using Unity.Burst;
using Unity.Collections;
using Unity.Jobs;
using Unity.Mathematics;

namespace IngSorre97.RenderHell.Brush3D
{
    [BurstCompile]
    struct ExtrapolateDrawnTrianglesJob : IJobParallelFor
    {
        [ReadOnly] public NativeArray<int> DrawnVertices;
        [ReadOnly] public NativeArray<int> Triangles;

        public NativeList<int>.ParallelWriter DrawnTriangles;
        
        public void Execute(int index)
        {
            int shiftedIndex = index * 3;

            int v0 = shiftedIndex + 0;
            int v1 = shiftedIndex + 1;
            int v2 = shiftedIndex + 2;
            bool areAllVerticesDrawn = DrawnVertices[v0] != -1 && DrawnVertices[v1] != -1 && DrawnVertices[v2] != -1;
            
            DrawnTriangles[index] = new int4(Triangles[v0], Triangles[v1], Triangles[v2], areAllVerticesDrawn ? 1 : 0);
        }
    }
}