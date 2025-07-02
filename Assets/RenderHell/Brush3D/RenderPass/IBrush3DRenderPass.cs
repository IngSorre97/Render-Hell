using UnityEngine;

namespace IngSorre97.RenderHell.Brush3D
{
    interface IBrush3DRenderPass
    {
        void SetActive(bool active);
        void SetPosition(Vector3 pos);
        void SetRadius(float radius);
    }
}