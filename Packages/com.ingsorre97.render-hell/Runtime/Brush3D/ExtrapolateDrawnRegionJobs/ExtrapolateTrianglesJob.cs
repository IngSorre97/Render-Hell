using System.Threading;
using Unity.Burst;
using Unity.Collections;
using Unity.Collections.LowLevel.Unsafe;
using Unity.Jobs;
using Unity.Mathematics;

namespace IngSorre97.RenderHell.Brush3D.Jobs
{
    [BurstCompile]
    public struct ExtrapolateTrianglesJob : IJobParallelFor
    {
        [ReadOnly] public NativeParallelHashMap<int, ExtrapolatedVertex> ExtrapolatedVertices;
        [ReadOnly] public NativeArray<int> MeshTriangles;
        
        [NativeDisableParallelForRestriction] public NativeList<int3>.ParallelWriter ExtrapolatedTriangles;
        public NativeArray<int> ExtrapolatedTrianglesCount;
        
        public void Execute(int index)
        {
            int t0 = MeshTriangles[index * 3];
            int t1 = MeshTriangles[index * 3 + 1];
            int t2 = MeshTriangles[index * 3 + 2];
            
            bool isTriangleDrawn = ExtrapolatedVertices.ContainsKey(t0)
                                   && ExtrapolatedVertices.ContainsKey(t1)
                                   && ExtrapolatedVertices.ContainsKey(t2);

            if (!isTriangleDrawn)
            {
                return;
            }
            
            unsafe
            {
                Interlocked.Increment(ref ((int*)ExtrapolatedTrianglesCount.GetUnsafePtr())[0]);
            }
            
            int3 newTriangle = new int3(ExtrapolatedVertices[t0].NewIndex, 
                ExtrapolatedVertices[t1].NewIndex,
                ExtrapolatedVertices[t2].NewIndex);
            ExtrapolatedTriangles.AddNoResize(newTriangle);
        }
    }
}