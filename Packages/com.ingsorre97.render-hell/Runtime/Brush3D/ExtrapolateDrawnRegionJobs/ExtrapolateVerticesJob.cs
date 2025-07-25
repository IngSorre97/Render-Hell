using System;
using System.Threading;
using Unity.Burst;
using Unity.Collections;
using Unity.Collections.LowLevel.Unsafe;
using Unity.Jobs;
using Unity.Mathematics;
using UnityEngine;

namespace IngSorre97.RenderHell.Brush3D.Jobs
{
    [BurstCompile]
    public struct ExtrapolateVerticesJob : IJobParallelFor
    {
        [ReadOnly] public int Size;
        [ReadOnly] public int DrawnIndex;
        [ReadOnly] public float3 BoundsMin;
        [ReadOnly] public float3 BoundsMax;
        [ReadOnly] public NativeArray<float> SelectionMask;
        [ReadOnly] public NativeArray<Vector3> MeshVertices;
        
        public NativeArray<int> ExtrapolatedVerticesCount;
        public NativeParallelHashMap<int, ExtrapolatedVertex>.ParallelWriter ExtrapolatedVertices;
        
        public void Execute(int index)
        {
            float3 vertex = MeshVertices[index];
            float3 vertexNormalizedUv = (vertex - BoundsMin) / (BoundsMax - BoundsMin);
            
            int closestX = Mathf.FloorToInt(vertexNormalizedUv.x * Size);
            closestX = closestX == Size ? closestX - 1 : closestX;
            
            int closestY = Mathf.FloorToInt(vertexNormalizedUv.y * Size);
            closestY = closestY == Size ? closestY - 1 : closestY;
            
            int closestZ = Mathf.FloorToInt(vertexNormalizedUv.z * Size);
            closestZ = closestZ == Size ? closestZ - 1 : closestZ;

            int selectionMaskIndex = closestX + closestY * Size + closestZ * Size * Size;

            int storedIndex = (int) SelectionMask[selectionMaskIndex];
            if (storedIndex != DrawnIndex)
            {
                return;
            }
            
            int newIndex;
            unsafe
            {
                newIndex = Interlocked.Increment(ref ((int*)ExtrapolatedVerticesCount.GetUnsafePtr())[0]);
            }

            ExtrapolatedVertices.TryAdd(index, new ExtrapolatedVertex
            {
                Vertex = vertex,
                OldIndex = index,
                NewIndex = newIndex
            });
        }
    }
}