using Unity.Burst;
using Unity.Collections;
using Unity.Jobs;

namespace IngSorre97.RenderHell.Brush3D
{
    [BurstCompile]
    struct EnumerateDrawnVerticesJob : IJobParallelFor
    {
        [ReadOnly] public NativeList<int> DrawnVerticesFiltered;
        
        public NativeArray<int> DrawnVertices;
        
        public void Execute(int index)
        {
            int oldVertexIndex = DrawnVerticesFiltered[index];
            DrawnVertices[oldVertexIndex] = index;
        }
    }
}