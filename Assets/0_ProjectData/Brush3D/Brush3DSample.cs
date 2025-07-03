using System.Threading.Tasks;
using IngSorre97.RenderHell.Brush3D;
using Microsoft.MixedReality.Toolkit.Utilities;
using UnityEngine;

namespace IngSorre97.RenderHell.Samples
{
    class Brush3DSample : MonoBehaviour
    {
        [SerializeField] MeshRenderer m_meshRenderer;
        [SerializeField] MeshFilter m_meshFilter;
        [SerializeField] MrtkHandsRecognizer m_handsRecognizer;

        [Header("Control Panel")]
        [SerializeField] bool m_intersecting;
        [SerializeField] [Range(0.0f, 50.0f)] float m_radius;

        [SerializeField] bool m_update;

        IBrush3D m_brush3D;
        
        void Start()
        {
            m_update = false;
            
            m_brush3D = RenderHellAPI.CreateBrush3D(m_meshRenderer, m_meshFilter);
            m_brush3D.SetIntersectionActivation(true);
            m_brush3D.SetRadius(m_radius);
        }

        void Update()
        {
            UpdateCursorPosition();

            if (!m_update)
            {
                return;
            }
            m_update = false;
            
            m_brush3D.SetIntersectionActivation(m_intersecting);
            m_brush3D.SetRadius(m_radius);
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