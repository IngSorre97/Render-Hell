using UnityEngine;

namespace IngSorre97.RenderHell
{
    public static class RenderHellShaderIDs
    {
        public static int Initialized { get; } = Shader.PropertyToID("_Initialized");
        public static int SelectionMask { get; } = Shader.PropertyToID("_SelectionMask");
        public static int SelectionMaskSize { get; } = Shader.PropertyToID("_SelectionMaskSize");
        public static int CursorNormalizedPos { get; } = Shader.PropertyToID("_CursorNormalizedPos");
        public static int CursorNormalizedRadius { get; } = Shader.PropertyToID("_CursorNormalizedRadius");
        public static int BoundsMin { get; } = Shader.PropertyToID("_BoundsMin");
        public static int BoundsMax { get; } = Shader.PropertyToID("_BoundsMax");
        public static int Intersecting { get; } = Shader.PropertyToID("_Intersecting");
        public static int DrawingIndex { get; } = Shader.PropertyToID("_DrawingIndex");
        public static int Clipping { get; } = Shader.PropertyToID("_Clipping");
        public static int OutlineColor { get; } = Shader.PropertyToID("_OutlineColor");
        public static int OutlineThickness { get; } = Shader.PropertyToID("_OutlineThickness");
        public static int ErasingIndex { get; } = Shader.PropertyToID("_ErasingIndex");
        public static int BrushProperties { get; } = Shader.PropertyToID("_BrushProperties");
        public static int ResetDrawnRegionIndex { get; } = Shader.PropertyToID("_ResetDrawnRegionIndex");
        public static int ClipDrawnRegionIndex { get; } = Shader.PropertyToID("_ClipDrawnRegionIndex");
    }
}