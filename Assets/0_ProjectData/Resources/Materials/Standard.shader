Shader "UX/Standard"
{
    Properties
    {
        // Main maps.
        _Color("Color", Color) = (1.0, 1.0, 1.0, 1.0)
        _MainTex("Albedo", 2D) = "white" {}
        [Enum(AlbedoAlphaMode)] _AlbedoAlphaMode("Albedo Alpha Mode", Float) = 0 // "Transparency"
        [Toggle] _AlbedoAssignedAtRuntime("Albedo Assigned at Runtime", Float) = 0.0
        _Cutoff("Alpha Cutoff", Range(0.0, 1.0)) = 0.5
        _Metallic("Metallic", Range(0.0, 1.0)) = 0.0
        _Smoothness("Smoothness", Range(0.0, 1.0)) = 0.5
        [Toggle(_CHANNEL_MAP)] _EnableChannelMap("Enable Channel Map", Float) = 0.0
        [NoScaleOffset] _ChannelMap("Channel Map", 2D) = "white" {}
        [Toggle(_NORMAL_MAP)] _EnableNormalMap("Enable Normal Map", Float) = 0.0
        [NoScaleOffset] _NormalMap("Normal Map", 2D) = "bump" {}
        _NormalMapScale("Scale", Float) = 1.0
        [Toggle(_EMISSION)] _EnableEmission("Enable Emission", Float) = 0.0
        [HDR]_EmissiveColor("Emissive Color", Color) = (0.0, 0.0, 0.0, 1.0)
        [Toggle(_TRIPLANAR_MAPPING)] _EnableTriplanarMapping("Triplanar Mapping", Float) = 0.0
        [Toggle(_USE_SSAA)] _EnableSSAA("Super Sample Anti Aliasing", Float) = 0.0
        _MipmapBias("Mipmap Bias", Range(-5.0, 0.0)) = -2.0
        [Toggle(_LOCAL_SPACE_TRIPLANAR_MAPPING)] _EnableLocalSpaceTriplanarMapping("Local Space", Float) = 0.0
        _TriplanarMappingBlendSharpness("Blend Sharpness", Range(1.0, 16.0)) = 4.0

        // Rendering options.
        [Toggle(_DIRECTIONAL_LIGHT)] _DirectionalLight("Directional Light", Float) = 1.0
        [Toggle(_SPECULAR_HIGHLIGHTS)] _SpecularHighlights("Specular Highlights", Float) = 1.0
        [Toggle(_SPHERICAL_HARMONICS)] _SphericalHarmonics("Spherical Harmonics", Float) = 0.0
        [Toggle(_REFLECTIONS)] _Reflections("Reflections", Float) = 0.0
        [Toggle(_REFRACTION)] _Refraction("Refraction", Float) = 0.0
        _RefractiveIndex("Refractive Index", Range(0.0, 3.0)) = 0.0
        [Toggle(_RIM_LIGHT)] _RimLight("Rim Light", Float) = 0.0
        _RimColor("Rim Color", Color) = (0.5, 0.5, 0.5, 1.0)
        _RimPower("Rim Power", Range(0.0, 8.0)) = 0.25
        [Toggle(_VERTEX_COLORS)] _VertexColors("Vertex Colors", Float) = 0.0
        [Toggle(_VERTEX_EXTRUSION)] _VertexExtrusion("Vertex Extrusion", Float) = 0.0
        _VertexExtrusionValue("Vertex Extrusion Value", Float) = 0.0
        [Toggle(_VERTEX_EXTRUSION_SMOOTH_NORMALS)] _VertexExtrusionSmoothNormals("Vertex Extrusion Smooth Normals", Float) = 0.0
        _BlendedClippingWidth("Blended Clipping With", Range(0.0, 10.0)) = 1.0
        [Toggle(_CLIPPING_BORDER)] _ClippingBorder("Clipping Border", Float) = 0.0
        _ClippingBorderWidth("Clipping Border Width", Range(0.0, 1.0)) = 0.025
        _ClippingBorderColor("Clipping Border Color", Color) = (1.0, 0.2, 0.0, 1.0)
        [Toggle(_NEAR_PLANE_FADE)] _NearPlaneFade("Near Plane Fade", Float) = 0.0
        [Toggle(_NEAR_LIGHT_FADE)] _NearLightFade("Near Light Fade", Float) = 0.0
        _FadeBeginDistance("Fade Begin Distance", Range(0.0, 10.0)) = 0.85
        _FadeCompleteDistance("Fade Complete Distance", Range(0.0, 10.0)) = 0.5
        _FadeMinValue("Fade Min Value", Range(0.0, 1.0)) = 0.0

        // Fluent options.
        [Toggle(_HOVER_LIGHT)] _HoverLight("Hover Light", Float) = 1.0
        [Toggle(_HOVER_COLOR_OVERRIDE)] _EnableHoverColorOverride("Hover Color Override", Float) = 0.0
        _HoverColorOverride("Hover Color Override", Color) = (1.0, 1.0, 1.0, 1.0)
        [Toggle(_PROXIMITY_LIGHT)] _ProximityLight("Proximity Light", Float) = 0.0
        [Toggle(_PROXIMITY_LIGHT_COLOR_OVERRIDE)] _EnableProximityLightColorOverride("Proximity Light Color Override", Float) = 0.0
        [HDR]_ProximityLightCenterColorOverride("Proximity Light Center Color Override", Color) = (1.0, 0.0, 0.0, 0.0)
        [HDR]_ProximityLightMiddleColorOverride("Proximity Light Middle Color Override", Color) = (0.0, 1.0, 0.0, 0.5)
        [HDR]_ProximityLightOuterColorOverride("Proximity Light Outer Color Override", Color) = (0.0, 0.0, 1.0, 1.0)
        [Toggle(_PROXIMITY_LIGHT_SUBTRACTIVE)] _ProximityLightSubtractive("Proximity Light Subtractive", Float) = 0.0
        [Toggle(_PROXIMITY_LIGHT_TWO_SIDED)] _ProximityLightTwoSided("Proximity Light Two Sided", Float) = 0.0
        _FluentLightIntensity("Fluent Light Intensity", Range(0.0, 1.0)) = 1.0
        [Toggle(_ROUND_CORNERS)] _RoundCorners("Round Corners", Float) = 0.0
        _RoundCornerRadius("Round Corner Radius", Range(0.0, 0.5)) = 0.25
        _RoundCornerMargin("Round Corner Margin", Range(0.0, 0.5)) = 0.01
        [Toggle(_INDEPENDENT_CORNERS)] _IndependentCorners("Independent Corners", Float) = 0.0
        _RoundCornersRadius("Round Corners Radius", Vector) = (0.5 ,0.5, 0.5, 0.5)
        [Toggle(_BORDER_LIGHT)] _BorderLight("Border Light", Float) = 0.0
        [Toggle(_BORDER_LIGHT_USES_HOVER_COLOR)] _BorderLightUsesHoverColor("Border Light Uses Hover Color", Float) = 0.0
        [Toggle(_BORDER_LIGHT_REPLACES_ALBEDO)] _BorderLightReplacesAlbedo("Border Light Replaces Albedo", Float) = 0.0
        [Toggle(_BORDER_LIGHT_OPAQUE)] _BorderLightOpaque("Border Light Opaque", Float) = 0.0
        _BorderWidth("Border Width", Range(0.0, 1.0)) = 0.1
        _BorderMinValue("Border Min Value", Range(0.0, 1.0)) = 0.1
        _EdgeSmoothingValue("Edge Smoothing Value", Range(0.0, 0.2)) = 0.002
        _BorderLightOpaqueAlpha("Border Light Opaque Alpha", Range(0.0, 1.0)) = 1.0
        [Toggle(_INNER_GLOW)] _InnerGlow("Inner Glow", Float) = 0.0
        _InnerGlowColor("Inner Glow Color (RGB) and Intensity (A)", Color) = (1.0, 1.0, 1.0, 0.75)
        _InnerGlowPower("Inner Glow Power", Range(2.0, 32.0)) = 4.0
        [Toggle(_IRIDESCENCE)] _Iridescence("Iridescence", Float) = 0.0
        [NoScaleOffset] _IridescentSpectrumMap("Iridescent Spectrum Map", 2D) = "white" {}
        _IridescenceIntensity("Iridescence Intensity", Range(0.0, 1.0)) = 0.5
        _IridescenceThreshold("Iridescence Threshold", Range(0.0, 1.0)) = 0.05
        _IridescenceAngle("Iridescence Angle", Range(-0.78, 0.78)) = -0.78
        [Toggle(_ENVIRONMENT_COLORING)] _EnvironmentColoring("Environment Coloring", Float) = 0.0
        _EnvironmentColorThreshold("Environment Color Threshold", Range(0.0, 3.0)) = 1.5
        _EnvironmentColorIntensity("Environment Color Intensity", Range(0.0, 1.0)) = 0.5
        _EnvironmentColorX("Environment Color X (RGB)", Color) = (1.0, 0.0, 0.0, 1.0)
        _EnvironmentColorY("Environment Color Y (RGB)", Color) = (0.0, 1.0, 0.0, 1.0)
        _EnvironmentColorZ("Environment Color Z (RGB)", Color) = (0.0, 0.0, 1.0, 1.0)

        // Advanced options.
        [Enum(RenderingMode)] _Mode("Rendering Mode", Float) = 0                                     // "Opaque"
        [Enum(CustomRenderingMode)] _CustomMode("Mode", Float) = 0                                   // "Opaque"
        [Enum(UnityEngine.Rendering.BlendMode)] _SrcBlend("Source Blend", Float) = 1                 // "One"
        [Enum(UnityEngine.Rendering.BlendMode)] _DstBlend("Destination Blend", Float) = 0            // "Zero"
        [Enum(UnityEngine.Rendering.BlendOp)] _BlendOp("Blend Operation", Float) = 0                 // "Add"
        [Enum(UnityEngine.Rendering.CompareFunction)] _ZTest("Depth Test", Float) = 4                // "LessEqual"
        [Enum(DepthWrite)] _ZWrite("Depth Write", Float) = 1                                         // "On"
        _ZOffsetFactor("Depth Offset Factor", Float) = 0                                             // "Zero"
        _ZOffsetUnits("Depth Offset Units", Float) = 0                                               // "Zero"
        [Enum(UnityEngine.Rendering.ColorWriteMask)] _ColorWriteMask("Color Write Mask", Float) = 15 // "All"
        [Enum(UnityEngine.Rendering.CullMode)] _CullMode("Cull Mode", Float) = 2                     // "Back"
        _RenderQueueOverride("Render Queue Override", Range(-1.0, 5000)) = -1
        [Toggle(_IGNORE_Z_SCALE)] _IgnoreZScale("Ignore Z Scale", Float) = 0.0
        [Toggle(_STENCIL)] _Stencil("Enable Stencil Testing", Float) = 0.0
        _StencilReference("Stencil Reference", Range(0, 255)) = 0
        [Enum(UnityEngine.Rendering.CompareFunction)]_StencilComparison("Stencil Comparison", Int) = 0
        [Enum(UnityEngine.Rendering.StencilOp)]_StencilOperation("Stencil Operation", Int) = 0
    }

    SubShader
    {
        Pass
        {
            Name "Main"
            Tags{ "RenderType" = "Opaque" "LightMode" = "UniversalForward" }
            LOD 100
            Blend[_SrcBlend][_DstBlend]
            BlendOp[_BlendOp]
            ZTest[_ZTest]
            ZWrite[_ZWrite]
            Cull[_CullMode]
            Offset[_ZOffsetFactor],[_ZOffsetUnits]
            ColorMask[_ColorWriteMask]

            Stencil
            {
                Ref[_StencilReference]
                Comp[_StencilComparison]
                Pass[_StencilOperation]
            }

            CGPROGRAM

            #pragma vertex vert
            #pragma fragment frag

            #pragma multi_compile_instancing
            #pragma multi_compile _ LIGHTMAP_ON
            #pragma multi_compile _ UNITY_UI_CLIP_RECT
            #pragma multi_compile _ _HOVER_LIGHT_MEDIUM _HOVER_LIGHT_HIGH
            #pragma multi_compile _ _CLIPPING_PLANE
            #pragma multi_compile _ _CLIPPING_SPHERE
            #pragma multi_compile _ _CLIPPING_BOX
            #pragma multi_compile _ _BRUSH_PREVIEW // NEW!
            #pragma shader_feature _ _ALPHATEST_ON _ALPHABLEND_ON
            #pragma shader_feature _DISABLE_ALBEDO_MAP
            #pragma shader_feature _ _METALLIC_TEXTURE_ALBEDO_CHANNEL_A _SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A
            #pragma shader_feature _CHANNEL_MAP
            #pragma shader_feature _NORMAL_MAP
            #pragma shader_feature _EMISSION
            #pragma shader_feature _TRIPLANAR_MAPPING
            #pragma shader_feature _LOCAL_SPACE_TRIPLANAR_MAPPING
            #pragma shader_feature _USE_SSAA
            #pragma shader_feature _DIRECTIONAL_LIGHT
            #pragma shader_feature _SPECULAR_HIGHLIGHTS
            #pragma shader_feature _SPHERICAL_HARMONICS
            #pragma shader_feature _REFLECTIONS
            #pragma shader_feature _REFRACTION
            #pragma shader_feature _RIM_LIGHT
            #pragma shader_feature _VERTEX_COLORS
            #pragma shader_feature _VERTEX_EXTRUSION
            #pragma shader_feature _VERTEX_EXTRUSION_SMOOTH_NORMALS
            #pragma shader_feature _CLIPPING_BORDER
            #pragma shader_feature _NEAR_PLANE_FADE
            #pragma shader_feature _NEAR_LIGHT_FADE
            #pragma shader_feature _HOVER_LIGHT
            #pragma shader_feature _HOVER_COLOR_OVERRIDE
            #pragma shader_feature _PROXIMITY_LIGHT
            #pragma shader_feature _PROXIMITY_LIGHT_COLOR_OVERRIDE
            #pragma shader_feature _PROXIMITY_LIGHT_SUBTRACTIVE
            #pragma shader_feature _PROXIMITY_LIGHT_TWO_SIDED
            #pragma shader_feature _ROUND_CORNERS
            #pragma shader_feature _INDEPENDENT_CORNERS
            #pragma shader_feature _BORDER_LIGHT
            #pragma shader_feature _BORDER_LIGHT_USES_HOVER_COLOR
            #pragma shader_feature _BORDER_LIGHT_REPLACES_ALBEDO
            #pragma shader_feature _BORDER_LIGHT_OPAQUE
            #pragma shader_feature _INNER_GLOW
            #pragma shader_feature _IRIDESCENCE
            #pragma shader_feature _ENVIRONMENT_COLORING
            #pragma shader_feature _IGNORE_Z_SCALE

            #include "UnityCG.cginc"

            // This define will get commented in by the UpgradeShaderForUniversalRenderPipeline method.
            #define _RENDER_PIPELINE

#if defined(_TRIPLANAR_MAPPING) || defined(_DIRECTIONAL_LIGHT) || defined(_SPHERICAL_HARMONICS) || defined(_REFLECTIONS) || defined(_RIM_LIGHT) || defined(_PROXIMITY_LIGHT) || defined(_ENVIRONMENT_COLORING)
            #define _NORMAL
#else
            #undef _NORMAL
#endif

#if defined(_CLIPPING_PLANE) || defined(_CLIPPING_SPHERE) || defined(_CLIPPING_BOX)
        #define _CLIPPING_PRIMITIVE
#else
        #undef _CLIPPING_PRIMITIVE
#endif

#if defined(_NORMAL) || defined(_CLIPPING_PRIMITIVE) || defined(_NEAR_PLANE_FADE) || defined(_HOVER_LIGHT) || defined(_PROXIMITY_LIGHT)
            #define _WORLD_POSITION
#else
            #undef _WORLD_POSITION
#endif

#if defined(UNITY_UI_CLIP_RECT)
            #define _LOCAL_POSITION
#else
            #undef _LOCAL_POSITION
#endif

#if defined(_ALPHATEST_ON) || defined(UNITY_UI_CLIP_RECT) || defined(_CLIPPING_PRIMITIVE) || defined(_ROUND_CORNERS)
            #define _ALPHA_CLIP
#else
            #undef _ALPHA_CLIP
#endif

#if defined(_ALPHABLEND_ON)
            #define _TRANSPARENT
            #undef _ALPHA_CLIP
#else
            #undef _TRANSPARENT
#endif

#if defined(_VERTEX_EXTRUSION) || defined(_ROUND_CORNERS) || defined(_BORDER_LIGHT)
            #define _SCALE
#else
            #undef _SCALE
#endif

#if defined(_DIRECTIONAL_LIGHT) || defined(_RIM_LIGHT)
            #define _FRESNEL
#else
            #undef _FRESNEL
#endif

#if defined(_ROUND_CORNERS) || defined(_BORDER_LIGHT) || defined(_INNER_GLOW)
            #define _DISTANCE_TO_EDGE
#else
            #undef _DISTANCE_TO_EDGE
#endif

#if !defined(_DISABLE_ALBEDO_MAP) || defined(_TRIPLANAR_MAPPING) || defined(_CHANNEL_MAP) || defined(_NORMAL_MAP) || defined(_DISTANCE_TO_EDGE) || defined(_IRIDESCENCE)
            #define _UV
#else
            #undef _UV
#endif

            struct appdata_t
            {
                float4 vertex : POSITION;
                // The default UV channel used for texturing.
                float2 uv : TEXCOORD0;
#if defined(LIGHTMAP_ON)
                // Reserved for Unity's light map UVs.
                float2 uv1 : TEXCOORD1;
#endif
                // Used for smooth normal data (or UGUI scaling data).
                float4 uv2 : TEXCOORD2;
                // Used for UGUI scaling data.
                float2 uv3 : TEXCOORD3;
#if defined(_VERTEX_COLORS)
                fixed4 color : COLOR0;
#endif
                fixed3 normal : NORMAL;
#if defined(_NORMAL_MAP)
                fixed4 tangent : TANGENT;
#endif
                UNITY_VERTEX_INPUT_INSTANCE_ID
            };

            struct v2f
            {
                float4 position : SV_POSITION;
#if defined(_BORDER_LIGHT)
                float4 uv : TEXCOORD0;
#elif defined(_UV)
                float2 uv : TEXCOORD0;
#endif
#if defined(LIGHTMAP_ON)
                float2 lightMapUV : TEXCOORD1;
#endif
#if defined(_VERTEX_COLORS)
                fixed4 color : COLOR0;
#endif
#if defined(_SPHERICAL_HARMONICS)
                fixed3 ambient : COLOR1;
#endif
#if defined(_IRIDESCENCE)
                fixed3 iridescentColor : COLOR2;
#endif
#if defined(_WORLD_POSITION)
#if defined(_NEAR_PLANE_FADE)
                float4 worldPosition : TEXCOORD2;
#else
                float3 worldPosition : TEXCOORD2;
#endif
#endif
#if defined(_LOCAL_POSITION)
                float3 localPosition : TEXCOORD7;
#endif
#if defined(_SCALE)
                float3 scale : TEXCOORD3;
#endif
#if defined(_NORMAL)
#if defined(_TRIPLANAR_MAPPING)
                fixed3 worldNormal : COLOR3;
                fixed3 triplanarNormal : COLOR4;
                float3 triplanarPosition : TEXCOORD6;
#elif defined(_NORMAL_MAP)
                fixed3 tangentX : COLOR3;
                fixed3 tangentY : COLOR4;
                fixed3 tangentZ : COLOR5;
#else
                fixed3 worldNormal : COLOR3;
#endif
#endif
                UNITY_VERTEX_INPUT_INSTANCE_ID
                UNITY_VERTEX_OUTPUT_STEREO
            };

            UNITY_INSTANCING_BUFFER_START(Props)
            UNITY_DEFINE_INSTANCED_PROP(float4, _Color)

#if defined(_CLIPPING_PLANE)
            UNITY_DEFINE_INSTANCED_PROP(fixed, _ClipPlaneSide)
            UNITY_DEFINE_INSTANCED_PROP(float4, _ClipPlane)
#endif

#if defined(_CLIPPING_SPHERE)
            UNITY_DEFINE_INSTANCED_PROP(fixed, _ClipSphereSide)
            // >>> NEW!
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform1)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform2)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform3)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform4)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform5)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform6)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform7)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform8)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform9)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform10)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform11)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform12)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform13)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform14)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform15)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform16)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform17)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform18)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform19)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform20)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform21)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform22)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform23)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform24)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform25)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform26)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform27)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform28)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform29)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform30)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform31)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform32)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform33)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform34)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform35)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform36)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform37)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform38)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform39)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform40)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform41)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform42)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform43)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform44)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform45)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform46)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform47)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform48)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform49)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform50)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform51)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform52)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform53)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform54)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform55)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform56)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform57)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform58)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform59)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform60)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform61)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform62)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform63)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform64)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform65)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform66)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform67)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform68)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform69)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform70)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform71)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform72)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform73)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform74)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform75)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform76)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform77)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform78)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform79)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform80)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform81)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform82)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform83)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform84)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform85)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform86)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform87)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform88)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform89)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform90)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform91)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform92)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform93)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform94)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform95)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform96)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform97)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform98)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform99)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform100)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform101)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform102)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform103)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform104)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform105)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform106)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform107)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform108)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform109)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform110)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform111)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform112)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform113)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform114)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform115)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform116)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform117)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform118)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform119)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform120)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform121)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform122)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform123)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform124)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform125)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform126)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform127)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform128)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform129)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform130)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform131)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform132)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform133)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform134)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform135)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform136)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform137)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform138)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform139)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform140)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform141)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform142)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform143)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform144)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform145)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform146)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform147)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform148)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform149)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform150)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform151)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform152)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform153)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform154)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform155)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform156)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform157)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform158)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform159)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform160)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform161)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform162)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform163)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform164)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform165)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform166)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform167)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform168)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform169)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform170)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform171)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform172)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform173)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform174)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform175)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform176)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform177)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform178)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform179)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform180)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform181)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform182)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform183)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform184)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform185)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform186)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform187)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform188)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform189)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform190)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform191)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform192)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform193)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform194)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform195)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform196)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform197)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform198)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform199)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform200)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform201)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform202)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform203)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform204)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform205)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform206)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform207)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform208)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform209)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform210)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform211)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform212)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform213)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform214)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform215)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform216)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform217)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform218)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform219)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform220)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform221)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform222)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform223)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform224)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform225)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform226)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform227)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform228)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform229)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform230)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform231)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform232)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform233)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform234)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform235)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform236)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform237)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform238)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform239)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform240)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform241)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform242)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform243)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform244)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform245)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform246)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform247)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform248)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform249)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform250)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform251)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform252)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform253)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform254)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform255)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform256)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform257)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform258)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform259)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform260)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform261)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform262)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform263)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform264)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform265)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform266)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform267)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform268)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform269)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform270)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform271)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform272)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform273)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform274)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform275)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform276)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform277)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform278)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform279)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform280)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform281)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform282)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform283)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform284)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform285)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform286)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform287)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform288)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform289)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform290)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform291)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform292)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform293)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform294)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform295)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform296)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform297)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform298)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform299)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform300)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform301)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform302)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform303)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform304)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform305)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform306)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform307)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform308)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform309)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform310)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform311)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform312)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform313)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform314)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform315)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform316)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform317)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform318)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform319)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform320)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform321)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform322)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform323)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform324)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform325)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform326)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform327)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform328)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform329)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform330)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform331)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform332)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform333)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform334)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform335)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform336)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform337)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform338)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform339)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform340)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform341)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform342)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform343)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform344)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform345)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform346)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform347)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform348)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform349)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform350)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform351)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform352)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform353)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform354)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform355)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform356)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform357)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform358)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform359)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform360)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform361)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform362)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform363)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform364)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform365)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform366)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform367)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform368)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform369)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform370)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform371)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform372)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform373)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform374)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform375)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform376)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform377)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform378)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform379)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform380)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform381)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform382)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform383)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform384)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform385)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform386)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform387)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform388)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform389)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform390)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform391)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform392)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform393)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform394)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform395)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform396)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform397)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform398)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform399)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform400)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform401)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform402)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform403)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform404)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform405)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform406)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform407)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform408)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform409)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform410)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform411)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform412)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform413)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform414)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform415)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform416)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform417)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform418)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform419)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform420)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform421)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform422)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform423)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform424)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform425)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform426)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform427)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform428)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform429)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform430)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform431)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform432)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform433)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform434)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform435)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform436)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform437)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform438)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform439)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform440)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform441)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform442)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform443)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform444)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform445)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform446)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform447)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform448)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform449)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform450)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform451)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform452)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform453)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform454)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform455)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform456)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform457)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform458)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform459)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform460)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform461)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform462)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform463)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform464)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform465)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform466)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform467)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform468)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform469)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform470)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform471)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform472)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform473)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform474)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform475)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform476)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform477)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform478)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform479)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform480)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform481)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform482)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform483)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform484)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform485)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform486)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform487)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform488)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform489)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform490)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform491)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform492)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform493)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform494)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform495)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform496)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform497)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform498)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform499)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform500)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform501)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform502)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform503)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform504)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform505)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform506)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform507)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform508)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform509)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform510)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform511)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform512)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform513)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform514)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform515)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform516)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform517)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform518)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform519)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform520)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform521)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform522)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform523)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform524)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform525)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform526)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform527)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform528)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform529)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform530)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform531)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform532)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform533)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform534)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform535)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform536)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform537)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform538)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform539)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform540)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform541)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform542)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform543)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform544)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform545)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform546)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform547)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform548)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform549)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform550)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform551)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform552)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform553)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform554)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform555)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform556)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform557)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform558)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform559)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform560)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform561)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform562)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform563)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform564)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform565)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform566)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform567)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform568)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform569)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform570)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform571)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform572)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform573)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform574)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform575)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform576)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform577)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform578)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform579)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform580)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform581)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform582)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform583)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform584)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform585)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform586)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform587)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform588)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform589)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform590)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform591)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform592)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform593)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform594)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform595)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform596)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform597)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform598)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform599)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform600)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform601)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform602)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform603)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform604)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform605)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform606)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform607)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform608)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform609)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform610)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform611)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform612)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform613)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform614)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform615)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform616)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform617)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform618)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform619)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform620)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform621)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform622)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform623)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform624)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform625)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform626)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform627)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform628)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform629)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform630)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform631)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform632)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform633)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform634)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform635)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform636)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform637)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform638)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform639)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform640)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform641)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform642)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform643)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform644)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform645)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform646)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform647)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform648)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform649)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform650)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform651)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform652)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform653)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform654)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform655)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform656)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform657)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform658)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform659)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform660)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform661)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform662)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform663)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform664)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform665)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform666)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform667)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform668)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform669)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform670)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform671)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform672)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform673)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform674)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform675)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform676)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform677)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform678)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform679)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform680)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform681)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform682)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform683)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform684)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform685)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform686)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform687)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform688)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform689)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform690)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform691)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform692)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform693)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform694)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform695)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform696)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform697)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform698)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform699)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform700)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform701)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform702)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform703)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform704)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform705)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform706)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform707)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform708)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform709)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform710)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform711)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform712)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform713)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform714)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform715)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform716)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform717)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform718)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform719)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform720)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform721)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform722)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform723)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform724)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform725)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform726)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform727)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform728)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform729)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform730)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform731)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform732)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform733)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform734)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform735)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform736)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform737)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform738)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform739)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform740)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform741)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform742)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform743)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform744)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform745)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform746)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform747)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform748)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform749)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform750)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform751)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform752)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform753)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform754)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform755)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform756)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform757)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform758)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform759)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform760)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform761)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform762)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform763)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform764)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform765)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform766)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform767)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform768)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform769)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform770)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform771)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform772)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform773)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform774)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform775)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform776)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform777)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform778)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform779)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform780)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform781)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform782)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform783)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform784)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform785)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform786)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform787)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform788)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform789)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform790)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform791)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform792)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform793)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform794)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform795)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform796)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform797)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform798)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform799)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform800)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform801)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform802)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform803)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform804)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform805)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform806)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform807)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform808)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform809)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform810)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform811)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform812)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform813)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform814)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform815)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform816)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform817)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform818)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform819)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform820)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform821)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform822)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform823)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform824)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform825)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform826)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform827)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform828)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform829)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform830)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform831)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform832)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform833)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform834)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform835)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform836)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform837)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform838)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform839)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform840)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform841)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform842)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform843)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform844)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform845)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform846)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform847)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform848)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform849)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform850)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform851)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform852)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform853)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform854)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform855)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform856)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform857)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform858)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform859)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform860)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform861)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform862)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform863)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform864)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform865)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform866)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform867)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform868)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform869)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform870)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform871)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform872)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform873)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform874)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform875)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform876)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform877)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform878)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform879)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform880)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform881)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform882)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform883)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform884)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform885)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform886)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform887)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform888)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform889)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform890)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform891)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform892)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform893)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform894)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform895)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform896)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform897)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform898)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform899)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform900)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform901)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform902)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform903)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform904)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform905)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform906)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform907)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform908)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform909)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform910)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform911)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform912)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform913)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform914)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform915)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform916)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform917)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform918)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform919)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform920)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform921)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform922)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform923)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform924)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform925)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform926)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform927)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform928)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform929)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform930)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform931)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform932)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform933)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform934)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform935)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform936)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform937)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform938)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform939)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform940)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform941)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform942)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform943)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform944)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform945)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform946)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform947)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform948)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform949)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform950)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform951)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform952)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform953)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform954)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform955)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform956)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform957)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform958)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform959)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform960)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform961)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform962)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform963)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform964)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform965)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform966)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform967)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform968)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform969)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform970)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform971)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform972)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform973)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform974)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform975)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform976)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform977)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform978)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform979)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform980)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform981)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform982)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform983)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform984)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform985)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform986)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform987)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform988)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform989)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform990)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform991)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform992)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform993)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform994)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform995)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform996)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform997)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform998)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform999)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform1000)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform1001)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform1002)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform1003)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform1004)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform1005)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform1006)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform1007)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform1008)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform1009)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform1010)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform1011)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform1012)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform1013)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform1014)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform1015)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform1016)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform1017)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform1018)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform1019)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform1020)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform1021)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform1022)
            // UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipSphereInverseTransform1023)

            UNITY_DEFINE_INSTANCED_PROP(int, _ClipSphereCount) 
            // >>> NEW!
