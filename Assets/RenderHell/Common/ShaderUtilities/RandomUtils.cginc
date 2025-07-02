#ifndef __RANDOM_UTILS__
#define __RANDOM_UTILS__

float random(float2 p)
{
    float2 K1 = float2(
        23.14069263277926f, // e^pi (Gelfond's constant)
        2.665144142690225f  // 2^sqrt(2) (Gelfond-Schneider constant)
    );
    return frac( cos( dot(p, K1) ) * 12345.6789f );
}

#endif // __RANDOM_UTILS__