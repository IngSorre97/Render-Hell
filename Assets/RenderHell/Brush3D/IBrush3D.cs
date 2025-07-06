using UnityEngine;

namespace IngSorre97.RenderHell.Brush3D
{
    public interface IBrush3D
    {
        void SetPosition(Vector3 pos);
        
        void SetRadius(float radius);
        
        void SetIntersectionActivation(bool active);
        
        void SetIntersectionColor(Color color, float rimPower);
        
        void SetOutlineColor(Color color);
        
        void SetOutlineThickness(float thickness);
        
        void SetDrawingActivation(bool active);
        
        void SetDrawingColor(Color color, float rimPower);
        
        void SetErasingDrawnActivation(bool active);
        
        void ResetDrawnRegion();
        
        void SetClippingActivation(bool active);

        void ClipDrawnRegion();

        void ResetClippedRegion();

        GameObject ExtrapolateDrawnRegion();
    }
}