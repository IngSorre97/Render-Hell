using UnityEngine;

namespace IngSorre97.RenderHell.Brush3D
{
    class Brush3D : MonoBehaviour, IBrush3D
    {
        const int SELECTION_MASK_SIZE = 512;
        
        [SerializeField] ComputeShader m_computeShader;

        float m_radius;
        float m_outlineThickness;
        
        MeshRenderer m_meshRenderer;
        Mesh m_mesh;
        
        Brush3DRenderPass m_renderPass;

        void OnDestroy()
        {
            m_renderPass.Dispose();
        }

        public void Setup(MeshRenderer meshRenderer, Mesh mesh, Brush3DProperties intersectingProperties)
        {
            m_meshRenderer = meshRenderer;
            m_mesh = mesh;
            
            m_renderPass = new Brush3DRenderPass(meshRenderer, m_mesh.bounds, m_computeShader, SELECTION_MASK_SIZE, intersectingProperties);
            m_renderPass.StartIntersecting();
        }

        public void SetPosition(Vector3 pos)
        {
            Vector3 localPos = m_meshRenderer.transform.InverseTransformPoint(pos);
            var normalizedPos = new Vector3(
                (localPos.x - m_mesh.bounds.min.x) / (m_mesh.bounds.max.x - m_mesh.bounds.min.x),
                (localPos.y - m_mesh.bounds.min.y) / (m_mesh.bounds.max.y - m_mesh.bounds.min.y),
                (localPos.z - m_mesh.bounds.min.z) / (m_mesh.bounds.max.z - m_mesh.bounds.min.z)
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
            
            m_radius = radius;
            m_renderPass.SetRadius(NormalizeLengthInBoundsExtent(radius));
            
            if (m_outlineThickness <= radius)
            {
                return;
            }
            
            Debug.LogWarning($"Scaled down outline thickness to {radius}");
            SetOutlineThickness(radius);
        }
        
        public void StartIntersecting()
        {
            m_renderPass.StartIntersecting();
        }

        public void StopIntersecting()
        {
            m_renderPass.StopIntersecting();
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
            
            if (thickness > m_radius)
            {
                Debug.LogWarning($"Thickness {thickness} would be greater than {m_radius}");
                return;
            }
            
            m_outlineThickness = thickness;
            m_renderPass.SetOutlineThickness(NormalizeLengthInBoundsExtent(thickness));
        }

        public void AddDrawingProperties(Brush3DProperties properties)
        {
            ValidateBrush3DProperties(properties);
            
            m_renderPass.AddDrawingProperties(properties);
        }

        public void UpdateDrawingProperties()
        {
            m_renderPass.UpdateDrawingProperties();
        }

        public void RemoveDrawingProperties(Brush3DProperties properties)
        {
            m_renderPass.RemoveDrawingProperties(properties);
        }

        public void StartDrawing(Brush3DProperties properties)
        {
            m_renderPass.StartDrawing(properties);
        }
        
        public void StopDrawing()
        {
            m_renderPass.StopDrawing();
        }

        public void StartErasing(Brush3DProperties properties)
        {
            m_renderPass.StartErasing(properties);
        }

        public void StopErasing()
        {
            m_renderPass.StopErasing();
        }
        
        public void StartClipping()
        {
            m_renderPass.StartClipping();
        }

        public void StopClipping()
        {
            m_renderPass.StopClipping();
        }

        public void ResetDrawnRegion(Brush3DProperties properties)
        {
            m_renderPass.ResetDrawnRegion(properties);
        }

        public void ClipDrawnRegion(Brush3DProperties properties)
        {
            m_renderPass.ClipDrawnRegion(properties);
        }

        public void ResetClippedRegion()
        {
            m_renderPass.ResetClippedRegion();
        }
        
        float NormalizeLengthInBoundsExtent(float length)
        {
            float boundsExtent = Mathf.Max(m_mesh.bounds.extents.x, m_mesh.bounds.extents.y, m_mesh.bounds.extents.z);
            return length / (boundsExtent * m_meshRenderer.transform.lossyScale.x);
        }

        static void ValidateBrush3DProperties(Brush3DProperties properties)
        {
            if (properties.m_rimPower >= 0.0f)
            {
                return;
            }
            
            Debug.LogError("Rim power must be greater than zero");
            properties.m_rimPower = 0.0f;
        }
    }
}