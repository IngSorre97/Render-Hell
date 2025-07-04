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

float3 ComputeBrush3DNormalizedUV(float3 objPos)
{
    return (objPos - _BoundsMin) / (_BoundsMax - _BoundsMin);
}

float GetBrush3DStoredValue(float3 normalizedUV)
{
    return SAMPLE_TEXTURE3D(_SelectionMask, sampler_SelectionMask, normalizedUV);
}

float4 ComputeBrush3DColor(float3 normalizedUV, float storedValue)
{
    clip(storedValue);
    
    float4 noColor = float4(0.0f, 0.0f, 0.0f, 1.0f);
    float4 drawColor = float4(0.0f, 0.0f, 1.0f, 1.0f);
    float4 intersectingColor = float4(1.0f, 0.0f, 0.0f, 1.0f);
    
    float isVoxelDrawn = when_eq(storedValue, 1.0f);
    
    float isInsideCursorSphere = IsInsideSphere(normalizedUV, _CursorNormalizedPos, _CursorNormalizedRadius);
    float4 newColor = lerp(noColor, drawColor, isVoxelDrawn);
    newColor = lerp(newColor, intersectingColor, isInsideCursorSphere);
    
    return newColor;
}

float ComputeBrush3DRimPower(float brush3DValue)
{
    float4 drawColor = float4(0.0f, 0.0f, 1.0f, 0.0f);
    float4 previewColor = float4(1.0f, 0.0f, 0.0f, 0.0f);

    return 0.0f;
}

#endif // __BRUSH3D__