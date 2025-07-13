#ifndef __RAY_UTILS__
#define __RAY_UTILS__

#include "FastConditionals.cginc"

struct Ray
{
    float3 origin;
    float3 direction;
};

float IntersectBox(Ray ray, out float entryPoint, out float exitPoint)
{
    float3 invR = 1.0 / ray.direction;
    float3 tbot = invR * (float3(-0.5f, -0.5f, -0.5f) - ray.origin);
    float3 ttop = invR * (float3( 0.5f,  0.5f,  0.5f) - ray.origin);
    float3 tmin = min(ttop, tbot);
    float3 tmax = max(ttop, tbot);
    float2 t = max(tmin.xx, tmin.yz);
    entryPoint = max(t.x, t.y);
    t = min(tmax.xx, tmax.yz);
    exitPoint = min(t.x, t.y);
    return when_le(entryPoint, exitPoint);
}

float IntersectBox(float3 origin, float3 direction, out float entryPoint, out float exitPoint)
{
    Ray ray;
    ray.origin = origin;
    ray.direction = direction;
    return IntersectBox(ray, entryPoint, exitPoint);
}

#endif // __RAY_UTILS__