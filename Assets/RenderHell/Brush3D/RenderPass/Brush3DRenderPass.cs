using UnityEngine;
using UnityEngine.Experimental.Rendering;
using UnityEngine.Rendering;
using UnityEngine.Rendering.Universal;
using Object = UnityEngine.Object;

namespace IngSorre97.RenderHell.Brush3D
{
    class Brush3DRenderPass : BaseRenderPass, IBrush3D
    {
        const RenderPassEvent RENDER_PASS_EVENT = RenderPassEvent.BeforeRenderingTransparents;

        public float Radius { get; private set; }
        public float OutlineThickness { get; private set; }
        
        readonly Material m_material;
        readonly float m_boundsExtent;
        readonly MeshRenderer m_meshRenderer;
        readonly int m_selectionMaskSize;
        
        readonly ComputeShader m_computeShader;
        readonly int m_updateMaskKernel;
        readonly int m_resetDrawnRegionKernel;
        readonly int m_clipDrawnRegionKernel;
        readonly int m_resetClippedRegionKernel;


        bool m_intersectionActive;
        bool m_drawingActive;
        bool m_clippingActive;

        public Brush3DRenderPass(MeshRenderer meshRenderer, Bounds bounds, ComputeShader computeShader, int selectionMaskSize)
            : base("Brush3DPass", RENDER_PASS_EVENT, Camera.main)
        {
            m_meshRenderer = meshRenderer;
            m_boundsExtent = Mathf.Max(bounds.extents.x, bounds.extents.y, bounds.extents.z);
            m_computeShader = Object.Instantiate(computeShader);
            m_selectionMaskSize = selectionMaskSize;
            
            m_updateMaskKernel = m_computeShader.FindKernel("UpdateMask");
            m_resetDrawnRegionKernel = m_computeShader.FindKernel("ResetDrawnRegion");
            m_clipDrawnRegionKernel = m_computeShader.FindKernel("ClipDrawnRegion");
            m_resetClippedRegionKernel = m_computeShader.FindKernel("ResetClippedRegion");

            m_material = m_meshRenderer.material;
            
            SetTexture3D(selectionMaskSize);
            
            m_material.SetVector(RenderHellShaderIDs.BoundsMin, bounds.min);
            m_material.SetVector(RenderHellShaderIDs.BoundsMax, bounds.max);
        }

        public override void Dispose()
        {
            base.Dispose();
            
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
            Radius = radius;
            float normalizedRadius = NormalizeLengthInBoundsExtent(radius);
            m_computeShader.SetFloat(RenderHellShaderIDs.CursorNormalizedRadius, normalizedRadius);
            m_material.SetFloat(RenderHellShaderIDs.CursorNormalizedRadius, normalizedRadius);

            if (OutlineThickness <= radius)
            {
                return;
            }

            Debug.LogWarning($"Scaled down outline thickness to {radius}");
            SetOutlineThickness(radius);
        }

        public void SetIntersectionActivation(bool active)
        {
            m_intersectionActive = active;
            
            m_computeShader.SetFloat(RenderHellShaderIDs.Intersecting, m_intersectionActive.ToBinaryFloat());
        }

        public void SetIntersectionColor(Color color, float rimPower)
        {
            m_material.SetColor(RenderHellShaderIDs.IntersectingColor, color);
            m_material.SetFloat(RenderHellShaderIDs.IntersectingRimPower, rimPower);
        }

        public void SetOutlineColor(Color color)
        {
            m_material.SetColor(RenderHellShaderIDs.OutlineColor, color);
        }

        public void SetOutlineThickness(float thickness)
        {
            if (thickness > Radius)
            {
                Debug.LogWarning($"Thickness {thickness} would be greater than {Radius}");
                return;
            }
            
            OutlineThickness = thickness;
            float normalizedOutlineThickness = NormalizeLengthInBoundsExtent(thickness);
            m_material.SetFloat(RenderHellShaderIDs.OutlineThickness, normalizedOutlineThickness);
        }

        public void SetDrawingActivation(bool active)
        {
            m_drawingActive = active;
            
            m_computeShader.SetFloat(RenderHellShaderIDs.Drawing, m_drawingActive.ToBinaryFloat());
        }

        public void SetDrawingColor(Color color, float rimPower)
        {
            m_material.SetColor(RenderHellShaderIDs.DrawingColor, color);
            m_material.SetFloat(RenderHellShaderIDs.DrawingRimPower, rimPower);
        }

        public void ResetDrawnRegion()
        {
            int threadGroup = Mathf.CeilToInt((float) m_selectionMaskSize / 8);
            
            m_computeShader.Dispatch(m_resetDrawnRegionKernel, threadGroup, threadGroup, threadGroup);
        }

        public void SetClippingActivation(bool active)
        {
            m_clippingActive = active;
            
            m_computeShader.SetFloat(RenderHellShaderIDs.Clipping, m_clippingActive.ToBinaryFloat());
        }

        public void ClipDrawnRegion()
        {
            int threadGroup = Mathf.CeilToInt((float) m_selectionMaskSize / 8);
            
            m_computeShader.Dispatch(m_clipDrawnRegionKernel, threadGroup, threadGroup, threadGroup);
        }

        public void ResetClippedRegion()
        {
            int threadGroup = Mathf.CeilToInt((float) m_selectionMaskSize / 8);
            
            m_computeShader.Dispatch(m_resetClippedRegionKernel, threadGroup, threadGroup, threadGroup);
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
            
            m_computeShader.SetTexture(m_updateMaskKernel, RenderHellShaderIDs.SelectionMask, selectionMask);
            m_computeShader.SetTexture(m_resetDrawnRegionKernel, RenderHellShaderIDs.SelectionMask, selectionMask);
            m_computeShader.SetTexture(m_clipDrawnRegionKernel, RenderHellShaderIDs.SelectionMask, selectionMask);
            m_computeShader.SetTexture(m_resetClippedRegionKernel, RenderHellShaderIDs.SelectionMask, selectionMask);
            m_material.SetTexture(RenderHellShaderIDs.SelectionMask, selectionMask);
            
            m_computeShader.SetInt(RenderHellShaderIDs.SelectionMaskSize, size);
            m_material.SetInt(RenderHellShaderIDs.SelectionMaskSize, size);
        }

        float NormalizeLengthInBoundsExtent(float length)
        {
            return Mathf.Clamp01(length / m_boundsExtent);
        }

        protected override void OnPassExecute(CommandBuffer commandBuffer, ScriptableRenderContext context, ref RenderingData renderingData)
        {
            int threadGroup = Mathf.CeilToInt((float) m_selectionMaskSize / 8);
            
            commandBuffer.DispatchCompute(m_computeShader, m_updateMaskKernel, threadGroup, threadGroup, threadGroup);
        }
    }
}