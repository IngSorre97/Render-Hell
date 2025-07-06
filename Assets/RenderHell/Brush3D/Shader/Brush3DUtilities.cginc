#ifndef __BRUSH3D_UTILITIES__
#define __BRUSH3D_UTILITIES__

#include "Assets/RenderHell/Common/ShaderUtilities/FastConditionals.cginc"
#include "Assets/RenderHell/Common/ShaderUtilities/ShaderUtilities.cginc"

#pragma enable_d3d11_debug_symbols

float3 _BoundsMin;
float3 _BoundsMax;

float3 ComputeBrush3DNormalizedUV(float3 objPos)
{
    return (objPos - _BoundsMin) / (_BoundsMax - _BoundsMin);
}

#endif // __BRUSH3D_UTILITIES__