#ifndef __BRUSH3D__
#define __BRUSH3D__

#include "Assets/RenderHell/Brush3D/Shader/Brush3DCommon.cginc"

#pragma enable_d3d11_debug_symbols

float _Initialized;

Texture3D<float> _SelectionMask;

float4 _OutlineColor;
float _OutlineThickness;

StructuredBuffer<brushProperties> _BrushProperties;

float IsInsideCursorOutline(float3 normalizedUV, float isInsideCursorSphere)
{
    return and(isInsideCursorSphere, not(IsInsideSphere(normalizedUV, _CursorNormalizedPos, _CursorNormalizedRadius - _OutlineThickness)));
}

float4 ComputeBrush3DAlbedo(float storedIndex, float4 materialAlbedo, float isInsideCursorSphere, float isInsideCursorOutline)
{
    float isDrawnIndex = IsDrawnIndex(storedIndex);
    float4 storedAlbedo = _BrushProperties[storedIndex].Albedo;
    float4 intersectionAlbedo = _BrushProperties[0].Albedo;
    
    float4 newAlbedo = lerp(materialAlbedo, storedAlbedo, isDrawnIndex);
    newAlbedo = lerp(newAlbedo, intersectionAlbedo, isInsideCursorSphere);
    newAlbedo = lerp(newAlbedo, _OutlineColor, isInsideCursorOutline);
    
    return lerp(materialAlbedo, newAlbedo, _Initialized);
}

float3 ComputeBrush3DRimColor(float storedIndex, float3 materialRimColor, float isInsideCursorSphere)
{
    float isDrawnIndex = IsDrawnIndex(storedIndex);
    float3 storedRimColor = _BrushProperties[storedIndex].RimColor;
    float3 intersectionRimColor = _BrushProperties[0].RimColor;
    
    float3 newRimColor = lerp(materialRimColor, storedRimColor, isDrawnIndex);
    newRimColor = lerp(newRimColor, intersectionRimColor, isInsideCursorSphere);
    newRimColor = lerp(materialRimColor, newRimColor, or(isDrawnIndex, isInsideCursorSphere));

    return lerp(materialRimColor, newRimColor, _Initialized);
}

float ComputeBrush3DRimPower(float storedIndex, float materialRimPower, float isInsideCursorSphere)
{
    float isDrawnIndex = IsDrawnIndex(storedIndex);
    float storedRimPower = _BrushProperties[storedIndex].RimPower;
    float intersectionRimPower = _BrushProperties[0].RimPower;
    
    float newRimPower = lerp(materialRimPower, storedRimPower, isDrawnIndex);
    newRimPower = lerp(newRimPower, intersectionRimPower, isInsideCursorSphere);
    newRimPower = lerp(materialRimPower, newRimPower, or(isDrawnIndex, isInsideCursorSphere));

    return lerp(materialRimPower, newRimPower, _Initialized);
}

brushProperties GetBrush3DStoredProperties(float3 normalizedUV, float4 materialAlbedo, float3 materialRimColor, float materialRimPower)
{
    uint3 id = uint3(normalizedUV.x * _SelectionMaskSize, normalizedUV.y * _SelectionMaskSize, normalizedUV.z * _SelectionMaskSize);
    float storedIndex = _SelectionMask[id];
    clip(storedIndex);

    float isInsideCursorSphere = and(_Intersecting, IsInsideCursorSphere(normalizedUV));
    float isInsideCursorOutline = and(_Intersecting, IsInsideCursorOutline(normalizedUV, isInsideCursorSphere));
    
    brushProperties voxelProperties;
    voxelProperties.Albedo = ComputeBrush3DAlbedo(storedIndex, materialAlbedo, isInsideCursorSphere, isInsideCursorOutline);
    voxelProperties.RimColor = ComputeBrush3DRimColor(storedIndex, materialRimColor, isInsideCursorSphere);
    voxelProperties.RimPower = ComputeBrush3DRimPower(storedIndex, materialRimPower, isInsideCursorSphere);
    return voxelProperties;
}

#endif // __BRUSH3D__