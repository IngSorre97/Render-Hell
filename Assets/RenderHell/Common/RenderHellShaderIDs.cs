using UnityEngine;

namespace IngSorre97.RenderHell
{
    public static class RenderHellShaderIDs
    {
        public static int SelectionMask { get; } = Shader.PropertyToID("_SelectionMask");
        public static int SelectionMaskSize { get; } = Shader.PropertyToID("_SelectionMaskSize");
        public static int CursorObjPos { get; } = Shader.PropertyToID("_CursorObjPos");
        public static int CursorRadius { get; } = Shader.PropertyToID("_CursorRadius");
        public static int BoundsMin { get; } = Shader.PropertyToID("_BoundsMin");
        public static int BoundsMax { get; } = Shader.PropertyToID("_BoundsMax");
    }
}