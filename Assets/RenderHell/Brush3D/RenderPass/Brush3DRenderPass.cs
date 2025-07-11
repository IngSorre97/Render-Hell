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
    class Brush3DRenderPass : BaseRenderPass, IBrush3D
    {
        const RenderPassEvent RENDER_PASS_EVENT = RenderPassEvent.BeforeRenderingTransparents;
        
        readonly Material m_material;
        readonly int m_selectionMaskSize;
        
        readonly ComputeShader m_computeShader;
        readonly int m_updateMaskKernel;
        readonly int m_resetDrawnRegionKernel;
        readonly int m_clipDrawnRegionKernel;
        readonly int m_resetClippedRegionKernel;
        
        readonly List<Brush3DProperties> m_drawingProperties;
        ComputeBuffer m_drawingPropertiesBuffer;
        Brush3DProperties m_currentDrawingProperties;
        Brush3DProperties m_currentErasingProperties;
        Brush3DProperties IntersectingProperties => m_drawingProperties[0];

        public Brush3DRenderPass(MeshRenderer meshRenderer, Bounds bounds, ComputeShader computeShader, int selectionMaskSize, Brush3DProperties intersectingProperties)
            : base("Brush3DPass", RENDER_PASS_EVENT, Camera.main)
        {
            m_computeShader = Object.Instantiate(computeShader);
            m_selectionMaskSize = selectionMaskSize;
            
            m_updateMaskKernel = m_computeShader.FindKernel("UpdateMask");
            m_resetDrawnRegionKernel = m_computeShader.FindKernel("ResetDrawnRegion");
            m_clipDrawnRegionKernel = m_computeShader.FindKernel("ClipDrawnRegion");
            m_resetClippedRegionKernel = m_computeShader.FindKernel("ResetClippedRegion");

            m_material = meshRenderer.material;
            m_drawingProperties = new List<Brush3DProperties>{intersectingProperties};
            UpdateDrawingProperties();
            
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
        }
        
        public void StopIntersecting()
        {
            m_computeShader.SetFloat(RenderHellShaderIDs.Intersecting, 0.0f);
        }

        public void SetOutlineColor(Color color)
        {
            m_material.SetColor(RenderHellShaderIDs.OutlineColor, color);
        }

        public void SetOutlineThickness(float normalizedOutlineThickness)
        {
            m_material.SetFloat(RenderHellShaderIDs.OutlineThickness, normalizedOutlineThickness);
        }

        public void AddDrawingProperties(Brush3DProperties properties)
        {
            if (TryGetBrushPropertiesIndex(properties, out int _))
            {
                Debug.LogError("Aborted AddDrawingProperties( ), cannot add same drawing properties twice");
                return;
            }
            
            m_drawingProperties.Add(properties);
            UpdateDrawingProperties();
        }

        public void UpdateDrawingProperties()
        {
            Brush3DPropertiesStruct[] properties = m_drawingProperties.Select(dp => dp.ToStruct()).ToArray();
            var newDrawingPropertiesBuffer = new ComputeBuffer(properties.Length, Marshal.SizeOf(typeof(Brush3DPropertiesStruct)));
            newDrawingPropertiesBuffer.name = "Brush3DPropertiesBuffer";
            newDrawingPropertiesBuffer.SetData(properties);
            
            m_computeShader.SetBuffer(m_updateMaskKernel, RenderHellShaderIDs.BrushProperties, newDrawingPropertiesBuffer);
            m_computeShader.SetBuffer(m_resetDrawnRegionKernel, RenderHellShaderIDs.BrushProperties, newDrawingPropertiesBuffer);
            m_computeShader.SetBuffer(m_clipDrawnRegionKernel, RenderHellShaderIDs.BrushProperties, newDrawingPropertiesBuffer);
            m_computeShader.SetBuffer(m_resetClippedRegionKernel, RenderHellShaderIDs.BrushProperties, newDrawingPropertiesBuffer);
            m_material.SetBuffer(RenderHellShaderIDs.BrushProperties, newDrawingPropertiesBuffer);

            if (m_drawingPropertiesBuffer == null)
            {
                return;
            }

            m_drawingPropertiesBuffer.Dispose();
            m_drawingPropertiesBuffer = newDrawingPropertiesBuffer;
        }

        public void RemoveDrawingProperties(Brush3DProperties properties)
        {
            if (properties == IntersectingProperties)
            {
                Debug.LogError("Aborted RemoveDrawingProperties( ), removing intersecting properties is forbidden");
                return;
            }
            
            if (!TryGetBrushPropertiesIndex(properties, out int _))
            {
                Debug.LogError("Aborted RemoveDrawingProperties( ), no property found");
                return;
            }
            
            if (properties == m_currentDrawingProperties)
            {
                Debug.LogError("Aborted RemoveDrawingProperties( ), removing current drawing properties is forbidden");
                return;
            }
            
            if (properties == m_currentErasingProperties)
            {
                Debug.LogError("Aborted RemoveDrawingProperties( ), removing current erasing properties is forbidden");
                return;
            }
            
            m_drawingProperties.Remove(properties);
            UpdateDrawingProperties();
        }

        public void StartDrawing(Brush3DProperties properties)
        {
            if (properties == IntersectingProperties)
            {
                Debug.LogError("Aborted StartDrawing( ), drawing with intersecting properties is forbidden");
                return;
            }
            
            if (!TryGetBrushPropertiesIndex(properties, out int index))
            {
                Debug.LogError("Aborted StartDrawing( ), no property found");
                return;
            }
            
            m_currentDrawingProperties = properties;
            m_computeShader.SetFloat(RenderHellShaderIDs.DrawingIndex, index);
        }

        public void StopDrawing()
        {
            m_currentDrawingProperties = null;
            m_computeShader.SetFloat(RenderHellShaderIDs.DrawingIndex, 0.0f);
        }
        
        public void StartErasing(Brush3DProperties properties)
        {
            if (!TryGetBrushPropertiesIndex(properties, out int index))
            {
                Debug.LogError("Aborted StartErasing( ), no property found");
                return;
            }
            
            m_currentErasingProperties = properties;
            m_computeShader.SetFloat(RenderHellShaderIDs.ErasingIndex, index);
        }

        public void StopErasing()
        {
            m_currentErasingProperties = null;
            m_computeShader.SetFloat(RenderHellShaderIDs.ErasingIndex, 0.0f);
        }

        public void StartClipping()
        {
            m_computeShader.SetFloat(RenderHellShaderIDs.Clipping, 1.0f);
        }

        public void StopClipping()
        {
            m_computeShader.SetFloat(RenderHellShaderIDs.Clipping, 0.0f);
        }


        public void ResetDrawnRegion(Brush3DProperties properties)
        {
            if (!TryGetBrushPropertiesIndex(properties, out int index))
            {
                Debug.LogError("Aborted ResetDrawnRegion( ), no property found");
                return;
            }
            m_computeShader.SetFloat(RenderHellShaderIDs.ResetDrawnRegionIndex, index);
            
            int threadGroup = Mathf.CeilToInt((float) m_selectionMaskSize / 8);
            m_computeShader.Dispatch(m_resetDrawnRegionKernel, threadGroup, threadGroup, threadGroup);
        }

        public void ClipDrawnRegion(Brush3DProperties properties)
        {
            if (!TryGetBrushPropertiesIndex(properties, out int index))
            {
                Debug.LogError("Aborted ClipDrawnRegion( ), no property found");
                return;
            }
            m_computeShader.SetFloat(RenderHellShaderIDs.ClipDrawnRegionIndex, index);
            
            int threadGroup = Mathf.CeilToInt((float) m_selectionMaskSize / 8);
            m_computeShader.Dispatch(m_clipDrawnRegionKernel, threadGroup, threadGroup, threadGroup);
        }

        public void ResetClippedRegion()
        {
            int threadGroup = Mathf.CeilToInt((float) m_selectionMaskSize / 8);
            m_computeShader.Dispatch(m_resetClippedRegionKernel, threadGroup, threadGroup, threadGroup);
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
            
            m_computeShader.SetTexture(m_updateMaskKernel, RenderHellShaderIDs.SelectionMask, selectionMask);
            m_computeShader.SetTexture(m_resetDrawnRegionKernel, RenderHellShaderIDs.SelectionMask, selectionMask);
            m_computeShader.SetTexture(m_clipDrawnRegionKernel, RenderHellShaderIDs.SelectionMask, selectionMask);
            m_computeShader.SetTexture(m_resetClippedRegionKernel, RenderHellShaderIDs.SelectionMask, selectionMask);
            m_material.SetTexture(RenderHellShaderIDs.SelectionMask, selectionMask);
            
            m_computeShader.SetInt(RenderHellShaderIDs.SelectionMaskSize, size);
            m_material.SetInt(RenderHellShaderIDs.SelectionMaskSize, size);
        }

        protected override void OnPassExecute(CommandBuffer commandBuffer, ScriptableRenderContext context, ref RenderingData renderingData)
        {
            int threadGroup = Mathf.CeilToInt((float) m_selectionMaskSize / 8);
            
            commandBuffer.DispatchCompute(m_computeShader, m_updateMaskKernel, threadGroup, threadGroup, threadGroup);
        }

        bool TryGetBrushPropertiesIndex(Brush3DProperties properties, out int index)
        {
            if (m_drawingProperties.Contains(properties))
            {
                index = m_drawingProperties.IndexOf(properties);
                return true;
            }

            index = -1;
            return false;
        }
    }
}