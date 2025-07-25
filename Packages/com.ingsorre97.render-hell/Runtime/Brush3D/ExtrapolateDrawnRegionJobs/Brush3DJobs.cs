using System.Linq;
using Unity.Collections;
using Unity.Jobs;
using Unity.Mathematics;
using UnityEngine;

namespace IngSorre97.RenderHell.Brush3D.Jobs
{
    public static class Brush3DJobs
    {
        public static Mesh ExtrapolateDrawnRegion(Mesh mesh, NativeArray<float> selectionMask, int selectionMaskSize, int index)
        {
            using var extrapolatedVertices = new NativeParallelHashMap<int, ExtrapolatedVertex>(mesh.vertices.Length, Allocator.Persistent);
            using var extrapolatedTriangles = new NativeList<int3>(mesh.triangles.Length, Allocator.Persistent);
            
            int verticesCount = ExtrapolateVertices(mesh, extrapolatedVertices, selectionMask, selectionMaskSize, index);
            Debug.Log($"Found {verticesCount} drawn vertices: ({verticesCount}/{mesh.vertices.Length})\n" +
                      $"{verticesCount / (float)mesh.vertices.Length:0.00}%");

            var trianglesCount = ExtrapolateTriangles(mesh, extrapolatedVertices, extrapolatedTriangles);
            Debug.Log($"Found {trianglesCount} drawn triangles: ({trianglesCount}/{mesh.triangles.Length / 3})\n" +
                      $"{trianglesCount / ((float)mesh.triangles.Length / 3):0.00}%");
            
            var vertices = new Vector3[verticesCount + 1];
            using var vertexIndexes = extrapolatedVertices.GetValueArray(Allocator.Persistent);
            vertexIndexes.Sort();
            for (int i = 0; i < vertexIndexes.Length; i++)
            {
                vertices[i+1] = vertexIndexes[i].Vertex;
            }

            var triangles = new int[trianglesCount * 3];
            for (int i = 0; i < trianglesCount; i++)
            {
                var triangle = extrapolatedTriangles[i];
                triangles[i * 3] = triangle.x;
                triangles[i * 3 + 1] = triangle.y;
                triangles[i * 3 + 2] = triangle.z;
            }
            
            var extrapolatedMesh = new Mesh
            {
                vertices = vertices,
                triangles = triangles,
            };
            extrapolatedMesh.RecalculateBounds();
            extrapolatedMesh.RecalculateNormals();
            extrapolatedMesh.RecalculateTangents();
            
            return extrapolatedMesh;
        }

        static int ExtrapolateVertices(Mesh mesh, NativeParallelHashMap<int, ExtrapolatedVertex> extrapolatedVertices, NativeArray<float> selectionMask, int selectionMaskSize, int index)
        {
            using var extrapolatedVerticesCount = new NativeArray<int>(1, Allocator.Persistent);
            using var meshVertices = new NativeArray<Vector3>(mesh.vertices, Allocator.Persistent);
            var job = new ExtrapolateVerticesJob
            {
                Size = selectionMaskSize,
                DrawnIndex = index,
                BoundsMin = mesh.bounds.min,
                BoundsMax = mesh.bounds.max,
                SelectionMask = selectionMask,
                MeshVertices = meshVertices,
                ExtrapolatedVerticesCount = extrapolatedVerticesCount,
                ExtrapolatedVertices = extrapolatedVertices.AsParallelWriter()
            };

            JobHandle handle = job.ScheduleByRef(meshVertices.Length, 32);
            handle.Complete();

            return extrapolatedVerticesCount[0];
        }

        static int ExtrapolateTriangles(Mesh mesh, NativeParallelHashMap<int, ExtrapolatedVertex> extrapolatedVertices, NativeList<int3> extrapolatedTriangles)
        {
            using var meshTriangles = new NativeArray<int>(mesh.triangles, Allocator.Persistent);
            using var extrapolatedTrianglesCount = new NativeArray<int>(1, Allocator.Persistent);

            var job = new ExtrapolateTrianglesJob
            {
                ExtrapolatedVertices = extrapolatedVertices,
                MeshTriangles = meshTriangles,
                ExtrapolatedTriangles = extrapolatedTriangles.AsParallelWriter(),
                ExtrapolatedTrianglesCount = extrapolatedTrianglesCount
            };
            
            JobHandle handle = job.ScheduleByRef(meshTriangles.Length / 3, 1);
            handle.Complete();
            
            return extrapolatedTrianglesCount[0];
        }
    }
}