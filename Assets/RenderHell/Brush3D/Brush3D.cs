using System;
using UnityEngine;

namespace IngSorre97.RenderHell.Brush3D
{
    class Brush3D : MonoBehaviour, IBrush3D
    {
        [SerializeField] ComputeShader m_computeShader;
        
        Brush3DRenderPass m_renderPass;

        void OnDestroy()
        {
            m_renderPass.Dispose();
        }

        public void Setup(MeshRenderer meshRenderer, MeshFilter meshFilter)
        {
            m_renderPass = new Brush3DRenderPass(meshRenderer, meshFilter, m_computeShader);
        }

        public void SetPosition(Vector3 pos)
        {
            m_renderPass.SetPosition(pos);
        }

        public void SetRadius(float radius)
        {
            m_renderPass.SetRadius(radius);
        }

        public void SetIntersectionActivation(bool active)
        {
            m_renderPass.SetActive(active);
        }

        public void SetIntersectionColor(Color color, float rimPower)
        {
            throw new NotImplementedException();
        }

        public void SetOutlineColor(Color color)
        {
            throw new NotImplementedException();
        }

        public void SetOutlineThickness(float thickness)
        {
            throw new NotImplementedException();
        }

        public void SetDrawingActivation(bool active)
        {
            throw new NotImplementedException();
        }

        public void SetDrawingColor(Color color, float rimPower)
        {
            throw new NotImplementedException();
        }

        public void ResetDrawnRegion()
        {
            throw new NotImplementedException();
        }

        public void SetClippingActivation(bool active)
        {
            throw new NotImplementedException();
        }

        public void ClipDrawnRegion()
        {
            throw new NotImplementedException();
        }

        public void ResetClippedRegion()
        {
            throw new NotImplementedException();
        }
    }
}