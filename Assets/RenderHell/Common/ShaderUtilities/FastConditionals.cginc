#ifndef __FAST_CONDITIONALS__
#define __FAST_CONDITIONALS__

///////////////////////////////////////////////////////////////////////
/* Set of functions designed to eliminate the use of standard        */
/* conditionals to prevent performance slowdowns in the code.        */
/*                                                                   */
/* NOTE: while most compilers typically perform these optimizations  */
/* automatically, using these explicit versions ensures optimization */
/* consistency across all platforms.                                 */
/*                                                                   */
/* The original implementation can be found here:                    */
/* http://theorangeduck.com/page/avoiding-shader-conditionals        */
///////////////////////////////////////////////////////////////////////

///////////
// float //
///////////

float when_eq(float x, float y)
{
    return 1.0 - abs(sign(x - y));
}

float when_neq(float x, float y)
{
    return abs(sign(x - y));
}

float when_gt(float x, float y)
{
    return max(sign(x - y), 0.0);
}

float when_lt(float x, float y)
{
    return max(sign(y - x), 0.0);
}

float when_ge(float x, float y)
{
    return 1.0 - when_lt(x, y);
}

float when_le(float x, float y)
{
    return 1.0 - when_gt(x, y);
}

float and(float a, float b) {
    return a * b;
}

float or(float a, float b) {
    return min(a + b, 1.0);
}

float xor(float a, float b) {
    return (a + b) % 2.0;
}

float not(float a) {
    return 1.0 - a;
}

////////////
// float2 //
////////////

float2 when_eq(float2 x, float2 y)
{
    return 1.0 - abs(sign(x - y));
}

float2 when_neq(float2 x, float2 y)
{
    return abs(sign(x - y));
}

float2 when_gt(float2 x, float2 y)
{
    return max(sign(x - y), 0.0);
}

float2 when_lt(float2 x, float2 y)
{
    return max(sign(y - x), 0.0);
}

float2 when_ge(float2 x, float2 y)
{
    return 1.0 - when_lt(x, y);
}

float2 when_le(float2 x, float2 y)
{
    return 1.0 - when_gt(x, y);
}

float2 and(float2 a, float2 b) {
    return a * b;
}

float2 or(float2 a, float2 b) {
    return min(a + b, 1.0);
}

float2 xor(float2 a, float2 b) {
    return (a + b) % 2.0;
}

float2 not(float2 a) {
    return 1.0 - a;
}

////////////
// float3 //
////////////

float3 when_eq(float3 x, float3 y)
{
    return 1.0 - abs(sign(x - y));
}

float3 when_neq(float3 x, float3 y)
{
    return abs(sign(x - y));
}

float3 when_gt(float3 x, float3 y)
{
    return max(sign(x - y), 0.0);
}

float3 when_lt(float3 x, float3 y)
{
    return max(sign(y - x), 0.0);
}

float3 when_ge(float3 x, float3 y)
{
    return 1.0 - when_lt(x, y);
}

float3 when_le(float3 x, float3 y)
{
    return 1.0 - when_gt(x, y);
}

float3 and(float3 a, float3 b) {
    return a * b;
}

float3 or(float3 a, float3 b) {
    return min(a + b, 1.0);
}

float3 xor(float3 a, float3 b) {
    return (a + b) % 2.0;
}

float3 not(float3 a) {
    return 1.0 - a;
}

////////////
// float4 //
////////////

float4 when_eq(float4 x, float4 y)
{
    return 1.0 - abs(sign(x - y));
}

float4 when_neq(float4 x, float4 y)
{
    return abs(sign(x - y));
}

float4 when_gt(float4 x, float4 y)
{
    return max(sign(x - y), 0.0);
}

float4 when_lt(float4 x, float4 y)
{
    return max(sign(y - x), 0.0);
}

float4 when_ge(float4 x, float4 y)
{
    return 1.0 - when_lt(x, y);
}

float4 when_le(float4 x, float4 y)
{
    return 1.0 - when_gt(x, y);
}

float4 and(float4 a, float4 b) {
    return a * b;
}

float4 or(float4 a, float4 b) {
    return min(a + b, 1.0);
}

float4 xor(float4 a, float4 b) {
    return (a + b) % 2.0;
}

float4 not(float4 a) {
    return 1.0 - a;
}

#endif // __FAST_CONDITIONALS__