#endif

#if defined(_CLIPPING_BOX)
            UNITY_DEFINE_INSTANCED_PROP(fixed, _ClipBoxSide)
            UNITY_DEFINE_INSTANCED_PROP(float4x4, _ClipBoxInverseTransform)
#endif

#if defined(_BRUSH_PREVIEW)
            float3 worldPosition : TEXCOORD2; // NEW!
#endif

            UNITY_INSTANCING_BUFFER_END(Props)

#if defined(_BRUSH_PREVIEW)
            float3 _BrushPosition;     // NEW!
            float _BrushRadius;        // NEW!
            float4 _PreviewColor;      // NEW!
            fixed _PreviewRimPower;    // NEW!             
            float _PreviewOutlineThickness; // NEW!
            float4 _PreviewOutlineColor; // NEW!
#endif
            sampler2D _MainTex;
            fixed4 _MainTex_ST;

#if defined(_ALPHA_CLIP)
            fixed _Cutoff;
#endif

#if defined(UNITY_UI_CLIP_RECT)
            float4 _ClipRect;
#endif

            fixed _Metallic;
            fixed _Smoothness;

#if defined(_CHANNEL_MAP)
            sampler2D _ChannelMap;
#endif

#if defined(_NORMAL_MAP)
            sampler2D _NormalMap;
            float _NormalMapScale;
