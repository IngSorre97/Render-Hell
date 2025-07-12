using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using UnityEngine;
using UnityEngine.Experimental.Rendering;
using UnityEngine.Rendering;
using UnityEngine.Rendering.Universal;
using Object = UnityEngine.Object;

namespace IngSorre97.RenderHell.Brush3D
{
    class Brush3DRenderPass : BaseRenderPass
    {
        const RenderPassEvent RENDER_PASS_EVENT = RenderPassEvent.BeforeRenderingTransparents;
        
        readonly Material m_material;
        readonly int m_selectionMaskSize;
        
        readonly ComputeShader m_computeShader;
        readonly int m_updateMaskKernel;
        readonly int m_resetDrawnRegionKernel;
        readonly int m_clipDrawnRegionKernel;
        readonly int m_resetClippedRegionKernel;
        readonly int m_removeBrushPropertiesKernel;

        List<int> ComputeShaderKernels => new()
        {
            m_updateMaskKernel, m_resetDrawnRegionKernel, m_clipDrawnRegionKernel, m_resetClippedRegionKernel,
            m_removeBrushPropertiesKernel
        };
        
        ComputeBuffer m_drawingPropertiesBuffer;

        public Brush3DRenderPass(MeshRenderer meshRenderer, Bounds bounds, ComputeShader computeShader, int selectionMaskSize)
            : base("Brush3DPass", RENDER_PASS_EVENT, Camera.main)
        {
            m_computeShader = Object.Instantiate(computeShader);
            m_selectionMaskSize = selectionMaskSize;
            
            m_updateMaskKernel = m_computeShader.FindKernel("UpdateMask");
            m_resetDrawnRegionKernel = m_computeShader.FindKernel("ResetDrawnRegion");
            m_clipDrawnRegionKernel = m_computeShader.FindKernel("ClipDrawnRegion");
            m_resetClippedRegionKernel = m_computeShader.FindKernel("ResetClippedRegion");
            m_removeBrushPropertiesKernel = m_computeShader.FindKernel("RemoveBrushProperties");

            m_material = meshRenderer.material;
            
            CreateSelectionMask(selectionMaskSize);
            
            m_material.SetVector(RenderHellShaderIDs.BoundsMin, bounds.min);
            m_material.SetVector(RenderHellShaderIDs.BoundsMax, bounds.max);
            m_material.SetFloat(RenderHellShaderIDs.Initialized, 1.0f);
        }

        public override void Dispose()
        {
            base.Dispose();
            
            Object.Destroy(m_computeShader);
            m_drawingPropertiesBuffer?.Dispose();
        }
        
        public override bool ShouldExecutePass()
        {
            return true;
        }
        
        public void SetPosition(Vector3 normalizedPos)
        {
            m_computeShader.SetVector(RenderHellShaderIDs.CursorNormalizedPos, normalizedPos);
            m_material.SetVector(RenderHellShaderIDs.CursorNormalizedPos, normalizedPos);
        }
        
        public void SetRadius(float normalizedRadius)
        {
            m_computeShader.SetFloat(RenderHellShaderIDs.CursorNormalizedRadius, normalizedRadius);
            m_material.SetFloat(RenderHellShaderIDs.CursorNormalizedRadius, normalizedRadius);
        }

        public void StartIntersecting()
        {
            m_computeShader.SetFloat(RenderHellShaderIDs.Intersecting, 1.0f);
            m_material.SetFloat(RenderHellShaderIDs.Intersecting, 1.0f);
        }
        
        public void StopIntersecting()
        {
            m_computeShader.SetFloat(RenderHellShaderIDs.Intersecting, 0.0f);
            m_material.SetFloat(RenderHellShaderIDs.Intersecting, 0.0f);
        }

        public void SetOutlineColor(Color color)
        {
            m_material.SetColor(RenderHellShaderIDs.OutlineColor, color);
        }

