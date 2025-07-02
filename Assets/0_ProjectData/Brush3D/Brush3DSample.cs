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
        [SerializeField] [Range(0.0f, 50.0f)] float m_radius;

        IBrush3D m_brush3D;
        
        void Start()
        {
            m_brush3D = RenderHellAPI.CreateBrush3D(m_meshRenderer, m_meshFilter);
            m_brush3D.On();
        }

        void Update()
        {
            m_brush3D.SetRadius(m_radius);
            
            Vector3 fingerTipPosition = m_handsRecognizer.GetPrioritizedFingerTipPosition(out Handedness hand);
            if (hand == Handedness.None)
            {
                return;
            }
            
            m_brush3D.SetPosition(fingerTipPosition);
        }
        
    }
}