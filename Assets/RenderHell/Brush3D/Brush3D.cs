using System;
using UnityEngine;

namespace IngSorre97.RenderHell.Brush3D
{
    class Brush3D : MonoBehaviour, IBrush3D
    {
        [SerializeField] ComputeShader m_computeShader;
        [SerializeField] Material m_material;
        
        Brush3DRenderPass m_renderPass;

        void OnDestroy()
        {
            m_renderPass.Dispose();
        }

        public void Setup(MeshRenderer meshRenderer, MeshFilter meshFilter)
        {
            m_renderPass = new Brush3DRenderPass(meshRenderer, meshFilter, m_material, m_computeShader);
        }

        public void On()
        {
            m_renderPass.SetActive(true);
        }

        public void Off()
        {
            m_renderPass.SetActive(false);
        }

        public void SetPosition(Vector3 pos)
        {
            m_renderPass.SetPosition(pos);
        }

        public void SetColor(Color color, float rimPower)
        {
            throw new System.NotImplementedException();
        }

        public void SetRadius(float radius)
        {
            m_renderPass.SetRadius(radius);
        }

        public void SetOutlineColor(Color color)
        {
            throw new System.NotImplementedException();
        }

        public void SetOutlineThickness(float thickness)
        {
            throw new System.NotImplementedException();
        }

        public void ApplyColorToModel(Color color, float rimPower)
        {
            throw new System.NotImplementedException();
        }

        public void RemoveColorFromModel()
        {
            throw new System.NotImplementedException();
        }

        public void ClipAllColoredModelParts()
        {
            throw new System.NotImplementedException();
        }

        public void RemoveAllColors()
        {
            throw new System.NotImplementedException();
        }
    }
}