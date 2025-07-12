#ifndef __BRUSH3D_COMMON__
#define __BRUSH3D_COMMON__

#include "Assets/RenderHell/Common/ShaderUtilities/FastConditionals.cginc"
#include "Assets/RenderHell/Common/ShaderUtilities/ShaderUtilities.cginc"

#pragma enable_d3d11_debug_symbols

int _SelectionMaskSize;

float3 _CursorNormalizedPos;
float _CursorNormalizedRadius;

float3 _BoundsMin;
float3 _BoundsMax;

float _Intersecting;
float _DrawingIndex;
float _ErasingIndex;
float _Clipping;

static const float _NoIndex = 0;
static const float _ClipIndex = -1;

struct brushProperties
{
    float4 Albedo;
    float3 RimColor;
    float RimPower;
};

float IsInsideCursorSphere(float3 normalizedUV)
{
    return IsInsideSphere(normalizedUV, _CursorNormalizedPos, _CursorNormalizedRadius);
}

float IsDrawing()
{
    return when_gt(_DrawingIndex, 0.0f);
}

float IsErasing()
{
    return when_gt(_ErasingIndex, 0.0f);
}

float IsClipped(float index)
{
    return when_eq(index, _ClipIndex);
}

float IsDrawnIndex(float index)
{
    return when_gt(index, 0);
}

float3 ComputeBrush3DNormalizedUV(float3 objPos)
{
    return (objPos - _BoundsMin) / (_BoundsMax - _BoundsMin);
}

#endif // __BRUSH3D_COMMON__