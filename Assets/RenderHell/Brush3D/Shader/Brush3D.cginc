#ifndef __BRUSH3D__
#define __BRUSH3D__

#include "Assets/RenderHell/Common/ShaderUtilities/FastConditionals.cginc"
#include "Assets/RenderHell/Common/ShaderUtilities/ShaderUtilities.cginc"
#include "Assets/RenderHell/Brush3D/Shader/Brush3DUtilities.cginc"

#pragma enable_d3d11_debug_symbols

float _Initialized;
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

float4 _OutlineColor;
float _OutlineThickness;

float4 GetBrush3DStoredColor(float3 normalizedUV)
{
    return SAMPLE_TEXTURE3D(_SelectionMask, sampler_SelectionMask, normalizedUV);
}

float IsInsideCursorSphere(float3 normalizedUV)
{
    return IsInsideSphere(normalizedUV, _CursorNormalizedPos, _CursorNormalizedRadius);
}

float IsInsideCursorOutline(float3 normalizedUV, float isInsideCursorSphere)
{
    return and(isInsideCursorSphere, not(IsInsideSphere(normalizedUV, _CursorNormalizedPos, _CursorNormalizedRadius - _OutlineThickness)));
}

float4 ComputeBrush3DColor(float4 storedColor, float isInsideCursorSphere, float isInsideCursorOutline)
{
    clip(storedColor.w);
    
    float4 newColor = lerp(_NoColor, storedColor, IsDrawnColor(storedColor));
    newColor = lerp(newColor, _IntersectingColor, isInsideCursorSphere);
    newColor = lerp(newColor, _OutlineColor, isInsideCursorOutline);
    newColor = lerp(_NoColor, newColor, _Initialized);
    
    return newColor;
}

float ComputeBrush3DRimPower(float rimPower, float4 storedColor, float isInsideCursorSphere)
{
    float newRimPower = lerp(0.0f, _DrawingRimPower, IsDrawnColor(storedColor));
    newRimPower = lerp(newRimPower, _IntersectingRimPower, isInsideCursorSphere);
    newRimPower = lerp(rimPower, newRimPower, or(IsDrawnColor(storedColor), isInsideCursorSphere));

    return lerp(rimPower, newRimPower, _Initialized);
}

#endif // __BRUSH3D__