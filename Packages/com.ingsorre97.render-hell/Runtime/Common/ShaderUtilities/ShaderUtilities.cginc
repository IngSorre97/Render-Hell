#ifndef __TEXTURE_UTILITIES__
#define __TEXTURE_UTILITIES__

#include "FastConditionals.cginc"

float _WindowHalfWidth;
float _WindowCenter;

float AdjustContrast(float originalColor)
{
    float minValue = max(0.0f, _WindowCenter - _WindowHalfWidth);
    float maxValue = min(_WindowCenter + _WindowHalfWidth, 1.0f);
    float clampedValue = clamp(originalColor, minValue, maxValue);

    float newRange = maxValue - minValue;
    if (newRange == 0)
        return _WindowCenter;
    
    return (clampedValue - minValue) / newRange;
}

float ChangeRange(float value, float oldMin, float oldMax, float newMin, float newMax)
{
    float oldRange = (oldMax - oldMin);

    if (oldRange == 0)
        return newMin;

    float newRange = (newMax - newMin);
    return (((value - oldMin) * newRange) / oldRange) + newMin;
}

float4 ChangeRange(float4 value, float oldMin, float oldMax, float newMin, float newMax)
{
    return float4(ChangeRange(value.r, oldMin, oldMax, newMin, newMax),
                  ChangeRange(value.g, oldMin, oldMax, newMin, newMax),
                  ChangeRange(value.b, oldMin, oldMax, newMin, newMax),
                  ChangeRange(value.a, oldMin, oldMax, newMin, newMax));
}

inline float ClipId(uint id, int size)
{
    return when_ge(id, size);
}

inline float ClipId(uint2 id, int width, int height)
{
    return or(ClipId(id.x, width), ClipId(id.y, height));
}

inline float ClipId(uint3 id, int width, int height, int depth)
{
    return or(or(ClipId(id.x, width), ClipId(id.y, height)), ClipId(id.z, depth));
}

inline float ClipId(uint3 id)
{
    return or(or(when_lt(id.x, 0), when_lt(id.y, 0)), when_lt(id.z, 0));
}

inline float ClipId(uint3 id, int value)
{
    return or(or(when_gt(id.x, value), when_gt(id.y, value)), when_gt(id.z, value));
}

inline bool IsInsideSphere(float3 pos, float3 center, float radius)
{
    return dot(pos - center, pos - center) <= radius * radius;
}

#endif // __TEXTURE_UTILITIES__