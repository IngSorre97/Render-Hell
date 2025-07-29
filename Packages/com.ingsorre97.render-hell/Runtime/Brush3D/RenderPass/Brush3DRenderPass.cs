using System.Collections.Generic;
using System.Runtime.InteropServices;
using System.Threading.Tasks;
using Unity.Collections;
using UnityEngine;
using UnityEngine.Experimental.Rendering;
using UnityEngine.Rendering;
using UnityEngine.Rendering.Universal;
using Object = UnityEngine.Object;
// ReSharper disable Unity.PerformanceCriticalCodeNullComparison

namespace IngSorre97.RenderHell.Brush3D
{
    class Brush3DRenderPass : BaseRenderPass
    {
        const RenderPassEvent RENDER_PASS_EVENT = RenderPassEvent.BeforeRenderingTransparents;
        
        readonly Material m_material;
        readonly List<Material> m_linkedMaterials = new();
        readonly List<Material> m_notLinkedMaterials = new();
        readonly List<RenderTexture> m_clonedSelectionMasks = new();
        BrushState m_brushState;
        
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

        public Brush3DRenderPass(Renderer meshRenderer, Bounds bounds, ComputeShader computeShader, int selectionMaskSize)
            : base("Brush3DPass", RENDER_PASS_EVENT, Camera.main)
        {
            m_computeShader = Object.Instantiate(computeShader);
            m_brushState.SelectionMaskSize = selectionMaskSize;
            
            m_updateMaskKernel = m_computeShader.FindKernel("UpdateMask");
            m_resetDrawnRegionKernel = m_computeShader.FindKernel("ResetDrawnRegion");
            m_clipDrawnRegionKernel = m_computeShader.FindKernel("ClipDrawnRegion");
            m_resetClippedRegionKernel = m_computeShader.FindKernel("ResetClippedRegion");
            m_removeBrushPropertiesKernel = m_computeShader.FindKernel("RemoveBrushProperties");

            m_material = meshRenderer.material;
            m_brushState.Bounds = bounds;
            
            CreateSelectionMask(selectionMaskSize);
            
            m_material.SetVector(RenderHellShaderIDs.BoundsMin, m_brushState.Bounds.min);
            m_material.SetVector(RenderHellShaderIDs.BoundsMax, m_brushState.Bounds.max);
            m_material.SetFloat(RenderHellShaderIDs.Initialized, 1.0f);
        }

        public override void Dispose()
        {
            base.Dispose();
            Object.Destroy(m_computeShader);
            m_brushState.Dispose();
            
            m_linkedMaterials.ForEach(Object.Destroy);
            m_notLinkedMaterials.ForEach(Object.Destroy);
            m_clonedSelectionMasks.ForEach(Object.Destroy);
        }
        
        public override bool ShouldExecutePass()
        {
            return true;
        }
        
        public void SetPosition(Vector3 normalizedPos)
        {
            m_brushState.CursorNormalizedPos = normalizedPos;
            
            m_computeShader.SetVector(RenderHellShaderIDs.CursorNormalizedPos, normalizedPos);
            m_material.SetVector(RenderHellShaderIDs.CursorNormalizedPos, normalizedPos);
            m_linkedMaterials.ForEach(lm => lm.SetVector(RenderHellShaderIDs.CursorNormalizedPos, normalizedPos));
        }
        
        public void SetRadius(float normalizedRadius)
        {
            m_brushState.CursorNormalizedRadius = normalizedRadius;
            
            m_computeShader.SetFloat(RenderHellShaderIDs.CursorNormalizedRadius, normalizedRadius);
            m_material.SetFloat(RenderHellShaderIDs.CursorNormalizedRadius, normalizedRadius);
            m_linkedMaterials.ForEach(lm => lm.SetFloat(RenderHellShaderIDs.CursorNormalizedRadius, normalizedRadius));
        }

        public void StartIntersecting()
        {
            m_brushState.Intersecting = 1.0f;
            
            m_computeShader.SetFloat(RenderHellShaderIDs.Intersecting, 1.0f);
            m_material.SetFloat(RenderHellShaderIDs.Intersecting, 1.0f);
            m_linkedMaterials.ForEach(lm => lm.SetFloat(RenderHellShaderIDs.Intersecting, 1.0f));
        }
        
        public void StopIntersecting()
        {
            m_brushState.Intersecting = 0.0f;
            
            m_computeShader.SetFloat(RenderHellShaderIDs.Intersecting, 0.0f);
            m_material.SetFloat(RenderHellShaderIDs.Intersecting, 0.0f);
            m_linkedMaterials.ForEach(lm => lm.SetFloat(RenderHellShaderIDs.Intersecting, 0.0f));
        }

        public void SetOutlineColor(Color color)
        {
            m_brushState.OutlineColor = color;
            
            m_material.SetColor(RenderHellShaderIDs.OutlineColor, color);
            m_linkedMaterials.ForEach(lm => lm.SetColor(RenderHellShaderIDs.OutlineColor, color));
        }

        public void SetOutlineThickness(float normalizedOutlineThickness)
        {
            m_brushState.OutlineThickness = normalizedOutlineThickness;
            
            m_material.SetFloat(RenderHellShaderIDs.OutlineThickness, normalizedOutlineThickness);
            m_linkedMaterials.ForEach(lm => lm.SetFloat(RenderHellShaderIDs.OutlineThickness, normalizedOutlineThickness));
        }

