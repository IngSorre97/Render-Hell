using System;
using UnityEngine;
using UnityEngine.Experimental.Rendering;
using UnityEngine.Rendering;
using UnityEngine.Rendering.Universal;
using Object = UnityEngine.Object;

namespace IngSorre97.RenderHell.Brush3D
{
    class Brush3DRenderPass : BaseRenderPass, IBrush3D
    {
        const RenderPassEvent RENDER_PASS_EVENT = RenderPassEvent.AfterRenderingTransparents;

        readonly MeshRenderer m_meshRenderer;
        readonly Bounds m_bounds;
        readonly float m_boundsExtent;
        readonly int m_selectionMaskSize;
        readonly Material m_material;
        
        readonly ComputeShader m_computeShader;
        readonly int m_selectionMaskKernel;

        bool m_intersectionActive;
        bool m_drawingActive;
        bool m_clippingActive;

        public Brush3DRenderPass(MeshRenderer meshRenderer, Bounds bounds, ComputeShader computeShader, int selectionMaskSize)
            : base("Brush3DPass", RENDER_PASS_EVENT, Camera.main)
        {
            m_meshRenderer = meshRenderer;
            m_bounds = bounds;
            m_boundsExtent = Mathf.Max(m_bounds.extents.x, m_bounds.extents.y, m_bounds.extents.z);
            m_selectionMaskSize = selectionMaskSize;
            m_material = Object.Instantiate(meshRenderer.material);
            m_computeShader = Object.Instantiate(computeShader);
            m_selectionMaskKernel = m_computeShader.FindKernel("UpdateMask");
            
            SetTexture3D(selectionMaskSize);
            
            m_material.SetVector(RenderHellShaderIDs.BoundsMin, m_bounds.min);
            m_material.SetVector(RenderHellShaderIDs.BoundsMax, m_bounds.max);
            
            m_computeShader.SetInt(RenderHellShaderIDs.SelectionMaskSize, selectionMaskSize);
            m_material.SetInt(RenderHellShaderIDs.SelectionMaskSize, selectionMaskSize);
            
            meshRenderer.materials = Array.Empty<Material>();
        }

        public override void Dispose()
        {
            base.Dispose();
            
            Object.Destroy(m_material);
            Object.Destroy(m_computeShader);
        }
        
        public override bool ShouldExecutePass()
        {
            return true;
        }
        
        public void SetPosition(Vector3 pos)
        {
            m_computeShader.SetVector(RenderHellShaderIDs.CursorNormalizedPos, pos);
            m_material.SetVector(RenderHellShaderIDs.CursorNormalizedPos, pos);
        }
        
        public void SetRadius(float radius)
        {
            float normalizedRadius = Mathf.Clamp01(radius / m_boundsExtent);
            m_computeShader.SetFloat(RenderHellShaderIDs.CursorNormalizedRadius, normalizedRadius);
            m_material.SetFloat(RenderHellShaderIDs.CursorNormalizedRadius, normalizedRadius);
        }

        public void SetIntersectionActivation(bool active)
        {
            m_intersectionActive = active;
            
            m_computeShader.SetFloat(RenderHellShaderIDs.Intersecting, m_intersectionActive.ToBinaryFloat());
        }

        public void SetIntersectionColor(Color color, float rimPower)
        {
            m_material.SetColor(RenderHellShaderIDs.IntersectingColor, color);
        }

        public void SetOutlineColor(Color color)
        {
            
        }

        public void SetOutlineThickness(float thickness)
        {
            
        }

        public void SetDrawingActivation(bool active)
        {
            m_drawingActive = active;
            
            m_computeShader.SetFloat(RenderHellShaderIDs.Drawing, m_drawingActive.ToBinaryFloat());
        }

        public void SetDrawingColor(Color color, float rimPower)
        {
            m_material.SetColor(RenderHellShaderIDs.DrawingColor, color);
        }

        public void ResetDrawnRegion()
        {
            
        }

        public void SetClippingActivation(bool active)
        {
            m_clippingActive = active;
            
            m_computeShader.SetFloat(RenderHellShaderIDs.Clipping, m_clippingActive.ToBinaryFloat());
        }

        public void ClipDrawnRegion()
        {
            
        }

        public void ResetClippedRegion()
        {
            
        }

        void SetTexture3D(int size)
        {
            var selectionMask = new RenderTexture(size, size, GraphicsFormat.R32_SFloat, 0)
            {
                name = "SelectionMask",
                filterMode = FilterMode.Trilinear,
                wrapMode = TextureWrapMode.Clamp,
                dimension = TextureDimension.Tex3D,
                volumeDepth = size,
                enableRandomWrite = true,
                isPowerOfTwo = true
            };
            selectionMask.Create();
            selectionMask.name = "SelectionMask";
            
            m_computeShader.SetTexture(m_selectionMaskKernel, RenderHellShaderIDs.SelectionMask, selectionMask);
            m_material.SetTexture(RenderHellShaderIDs.SelectionMask, selectionMask);
            
            m_computeShader.SetFloat(RenderHellShaderIDs.SelectionMaskSize, size);
            m_material.SetFloat(RenderHellShaderIDs.SelectionMaskSize, size);
        }

        protected override void OnPassExecute(CommandBuffer commandBuffer, ScriptableRenderContext context, ref RenderingData renderingData)
        {
            int threadGroup = Mathf.CeilToInt((float) m_selectionMaskSize / 8);
            
            commandBuffer.DispatchCompute(m_computeShader, m_selectionMaskKernel, threadGroup, threadGroup, threadGroup);
            commandBuffer.DrawRenderer(m_meshRenderer, m_material);
        }
    }
}