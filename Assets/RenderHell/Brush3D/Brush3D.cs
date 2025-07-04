using UnityEngine;

namespace IngSorre97.RenderHell.Brush3D
{
    class Brush3D : MonoBehaviour, IBrush3D
    {
        const int SELECTION_MASK_SIZE = 256;
        
        [SerializeField] ComputeShader m_computeShader;

        MeshRenderer m_meshRenderer;
        Bounds m_bounds;
        Brush3DRenderPass m_renderPass;
        
        void OnDestroy()
        {
            m_renderPass.Dispose();
        }

        public void Setup(MeshRenderer meshRenderer, Bounds bounds)
        {
            m_meshRenderer = meshRenderer;
            m_bounds = bounds;
            
            m_renderPass = new Brush3DRenderPass(meshRenderer, m_bounds, m_computeShader, SELECTION_MASK_SIZE);
        }

        public void SetPosition(Vector3 pos)
        {
            Vector3 localPos = m_meshRenderer.transform.InverseTransformPoint(pos);
            var normalizedPos = new Vector3(
                (localPos.x - m_bounds.min.x) / (m_bounds.max.x - m_bounds.min.x),
                (localPos.y - m_bounds.min.y) / (m_bounds.max.y - m_bounds.min.y),
                (localPos.z - m_bounds.min.z) / (m_bounds.max.z - m_bounds.min.z)
            );
            
            m_renderPass.SetPosition(normalizedPos);
        }

        public void SetRadius(float radius)
        {
            if (radius < 0.0f)
            {
                Debug.LogError("Radius must be greater than zero");
                return;
            }

            m_renderPass.SetRadius(radius);
        }

        public void SetIntersectionActivation(bool active)
        {
            m_renderPass.SetIntersectionActivation(active);
        }

        public void SetIntersectionColor(Color color, float rimPower)
        {
            if (rimPower < 0.0f)
            {
                Debug.LogError("Intersection rim power must be greater than zero");
                return;
            }
            
            m_renderPass.SetIntersectionColor(color, rimPower);
        }

        public void SetOutlineColor(Color color)
        {
            m_renderPass.SetOutlineColor(color);
        }

        public void SetOutlineThickness(float thickness)
        {
            if (thickness < 0.0f)
            {
                Debug.LogError("Outline thickness power must be greater than zero");
                return;
            }
            
            m_renderPass.SetOutlineThickness(thickness);
        }

        public void SetDrawingActivation(bool active)
        {
            m_renderPass.SetDrawingActivation(active);
        }

        public void SetDrawingColor(Color color, float rimPower)
        {
            if (rimPower < 0.0f)
            {
                Debug.LogError("Drawing rim power must be greater than zero");
                return;
            }
            
            m_renderPass.SetDrawingColor(color, rimPower);
        }

        public void SetErasingDrawnActivation(bool active)
        {
            m_renderPass.SetErasingDrawnActivation(active);
        }

        public void ResetDrawnRegion()
        {
            m_renderPass.ResetDrawnRegion();
        }

        public void SetClippingActivation(bool active)
        {
            m_renderPass.SetClippingActivation(active);
        }

        public void ClipDrawnRegion()
        {
            m_renderPass.ClipDrawnRegion();
        }

        public void ResetClippedRegion()
        {
            m_renderPass.ResetClippedRegion();
        }
    }
}