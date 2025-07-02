Shader "RenderHell/Brush3D"
{
    SubShader
    {
        Tags { "RenderType"="Transparent" "IgnoreProjector" = "True" "RenderPipeline"="UniversalRenderPipeline" }
        
        Cull Off
        ZWrite Off
        Blend One OneMinusSrcAlpha
        
        Pass
        {
            Name "Brush3D"
            
            HLSLPROGRAM
            #pragma enable_d3d11_debug_symbols
            #pragma vertex vert
            #pragma fragment frag
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"

CBUFFER_START(UnityPerMaterial)
            float3 _BoundsMin;
            float3 _BoundsMax;
CBUFFER_END
            
            TEXTURE3D(_SelectionMask);
            SAMPLER(sampler_SelectionMask);
            
            struct vertInput
            {
                float4 pos      : POSITION;
                
                UNITY_VERTEX_INPUT_INSTANCE_ID
            };

            struct v2f
            {
                float4 pos : SV_POSITION;
                float3 mask_uv  : TEXCOORD0;
                
                UNITY_VERTEX_INPUT_INSTANCE_ID
                UNITY_VERTEX_OUTPUT_STEREO
            };

/************************************** Vertex Shader *****************************************************************/
            
            v2f vert(vertInput v)
            {
                v2f o;

                ZERO_INITIALIZE(v2f, o);
                UNITY_SETUP_INSTANCE_ID(v);
                UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
                
                o.pos = TransformObjectToHClip(v.pos.xyz);
                o.mask_uv = (v.pos.xyz - _BoundsMin) / (_BoundsMax - _BoundsMin);
                
                return o;
            }

/************************************** Fragment Shader ***************************************************************/
            
            float4 frag(v2f i) : SV_Target
            {
                float isSelected = SAMPLE_TEXTURE3D(_SelectionMask, sampler_SelectionMask, i.mask_uv);
                clip(isSelected - 1);
                
                return float4(0.0f, 0.0f, 0.0f, 1.0f);
            }
            
            ENDHLSL
        }
    }
}