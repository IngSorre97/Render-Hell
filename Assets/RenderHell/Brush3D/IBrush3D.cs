using UnityEngine;

namespace IngSorre97.RenderHell.Brush3D
{
    public interface IBrush3D
    {
        void On();
        
        void Off();
        
        void SetPosition(Vector3 pos);
        
        void SetColor(Color color, float rimPower);
        
        void SetRadius(float radius);
        
        void SetOutlineColor(Color color);
        
        void SetOutlineThickness(float thickness);
        
        void ApplyColorToModel(Color color, float rimPower);
        
        void RemoveColorFromModel(); //NOTA: eredita posizione da SetPosition e radius da SetRadius
        
        void ClipAllColoredModelParts();
        
        void RemoveAllColors();
    }
}