        public void SetOutlineThickness(float normalizedOutlineThickness)
        {
            m_material.SetFloat(RenderHellShaderIDs.OutlineThickness, normalizedOutlineThickness);
        }

        public void UpdateDrawingProperties(Brush3DPropertiesStruct[] properties)
        {
            var newDrawingPropertiesBuffer = new ComputeBuffer(properties.Length, Marshal.SizeOf(typeof(Brush3DPropertiesStruct)));
            newDrawingPropertiesBuffer.name = "Brush3DPropertiesBuffer";
            newDrawingPropertiesBuffer.SetData(properties);
            
            ComputeShaderKernels.ForEach(kernel => m_computeShader.SetBuffer(kernel, RenderHellShaderIDs.BrushProperties, newDrawingPropertiesBuffer));
            m_material.SetBuffer(RenderHellShaderIDs.BrushProperties, newDrawingPropertiesBuffer);
            
            m_drawingPropertiesBuffer?.Dispose();
            m_drawingPropertiesBuffer = newDrawingPropertiesBuffer;
        }
        
        public void RemoveDrawingProperties(int index)
        {
            m_computeShader.SetFloat(RenderHellShaderIDs.RemovedIndex, index);
            DispatchOnMaskSize(m_removeBrushPropertiesKernel);
        }

        public void SetDrawingIndex(int index)
        {
            m_computeShader.SetFloat(RenderHellShaderIDs.DrawingIndex, index);
        }
        
        public void SetErasingIndex(int index)
        {
            m_computeShader.SetFloat(RenderHellShaderIDs.ErasingIndex, index);
        }
        
        public void SetClippingIndex(int index)
        {
            m_computeShader.SetFloat(RenderHellShaderIDs.Clipping, index);
        }
        
        public void ResetDrawnRegion(int index)
        {
            m_computeShader.SetFloat(RenderHellShaderIDs.ResetDrawnRegionIndex, index);
            DispatchOnMaskSize(m_resetDrawnRegionKernel);
        }

        public void ClipDrawnRegion(int index)
        {
            m_computeShader.SetFloat(RenderHellShaderIDs.ClipDrawnRegionIndex, index);
            DispatchOnMaskSize(m_clipDrawnRegionKernel);
        }

        public void ResetClippedRegion()
        {
            DispatchOnMaskSize(m_resetClippedRegionKernel);
        }

        void CreateSelectionMask(int size)
        {
            var selectionMask = new RenderTexture(size, size, GraphicsFormat.R16_SFloat, 0)
            {
                name = "SelectionMask",
                format = RenderTextureFormat.ARGBFloat,
                filterMode = FilterMode.Trilinear,
                wrapMode = TextureWrapMode.Clamp,
                dimension = TextureDimension.Tex3D,
                volumeDepth = size,
                enableRandomWrite = true,
                isPowerOfTwo = true
            };
            selectionMask.Create();
            selectionMask.name = "SelectionMask";
            
            ComputeShaderKernels.ForEach(kernel => m_computeShader.SetTexture(kernel, RenderHellShaderIDs.SelectionMask, selectionMask));
            m_material.SetTexture(RenderHellShaderIDs.SelectionMask, selectionMask);
            
            m_computeShader.SetInt(RenderHellShaderIDs.SelectionMaskSize, size);
            m_material.SetInt(RenderHellShaderIDs.SelectionMaskSize, size);
        }

        void DispatchOnMaskSize(int kernel)
        {
            int threadGroup = Mathf.CeilToInt((float) m_selectionMaskSize / 8);
            m_computeShader.Dispatch(kernel, threadGroup, threadGroup, threadGroup);
        }

        protected override void OnPassExecute(CommandBuffer commandBuffer, ScriptableRenderContext context, ref RenderingData renderingData)
        {
            int threadGroup = Mathf.CeilToInt((float) m_selectionMaskSize / 8);
            
            commandBuffer.DispatchCompute(m_computeShader, m_updateMaskKernel, threadGroup, threadGroup, threadGroup);
        }
    }
}