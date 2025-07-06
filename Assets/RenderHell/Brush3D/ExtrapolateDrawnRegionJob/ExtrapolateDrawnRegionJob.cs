using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Unity.Collections;
using Unity.Jobs;
using Unity.Mathematics;
using UnityEngine;
using UnityEngine.Rendering;

namespace IngSorre97.RenderHell.Brush3D
{
    public static class ExtrapolateDrawnRegionJob
    {
        public static GameObject Execute(ComputeShader computeShader, Mesh mesh)
        {
            NativeArray<bool> drawnVertices = ComputeDrawnVertices(computeShader, mesh.vertices);
            NativeArray<int4> drawnTriangles = ComputeDrawnTriangles(mesh.triangles, drawnVertices);

            Mesh extrapolatedMesh = new Mesh();
            mesh.vertices = mesh.vertices;
            return null;
        }

        static NativeArray<bool> ComputeDrawnVertices(ComputeShader computeShader, Vector3[] vertices)
        {
            int kernelIndex = computeShader.FindKernel("ComputeDrawnVertices");
            
            computeShader.SetInt(RenderHellShaderIDs.MeshVerticesCount, vertices.Length);
            
            var verticesBuffer = new ComputeBuffer(vertices.Length, sizeof(float) * 3);
            verticesBuffer.SetData(vertices);
            computeShader.SetBuffer(kernelIndex, RenderHellShaderIDs.MeshVertices, verticesBuffer);

            var verticesChecks = new float[vertices.Length];
            var verticesChecksBuffer = new ComputeBuffer(vertices.Length, sizeof(bool));
            verticesChecksBuffer.SetData(verticesChecks);
            computeShader.SetBuffer(kernelIndex, RenderHellShaderIDs.MeshVerticesChecks, verticesChecksBuffer);

            int threadGroup = Mathf.CeilToInt((float) vertices.Length / 8);
            computeShader.Dispatch(kernelIndex, threadGroup, threadGroup, threadGroup);
            
            var gpuRequest = AsyncGPUReadback.Request(verticesChecksBuffer);
            gpuRequest.WaitForCompletion();

            if (gpuRequest.hasError)
            {
                throw new ApplicationException("Unable to load drawn vertices data from GPU!");
            }

            var verticesChecksData = gpuRequest.GetData<bool>();
            
            verticesBuffer.Dispose();
            verticesChecksBuffer.Dispose();
            
            return verticesChecksData;
        }

        static NativeArray<int4> ComputeDrawnTriangles(int[] triangles, NativeArray<bool> drawnVertices)
        {
            var trianglesNativeArray = new NativeArray<int>(triangles, Allocator.Persistent);
            int trianglesCount = triangles.Length / 3;
            var drawnTriangles = new NativeList<int3>(Allocator.Persistent);

            var job = new ExtrapolateDrawnTrianglesJob
            {
                drawnVertices = drawnVertices,
                triangles = trianglesNativeArray,
                //drawnTriangles = drawnTriangles
            };

            JobHandle jobHandle = job.ScheduleByRef(trianglesCount, 1);
            jobHandle.Complete();

            trianglesNativeArray.Dispose();

            return default;
        }
    }
}