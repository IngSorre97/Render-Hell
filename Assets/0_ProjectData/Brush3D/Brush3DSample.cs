using System;
using System.Threading.Tasks;
using IngSorre97.RenderHell.Brush3D;
using Microsoft.MixedReality.Toolkit.Utilities;
using UnityEngine;
using UnityEngine.Serialization;

namespace IngSorre97.RenderHell.Samples
{
    class Brush3DSample : MonoBehaviour
    {
        [SerializeField] MeshRenderer m_meshRenderer;
        [SerializeField] MeshFilter m_meshFilter;
        [SerializeField] MrtkHandsRecognizer m_handsRecognizer;

        [Header("Control Panel")]
        [SerializeField] bool m_intersecting;
        [SerializeField] bool m_drawing;
        [SerializeField] bool m_clipping;
        [SerializeField] [Range(0.0f, 25.0f)] float m_radius;
        [Space]
        [SerializeField] float m_intersectionRimPower;
        [SerializeField] Color m_intersectionColor;
        [Space]
        [SerializeField] [Range(0.0f, 50.0f)] float m_outlineThickness;
        [SerializeField] Color m_outlineColor;
        [Space]
        [SerializeField] float m_drawingRimPower;
        [SerializeField] Color m_drawingColor;
        
        [Space]
        [Header("Update")]
        [SerializeField] bool m_updateLoop;
        [SerializeField] bool m_updateOnce;

        IBrush3D m_brush3D;
        
        void Start()
        {
            m_updateOnce = false;
            
            m_brush3D = RenderHellAPI.CreateBrush3D(m_meshRenderer, m_meshFilter);
            UpdateBrush3D();
        }

        void Update()
        {
            UpdateCursorPosition();

            if (!m_updateOnce && !m_updateLoop)
            {
                return;
            }
            m_updateOnce = false;
            
            UpdateBrush3D();
        }

        void UpdateBrush3D()
        {
            m_brush3D.SetIntersectionActivation(m_intersecting);
            m_brush3D.SetDrawingActivation(m_drawing);
            m_brush3D.SetClippingActivation(m_clipping);
            m_brush3D.SetRadius(m_radius);
            
            m_brush3D.SetIntersectionColor(m_intersectionColor, m_intersectionRimPower);
            m_brush3D.SetOutlineThickness(m_outlineThickness);
            m_brush3D.SetOutlineColor(m_outlineColor);
            m_brush3D.SetDrawingColor(m_drawingColor, m_drawingRimPower);
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