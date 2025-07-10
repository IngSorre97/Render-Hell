using System;
using System.Runtime.InteropServices;
using Unity.Mathematics;
using UnityEngine;

namespace IngSorre97.RenderHell.Brush3D
{
    [Serializable]
    public class Brush3DProperties
    {
        [SerializeField] public Color m_albedo;
        [SerializeField] public Color m_rimColor;
        [SerializeField] public float m_rimPower;

        internal Brush3DPropertiesStruct ToStruct()
        {
            return new Brush3DPropertiesStruct
            {
                Albedo = new float4(m_albedo.r, m_albedo.g, m_albedo.b, m_albedo.a), 
                RimColor = new float3(m_rimColor.r, m_rimColor.g, m_rimColor.b), 
                RimPower = m_rimPower
            };
        }
            
        internal static int GetSize()
        {
            return 4 * sizeof(float) + 3 * sizeof(float) + sizeof(float);
        }
    }
    
    [StructLayout(LayoutKind.Sequential)]
    struct Brush3DPropertiesStruct
    {
        public float4 Albedo { get; set; } 
        public float3 RimColor { get; set; } 
        public float RimPower { get; set; }
    }
}