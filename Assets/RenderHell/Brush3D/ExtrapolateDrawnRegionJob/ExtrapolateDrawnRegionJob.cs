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
            NativeArray<float4> drawnVertices = ComputeDrawnVertices(computeShader, mesh.vertices, out int drawnVerticesCount);
            NativeList<int> drawnVerticesFiltered = FilterDrawnVertices(drawnVertices, drawnVerticesCount);
            NativeArray<int4> drawnTriangles = ComputeDrawnTriangles(mesh.triangles, drawnVerticesFiltered);

            var extrapolatedMesh = new Mesh();
            mesh.vertices = mesh.vertices;
            return null;
        }

        static NativeArray<float4> ComputeDrawnVertices(ComputeShader computeShader, Vector3[] vertices, out int drawnVerticesCount)
        {
            int kernelIndex = computeShader.FindKernel("ComputeDrawnVertices");
            
            computeShader.SetInt(RenderHellShaderIDs.MeshVerticesCount, vertices.Length);
            computeShader.SetInt(RenderHellShaderIDs.MeshDrawnVerticesCount, 0);
            
            var verticesBuffer = new ComputeBuffer(vertices.Length, sizeof(float) * 3);
            verticesBuffer.SetData(vertices);
            computeShader.SetBuffer(kernelIndex, RenderHellShaderIDs.MeshVertices, verticesBuffer);

            var drawnVerticesBuffer = new ComputeBuffer(vertices.Length, sizeof(float) * 4);
            drawnVerticesBuffer.SetData(new int[vertices.Length]);
            computeShader.SetBuffer(kernelIndex, RenderHellShaderIDs.MeshDrawnVertices, drawnVerticesBuffer);
            
            var drawnVerticesCountBuffer = new ComputeBuffer(1, sizeof(int));
            drawnVerticesCountBuffer.SetData(new []{0});
            computeShader.SetBuffer(kernelIndex, RenderHellShaderIDs.MeshDrawnVerticesCount, drawnVerticesCountBuffer);

            int threadGroup = Mathf.CeilToInt((float) vertices.Length / 8);
            computeShader.Dispatch(kernelIndex, threadGroup, threadGroup, threadGroup);
            
            AsyncGPUReadbackRequest drawnVerticesRequest = AsyncGPUReadback.Request(drawnVerticesBuffer);
            AsyncGPUReadbackRequest drawnVerticesCountRequest = AsyncGPUReadback.Request(drawnVerticesBuffer);
            AsyncGPUReadback.WaitAllRequests();

            if (drawnVerticesRequest.hasError)
            {
                throw new ApplicationException("Unable to load drawn vertices array from GPU!");
            }
            
            if (drawnVerticesCountRequest.hasError)
            {
                throw new ApplicationException("Unable to load drawn vertices count from GPU!");
            }

            NativeArray<float4> drawnVerticesData = drawnVerticesRequest.GetData<float4>();
            NativeArray<int> drawnVerticesCountData = drawnVerticesRequest.GetData<int>();
            drawnVerticesCount = drawnVerticesCountData[0];
            
            drawnVerticesCountData.Dispose();
            verticesBuffer.Dispose();
            drawnVerticesBuffer.Dispose();
            drawnVerticesCountBuffer.Dispose();
            
            return drawnVerticesData;
        }

        static NativeList<int> FilterDrawnVertices(NativeArray<float4> drawnVertices, int drawnVerticesCount)
        {
            var drawnVerticesFiltered = new NativeList<int>(drawnVerticesCount, Allocator.Persistent);
            
            var filterJob = new FilterDrawnVerticesJob
            {
                DrawnVertices = drawnVertices,
                DrawnVerticesFiltered = drawnVerticesFiltered.AsParallelWriter()
            };
            JobHandle filterJobHandle = filterJob.ScheduleByRef(drawnVerticesCount, 1);
            filterJobHandle.Complete();
            
            var enumerateJob = new EnumerateDrawnVerticesJob
            {
                DrawnVertices = drawnVertices,
                DrawnVerticesFiltered = drawnVerticesFiltered
            };
            
            JobHandle enumerateJobHandle = enumerateJob.ScheduleByRef(drawnVerticesCount, 1);
            enumerateJobHandle.Complete();

            return drawnVerticesFiltered;
        }

        static NativeArray<int4> ComputeDrawnTriangles(int[] triangles, NativeList<(int oldVertexIndex, int newVertexIndex)> drawnVertices)
        {
            var trianglesNativeArray = new NativeArray<int>(triangles, Allocator.Persistent);
            int trianglesCount = triangles.Length / 3;
            var drawnTriangles = new NativeList<int3>(Allocator.Persistent);

            var job = new ExtrapolateDrawnTrianglesJob
            {
                DrawnVertices = drawnVertices,
                Triangles = trianglesNativeArray
                //drawnTriangles = drawnTriangles
            };

            JobHandle jobHandle = job.ScheduleByRef(trianglesCount, 1);
            jobHandle.Complete();

            trianglesNativeArray.Dispose();

            return default;
        }
    }
}