#endif

#if defined(_EMISSION)
            fixed4 _EmissiveColor;
#endif

#if defined(_USE_SSAA)
            float _MipmapBias;
#endif

#if defined(_TRIPLANAR_MAPPING)
            float _TriplanarMappingBlendSharpness;
#endif

#if defined(_DIRECTIONAL_LIGHT)
#if defined(_RENDER_PIPELINE)
            CBUFFER_START(_LightBuffer)
            float4 _MainLightPosition;
            half4 _MainLightColor;
            CBUFFER_END
#else
            fixed4 _LightColor0;
#endif
#endif

#if defined(_REFRACTION)
            fixed _RefractiveIndex;
#endif

#if defined(_RIM_LIGHT)
            fixed3 _RimColor;
            fixed _RimPower;
#endif

#if defined(_VERTEX_EXTRUSION)
            float _VertexExtrusionValue;
#endif


#if defined(_CLIPPING_PRIMITIVE)
            float _BlendedClippingWidth;
#endif

#if defined(_CLIPPING_BORDER)
            fixed _ClippingBorderWidth;
            fixed3 _ClippingBorderColor;
#endif

#if defined(_NEAR_PLANE_FADE)
            float _FadeBeginDistance;
            float _FadeCompleteDistance;
            fixed _FadeMinValue;
#endif

#if defined(_HOVER_LIGHT) || defined(_NEAR_LIGHT_FADE)
#if defined(_HOVER_LIGHT_HIGH)
#define HOVER_LIGHT_COUNT 10
#elif defined(_HOVER_LIGHT_MEDIUM)
#define HOVER_LIGHT_COUNT 4
#else
#define HOVER_LIGHT_COUNT 2
#endif
#define HOVER_LIGHT_DATA_SIZE 2
            float4 _HoverLightData[HOVER_LIGHT_COUNT * HOVER_LIGHT_DATA_SIZE];
#if defined(_HOVER_COLOR_OVERRIDE)
            fixed3 _HoverColorOverride;
#endif
#endif

#if defined(_PROXIMITY_LIGHT) || defined(_NEAR_LIGHT_FADE)
#define PROXIMITY_LIGHT_COUNT 2
#define PROXIMITY_LIGHT_DATA_SIZE 6
            float4 _ProximityLightData[PROXIMITY_LIGHT_COUNT * PROXIMITY_LIGHT_DATA_SIZE];
#if defined(_PROXIMITY_LIGHT_COLOR_OVERRIDE)
            float4 _ProximityLightCenterColorOverride;
            float4 _ProximityLightMiddleColorOverride;
            float4 _ProximityLightOuterColorOverride;
#endif
#endif

#if defined(_HOVER_LIGHT) || defined(_PROXIMITY_LIGHT) || defined(_BORDER_LIGHT)
            fixed _FluentLightIntensity;
#endif

#if defined(_ROUND_CORNERS)
#if defined(_INDEPENDENT_CORNERS)
            float4 _RoundCornersRadius;
#else
            fixed _RoundCornerRadius;
#endif
            fixed _RoundCornerMargin;
#endif

#if defined(_BORDER_LIGHT)
            fixed _BorderWidth;
            fixed _BorderMinValue;
#endif

#if defined(_BORDER_LIGHT_OPAQUE)
            fixed _BorderLightOpaqueAlpha;
#endif

#if defined(_ROUND_CORNERS) || defined(_BORDER_LIGHT)
            float _EdgeSmoothingValue;
#endif

#if defined(_INNER_GLOW)
            fixed4 _InnerGlowColor;
            fixed _InnerGlowPower;
#endif

#if defined(_IRIDESCENCE)
            sampler2D _IridescentSpectrumMap;
            fixed _IridescenceIntensity;
            fixed _IridescenceThreshold;
            fixed _IridescenceAngle;
#endif

#if defined(_ENVIRONMENT_COLORING)
            fixed _EnvironmentColorThreshold;
            fixed _EnvironmentColorIntensity;
            fixed3 _EnvironmentColorX;
            fixed3 _EnvironmentColorY;
            fixed3 _EnvironmentColorZ;
#endif

#if defined(_DIRECTIONAL_LIGHT)
            static const fixed _MinMetallicLightContribution = 0.7;
            static const fixed _IblContribution = 0.1;
#endif

#if defined(_SPECULAR_HIGHLIGHTS)
            static const float _Shininess = 800.0;
#endif

#if defined(_FRESNEL)
            static const float _FresnelPower = 8.0;
#endif

#if defined(_NEAR_LIGHT_FADE)
            static const float _MaxNearLightDistance = 10.0;

            inline float NearLightDistance(float4 light, float3 worldPosition)
            {
                return distance(worldPosition, light.xyz) + ((1.0 - light.w) * _MaxNearLightDistance);
            }
#endif

#if defined(_HOVER_LIGHT)
            inline float HoverLight(float4 hoverLight, float inverseRadius, float3 worldPosition)
            {
                return (1.0 - saturate(length(hoverLight.xyz - worldPosition) * inverseRadius)) * hoverLight.w;
            }
#endif

