using System;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;

namespace IngSorre97.RenderHell.Brush3D
{
    class Brush3DPropertiesManager
    {
        readonly Brush3DRenderPass m_renderPass;
        
        readonly List<Brush3DProperties> m_drawingProperties;
        Brush3DProperties m_currentDrawingProperties;
        Brush3DProperties m_currentErasingProperties;
        Brush3DProperties IntersectingProperties => m_drawingProperties[0];
        
        public Brush3DPropertiesManager(Brush3DRenderPass renderPass, Brush3DProperties intersectingProperties)
        {
            m_renderPass = renderPass;

            m_drawingProperties = new List<Brush3DProperties> { intersectingProperties };
        }
        
        public void AddDrawingProperties(Brush3DProperties properties)
        {
            const string operation = "AddDrawingProperties";
            EnsurePropertiesDoNotExists(properties, operation);
            
            m_drawingProperties.Add(properties);
            
            UpdateDrawingProperties();
        }
        
        public void RemoveDrawingProperties(Brush3DProperties properties)
        {
            const string operation = "RemoveDrawingProperties";
            EnsurePropertiesExists(properties, operation, out int removedIndex);
            EnsureNoIntersectingProperties(properties, operation);
            EnsureNoCurrentProperties(properties, operation);

            int drawIndex = m_drawingProperties.IndexOf(m_currentDrawingProperties);
            if (drawIndex != -1 && drawIndex > removedIndex)
            {
                m_renderPass.SetDrawingIndex(drawIndex - 1);
            }
            
            int eraseIndex = m_drawingProperties.IndexOf(m_currentErasingProperties);
            if (eraseIndex != -1 && eraseIndex > removedIndex)
            {
                m_renderPass.SetErasingIndex(eraseIndex - 1);
            }
            
            m_drawingProperties.RemoveAt(removedIndex);
            
            m_renderPass.RemoveDrawingProperties(removedIndex);
            UpdateDrawingProperties();
        }

        public void UpdateDrawingProperties()
        {
            m_renderPass.UpdateDrawingProperties(m_drawingProperties.Select(dp => dp.ToStruct()).ToArray());
        }

        public void StartDrawing(Brush3DProperties properties)
        {
            const string operation = "StartDrawing";
            EnsurePropertiesExists(properties, operation, out int index);
            EnsureNoIntersectingProperties(properties, operation);
            
            m_currentDrawingProperties = properties;
            m_renderPass.SetDrawingIndex(index);
        }
        
        public void StopDrawing()
        {
            m_currentDrawingProperties = null;
            m_renderPass.SetDrawingIndex(0);
        }
        
        public void StartErasing(Brush3DProperties properties)
        {
            const string operation = "StartErasing";
            EnsurePropertiesExists(properties, operation, out int index);
            EnsureNoIntersectingProperties(properties, operation);
            
            m_currentErasingProperties = properties;
            m_renderPass.SetErasingIndex(index);
        }
        
        public void StopErasing()
        {
            m_currentErasingProperties = null;
            m_renderPass.SetErasingIndex(0);
        }
        
        public void ResetDrawnRegion(Brush3DProperties properties)
        {
            const string operation = "ResetDrawnRegion";
            EnsurePropertiesExists(properties, operation, out int index);
            EnsureNoIntersectingProperties(properties, operation);
            
            m_renderPass.ResetDrawnRegion(index);
        }

        public void ClipDrawnRegion(Brush3DProperties properties)
        {
            const string operation = "ClipDrawnRegion";
            EnsurePropertiesExists(properties, operation, out int index);
            EnsureNoIntersectingProperties(properties, operation);
            
            m_renderPass.ClipDrawnRegion(index);
        }
        
        void EnsureNoIntersectingProperties(Brush3DProperties properties, string operation)
        {
            if (properties != IntersectingProperties)
            {
                return;
            }
            Debug.LogError("Aborted ClipDrawnRegion( ), clipping intersecting properties is forbidden");
            throw new InvalidOperationException($"Aborted {operation}, not a valid operation on Intersecting properties");
        }
        
        void EnsureNoCurrentProperties(Brush3DProperties properties, string operation)
        {
            if (properties != m_currentDrawingProperties && properties != m_currentErasingProperties)
            {
                return;
            }
            throw new InvalidOperationException($"Aborted {operation}, not a valid operation on current properties");
        }

        void EnsurePropertiesExists(Brush3DProperties properties, string operation, out int index)
        {
            index = m_drawingProperties.IndexOf(properties);
            
            if (index == -1)
            {
                throw new InvalidOperationException($"Aborted {operation}, properties not found");
            }
        }
        
        void EnsurePropertiesDoNotExists(Brush3DProperties properties, string operation)
        {
            if (m_drawingProperties.Contains(properties))
            {
                throw new InvalidOperationException($"Aborted {operation}, properties already present");
            }
        }
    }
}