#ifndef __BRUSH3D__
#define __BRUSH3D__

#include "Assets/RenderHell/Common/ShaderUtilities/FastConditionals.cginc"

#pragma enable_d3d11_debug_symbols

float3 _BoundsMin;
float3 _BoundsMax;
float _Intersecting;

TEXTURE3D(_SelectionMask);
SAMPLER(sampler_SelectionMask);

float3 ComputeNormalizedUV(float3 objPos)
{
    return (objPos - _BoundsMin) / (_BoundsMax - _BoundsMin);
}

float4 Brush3D(float3 normalizedUV)
{
    if (when_eq(0.0f, _Intersecting))
    {
        return float4(0.0f, 0.0f, 0.0f, 0.0f);
    }
    
    float isSelected = SAMPLE_TEXTURE3D(_SelectionMask, sampler_SelectionMask, normalizedUV);
    clip(0 - isSelected);

    return float4(0.0f, 0.0f, 0.0f, 0.0f);
}

#endif // __BRUSH3D__