#if defined(_PROXIMITY_LIGHT)
            inline float ProximityLight(float4 proximityLight, float4 proximityLightParams, float4 proximityLightPulseParams, float3 worldPosition, float3 worldNormal, out fixed colorValue)
            {
                float proximityLightDistance = dot(proximityLight.xyz - worldPosition, worldNormal);
#if defined(_PROXIMITY_LIGHT_TWO_SIDED)
                worldNormal = proximityLightDistance < 0.0 ? -worldNormal : worldNormal;
                proximityLightDistance = abs(proximityLightDistance);
#endif
                float normalizedProximityLightDistance = saturate(proximityLightDistance * proximityLightParams.y);
                float3 projectedProximityLight = proximityLight.xyz - (worldNormal * abs(proximityLightDistance));
                float projectedProximityLightDistance = length(projectedProximityLight - worldPosition);
                float attenuation = (1.0 - normalizedProximityLightDistance) * proximityLight.w;
                colorValue = saturate(projectedProximityLightDistance * proximityLightParams.z);
                float pulse = step(proximityLightPulseParams.x, projectedProximityLightDistance) * proximityLightPulseParams.y;

                return smoothstep(1.0, 0.0, projectedProximityLightDistance / (proximityLightParams.x * max(pow(normalizedProximityLightDistance, 0.25), proximityLightParams.w))) * pulse * attenuation;
            }

            inline fixed3 MixProximityLightColor(fixed4 centerColor, fixed4 middleColor, fixed4 outerColor, fixed t)
            {
                fixed3 color = lerp(centerColor.rgb, middleColor.rgb, smoothstep(centerColor.a, middleColor.a, t));
                return lerp(color, outerColor, smoothstep(middleColor.a, outerColor.a, t));
            }
#endif

#if defined(_ROUND_CORNERS)
            inline float PointVsRoundedBox(float2 position, float2 cornerCircleDistance, float cornerCircleRadius)
            {
                return length(max(abs(position) - cornerCircleDistance, 0.0)) - cornerCircleRadius;
            }

            inline float RoundCornersSmooth(float2 position, float2 cornerCircleDistance, float cornerCircleRadius)
            {
                return smoothstep(1.0, 0.0, PointVsRoundedBox(position, cornerCircleDistance, cornerCircleRadius) / _EdgeSmoothingValue);
            }

            inline float RoundCorners(float2 position, float2 cornerCircleDistance, float cornerCircleRadius)
            {
#if defined(_TRANSPARENT)
                return RoundCornersSmooth(position, cornerCircleDistance, cornerCircleRadius);
#else
                return (PointVsRoundedBox(position, cornerCircleDistance, cornerCircleRadius) < 0.0);
#endif
            }
#endif

#if defined(_IRIDESCENCE)
            fixed3 Iridescence(float tangentDotIncident, sampler2D spectrumMap, float threshold, float2 uv, float angle, float intensity)
            {
                float k = tangentDotIncident * 0.5 + 0.5;
                float4 left = tex2D(spectrumMap, float2(lerp(0.0, 1.0 - threshold, k), 0.5), float2(0.0, 0.0), float2(0.0, 0.0));
                float4 right = tex2D(spectrumMap, float2(lerp(threshold, 1.0, k), 0.5), float2(0.0, 0.0), float2(0.0, 0.0));

                float2 XY = uv - float2(0.5, 0.5);
                float s = (cos(angle) * XY.x - sin(angle) * XY.y) / cos(angle);
                return (left.rgb + s * (right.rgb - left.rgb)) * intensity;
            }
