using System;
using UnityEngine;

namespace IngSorre97.RenderHell.Brush3D
{
    public interface IBrush3D
    {
        void SetPosition(Vector3 normalizedPos);
        
        void SetRadius(float normalizedRadius);
        
        void StartIntersecting();
        
        void StopIntersecting();
        
        void SetOutlineColor(Color color);
        
        void SetOutlineThickness(float thickness);

        void AddDrawingProperties(Brush3DProperties properties);
        
        void UpdateDrawingProperties();
        
        /// <exception cref="InvalidOperationException">If called with intersecting properties.</exception>
        /// <exception cref="InvalidOperationException">If properties active as Drawing or Erasing.</exception>
        void RemoveDrawingProperties(Brush3DProperties properties);
        
        /// <exception cref="InvalidOperationException">If called with intersecting properties.</exception>
        void StartDrawing(Brush3DProperties properties);
        
        void StopDrawing();
        
        /// <exception cref="InvalidOperationException">If called with intersecting properties.</exception>
        void StartErasing(Brush3DProperties properties);
        
        void StopErasing();
        
        void StartClipping();
        
        void StopClipping();
        
        /// <exception cref="InvalidOperationException">If called with intersecting properties.</exception>
        void ResetDrawnRegion(Brush3DProperties properties);
        
        /// <exception cref="InvalidOperationException">If called with intersecting properties.</exception>
        void ClipDrawnRegion(Brush3DProperties properties);
        
        void ResetClippedRegion();
    }
}