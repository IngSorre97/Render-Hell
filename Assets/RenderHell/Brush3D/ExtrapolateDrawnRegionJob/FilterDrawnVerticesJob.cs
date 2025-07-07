using Unity.Burst;
using Unity.Collections;
using Unity.Jobs;
using Unity.Mathematics;

namespace IngSorre97.RenderHell.Brush3D
{
    [BurstCompile]
    struct FilterDrawnVerticesJob : IJobParallelFor
    {
        [ReadOnly] public NativeArray<float4> DrawnVertices;

        public NativeList<int>.ParallelWriter DrawnVerticesFiltered;
        
        public void Execute(int index)
        {
            bool isVertexDrawn = DrawnVertices[index].w == 1;
            if (!isVertexDrawn)
            {
                return;
            }
            
            DrawnVerticesFiltered.AddNoResize(index);
        }
    }
}