using System;
using UnityEngine;
using Object = UnityEngine.Object;

namespace IngSorre97.RenderHell.Brush3D
{
    struct BrushState : IDisposable
    {
        public Vector3 CursorNormalizedPos { get; set; }
        public float CursorNormalizedRadius { get; set; }
        public Bounds Bounds { get; set; }
        public RenderTexture SelectionMask { get; set; }
        public int SelectionMaskSize { get; set; }
        public float Intersecting { get; set; }
        public Color OutlineColor { get; set; }
        public float OutlineThickness { get; set; }
        public ComputeBuffer DrawingProperties { get; set; }

        public void Dispose()
        {
            Object.Destroy(SelectionMask);
            DrawingProperties?.Dispose();
        }
    }
}