        public void UpdateDrawingProperties(Brush3DPropertiesStruct[] properties)
        {
            var newDrawingPropertiesBuffer = new ComputeBuffer(properties.Length, Marshal.SizeOf(typeof(Brush3DPropertiesStruct)));
            newDrawingPropertiesBuffer.name = "Brush3DPropertiesBuffer";
            newDrawingPropertiesBuffer.SetData(properties);
            
            ComputeShaderKernels.ForEach(kernel => m_computeShader.SetBuffer(kernel, RenderHellShaderIDs.BrushProperties, newDrawingPropertiesBuffer));
            m_material.SetBuffer(RenderHellShaderIDs.BrushProperties, newDrawingPropertiesBuffer);
            m_linkedMaterials.ForEach(lm => lm.SetBuffer(RenderHellShaderIDs.BrushProperties, newDrawingPropertiesBuffer));
            
            m_brushState.DrawingProperties?.Dispose();
            m_brushState.DrawingProperties = newDrawingPropertiesBuffer;
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

        public async Task<NativeArray<float>> GetSelectionMask()
        {
            int expectedSize = Mathf.CeilToInt(Mathf.Pow(m_brushState.SelectionMaskSize, 3));
            var selectionMaskData = new NativeArray<float>(expectedSize, Allocator.Persistent);
            var request = AsyncGPUReadback.RequestIntoNativeArray(ref selectionMaskData, m_brushState.SelectionMask, 0, GraphicsFormat.R32_SFloat);

            while (!request.done)
            {
                await Task.Yield();
            }
            
            if (request.hasError) Debug.LogError("Error during GPU readback of selection mask");
            return selectionMaskData;
        }

        public Material CloneBrushMaterial(bool keepLink)
        {
            var clonedMaterial = Object.Instantiate(m_material);
            clonedMaterial.SetVector(RenderHellShaderIDs.BoundsMin, m_brushState.Bounds.min);
            clonedMaterial.SetVector(RenderHellShaderIDs.BoundsMax, m_brushState.Bounds.max);
            
            clonedMaterial.SetVector(RenderHellShaderIDs.CursorNormalizedPos, m_brushState.CursorNormalizedPos);
            clonedMaterial.SetFloat(RenderHellShaderIDs.CursorNormalizedRadius, m_brushState.CursorNormalizedRadius);
            
            clonedMaterial.SetColor(RenderHellShaderIDs.OutlineColor, m_brushState.OutlineColor);
            clonedMaterial.SetFloat(RenderHellShaderIDs.OutlineThickness, m_brushState.OutlineThickness);
            
            clonedMaterial.SetInt(RenderHellShaderIDs.SelectionMaskSize, m_brushState.SelectionMaskSize);
            
            clonedMaterial.SetFloat(RenderHellShaderIDs.Intersecting, m_brushState.Intersecting);
            
            clonedMaterial.SetBuffer(RenderHellShaderIDs.BrushProperties, m_brushState.DrawingProperties);

            clonedMaterial.SetFloat(RenderHellShaderIDs.Initialized, 1.0f);
            if (keepLink)
            {
                m_linkedMaterials.Add(clonedMaterial);
                clonedMaterial.SetTexture(RenderHellShaderIDs.SelectionMask, m_brushState.SelectionMask);
                return clonedMaterial;
            }
            m_notLinkedMaterials.Add(clonedMaterial);
            var clonedSelectionMask = CloneSelectionMask();
            m_clonedSelectionMasks.Add(clonedSelectionMask);
            clonedMaterial.SetTexture(RenderHellShaderIDs.SelectionMask, clonedSelectionMask);
            return clonedMaterial;
        }
        
        RenderTexture CloneSelectionMask()
        {
            RenderTexture source = m_brushState.SelectionMask;
            if (source == null)
            {
                Debug.LogError("Selection Mask is null!");
                return null;
            }

            int size = m_brushState.SelectionMaskSize;
            RenderTexture clonedSelectionMask = new RenderTexture(size, size, GraphicsFormat.R32_SFloat, 0)
            {
                name = "SelectionMaskClone",
                format = RenderTextureFormat.ARGBFloat,
                filterMode = FilterMode.Trilinear,
                wrapMode = TextureWrapMode.Clamp,
                dimension = TextureDimension.Tex2DArray,
                volumeDepth = size,
                enableRandomWrite = true,
                isPowerOfTwo = true
            };
            clonedSelectionMask.Create();
            Graphics.Blit(source, clonedSelectionMask);
            return clonedSelectionMask;
        }

        void CreateSelectionMask(int size)
        {
            var selectionMask = new RenderTexture(size, size, GraphicsFormat.R32_SFloat, 0)
            {
                name = "SelectionMask",
                format = RenderTextureFormat.ARGBFloat,
                filterMode = FilterMode.Trilinear,
                wrapMode = TextureWrapMode.Clamp,
                dimension = TextureDimension.Tex2DArray,
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

            m_brushState.SelectionMask = selectionMask;
        }

        void DispatchOnMaskSize(int kernel)
        {
            int threadGroup = Mathf.CeilToInt((float) m_brushState.SelectionMaskSize / 8);
            m_computeShader.Dispatch(kernel, threadGroup, threadGroup, threadGroup);
        }

        protected override void OnPassExecute(CommandBuffer commandBuffer, ScriptableRenderContext context, ref RenderingData renderingData)
        {
            DispatchOnMaskSize(m_updateMaskKernel);
        }
    }
}