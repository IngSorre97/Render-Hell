using UnityEngine;

namespace IngSorre97.RenderHell
{
    public static class RenderHellShaderIDs
    {
        public static int SelectionMask { get; } = Shader.PropertyToID("_SelectionMask");
        public static int SelectionMaskSize { get; } = Shader.PropertyToID("_SelectionMaskSize");
        public static int CursorNormalizedPos { get; } = Shader.PropertyToID("_CursorNormalizedPos");
        public static int CursorNormalizedRadius { get; } = Shader.PropertyToID("_CursorNormalizedRadius");
        public static int BoundsMin { get; } = Shader.PropertyToID("_BoundsMin");
        public static int BoundsMax { get; } = Shader.PropertyToID("_BoundsMax");
        public static int Intersecting { get; } = Shader.PropertyToID("_Intersecting");
        public static int Drawing { get; } = Shader.PropertyToID("_Drawing");
        public static int Clipping { get; } = Shader.PropertyToID("_Clipping");
        public static int IntersectingColor { get; } = Shader.PropertyToID("_IntersectingColor");
        public static int IntersectingRimPower { get; } = Shader.PropertyToID("_IntersectingRimPower");
        public static int DrawingColor { get; } = Shader.PropertyToID("_DrawingColor");
        public static int DrawingRimPower { get; } = Shader.PropertyToID("_DrawingRimPower");
    }
}