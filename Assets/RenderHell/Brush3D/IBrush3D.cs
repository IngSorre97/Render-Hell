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
        void RemoveDrawingProperties(Brush3DProperties properties);
        void StartDrawing(Brush3DProperties properties);
        void StopDrawing();
        
        void StartErasing(Brush3DProperties properties);
        void StopErasing();
        
        void StartClipping();
        void StopClipping();
        
        void ResetDrawnRegion(Brush3DProperties properties);
        void ClipDrawnRegion(Brush3DProperties properties);
        void ResetClippedRegion();
    }
}