#endif

            v2f vert(appdata_t v)
            {
                v2f o;
                UNITY_SETUP_INSTANCE_ID(v);
                UNITY_INITIALIZE_OUTPUT(v2f, o);
                UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
                UNITY_TRANSFER_INSTANCE_ID(v, o);

                float4 vertexPosition = v.vertex;

#if defined(_WORLD_POSITION) || defined(_VERTEX_EXTRUSION)
                float3 worldVertexPosition = mul(unity_ObjectToWorld, vertexPosition).xyz;
#endif

#if defined(_SCALE)
                o.scale.x = length(mul(unity_ObjectToWorld, float4(1.0, 0.0, 0.0, 0.0)));
                o.scale.y = length(mul(unity_ObjectToWorld, float4(0.0, 1.0, 0.0, 0.0)));
#if defined(_IGNORE_Z_SCALE)
                o.scale.z = o.scale.x;
#else
                o.scale.z = length(mul(unity_ObjectToWorld, float4(0.0, 0.0, 1.0, 0.0)));
#endif
#if !defined(_VERTEX_EXTRUSION_SMOOTH_NORMALS)
                // uv3.y will contain a negative value when rendered by a UGUI and ScaleMeshEffect.
                if (v.uv3.y < 0.0)
                {
                    o.scale.x *= v.uv2.x;
                    o.scale.y *= v.uv2.y;
                    o.scale.z *= v.uv3.x;
                }
#endif
#endif

                fixed3 localNormal = v.normal;

#if defined(_NORMAL) || defined(_VERTEX_EXTRUSION)
                fixed3 worldNormal = UnityObjectToWorldNormal(localNormal);
#endif

#if defined(_VERTEX_EXTRUSION)
#if defined(_VERTEX_EXTRUSION_SMOOTH_NORMALS)
                worldVertexPosition += UnityObjectToWorldNormal(v.uv2 * o.scale) * _VertexExtrusionValue;
#else
                worldVertexPosition += worldNormal * _VertexExtrusionValue;
#endif
                vertexPosition = mul(unity_WorldToObject, float4(worldVertexPosition, 1.0));
#endif

                o.position = UnityObjectToClipPos(vertexPosition);

#if defined(_WORLD_POSITION)
                o.worldPosition.xyz = worldVertexPosition;
#endif

#if defined(_LOCAL_POSITION)
                o.localPosition.xyz = vertexPosition;
#endif

#if defined(_NEAR_PLANE_FADE)
                float rangeInverse = 1.0 / (_FadeBeginDistance - _FadeCompleteDistance);
#if defined(_NEAR_LIGHT_FADE)
                float fadeDistance = _MaxNearLightDistance;

                [unroll]
                for (int hoverLightIndex = 0; hoverLightIndex < HOVER_LIGHT_COUNT; ++hoverLightIndex)
                {
                    int dataIndex = hoverLightIndex * HOVER_LIGHT_DATA_SIZE;
                    fadeDistance = min(fadeDistance, NearLightDistance(_HoverLightData[dataIndex], o.worldPosition));
                }

                [unroll]
                for (int proximityLightIndex = 0; proximityLightIndex < PROXIMITY_LIGHT_COUNT; ++proximityLightIndex)
                {
                    int dataIndex = proximityLightIndex * PROXIMITY_LIGHT_DATA_SIZE;
                    fadeDistance = min(fadeDistance, NearLightDistance(_ProximityLightData[dataIndex], o.worldPosition));
                }
#else
                float fadeDistance = -UnityObjectToViewPos(vertexPosition).z;
#endif
                o.worldPosition.w = max(saturate(mad(fadeDistance, rangeInverse, -_FadeCompleteDistance * rangeInverse)), _FadeMinValue);
#endif

#if defined(_BORDER_LIGHT) || defined(_ROUND_CORNERS)
                o.uv.xy = TRANSFORM_TEX(v.uv, _MainTex);

                float minScale = min(min(o.scale.x, o.scale.y), o.scale.z);

#if defined(_BORDER_LIGHT) 
                float maxScale = max(max(o.scale.x, o.scale.y), o.scale.z);
                float minOverMiddleScale = minScale / (o.scale.x + o.scale.y + o.scale.z - minScale - maxScale);

                float areaYZ = o.scale.y * o.scale.z;
                float areaXZ = o.scale.z * o.scale.x;
                float areaXY = o.scale.x * o.scale.y;

                float borderWidth = _BorderWidth;
#endif

                if (abs(localNormal.x) == 1.0) // Y,Z plane.
                {
                    o.scale.x = o.scale.z;
                    o.scale.y = o.scale.y;

#if defined(_BORDER_LIGHT) 
                    if (areaYZ > areaXZ && areaYZ > areaXY)
                    {
                        borderWidth *= minOverMiddleScale;
                    }
#endif
                }
                else if (abs(localNormal.y) == 1.0) // X,Z plane.
                {
                    o.scale.x = o.scale.x;
                    o.scale.y = o.scale.z;

#if defined(_BORDER_LIGHT) 
                    if (areaXZ > areaXY && areaXZ > areaYZ)
                    {
                        borderWidth *= minOverMiddleScale;
                    }
#endif
                }
                else  // X,Y plane.
                {
                    o.scale.x = o.scale.x;
                    o.scale.y = o.scale.y;

#if defined(_BORDER_LIGHT) 
                    if (areaXY > areaYZ && areaXY > areaXZ)
                    {
                        borderWidth *= minOverMiddleScale;
                    }
#endif
                }

                o.scale.z = minScale;

#if defined(_BORDER_LIGHT) 
                float scaleRatio = min(o.scale.x, o.scale.y) / max(o.scale.x, o.scale.y);
                o.uv.z = o.scale.x > o.scale.y ? 1.0 - (borderWidth * scaleRatio) : 1.0 - borderWidth;
                o.uv.w = o.scale.x > o.scale.y ? 1.0 - borderWidth : 1.0 - (borderWidth * scaleRatio);
#endif
#elif defined(_UV)
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
#endif

#if defined(LIGHTMAP_ON)
                o.lightMapUV.xy = v.uv1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
#endif

#if defined(_VERTEX_COLORS)
                o.color = v.color;
#endif

#if defined(_SPHERICAL_HARMONICS)
                o.ambient = ShadeSH9(float4(worldNormal, 1.0));
#endif

#if defined(_IRIDESCENCE)
                float3 rightTangent = normalize(mul((float3x3)unity_ObjectToWorld, float3(1.0, 0.0, 0.0)));
                float3 incidentWithCenter = normalize(mul(unity_ObjectToWorld, float4(0.0, 0.0, 0.0, 1.0)) - _WorldSpaceCameraPos);
                float tangentDotIncident = dot(rightTangent, incidentWithCenter);
                o.iridescentColor = Iridescence(tangentDotIncident, _IridescentSpectrumMap, _IridescenceThreshold, v.uv, _IridescenceAngle, _IridescenceIntensity);
#endif

#if defined(_NORMAL)
#if defined(_TRIPLANAR_MAPPING)
                o.worldNormal = worldNormal;
#if defined(_LOCAL_SPACE_TRIPLANAR_MAPPING)
                o.triplanarNormal = localNormal;
                o.triplanarPosition = vertexPosition;
#else
                o.triplanarNormal = worldNormal;
                o.triplanarPosition = o.worldPosition;
#endif
#elif defined(_NORMAL_MAP)
                fixed3 worldTangent = UnityObjectToWorldDir(v.tangent.xyz);
                fixed tangentSign = v.tangent.w * unity_WorldTransformParams.w;
                fixed3 worldBitangent = cross(worldNormal, worldTangent) * tangentSign;
                o.tangentX = fixed3(worldTangent.x, worldBitangent.x, worldNormal.x);
                o.tangentY = fixed3(worldTangent.y, worldBitangent.y, worldNormal.y);
                o.tangentZ = fixed3(worldTangent.z, worldBitangent.z, worldNormal.z);
#else
                o.worldNormal = worldNormal;
#endif
#endif

                return o;
            }

            fixed4 frag(v2f i, bool facing : SV_IsFrontFace) : SV_Target
            {
                UNITY_SETUP_INSTANCE_ID(i);

#if defined(_TRIPLANAR_MAPPING)
                // Calculate triplanar uvs and apply texture scale and offset values like TRANSFORM_TEX.
                fixed3 triplanarBlend = pow(abs(i.triplanarNormal), _TriplanarMappingBlendSharpness);
                triplanarBlend /= dot(triplanarBlend, fixed3(1.0, 1.0, 1.0));
                float2 uvX = i.triplanarPosition.zy * _MainTex_ST.xy + _MainTex_ST.zw;
                float2 uvY = i.triplanarPosition.xz * _MainTex_ST.xy + _MainTex_ST.zw;
                float2 uvZ = i.triplanarPosition.xy * _MainTex_ST.xy + _MainTex_ST.zw;

                // Ternary operator is 2 instructions faster than sign() when we don't care about zero returning a zero sign.
                float3 axisSign = i.triplanarNormal < 0 ? -1 : 1;
                uvX.x *= axisSign.x;
                uvY.x *= axisSign.y;
                uvZ.x *= -axisSign.z;
#endif

            // Texturing.
#if defined(_DISABLE_ALBEDO_MAP)
                fixed4 albedo = fixed4(1.0, 1.0, 1.0, 1.0);
#else
#if defined(_TRIPLANAR_MAPPING)
                fixed4 albedo = tex2D(_MainTex, uvX) * triplanarBlend.x +
                                tex2D(_MainTex, uvY) * triplanarBlend.y +
                                tex2D(_MainTex, uvZ) * triplanarBlend.z;
#else
#if defined(_USE_SSAA)
                // Does SSAA on the texture, implementation based off this article: https://medium.com/@bgolus/sharper-mipmapping-using-shader-based-supersampling-ed7aadb47bec
                // per pixel screen space partial derivatives
                float2 dx = ddx(i.uv.xy) * 0.25; // horizontal offset
                float2 dy = ddy(i.uv.xy) * 0.25; // vertical offset
                // supersampled 2x2 ordered grid
                fixed4 albedo = 0;
                albedo += tex2Dbias(_MainTex, float4(i.uv.xy + dx + dy, 0.0, _MipmapBias));
                albedo += tex2Dbias(_MainTex, float4(i.uv.xy - dx + dy, 0.0, _MipmapBias));
                albedo += tex2Dbias(_MainTex, float4(i.uv.xy + dx - dy, 0.0, _MipmapBias));
                albedo += tex2Dbias(_MainTex, float4(i.uv.xy - dx - dy, 0.0, _MipmapBias));
                albedo *= 0.25;
#else
                fixed4 albedo = tex2D(_MainTex, i.uv);
#endif
#endif
#endif


#ifdef LIGHTMAP_ON
                albedo.rgb *= DecodeLightmap(UNITY_SAMPLE_TEX2D(unity_Lightmap, i.lightMapUV));
#endif

#if defined(_CHANNEL_MAP)
                fixed4 channel = tex2D(_ChannelMap, i.uv);
                _Metallic = channel.r;
                albedo.rgb *= channel.g;
                _Smoothness = channel.a;
#else
#if defined(_METALLIC_TEXTURE_ALBEDO_CHANNEL_A)
                _Metallic = albedo.a;
                albedo.a = 1.0;
#elif defined(_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A)
                _Smoothness = albedo.a;
                albedo.a = 1.0;
#endif 
#endif

                // Primitive clipping.
#if defined(_CLIPPING_PRIMITIVE)
                float primitiveDistance = 1.0;
#if defined(_CLIPPING_PLANE)
                fixed clipPlaneSide = UNITY_ACCESS_INSTANCED_PROP(Props, _ClipPlaneSide);
                float4 clipPlane = UNITY_ACCESS_INSTANCED_PROP(Props, _ClipPlane);
                primitiveDistance = min(primitiveDistance, PointVsPlane(i.worldPosition.xyz, clipPlane) * clipPlaneSide);
#endif
#if defined(_CLIPPING_SPHERE)
                fixed clipSphereSide = UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereSide);
                float4x4 clipSphereInverseTransform = UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform);
                
                // <<< NEW!
                int count = UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereCount);

                if (count > 0)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform)) * clipSphereSide);
                if (count > 1)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform1)) * clipSphereSide);
                if (count > 2)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform2)) * clipSphereSide);
                if (count > 3)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform3)) * clipSphereSide);
                if (count > 4)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform4)) * clipSphereSide);
                if (count > 5)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform5)) * clipSphereSide);
                if (count > 6)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform6)) * clipSphereSide);
                if (count > 7)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform7)) * clipSphereSide);
                if (count > 8)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform8)) * clipSphereSide);
                if (count > 9)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform9)) * clipSphereSide);
                if (count > 10)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform10)) * clipSphereSide);
                if (count > 11)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform11)) * clipSphereSide);
                if (count > 12)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform12)) * clipSphereSide);
                if (count > 13)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform13)) * clipSphereSide);
                if (count > 14)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform14)) * clipSphereSide);
                if (count > 15)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform15)) * clipSphereSide);
                if (count > 16)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform16)) * clipSphereSide);
                if (count > 17)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform17)) * clipSphereSide);
                if (count > 18)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform18)) * clipSphereSide);
                if (count > 19)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform19)) * clipSphereSide);
                if (count > 20)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform20)) * clipSphereSide);
                if (count > 21)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform21)) * clipSphereSide);
                if (count > 22)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform22)) * clipSphereSide);
                if (count > 23)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform23)) * clipSphereSide);
                if (count > 24)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform24)) * clipSphereSide);
                if (count > 25)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform25)) * clipSphereSide);
                if (count > 26)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform26)) * clipSphereSide);
                if (count > 27)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform27)) * clipSphereSide);
                if (count > 28)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform28)) * clipSphereSide);
                if (count > 29)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform29)) * clipSphereSide);
                if (count > 30)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform30)) * clipSphereSide);
                if (count > 31)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform31)) * clipSphereSide);
                if (count > 32)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform32)) * clipSphereSide);
                if (count > 33)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform33)) * clipSphereSide);
                if (count > 34)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform34)) * clipSphereSide);
                if (count > 35)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform35)) * clipSphereSide);
                if (count > 36)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform36)) * clipSphereSide);
                if (count > 37)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform37)) * clipSphereSide);
                if (count > 38)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform38)) * clipSphereSide);
                if (count > 39)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform39)) * clipSphereSide);
                if (count > 40)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform40)) * clipSphereSide);
                if (count > 41)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform41)) * clipSphereSide);
                if (count > 42)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform42)) * clipSphereSide);
                if (count > 43)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform43)) * clipSphereSide);
                if (count > 44)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform44)) * clipSphereSide);
                if (count > 45)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform45)) * clipSphereSide);
                if (count > 46)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform46)) * clipSphereSide);
                if (count > 47)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform47)) * clipSphereSide);
                if (count > 48)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform48)) * clipSphereSide);
                if (count > 49)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform49)) * clipSphereSide);
                if (count > 50)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform50)) * clipSphereSide);
                if (count > 51)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform51)) * clipSphereSide);
                if (count > 52)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform52)) * clipSphereSide);
                if (count > 53)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform53)) * clipSphereSide);
                if (count > 54)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform54)) * clipSphereSide);
                if (count > 55)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform55)) * clipSphereSide);
                if (count > 56)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform56)) * clipSphereSide);
                if (count > 57)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform57)) * clipSphereSide);
                if (count > 58)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform58)) * clipSphereSide);
                if (count > 59)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform59)) * clipSphereSide);
                if (count > 60)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform60)) * clipSphereSide);
                if (count > 61)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform61)) * clipSphereSide);
                if (count > 62)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform62)) * clipSphereSide);
                if (count > 63)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform63)) * clipSphereSide);
                if (count > 64)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform64)) * clipSphereSide);
                if (count > 65)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform65)) * clipSphereSide);
                if (count > 66)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform66)) * clipSphereSide);
                if (count > 67)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform67)) * clipSphereSide);
                if (count > 68)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform68)) * clipSphereSide);
                if (count > 69)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform69)) * clipSphereSide);
                if (count > 70)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform70)) * clipSphereSide);
                if (count > 71)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform71)) * clipSphereSide);
                if (count > 72)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform72)) * clipSphereSide);
                if (count > 73)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform73)) * clipSphereSide);
                if (count > 74)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform74)) * clipSphereSide);
                if (count > 75)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform75)) * clipSphereSide);
                if (count > 76)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform76)) * clipSphereSide);
                if (count > 77)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform77)) * clipSphereSide);
                if (count > 78)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform78)) * clipSphereSide);
                if (count > 79)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform79)) * clipSphereSide);
                if (count > 80)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform80)) * clipSphereSide);
                if (count > 81)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform81)) * clipSphereSide);
                if (count > 82)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform82)) * clipSphereSide);
                if (count > 83)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform83)) * clipSphereSide);
                if (count > 84)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform84)) * clipSphereSide);
                if (count > 85)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform85)) * clipSphereSide);
                if (count > 86)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform86)) * clipSphereSide);
                if (count > 87)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform87)) * clipSphereSide);
                if (count > 88)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform88)) * clipSphereSide);
                if (count > 89)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform89)) * clipSphereSide);
                if (count > 90)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform90)) * clipSphereSide);
                if (count > 91)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform91)) * clipSphereSide);
                if (count > 92)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform92)) * clipSphereSide);
                if (count > 93)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform93)) * clipSphereSide);
                if (count > 94)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform94)) * clipSphereSide);
                if (count > 95)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform95)) * clipSphereSide);
                if (count > 96)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform96)) * clipSphereSide);
                if (count > 97)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform97)) * clipSphereSide);
                if (count > 98)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform98)) * clipSphereSide);
                if (count > 99)   primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform99)) * clipSphereSide);
                if (count > 100)  primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform100)) * clipSphereSide);
                if (count > 101)  primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform101)) * clipSphereSide);
                if (count > 102)  primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform102)) * clipSphereSide);
                if (count > 103)  primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform103)) * clipSphereSide);
                if (count > 104)  primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform104)) * clipSphereSide);
                if (count > 105)  primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform105)) * clipSphereSide);
                if (count > 106)  primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform106)) * clipSphereSide);
                if (count > 107)  primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform107)) * clipSphereSide);
                if (count > 108)  primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform108)) * clipSphereSide);
                if (count > 109)  primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform109)) * clipSphereSide);
                if (count > 110)  primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform110)) * clipSphereSide);
                if (count > 111)  primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform111)) * clipSphereSide);
                if (count > 112)  primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform112)) * clipSphereSide);
                if (count > 113)  primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform113)) * clipSphereSide);
                if (count > 114)  primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform114)) * clipSphereSide);
                if (count > 115)  primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform115)) * clipSphereSide);
                if (count > 116)  primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform116)) * clipSphereSide);
                if (count > 117)  primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform117)) * clipSphereSide);
                if (count > 118)  primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform118)) * clipSphereSide);
                if (count > 119)  primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform119)) * clipSphereSide);
                if (count > 120)  primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform120)) * clipSphereSide);
                if (count > 121)  primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform121)) * clipSphereSide);
                if (count > 122)  primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform122)) * clipSphereSide);
                if (count > 123)  primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform123)) * clipSphereSide);
                if (count > 124)  primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform124)) * clipSphereSide);
                if (count > 125)  primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform125)) * clipSphereSide);
                if (count > 126)  primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform126)) * clipSphereSide);
                if (count > 127)  primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform127)) * clipSphereSide);
