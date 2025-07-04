#ifndef __BRUSH3D__
#define __BRUSH3D__

#include "Assets/RenderHell/Common/ShaderUtilities/FastConditionals.cginc"
#include "Assets/RenderHell/Common/ShaderUtilities/ShaderUtilities.cginc"

#pragma enable_d3d11_debug_symbols

float3 _BoundsMin;
float3 _BoundsMax;

float3 _CursorNormalizedPos;
float _CursorNormalizedRadius;

float _Intersecting;
float _Drawing;
float _Clipping;

TEXTURE3D(_SelectionMask);
SAMPLER(sampler_SelectionMask);
int _SelectionMaskSize;

float4 _IntersectingColor;
float _IntersectingRimPower;

float4 _DrawingColor;
float _DrawingRimPower;

float3 ComputeBrush3DNormalizedUV(float3 objPos)
{
    return (objPos - _BoundsMin) / (_BoundsMax - _BoundsMin);
}

float GetBrush3DStoredValue(float3 normalizedUV)
{
    return SAMPLE_TEXTURE3D(_SelectionMask, sampler_SelectionMask, normalizedUV);
}

float IsInsideCursorSphere(float3 normalizedUV)
{
    return IsInsideSphere(normalizedUV, _CursorNormalizedPos, _CursorNormalizedRadius);
}

float4 ComputeBrush3DColor(float storedValue, float isInsideCursorSphere)
{
    clip(storedValue);
    
    float isVoxelDrawn = when_eq(storedValue, 1.0f);
    
    float4 newColor = lerp(float4(0.0f, 0.0f, 0.0f, 0.0f), _DrawingColor, isVoxelDrawn);
    newColor = lerp(newColor, _IntersectingColor, isInsideCursorSphere);
    
    return newColor;
}

float ComputeBrush3DRimPower(float rimPower, float storedValue, float isInsideCursorSphere)
{
    clip(storedValue);

    float isVoxelDrawn = when_eq(storedValue, 1.0f);
    
    float newRimPower = lerp(0.0f, _DrawingRimPower, isVoxelDrawn);
    newRimPower = lerp(newRimPower, _IntersectingRimPower, isInsideCursorSphere);

    return lerp(rimPower, newRimPower, or(isVoxelDrawn, isInsideCursorSphere));
}

#endif // __BRUSH3D__