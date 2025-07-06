using Unity.Burst;
using Unity.Collections;
using Unity.Jobs;
using Unity.Mathematics;

namespace IngSorre97.RenderHell.Brush3D
{
    [BurstCompile]
    struct ExtrapolateDrawnTrianglesJob : IJobParallelFor
    {
        [ReadOnly] public NativeArray<bool> drawnVertices;
        [ReadOnly] public NativeArray<int> triangles;

        public NativeArray<int4> drawnTriangles;
        
        public void Execute(int index)
        {
            int shiftedIndex = index * 3;

            int v_0 = shiftedIndex + 0;
            int v_1 = shiftedIndex + 1;
            int v_2 = shiftedIndex + 2;
            bool areAllVerticesDrawn = drawnVertices[v_0] &&
                                       drawnVertices[v_1] &&
                                       drawnVertices[v_2];
            
            drawnTriangles[index] = new int4
                (triangles[v_0], triangles[v_1], triangles[v_2], areAllVerticesDrawn ? 1 : 0);
        }
    }
}