//                 if (count > 128)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform128)) * clipSphereSide);
// if (count > 129)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform129)) * clipSphereSide);
// if (count > 130)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform130)) * clipSphereSide);
// if (count > 131)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform131)) * clipSphereSide);
// if (count > 132)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform132)) * clipSphereSide);
// if (count > 133)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform133)) * clipSphereSide);
// if (count > 134)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform134)) * clipSphereSide);
// if (count > 135)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform135)) * clipSphereSide);
// if (count > 136)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform136)) * clipSphereSide);
// if (count > 137)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform137)) * clipSphereSide);
// if (count > 138)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform138)) * clipSphereSide);
// if (count > 139)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform139)) * clipSphereSide);
// if (count > 140)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform140)) * clipSphereSide);
// if (count > 141)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform141)) * clipSphereSide);
// if (count > 142)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform142)) * clipSphereSide);
// if (count > 143)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform143)) * clipSphereSide);
// if (count > 144)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform144)) * clipSphereSide);
// if (count > 145)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform145)) * clipSphereSide);
// if (count > 146)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform146)) * clipSphereSide);
// if (count > 147)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform147)) * clipSphereSide);
// if (count > 148)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform148)) * clipSphereSide);
// if (count > 149)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform149)) * clipSphereSide);
// if (count > 150)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform150)) * clipSphereSide);
// if (count > 151)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform151)) * clipSphereSide);
// if (count > 152)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform152)) * clipSphereSide);
// if (count > 153)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform153)) * clipSphereSide);
// if (count > 154)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform154)) * clipSphereSide);
// if (count > 155)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform155)) * clipSphereSide);
// if (count > 156)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform156)) * clipSphereSide);
// if (count > 157)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform157)) * clipSphereSide);
// if (count > 158)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform158)) * clipSphereSide);
// if (count > 159)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform159)) * clipSphereSide);
// if (count > 160)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform160)) * clipSphereSide);
// if (count > 161)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform161)) * clipSphereSide);
// if (count > 162)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform162)) * clipSphereSide);
// if (count > 163)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform163)) * clipSphereSide);
// if (count > 164)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform164)) * clipSphereSide);
// if (count > 165)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform165)) * clipSphereSide);
// if (count > 166)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform166)) * clipSphereSide);
// if (count > 167)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform167)) * clipSphereSide);
// if (count > 168)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform168)) * clipSphereSide);
// if (count > 169)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform169)) * clipSphereSide);
// if (count > 170)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform170)) * clipSphereSide);
// if (count > 171)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform171)) * clipSphereSide);
// if (count > 172)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform172)) * clipSphereSide);
// if (count > 173)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform173)) * clipSphereSide);
// if (count > 174)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform174)) * clipSphereSide);
// if (count > 175)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform175)) * clipSphereSide);
// if (count > 176)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform176)) * clipSphereSide);
// if (count > 177)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform177)) * clipSphereSide);
// if (count > 178)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform178)) * clipSphereSide);
// if (count > 179)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform179)) * clipSphereSide);
// if (count > 180)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform180)) * clipSphereSide);
// if (count > 181)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform181)) * clipSphereSide);
// if (count > 182)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform182)) * clipSphereSide);
// if (count > 183)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform183)) * clipSphereSide);
// if (count > 184)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform184)) * clipSphereSide);
// if (count > 185)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform185)) * clipSphereSide);
// if (count > 186)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform186)) * clipSphereSide);
// if (count > 187)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform187)) * clipSphereSide);
// if (count > 188)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform188)) * clipSphereSide);
// if (count > 189)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform189)) * clipSphereSide);
// if (count > 190)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform190)) * clipSphereSide);
// if (count > 191)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform191)) * clipSphereSide);
// if (count > 192)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform192)) * clipSphereSide);
// if (count > 193)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform193)) * clipSphereSide);
// if (count > 194)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform194)) * clipSphereSide);
// if (count > 195)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform195)) * clipSphereSide);
// if (count > 196)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform196)) * clipSphereSide);
// if (count > 197)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform197)) * clipSphereSide);
// if (count > 198)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform198)) * clipSphereSide);
// if (count > 199)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform199)) * clipSphereSide);
// if (count > 200)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform200)) * clipSphereSide);
// if (count > 201)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform201)) * clipSphereSide);
// if (count > 202)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform202)) * clipSphereSide);
// if (count > 203)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform203)) * clipSphereSide);
// if (count > 204)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform204)) * clipSphereSide);
// if (count > 205)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform205)) * clipSphereSide);
// if (count > 206)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform206)) * clipSphereSide);
// if (count > 207)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform207)) * clipSphereSide);
// if (count > 208)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform208)) * clipSphereSide);
// if (count > 209)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform209)) * clipSphereSide);
// if (count > 210)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform210)) * clipSphereSide);
// if (count > 211)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform211)) * clipSphereSide);
// if (count > 212)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform212)) * clipSphereSide);
// if (count > 213)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform213)) * clipSphereSide);
// if (count > 214)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform214)) * clipSphereSide);
// if (count > 215)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform215)) * clipSphereSide);
// if (count > 216)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform216)) * clipSphereSide);
// if (count > 217)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform217)) * clipSphereSide);
// if (count > 218)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform218)) * clipSphereSide);
// if (count > 219)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform219)) * clipSphereSide);
// if (count > 220)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform220)) * clipSphereSide);
// if (count > 221)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform221)) * clipSphereSide);
// if (count > 222)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform222)) * clipSphereSide);
// if (count > 223)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform223)) * clipSphereSide);
// if (count > 224)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform224)) * clipSphereSide);
// if (count > 225)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform225)) * clipSphereSide);
// if (count > 226)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform226)) * clipSphereSide);
// if (count > 227)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform227)) * clipSphereSide);
// if (count > 228)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform228)) * clipSphereSide);
// if (count > 229)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform229)) * clipSphereSide);
// if (count > 230)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform230)) * clipSphereSide);
// if (count > 231)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform231)) * clipSphereSide);
// if (count > 232)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform232)) * clipSphereSide);
// if (count > 233)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform233)) * clipSphereSide);
// if (count > 234)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform234)) * clipSphereSide);
// if (count > 235)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform235)) * clipSphereSide);
// if (count > 236)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform236)) * clipSphereSide);
// if (count > 237)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform237)) * clipSphereSide);
// if (count > 238)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform238)) * clipSphereSide);
// if (count > 239)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform239)) * clipSphereSide);
// if (count > 240)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform240)) * clipSphereSide);
// if (count > 241)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform241)) * clipSphereSide);
// if (count > 242)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform242)) * clipSphereSide);
// if (count > 243)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform243)) * clipSphereSide);
// if (count > 244)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform244)) * clipSphereSide);
// if (count > 245)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform245)) * clipSphereSide);
// if (count > 246)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform246)) * clipSphereSide);
// if (count > 247)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform247)) * clipSphereSide);
// if (count > 248)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform248)) * clipSphereSide);
// if (count > 249)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform249)) * clipSphereSide);
// if (count > 250)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform250)) * clipSphereSide);
// if (count > 251)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform251)) * clipSphereSide);
// if (count > 252)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform252)) * clipSphereSide);
// if (count > 253)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform253)) * clipSphereSide);
// if (count > 254)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform254)) * clipSphereSide);
// if (count > 255)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform255)) * clipSphereSide);
// if (count > 256)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform256)) * clipSphereSide);
// if (count > 257)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform257)) * clipSphereSide);
// if (count > 258)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform258)) * clipSphereSide);
// if (count > 259)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform259)) * clipSphereSide);
// if (count > 260)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform260)) * clipSphereSide);
// if (count > 261)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform261)) * clipSphereSide);
// if (count > 262)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform262)) * clipSphereSide);
// if (count > 263)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform263)) * clipSphereSide);
// if (count > 264)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform264)) * clipSphereSide);
// if (count > 265)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform265)) * clipSphereSide);
// if (count > 266)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform266)) * clipSphereSide);
// if (count > 267)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform267)) * clipSphereSide);
// if (count > 268)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform268)) * clipSphereSide);
// if (count > 269)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform269)) * clipSphereSide);
// if (count > 270)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform270)) * clipSphereSide);
// if (count > 271)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform271)) * clipSphereSide);
// if (count > 272)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform272)) * clipSphereSide);
// if (count > 273)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform273)) * clipSphereSide);
// if (count > 274)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform274)) * clipSphereSide);
// if (count > 275)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform275)) * clipSphereSide);
// if (count > 276)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform276)) * clipSphereSide);
// if (count > 277)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform277)) * clipSphereSide);
// if (count > 278)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform278)) * clipSphereSide);
// if (count > 279)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform279)) * clipSphereSide);
// if (count > 280)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform280)) * clipSphereSide);
// if (count > 281)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform281)) * clipSphereSide);
// if (count > 282)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform282)) * clipSphereSide);
// if (count > 283)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform283)) * clipSphereSide);
// if (count > 284)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform284)) * clipSphereSide);
// if (count > 285)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform285)) * clipSphereSide);
// if (count > 286)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform286)) * clipSphereSide);
// if (count > 287)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform287)) * clipSphereSide);
// if (count > 288)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform288)) * clipSphereSide);
// if (count > 289)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform289)) * clipSphereSide);
// if (count > 290)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform290)) * clipSphereSide);
// if (count > 291)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform291)) * clipSphereSide);
// if (count > 292)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform292)) * clipSphereSide);
// if (count > 293)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform293)) * clipSphereSide);
// if (count > 294)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform294)) * clipSphereSide);
// if (count > 295)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform295)) * clipSphereSide);
// if (count > 296)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform296)) * clipSphereSide);
// if (count > 297)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform297)) * clipSphereSide);
// if (count > 298)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform298)) * clipSphereSide);
// if (count > 299)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform299)) * clipSphereSide);
// if (count > 300)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform300)) * clipSphereSide);
// if (count > 301)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform301)) * clipSphereSide);
// if (count > 302)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform302)) * clipSphereSide);
// if (count > 303)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform303)) * clipSphereSide);
// if (count > 304)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform304)) * clipSphereSide);
// if (count > 305)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform305)) * clipSphereSide);
// if (count > 306)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform306)) * clipSphereSide);
// if (count > 307)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform307)) * clipSphereSide);
// if (count > 308)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform308)) * clipSphereSide);
// if (count > 309)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform309)) * clipSphereSide);
// if (count > 310)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform310)) * clipSphereSide);
// if (count > 311)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform311)) * clipSphereSide);
// if (count > 312)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform312)) * clipSphereSide);
// if (count > 313)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform313)) * clipSphereSide);
// if (count > 314)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform314)) * clipSphereSide);
// if (count > 315)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform315)) * clipSphereSide);
// if (count > 316)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform316)) * clipSphereSide);
// if (count > 317)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform317)) * clipSphereSide);
// if (count > 318)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform318)) * clipSphereSide);
// if (count > 319)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform319)) * clipSphereSide);
// if (count > 320)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform320)) * clipSphereSide);
// if (count > 321)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform321)) * clipSphereSide);
// if (count > 322)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform322)) * clipSphereSide);
// if (count > 323)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform323)) * clipSphereSide);
// if (count > 324)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform324)) * clipSphereSide);
// if (count > 325)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform325)) * clipSphereSide);
// if (count > 326)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform326)) * clipSphereSide);
// if (count > 327)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform327)) * clipSphereSide);
// if (count > 328)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform328)) * clipSphereSide);
// if (count > 329)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform329)) * clipSphereSide);
// if (count > 330)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform330)) * clipSphereSide);
// if (count > 331)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform331)) * clipSphereSide);
// if (count > 332)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform332)) * clipSphereSide);
// if (count > 333)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform333)) * clipSphereSide);
// if (count > 334)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform334)) * clipSphereSide);
// if (count > 335)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform335)) * clipSphereSide);
// if (count > 336)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform336)) * clipSphereSide);
// if (count > 337)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform337)) * clipSphereSide);
// if (count > 338)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform338)) * clipSphereSide);
// if (count > 339)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform339)) * clipSphereSide);
// if (count > 340)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform340)) * clipSphereSide);
// if (count > 341)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform341)) * clipSphereSide);
// if (count > 342)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform342)) * clipSphereSide);
// if (count > 343)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform343)) * clipSphereSide);
// if (count > 344)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform344)) * clipSphereSide);
// if (count > 345)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform345)) * clipSphereSide);
// if (count > 346)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform346)) * clipSphereSide);
// if (count > 347)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform347)) * clipSphereSide);
// if (count > 348)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform348)) * clipSphereSide);
// if (count > 349)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform349)) * clipSphereSide);
// if (count > 350)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform350)) * clipSphereSide);
// if (count > 351)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform351)) * clipSphereSide);
// if (count > 352)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform352)) * clipSphereSide);
// if (count > 353)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform353)) * clipSphereSide);
// if (count > 354)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform354)) * clipSphereSide);
// if (count > 355)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform355)) * clipSphereSide);
// if (count > 356)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform356)) * clipSphereSide);
// if (count > 357)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform357)) * clipSphereSide);
// if (count > 358)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform358)) * clipSphereSide);
// if (count > 359)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform359)) * clipSphereSide);
// if (count > 360)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform360)) * clipSphereSide);
// if (count > 361)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform361)) * clipSphereSide);
// if (count > 362)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform362)) * clipSphereSide);
// if (count > 363)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform363)) * clipSphereSide);
// if (count > 364)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform364)) * clipSphereSide);
// if (count > 365)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform365)) * clipSphereSide);
// if (count > 366)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform366)) * clipSphereSide);
// if (count > 367)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform367)) * clipSphereSide);
// if (count > 368)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform368)) * clipSphereSide);
// if (count > 369)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform369)) * clipSphereSide);
// if (count > 370)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform370)) * clipSphereSide);
// if (count > 371)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform371)) * clipSphereSide);
// if (count > 372)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform372)) * clipSphereSide);
// if (count > 373)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform373)) * clipSphereSide);
// if (count > 374)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform374)) * clipSphereSide);
// if (count > 375)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform375)) * clipSphereSide);
// if (count > 376)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform376)) * clipSphereSide);
// if (count > 377)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform377)) * clipSphereSide);
// if (count > 378)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform378)) * clipSphereSide);
// if (count > 379)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform379)) * clipSphereSide);
// if (count > 380)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform380)) * clipSphereSide);
// if (count > 381)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform381)) * clipSphereSide);
// if (count > 382)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform382)) * clipSphereSide);
// if (count > 383)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform383)) * clipSphereSide);
// if (count > 384)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform384)) * clipSphereSide);
// if (count > 385)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform385)) * clipSphereSide);
// if (count > 386)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform386)) * clipSphereSide);
// if (count > 387)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform387)) * clipSphereSide);
// if (count > 388)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform388)) * clipSphereSide);
// if (count > 389)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform389)) * clipSphereSide);
// if (count > 390)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform390)) * clipSphereSide);
// if (count > 391)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform391)) * clipSphereSide);
// if (count > 392)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform392)) * clipSphereSide);
// if (count > 393)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform393)) * clipSphereSide);
// if (count > 394)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform394)) * clipSphereSide);
// if (count > 395)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform395)) * clipSphereSide);
// if (count > 396)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform396)) * clipSphereSide);
// if (count > 397)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform397)) * clipSphereSide);
// if (count > 398)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform398)) * clipSphereSide);
// if (count > 399)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform399)) * clipSphereSide);
// if (count > 400)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform400)) * clipSphereSide);
// if (count > 401)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform401)) * clipSphereSide);
// if (count > 402)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform402)) * clipSphereSide);
// if (count > 403)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform403)) * clipSphereSide);
// if (count > 404)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform404)) * clipSphereSide);
// if (count > 405)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform405)) * clipSphereSide);
// if (count > 406)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform406)) * clipSphereSide);
// if (count > 407)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform407)) * clipSphereSide);
// if (count > 408)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform408)) * clipSphereSide);
// if (count > 409)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform409)) * clipSphereSide);
// if (count > 410)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform410)) * clipSphereSide);
// if (count > 411)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform411)) * clipSphereSide);
// if (count > 412)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform412)) * clipSphereSide);
// if (count > 413)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform413)) * clipSphereSide);
// if (count > 414)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform414)) * clipSphereSide);
// if (count > 415)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform415)) * clipSphereSide);
// if (count > 416)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform416)) * clipSphereSide);
// if (count > 417)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform417)) * clipSphereSide);
// if (count > 418)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform418)) * clipSphereSide);
// if (count > 419)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform419)) * clipSphereSide);
// if (count > 420)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform420)) * clipSphereSide);
// if (count > 421)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform421)) * clipSphereSide);
// if (count > 422)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform422)) * clipSphereSide);
// if (count > 423)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform423)) * clipSphereSide);
// if (count > 424)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform424)) * clipSphereSide);
// if (count > 425)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform425)) * clipSphereSide);
// if (count > 426)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform426)) * clipSphereSide);
// if (count > 427)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform427)) * clipSphereSide);
// if (count > 428)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform428)) * clipSphereSide);
// if (count > 429)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform429)) * clipSphereSide);
// if (count > 430)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform430)) * clipSphereSide);
// if (count > 431)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform431)) * clipSphereSide);
// if (count > 432)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform432)) * clipSphereSide);
// if (count > 433)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform433)) * clipSphereSide);
// if (count > 434)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform434)) * clipSphereSide);
// if (count > 435)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform435)) * clipSphereSide);
// if (count > 436)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform436)) * clipSphereSide);
// if (count > 437)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform437)) * clipSphereSide);
// if (count > 438)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform438)) * clipSphereSide);
// if (count > 439)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform439)) * clipSphereSide);
// if (count > 440)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform440)) * clipSphereSide);
// if (count > 441)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform441)) * clipSphereSide);
// if (count > 442)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform442)) * clipSphereSide);
// if (count > 443)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform443)) * clipSphereSide);
// if (count > 444)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform444)) * clipSphereSide);
// if (count > 445)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform445)) * clipSphereSide);
// if (count > 446)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform446)) * clipSphereSide);
// if (count > 447)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform447)) * clipSphereSide);
// if (count > 448)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform448)) * clipSphereSide);
// if (count > 449)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform449)) * clipSphereSide);
// if (count > 450)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform450)) * clipSphereSide);
// if (count > 451)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform451)) * clipSphereSide);
// if (count > 452)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform452)) * clipSphereSide);
// if (count > 453)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform453)) * clipSphereSide);
// if (count > 454)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform454)) * clipSphereSide);
// if (count > 455)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform455)) * clipSphereSide);
// if (count > 456)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform456)) * clipSphereSide);
// if (count > 457)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform457)) * clipSphereSide);
// if (count > 458)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform458)) * clipSphereSide);
// if (count > 459)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform459)) * clipSphereSide);
// if (count > 460)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform460)) * clipSphereSide);
// if (count > 461)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform461)) * clipSphereSide);
// if (count > 462)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform462)) * clipSphereSide);
// if (count > 463)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform463)) * clipSphereSide);
// if (count > 464)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform464)) * clipSphereSide);
// if (count > 465)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform465)) * clipSphereSide);
// if (count > 466)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform466)) * clipSphereSide);
// if (count > 467)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform467)) * clipSphereSide);
// if (count > 468)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform468)) * clipSphereSide);
// if (count > 469)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform469)) * clipSphereSide);
// if (count > 470)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform470)) * clipSphereSide);
// if (count > 471)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform471)) * clipSphereSide);
// if (count > 472)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform472)) * clipSphereSide);
// if (count > 473)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform473)) * clipSphereSide);
// if (count > 474)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform474)) * clipSphereSide);
// if (count > 475)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform475)) * clipSphereSide);
// if (count > 476)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform476)) * clipSphereSide);
// if (count > 477)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform477)) * clipSphereSide);
// if (count > 478)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform478)) * clipSphereSide);
// if (count > 479)    primitiveDistance = min(primitiveDistance, PointVsSphere(i.worldPosition.xyz, UNITY_ACCESS_INSTANCED_PROP(Props, _ClipSphereInverseTransform479)) * clipSphereSide);

                
                
                // >>>
