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
        [SerializeField] [Range(0.0f, 1.0f)] float m_radius;
        [Space]
        [Header("Outline")]
        [SerializeField] [Range(0.0f, 1.0f)] float m_outlineThickness;
        [SerializeField] Color m_outlineColor;
        [Space]
        [Header("Intersecting")]
        [SerializeField] bool m_isIntersecting;
        [Space]
        [SerializeField] bool m_startIntersecting;
        [SerializeField] bool m_stopIntersecting;
        [Space]
        [Header("Drawing")]
        [SerializeField] bool m_isDrawing;
        [Space]
        [SerializeField] bool m_startDrawing;
        [SerializeField] bool m_stopDrawing;
        [SerializeField] int m_drawingIndex;
        [Space]
        [Header("Erasing")]
        [SerializeField] bool m_isErasing;
        [Space]
        [SerializeField] bool m_startErasing;
        [SerializeField] bool m_stopErasing;
        [SerializeField] int m_erasingIndex;
        [Space]
        [Header("Clipping")]
        [SerializeField] bool m_isClipping;
        [Space]
        [SerializeField] bool m_startClipping;
        [SerializeField] bool m_stopClipping;
        [Space]
        [Header("Brush3D Properties")]
        [Space]
        [SerializeField] List<Brush3DProperties> m_brush3DProperties;
        [SerializeField] int m_removeBrushPropertiesIndex;
        [Space]
        [SerializeField] bool m_updateBrushProperties;
        [Space]
        [SerializeField] bool m_extrapolateDrawnRegion;
        [SerializeField] bool m_keepLink;
        [SerializeField] int m_extrapolateDrawnRegionIndex;
        [Space]
        [SerializeField] bool m_resetDrawnRegion;
        [SerializeField] int m_resetDrawnRegionIndex;
        [Space]
        [SerializeField] bool m_clipDrawnRegion;
        [SerializeField] int m_clipDrawnRegionIndex;
        [Space]
        [SerializeField] bool m_resetClippedRegion;

        bool m_internalIntersecting;
        bool m_internalDrawing;
        bool m_internalErasing;
        bool m_internalClipping;
        
        IBrush3D m_brush3D;
        
        void Start()
        {
            m_resetDrawnRegion = false;
            m_clipDrawnRegion = false;
            m_resetClippedRegion = false;
            m_extrapolateDrawnRegion = false;

            m_internalIntersecting = true;
            m_internalDrawing = false;
            m_internalErasing = false;
            m_internalClipping = false;

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

            CheckIfIntersecting();
            CheckIfDrawing(m_drawingIndex);
            CheckIfClipping();
            CheckIfErasing(m_erasingIndex);
            CheckIfResetDrawnRegion(m_resetDrawnRegionIndex);
            CheckIfResetClippedRegion();
            CheckIfClipDrawnRegion(m_clipDrawnRegionIndex);
            CheckIfExtrapolateDrawnRegion(m_extrapolateDrawnRegionIndex, m_keepLink);
            CheckIfUpdateBrushProperties();
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
        
        [ContextMenu("Add new brush")]
        public void AddNewBrush()
        {
            var newBrush = new Brush3DProperties { m_albedo = Color.white, m_rimColor = Color.white, m_rimPower = 1.0f };
            m_brush3DProperties.Add(newBrush);
            m_brush3D?.AddDrawingProperties(newBrush);
        }
        
        [ContextMenu("Remove brush")]
        public void RemoveBrush()
        {
            if (m_removeBrushPropertiesIndex == 0) return;
            m_brush3D?.RemoveDrawingProperties(m_brush3DProperties[m_removeBrushPropertiesIndex]);
            m_brush3DProperties.RemoveAt(m_removeBrushPropertiesIndex);
        }

        void CheckIfUpdateBrushProperties()
        {
            if (m_updateBrushProperties)
            {
                m_updateBrushProperties = false;
                m_brush3D.UpdateDrawingProperties();
            }
        }

        void CheckIfIntersecting()
        {
            if (m_startIntersecting)
            {
                m_startIntersecting = false;
                
                m_internalIntersecting = true;
                m_brush3D.StartIntersecting();
            }
            
            if (m_stopIntersecting)
            {
                m_stopIntersecting = false;
                
                m_internalIntersecting = false;
                m_brush3D.StopIntersecting();
            }

            m_isIntersecting = m_internalIntersecting;
        }

        void CheckIfDrawing(int index)
        {
            if (m_startDrawing && index != 0 && index < m_brush3DProperties.Count)
            {
                m_startDrawing = false;
                
                m_internalDrawing = true;
                m_brush3D.StartDrawing(m_brush3DProperties[index]);
            }
            
            if (m_stopDrawing)
            {
                m_stopDrawing = false;
                
                m_internalDrawing = false;
                m_brush3D.StopDrawing();
            }

            m_isDrawing = m_internalDrawing;
        }
        
        void CheckIfClipping()
        {
            if (m_startClipping)
            {
                m_startClipping = false;
                
                m_internalClipping = true;
                m_brush3D.StartClipping();
            }
            
            if (m_stopClipping)
            {
                m_stopClipping = false;
                
                m_internalClipping = false;
                m_brush3D.StopClipping();
            }

            m_isClipping = m_internalClipping;
        }
        
        void CheckIfErasing(int index)
        {
            if (m_startErasing && index != 0 && index < m_brush3DProperties.Count)
            {
                m_startErasing = false;
                
                m_internalErasing = true;
                m_brush3D.StartErasing(m_brush3DProperties[index]);
            }
            
            if (m_stopErasing)
            {
                m_stopErasing = false;
                
                m_internalErasing = false;
                m_brush3D.StopErasing();
            }

            m_isErasing = m_internalErasing;
        }

        void CheckIfResetDrawnRegion(int index)
        {
            if (m_resetDrawnRegion && index != 0 && index < m_brush3DProperties.Count)
            {
                m_brush3D?.ResetDrawnRegion(m_brush3DProperties[index]);
                m_resetDrawnRegion = false;
            }
        }

        void CheckIfClipDrawnRegion(int index)
        {
            if (m_clipDrawnRegion && index != 0 && index < m_brush3DProperties.Count)
            {
                m_brush3D?.ClipDrawnRegion(m_brush3DProperties[index]);
                m_clipDrawnRegion = false;
            }
        }

        void CheckIfResetClippedRegion()
        {
            if (m_resetClippedRegion)
            {
                m_brush3D?.ResetClippedRegion();
                m_resetClippedRegion = false;
            }
        }

        void CheckIfExtrapolateDrawnRegion(int index, bool keepLink)
        {
            if (m_extrapolateDrawnRegion && index != 0 && index < m_brush3DProperties.Count)
            {
                m_brush3D?.ExtrapolateDrawnRegion(m_brush3DProperties[index], keepLink);
                m_extrapolateDrawnRegion = false;
            }
        }
    }
}