using UnityEngine;
using UnityEngine.Experimental.Rendering;
using UnityEngine.Rendering;
using UnityEngine.Rendering.Universal;
using Object = UnityEngine.Object;

namespace IngSorre97.RenderHell.Brush3D
{
    class Brush3DRenderPass : BaseRenderPass, IBrush3DRenderPass
    {
        const RenderPassEvent RENDER_PASS_EVENT = RenderPassEvent.AfterRenderingTransparents;
        const int SELECTION_MASK_SIZE = 256;

        readonly MeshRenderer m_meshRenderer;
        readonly Material m_material;
        
        readonly ComputeShader m_computeShader;
        readonly int m_selectionMaskKernel;

        Vector3 m_boundsMin;
        Vector3 m_boundsMax;

        bool m_active;

        public Brush3DRenderPass(MeshRenderer meshRenderer, MeshFilter meshFilter, Material material, ComputeShader computeShader) : base("Brush3DPass", RENDER_PASS_EVENT, Camera.main)
        {
            m_meshRenderer = meshRenderer;
            m_material = Object.Instantiate(material);
            m_computeShader = Object.Instantiate(computeShader);
            m_selectionMaskKernel = m_computeShader.FindKernel("UpdateMask");
            
            SetTexture3D(SELECTION_MASK_SIZE);
            SetBounds(meshFilter);
        }

        public override void Dispose()
        {
            base.Dispose();
            
            Object.Destroy(m_material);
            Object.Destroy(m_computeShader);
        }
        
        public override bool ShouldExecutePass()
        {
            return m_active;
        }

        public void SetActive(bool active)
        {
            m_active = active;
        }
        
        public void SetPosition(Vector3 pos)
        {
            if (!m_meshRenderer.bounds.Contains(pos)) //TODO works only if inside
            {
                m_computeShader.SetVector(RenderHellShaderIDs.CursorObjPos, -1.0f * Vector3.one);
                return;
            }
            
            Vector3 localPos = m_meshRenderer.transform.InverseTransformPoint(pos);
            var normalizedPos = new Vector3(
                (localPos.x - m_boundsMin.x) / (m_boundsMax.x - m_boundsMin.x),
                (localPos.y - m_boundsMin.y) / (m_boundsMax.y - m_boundsMin.y),
                (localPos.z - m_boundsMin.z) / (m_boundsMax.z - m_boundsMin.z)
            );
            
            normalizedPos *= SELECTION_MASK_SIZE;
            
            m_computeShader.SetVector(RenderHellShaderIDs.CursorObjPos, normalizedPos);
        }
        
        public void SetRadius(float radius)
        {
            m_computeShader.SetFloat(RenderHellShaderIDs.CursorRadius, radius);
        }
        
        void SetTexture3D(int size)
        {
            var selectionMask = new RenderTexture(size, size, GraphicsFormat.R8_UNorm, 0)
            {
                name = "SelectionMask",
                filterMode = FilterMode.Trilinear,
                wrapMode = TextureWrapMode.Clamp,
                dimension = TextureDimension.Tex3D,
                volumeDepth = size,
                enableRandomWrite = true,
                isPowerOfTwo = true
            };
            
            m_computeShader.SetTexture(m_selectionMaskKernel, RenderHellShaderIDs.SelectionMask, selectionMask);
            m_material.SetTexture(RenderHellShaderIDs.SelectionMask, selectionMask);
            
            m_computeShader.SetFloat(RenderHellShaderIDs.SelectionMaskSize, size);
        }

        void SetBounds(MeshFilter meshFilter)
        {
            Bounds bounds = meshFilter.sharedMesh.bounds;
            
            m_boundsMin = bounds.min;
            m_material.SetVector(RenderHellShaderIDs.BoundsMin, m_boundsMin);
            
            m_boundsMax = bounds.max;
            m_material.SetVector(RenderHellShaderIDs.BoundsMax, m_boundsMax);
        }

        protected override void OnPassExecute(CommandBuffer commandBuffer, ScriptableRenderContext context, ref RenderingData renderingData)
        {
            int threadGroup = Mathf.CeilToInt((float) SELECTION_MASK_SIZE / 8);
            
            commandBuffer.DispatchCompute(m_computeShader, m_selectionMaskKernel, threadGroup, threadGroup, threadGroup);
            commandBuffer.DrawRenderer(m_meshRenderer, m_material);
        }
    }
}