#endif
#if defined(_CLIPPING_BOX)
                fixed clipBoxSide = UNITY_ACCESS_INSTANCED_PROP(Props, _ClipBoxSide);
                float4x4 clipBoxInverseTransform = UNITY_ACCESS_INSTANCED_PROP(Props, _ClipBoxInverseTransform);
                primitiveDistance = min(primitiveDistance, PointVsBox(i.worldPosition.xyz, clipBoxInverseTransform) * clipBoxSide);
#endif
#if defined(_CLIPPING_BORDER)
                fixed3 primitiveBorderColor = lerp(_ClippingBorderColor, fixed3(0.0, 0.0, 0.0), primitiveDistance / _ClippingBorderWidth);
                albedo.rgb += primitiveBorderColor * (primitiveDistance < _ClippingBorderWidth ? 1.0 : 0.0);
#endif
#endif

#if defined(_DISTANCE_TO_EDGE)
                fixed2 distanceToEdge;
                distanceToEdge.x = abs(i.uv.x - 0.5) * 2.0;
                distanceToEdge.y = abs(i.uv.y - 0.5) * 2.0;
#endif

                // Rounded corner clipping.
#if defined(_ROUND_CORNERS)
                float2 halfScale = i.scale.xy * 0.5;
                float2 roundCornerPosition = distanceToEdge * halfScale;

                fixed currentCornerRadius;

#if defined(_INDEPENDENT_CORNERS)

                _RoundCornersRadius = clamp(_RoundCornersRadius, 0, 0.5);

                if (i.uv.x < 0.5)
                {
                    if (i.uv.y > 0.5)
                    {
                        currentCornerRadius = _RoundCornersRadius.x;
                    }
                    else
                    {
                        currentCornerRadius = _RoundCornersRadius.w;
                    }
                }
                else
                {
                    if (i.uv.y > 0.5)
                    {
                        currentCornerRadius = _RoundCornersRadius.y;
                    }
                    else
                    {
                        currentCornerRadius = _RoundCornersRadius.z;
                    }
                }
#else 
                currentCornerRadius = _RoundCornerRadius;
#endif

                float cornerCircleRadius = saturate(max(currentCornerRadius - _RoundCornerMargin, 0.01)) * i.scale.z;

                float2 cornerCircleDistance = halfScale - (_RoundCornerMargin * i.scale.z) - cornerCircleRadius;

                float roundCornerClip = RoundCorners(roundCornerPosition, cornerCircleDistance, cornerCircleRadius);
#endif

                albedo *= UNITY_ACCESS_INSTANCED_PROP(Props, _Color);

#if defined(_VERTEX_COLORS)
                albedo *= i.color;
#endif

#if defined(_IRIDESCENCE)
                albedo.rgb += i.iridescentColor;
#endif

                // Normal calculation.
#if defined(_NORMAL)
                fixed3 worldViewDir = normalize(UnityWorldSpaceViewDir(i.worldPosition.xyz));
#if defined(_REFLECTIONS) || defined(_ENVIRONMENT_COLORING)
                fixed3 incident = -worldViewDir;
#endif
                fixed3 worldNormal;

#if defined(_NORMAL_MAP)
#if defined(_TRIPLANAR_MAPPING)
                fixed3 tangentNormalX = UnpackScaleNormal(tex2D(_NormalMap, uvX), _NormalMapScale);
                fixed3 tangentNormalY = UnpackScaleNormal(tex2D(_NormalMap, uvY), _NormalMapScale);
                fixed3 tangentNormalZ = UnpackScaleNormal(tex2D(_NormalMap, uvZ), _NormalMapScale);
                tangentNormalX.x *= axisSign.x;
                tangentNormalY.x *= axisSign.y;
                tangentNormalZ.x *= -axisSign.z;

                // Swizzle world normals to match tangent space and apply Whiteout normal blend.
                tangentNormalX = fixed3(tangentNormalX.xy + i.worldNormal.zy, tangentNormalX.z * i.worldNormal.x);
                tangentNormalY = fixed3(tangentNormalY.xy + i.worldNormal.xz, tangentNormalY.z * i.worldNormal.y);
                tangentNormalZ = fixed3(tangentNormalZ.xy + i.worldNormal.xy, tangentNormalZ.z * i.worldNormal.z);

                // Swizzle tangent normals to match world normal and blend together.
                worldNormal = normalize(tangentNormalX.zyx * triplanarBlend.x +
                                        tangentNormalY.xzy * triplanarBlend.y +
                                        tangentNormalZ.xyz * triplanarBlend.z);
#else
                fixed3 tangentNormal = UnpackScaleNormal(tex2D(_NormalMap, i.uv), _NormalMapScale);
                worldNormal.x = dot(i.tangentX, tangentNormal);
                worldNormal.y = dot(i.tangentY, tangentNormal);
                worldNormal.z = dot(i.tangentZ, tangentNormal);
                worldNormal = normalize(worldNormal) * (facing ? 1.0 : -1.0);
#endif
#else
                worldNormal = normalize(i.worldNormal) * (facing ? 1.0 : -1.0);
#endif
#endif

                fixed pointToLight = 1.0;
                fixed3 fluentLightColor = fixed3(0.0, 0.0, 0.0);

                // Hover light.
#if defined(_HOVER_LIGHT)
                pointToLight = 0.0;

                [unroll]
                for (int hoverLightIndex = 0; hoverLightIndex < HOVER_LIGHT_COUNT; ++hoverLightIndex)
                {
                    int dataIndex = hoverLightIndex * HOVER_LIGHT_DATA_SIZE;
                    fixed hoverValue = HoverLight(_HoverLightData[dataIndex], _HoverLightData[dataIndex + 1].w, i.worldPosition.xyz);
                    pointToLight += hoverValue;
#if !defined(_HOVER_COLOR_OVERRIDE)
                    fluentLightColor += lerp(fixed3(0.0, 0.0, 0.0), _HoverLightData[dataIndex + 1].rgb, hoverValue);
#endif
                }
#if defined(_HOVER_COLOR_OVERRIDE)
                fluentLightColor = _HoverColorOverride.rgb * pointToLight;
#endif
#endif

                // Proximity light.
#if defined(_PROXIMITY_LIGHT)
#if !defined(_HOVER_LIGHT)
                pointToLight = 0.0;
