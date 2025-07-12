using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using IngSorre97.RenderHell.Brush3D;
using Microsoft.MixedReality.Toolkit.Utilities;
using UnityEngine;
using UnityEngine.Serialization;
// ReSharper disable InvertIf

namespace IngSorre97.RenderHell.Samples
{
    class Brush3DSample : MonoBehaviour
    {
        [SerializeField] MeshRenderer m_meshRenderer;
        [SerializeField] MeshFilter m_meshFilter;
        [SerializeField] MrtkHandsRecognizer m_handsRecognizer;

        [Header("Control Panel")]
        [SerializeField] bool m_intersecting;
        [Space]
        [SerializeField] int m_drawingIndex;
        [SerializeField] int m_erasingIndex;
        [Space]
        [SerializeField] [Range(0.0f, 1.0f)] float m_radius;
        [SerializeField] [Range(0.0f, 1.0f)] float m_outlineThickness;
        [SerializeField] Color m_outlineColor;
        [Space]
        [SerializeField] List<Brush3DProperties> m_brush3DProperties;
        [SerializeField] int m_removeBrushPropertiesIndex;
        [Space]
        [SerializeField] bool m_resetDrawnRegion;
        [SerializeField] int m_resetDrawnRegionIndex;
        [Space]
        [SerializeField] bool m_clipDrawnRegion;
        [SerializeField] int m_clipDrawnRegionIndex;
        [Space]
        [SerializeField] bool m_resetClippedRegion;
        
        IBrush3D m_brush3D;
        
        [ContextMenu("Add new brush")]
        public void AddNewBrush()
        {
            var newBrush = new Brush3DProperties { m_albedo = Color.white, m_rimColor = Color.white, m_rimPower = 1.0f };
            m_brush3DProperties.Add(newBrush);
            m_brush3D?.AddDrawingProperties(newBrush);
        }

        [ContextMenu("Update brushes")]
        public void UpdateBrushes()
        {
            m_brush3D?.UpdateDrawingProperties();
        }
        
        [ContextMenu("Remove brush")]
        public void RemoveBrush()
        {
            m_brush3D?.RemoveDrawingProperties(m_brush3DProperties[m_removeBrushPropertiesIndex]);
            m_brush3DProperties.RemoveAt(m_removeBrushPropertiesIndex);
        }

        [ContextMenu("Start intersecting")]
        public void StartIntersecting()
        {
            m_brush3D?.StartIntersecting();
        }
        
        [ContextMenu("Stop intersecting")]
        public void StopIntersecting()
        {
            m_brush3D?.StopIntersecting();
        }

        [ContextMenu("Start drawing")]
        public void StartDrawing()
        {
            m_brush3D?.StartDrawing(m_brush3DProperties[m_drawingIndex]);
        }
        
        [ContextMenu("Stop drawing")]
        public void StopDrawing()
        {
            m_brush3D?.StopDrawing();
        }
        
        [ContextMenu("Start clipping")]
        public void StartClipping()
        {
            m_brush3D?.StartClipping();
        }
        
        [ContextMenu("Stop clipping")]
        public void StopClipping()
        {
            m_brush3D?.StopClipping();
        }
        
        [ContextMenu("Start erasing")]
        public void StartErasing()
        {
            m_brush3D?.StartErasing(m_brush3DProperties[m_erasingIndex]);
        }
        
        [ContextMenu("Stop erasing")]
        public void StopErasing()
        {
            m_brush3D?.StopErasing();
        }
        
        void Start()
        {
            m_resetDrawnRegion = false;
            m_clipDrawnRegion = false;
            m_resetClippedRegion = false;

            if (m_brush3DProperties.Count == 0)
            {
                Debug.LogError("Brush3DSample: No Brush Properties Set!");
                return;
            }
            m_brush3D = RenderHellAPI.CreateBrush3D(m_meshRenderer, m_meshFilter, m_brush3DProperties[0]);
            for (int i = 1; i < m_brush3DProperties.Count; i++)
            {
                m_brush3D.AddDrawingProperties(m_brush3DProperties[i]);
            }
            
            m_brush3D.StartIntersecting();
        }

        void Update()
        {
            UpdateCursorPosition();
            
            m_brush3D?.SetRadius(m_radius);
            m_brush3D?.SetOutlineThickness(m_outlineThickness);
            m_brush3D?.SetOutlineColor(m_outlineColor);

            if (m_resetDrawnRegion)
            {
                m_brush3D?.ResetDrawnRegion(m_brush3DProperties[m_resetDrawnRegionIndex]);
                m_resetDrawnRegion = false;
            }
            
            if (m_clipDrawnRegion)
            {
                m_brush3D?.ClipDrawnRegion(m_brush3DProperties[m_clipDrawnRegionIndex]);
                m_clipDrawnRegion = false;
            }
            
            if (m_resetClippedRegion)
            {
                m_brush3D?.ResetClippedRegion();
                m_resetClippedRegion = false;
            }
        }

        void UpdateCursorPosition()
        {
            Vector3 fingerTipPosition = m_handsRecognizer.GetPrioritizedFingerTipPosition(out Handedness hand);
            if (hand == Handedness.None)
            {
                return;
            }
            
            m_brush3D.SetPosition(fingerTipPosition);
        }
    }
}