#endif
                [unroll]
                for (int proximityLightIndex = 0; proximityLightIndex < PROXIMITY_LIGHT_COUNT; ++proximityLightIndex)
                {
                    int dataIndex = proximityLightIndex * PROXIMITY_LIGHT_DATA_SIZE;
                    fixed colorValue;
                    fixed proximityValue = ProximityLight(_ProximityLightData[dataIndex], _ProximityLightData[dataIndex + 1], _ProximityLightData[dataIndex + 2], i.worldPosition.xyz, worldNormal, colorValue);
                    pointToLight += proximityValue;
#if defined(_PROXIMITY_LIGHT_COLOR_OVERRIDE)
                    fixed3 proximityColor = MixProximityLightColor(_ProximityLightCenterColorOverride, _ProximityLightMiddleColorOverride, _ProximityLightOuterColorOverride, colorValue);
#else
                    fixed3 proximityColor = MixProximityLightColor(_ProximityLightData[dataIndex + 3], _ProximityLightData[dataIndex + 4], _ProximityLightData[dataIndex + 5], colorValue);
#endif  
#if defined(_PROXIMITY_LIGHT_SUBTRACTIVE)
                    fluentLightColor -= lerp(fixed3(0.0, 0.0, 0.0), proximityColor, proximityValue);
#else
                    fluentLightColor += lerp(fixed3(0.0, 0.0, 0.0), proximityColor, proximityValue);
#endif    
                }
#endif    

                // Border light.
#if defined(_BORDER_LIGHT)
                fixed borderValue;
#if defined(_ROUND_CORNERS)
                fixed borderMargin = _RoundCornerMargin + _BorderWidth * 0.5;

                cornerCircleRadius = saturate(max(currentCornerRadius - borderMargin, 0.01)) * i.scale.z;

                cornerCircleDistance = halfScale - (borderMargin * i.scale.z) - cornerCircleRadius;

                borderValue = 1.0 - RoundCornersSmooth(roundCornerPosition, cornerCircleDistance, cornerCircleRadius);
#else
                borderValue = max(smoothstep(i.uv.z - _EdgeSmoothingValue, i.uv.z + _EdgeSmoothingValue, distanceToEdge.x),
                                  smoothstep(i.uv.w - _EdgeSmoothingValue, i.uv.w + _EdgeSmoothingValue, distanceToEdge.y));
#endif
#if defined(_HOVER_LIGHT) && defined(_BORDER_LIGHT_USES_HOVER_COLOR) && defined(_HOVER_COLOR_OVERRIDE)
                fixed3 borderColor = _HoverColorOverride.rgb;
#else
                fixed3 borderColor = fixed3(1.0, 1.0, 1.0);
#endif
                fixed3 borderContribution = borderColor * borderValue * _BorderMinValue * _FluentLightIntensity;
#if defined(_BORDER_LIGHT_REPLACES_ALBEDO)
                albedo.rgb = lerp(albedo.rgb, borderContribution, borderValue);
#else
                albedo.rgb += borderContribution;
#endif
#if defined(_HOVER_LIGHT) || defined(_PROXIMITY_LIGHT)
                albedo.rgb += (fluentLightColor * borderValue * pointToLight * _FluentLightIntensity) * 2.0;
#endif
#if defined(_BORDER_LIGHT_OPAQUE)
                albedo.a = max(albedo.a, borderValue * _BorderLightOpaqueAlpha);
#endif
#endif

#if defined(_ROUND_CORNERS)
                albedo *= roundCornerClip;
                pointToLight *= roundCornerClip;
#endif

#ifdef UNITY_UI_CLIP_RECT
                albedo.a *= UnityGet2DClipping(i.localPosition.xy, _ClipRect);
#endif

#if defined(_ALPHA_CLIP)
#if !defined(_ALPHATEST_ON)
                _Cutoff = 0.5;
#endif
#if defined(_CLIPPING_PRIMITIVE)
                albedo *= (primitiveDistance > 0.0);
#endif
                clip(albedo.a - _Cutoff);
                albedo.a = 1.0;
#endif

                // Blinn phong lighting.
#if defined(_DIRECTIONAL_LIGHT)
#if defined(_RENDER_PIPELINE)
                float4 directionalLightDirection = _MainLightPosition;
#else
                float4 directionalLightDirection = _WorldSpaceLightPos0;
#endif
                fixed diffuse = max(0.0, dot(worldNormal, directionalLightDirection));
#if defined(_SPECULAR_HIGHLIGHTS)
                fixed halfVector = max(0.0, dot(worldNormal, normalize(directionalLightDirection + worldViewDir)));
                fixed specular = saturate(pow(halfVector, _Shininess * pow(_Smoothness, 4.0)) * (_Smoothness * 2.0) * _Metallic);
#else
                fixed specular = 0.0;
#endif
#endif

                // Image based lighting (attempt to mimic the Standard shader).
#if defined(_REFLECTIONS)
                fixed3 worldReflection = reflect(incident, worldNormal);
                fixed4 iblData = UNITY_SAMPLE_TEXCUBE_LOD(unity_SpecCube0, worldReflection, (1.0 - _Smoothness) * UNITY_SPECCUBE_LOD_STEPS);
                fixed3 ibl = DecodeHDR(iblData, unity_SpecCube0_HDR);
#if defined(_REFRACTION)
                fixed4 refractColor = UNITY_SAMPLE_TEXCUBE(unity_SpecCube0, refract(incident, worldNormal, _RefractiveIndex));
                ibl *= DecodeHDR(refractColor, unity_SpecCube0_HDR);
#endif
#else
                fixed3 ibl = unity_IndirectSpecColor.rgb;
#endif

                // Fresnel lighting.
#if defined(_FRESNEL)
                fixed fresnel = 1.0 - saturate(abs(dot(worldViewDir, worldNormal)));
#if defined(_RIM_LIGHT)
                fixed3 fresnelColor = _RimColor * pow(fresnel, _RimPower);
#else
                fixed3 fresnelColor = unity_IndirectSpecColor.rgb * (pow(fresnel, _FresnelPower) * max(_Smoothness, 0.5));
#endif
#endif
                // Final lighting mix.
                fixed4 output = albedo;
#if defined(_SPHERICAL_HARMONICS)
                fixed3 ambient = i.ambient;
#else
                fixed3 ambient = glstate_lightmodel_ambient + fixed3(0.25, 0.25, 0.25);
#endif
                fixed minProperty = min(_Smoothness, _Metallic);
#if defined(_DIRECTIONAL_LIGHT)
                fixed oneMinusMetallic = (1.0 - _Metallic);
                output.rgb = lerp(output.rgb, ibl, minProperty);
#if defined(_RENDER_PIPELINE)
                fixed3 directionalLightColor = _MainLightColor.rgb;
#else
                fixed3 directionalLightColor = _LightColor0.rgb;
#endif
                output.rgb *= lerp((ambient + directionalLightColor * diffuse + directionalLightColor * specular) * max(oneMinusMetallic, _MinMetallicLightContribution), albedo, minProperty);
                output.rgb += (directionalLightColor * albedo * specular) + (directionalLightColor * specular * _Smoothness);
                output.rgb += ibl * oneMinusMetallic * _IblContribution;
#elif defined(_REFLECTIONS)
                output.rgb = lerp(output.rgb, ibl, minProperty);
                output.rgb *= lerp(ambient, albedo, minProperty);
#elif defined(_SPHERICAL_HARMONICS)
                output.rgb *= ambient;
#endif

#if defined(_FRESNEL)
#if defined(_RIM_LIGHT) || !defined(_REFLECTIONS)
                output.rgb += fresnelColor;
#else
                output.rgb += fresnelColor * (1.0 - minProperty);
#endif
#endif

#if defined(_EMISSION)
#if defined(_CHANNEL_MAP)
                output.rgb += _EmissiveColor * channel.b;
#else
                output.rgb += _EmissiveColor;
#endif
#endif

                // Inner glow.
#if defined(_INNER_GLOW)
                fixed2 uvGlow = pow(distanceToEdge * _InnerGlowColor.a, _InnerGlowPower);
                output.rgb += lerp(fixed3(0.0, 0.0, 0.0), _InnerGlowColor.rgb, uvGlow.x + uvGlow.y);
#endif

                // Environment coloring.
#if defined(_ENVIRONMENT_COLORING)
                fixed3 environmentColor = incident.x * incident.x * _EnvironmentColorX +
                                          incident.y * incident.y * _EnvironmentColorY +
                                          incident.z * incident.z * _EnvironmentColorZ;
                output.rgb += environmentColor * max(0.0, dot(incident, worldNormal) + _EnvironmentColorThreshold) * _EnvironmentColorIntensity;

#endif

#if defined(_NEAR_PLANE_FADE)
                output *= i.worldPosition.w;
#endif

                // Hover and proximity lighting should occur after near plane fading.
#if defined(_HOVER_LIGHT) || defined(_PROXIMITY_LIGHT)
                output.rgb += fluentLightColor * _FluentLightIntensity * pointToLight;
#endif

                // Perform non-alpha clipped primitive clipping on the final output.
#if defined(_CLIPPING_PRIMITIVE) && !defined(_ALPHA_CLIP)
                output *= saturate(primitiveDistance * (1.0f / _BlendedClippingWidth));
#endif

#if defined(_BRUSH_PREVIEW)
                // <<< NEW!
                
                float3 worldPos = i.worldPosition;
                float dist = length(worldPos - _BrushPosition);

                if (dist <= _BrushRadius)
                {
                    fixed3 fresnelColor = _PreviewColor * pow(fresnel, _PreviewRimPower);
                    output.rgb += fresnelColor;
                }
                
                float innerEdge = _BrushRadius - _PreviewOutlineThickness;
                if (dist > innerEdge && dist <= _BrushRadius)
                {
                    output.rgb = _PreviewOutlineColor.rgb;
                }

                output *= saturate(primitiveDistance * (1.0f / _BlendedClippingWidth));
                /// >>> NEW!
#endif
                return output;
            }

            ENDCG
        }

        // Extracts information for lightmapping, GI (emission, albedo, ...)
        // This pass it not used during regular rendering.
        Pass
        {
            Name "Meta"
            Tags { "LightMode" = "Meta" }

            CGPROGRAM

            #pragma vertex vert
            #pragma fragment frag

            #pragma shader_feature EDITOR_VISUALIZATION
            #pragma shader_feature _EMISSION
            #pragma shader_feature _CHANNEL_MAP

            #include "UnityCG.cginc"
            #include "UnityMetaPass.cginc"

            // This define will get commented in by the UpgradeShaderForUniversalRenderPipeline method.
            #define _RENDER_PIPELINE

            struct v2f
            {
                float4 vertex : SV_POSITION;
                float2 uv : TEXCOORD0;
            };

            float4 _MainTex_ST;

            v2f vert(appdata_full v)
            {
                v2f o;
                o.vertex = UnityMetaVertexPosition(v.vertex, v.texcoord1.xy, v.texcoord2.xy, unity_LightmapST, unity_DynamicLightmapST);
                o.uv = TRANSFORM_TEX(v.texcoord, _MainTex);

                return o;
            }

            sampler2D _MainTex;
            sampler2D _ChannelMap;

            fixed4 _Color;
            fixed4 _EmissiveColor;

#if defined(_RENDER_PIPELINE)
            CBUFFER_START(_LightBuffer)
            float4 _MainLightPosition;
            half4 _MainLightColor;
            CBUFFER_END
#else
            fixed4 _LightColor0;
#endif

            half4 frag(v2f i) : SV_Target
            {
                UnityMetaInput output;
                UNITY_INITIALIZE_OUTPUT(UnityMetaInput, output);

                output.Albedo = tex2D(_MainTex, i.uv) * _Color;
#if defined(_EMISSION)
#if defined(_CHANNEL_MAP)
                output.Emission += tex2D(_ChannelMap, i.uv).b * _EmissiveColor;
#else
                output.Emission += _EmissiveColor;
#endif
#endif
#if defined(_RENDER_PIPELINE)
                output.SpecularColor = _MainLightColor.rgb;
#else
                output.SpecularColor = _LightColor0.rgb;
#endif

                return UnityMetaFragment(output);
            }
            ENDCG
        }
    }

    Fallback "Hidden/InternalErrorShader"
    CustomEditor "Microsoft.MixedReality.Toolkit.Editor.MixedRealityStandardShaderGUI"
}
