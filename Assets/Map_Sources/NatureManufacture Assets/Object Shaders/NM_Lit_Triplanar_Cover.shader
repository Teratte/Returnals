﻿Shader "NatureManufacture/URP/Lit/Triplanar Cover"
{
    Properties
    {
        _AlphaCutoff("Alpha Cutoff", Range(0, 1)) = 0
        _BaseColor("Base Color", Color) = (1, 1, 1, 0)
        [NoScaleOffset]_BaseColorMap("Base Map(RGB) Alpha(A)", 2D) = "white" {}
        [ToggleUI]_BaseUsePlanarUV("Base Use Planar UV", Float) = 0
        _BaseTilingOffset("Base Tiling and Offset", Vector) = (1, 1, 0, 0)
        [Normal][NoScaleOffset]_BaseNormalMap("Base Normal Map", 2D) = "bump" {}
        _BaseNormalScale("Base Normal Scale", Range(0, 8)) = 1
        [NoScaleOffset]_BaseMaskMap("Base Mask Map MT(R) AO(G) SM(A)", 2D) = "white" {}
        _BaseMetallic("Base Metallic", Range(0, 1)) = 1
        _BaseAORemapMin("Base AO Remap Min", Range(0, 1)) = 0
        _BaseAORemapMax("Base AO Remap Max", Range(0, 1)) = 1
        _BaseSmoothnessRemapMin("Base Smoothness Remap Min", Range(0, 1)) = 0
        _BaseSmoothnessRemapMax("Base Smoothness Remap Max", Range(0, 1)) = 1
        [NoScaleOffset]_CoverMaskA("Cover Mask (A)", 2D) = "white" {}
        _CoverMaskPower("Cover Mask Power", Range(0, 10)) = 1
        _Cover_Amount("Cover Amount", Range(0, 2)) = 0
        _Cover_Amount_Grow_Speed("Cover Amount Grow Speed", Range(0, 3)) = 3
        _CoverDirection("Cover Direction", Vector) = (0, 1, 0, 0)
        _Cover_Max_Angle("Cover Max Angle", Range(0.001, 90)) = 35
        _Cover_Min_Height("Cover Min Height", Float) = -10000
        _Cover_Min_Height_Blending("Cover Min Height Blending", Range(0, 500)) = 1
        _CoverBaseColor("Cover Base Color", Color) = (1, 1, 1, 0)
        [NoScaleOffset]_CoverBaseColorMap("Cover Base Map", 2D) = "white" {}
        _CoverTilingOffset("Cover Tiling Offset", Vector) = (1, 1, 0, 0)
        _CoverTriplanarThreshold("Cover Triplanar Threshold", Range(1, 8)) = 5
        [Normal][NoScaleOffset]_CoverNormalMap("Cover Normal Map", 2D) = "bump" {}
        _CoverNormalScale("Cover Normal Scale", Range(0, 8)) = 1
        _CoverNormalBlendHardness("Cover Normal Blend Hardness", Range(0, 8)) = 1
        _CoverHardness("Cover Hardness", Range(0, 10)) = 5
        _CoverHeightMapMin("Cover Height Map Min", Float) = 0
        _CoverHeightMapMax("Cover Height Map Max", Float) = 1
        _CoverHeightMapOffset("Cover Height Map Offset", Float) = 0
        [NoScaleOffset]_CoverMaskMap("Cover Mask Map MT(R) AO(G) H(B) SM(A)", 2D) = "white" {}
        _CoverMetallic("Cover Metallic", Range(0, 1)) = 1
        _CoverAORemapMin("Cover AO Remap Min", Range(0, 1)) = 0
        _CoverAORemapMax("Cover AO Remap Max", Range(0, 1)) = 1
        _CoverSmoothnessRemapMin("Cover Smoothness Remap Min", Range(0, 1)) = 0
        _CoverSmoothnessRemapMax("Cover Smoothness Remap Max", Range(0, 1)) = 1
        [NoScaleOffset]_DetailMap("Detail Map Base (R) Ny(G) Sm(B) Nx(A)", 2D) = "white" {}
        _DetailTilingOffset("Detail Tiling Offset", Vector) = (1, 1, 0, 0)
        _DetailAlbedoScale("Detail Albedo Scale", Range(0, 2)) = 0
        _DetailNormalScale("Detail Normal Scale", Range(0, 2)) = 0
        _DetailSmoothnessScale("Detail Smoothness Scale", Range(0, 2)) = 0
        _WetColor("Wet Color Vertex(R)", Color) = (0.7735849, 0.7735849, 0.7735849, 0)
        _WetSmoothness("Wet Smoothness Vertex(R)", Range(0, 1)) = 1
        [Toggle]_USEDYNAMICCOVERTSTATICMASKF("Use Dynamic Cover (T) Static Mask (F)", Float) = 1
        [HideInInspector]_WorkflowMode("_WorkflowMode", Float) = 1
        [HideInInspector]_CastShadows("_CastShadows", Float) = 1
        [HideInInspector]_ReceiveShadows("_ReceiveShadows", Float) = 1
        [HideInInspector]_Surface("_Surface", Float) = 0
        [HideInInspector]_Blend("_Blend", Float) = 0
        [HideInInspector]_AlphaClip("_AlphaClip", Float) = 1
        [HideInInspector]_BlendModePreserveSpecular("_BlendModePreserveSpecular", Float) = 0
        [HideInInspector]_SrcBlend("_SrcBlend", Float) = 1
        [HideInInspector]_DstBlend("_DstBlend", Float) = 0
        [HideInInspector][ToggleUI]_ZWrite("_ZWrite", Float) = 1
        [HideInInspector]_ZWriteControl("_ZWriteControl", Float) = 0
        [HideInInspector]_ZTest("_ZTest", Float) = 4
        [HideInInspector]_Cull("_Cull", Float) = 2
        [HideInInspector]_AlphaToMask("_AlphaToMask", Float) = 1
        [HideInInspector]_QueueOffset("_QueueOffset", Float) = 0
        [HideInInspector]_QueueControl("_QueueControl", Float) = -1
        [HideInInspector][NoScaleOffset]unity_Lightmaps("unity_Lightmaps", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset]unity_LightmapsInd("unity_LightmapsInd", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset]unity_ShadowMasks("unity_ShadowMasks", 2DArray) = "" {}
    }
    SubShader
    {
        Tags
        {
            "RenderPipeline"="UniversalPipeline"
            "RenderType"="Opaque"
            "UniversalMaterialType" = "Lit"
            "Queue"="AlphaTest"
            "DisableBatching"="LODFading"
            "ShaderGraphShader"="true"
            "ShaderGraphTargetId"="UniversalLitSubTarget"
        }
        Pass
        {
            Name "Universal Forward"
            Tags
            {
                "LightMode" = "UniversalForward"
            }
        
        // Render State
        Cull [_Cull]
        Blend [_SrcBlend] [_DstBlend]
        ZTest [_ZTest]
        ZWrite [_ZWrite]
        AlphaToMask [_AlphaToMask]
        
        // Debug
        // <None>
        
        // --------------------------------------------------
        // Pass
        
        HLSLPROGRAM
        
        // Pragmas
        #pragma target 2.0
        #pragma multi_compile_instancing
        #pragma multi_compile_fog
        #pragma instancing_options renderinglayer
        #pragma vertex vert
        #pragma fragment frag
        
        // Keywords
        #pragma multi_compile_fragment _ _SCREEN_SPACE_OCCLUSION
        #pragma multi_compile _ LIGHTMAP_ON
        #pragma multi_compile _ DYNAMICLIGHTMAP_ON
        #pragma multi_compile _ DIRLIGHTMAP_COMBINED
        #pragma multi_compile _ USE_LEGACY_LIGHTMAPS
        #pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN
        #pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
        #pragma multi_compile_fragment _ _ADDITIONAL_LIGHT_SHADOWS
        #pragma multi_compile_fragment _ _REFLECTION_PROBE_BLENDING
        #pragma multi_compile_fragment _ _REFLECTION_PROBE_BOX_PROJECTION
        #pragma multi_compile_fragment _ _SHADOWS_SOFT _SHADOWS_SOFT_LOW _SHADOWS_SOFT_MEDIUM _SHADOWS_SOFT_HIGH
        #pragma multi_compile _ LIGHTMAP_SHADOW_MIXING
        #pragma multi_compile _ SHADOWS_SHADOWMASK
        #pragma multi_compile_fragment _ _DBUFFER_MRT1 _DBUFFER_MRT2 _DBUFFER_MRT3
        #pragma multi_compile_fragment _ _LIGHT_LAYERS
        #pragma multi_compile_fragment _ DEBUG_DISPLAY
        #pragma multi_compile_fragment _ _LIGHT_COOKIES
        #pragma multi_compile _ _FORWARD_PLUS
        #pragma multi_compile _ EVALUATE_SH_MIXED EVALUATE_SH_VERTEX
        #pragma shader_feature_fragment _ _SURFACE_TYPE_TRANSPARENT
        #pragma shader_feature_local_fragment _ _ALPHAPREMULTIPLY_ON
        #pragma shader_feature_local_fragment _ _ALPHAMODULATE_ON
        #pragma shader_feature_local_fragment _ _ALPHATEST_ON
        #pragma shader_feature_local_fragment _ _SPECULAR_SETUP
        #pragma shader_feature_local _ _RECEIVE_SHADOWS_OFF
        #pragma multi_compile _ LOD_FADE_CROSSFADE
        #pragma shader_feature_local _ _USEDYNAMICCOVERTSTATICMASKF_ON
        
        #if defined(_USEDYNAMICCOVERTSTATICMASKF_ON)
            #define KEYWORD_PERMUTATION_0
        #else
            #define KEYWORD_PERMUTATION_1
        #endif
        
        
        // Defines
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define _NORMALMAP 1
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define _NORMAL_DROPOFF_TS 1
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_NORMAL
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_TANGENT
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_TEXCOORD0
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_TEXCOORD1
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_TEXCOORD2
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_COLOR
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define FEATURES_GRAPH_VERTEX_NORMAL_OUTPUT
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define FEATURES_GRAPH_VERTEX_TANGENT_OUTPUT
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_POSITION_WS
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_NORMAL_WS
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_TANGENT_WS
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_TEXCOORD0
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_TEXCOORD2
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_COLOR
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_FOG_AND_VERTEX_LIGHT
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_SHADOW_COORD
        #endif
        
        #define FEATURES_GRAPH_VERTEX
        /* WARNING: $splice Could not find named fragment 'PassInstancing' */
        #define SHADERPASS SHADERPASS_FORWARD
        #define _FOG_FRAGMENT 1
        #define USE_UNITY_CROSSFADE 1
        
        
        // custom interpolator pre-include
        /* WARNING: $splice Could not find named fragment 'sgci_CustomInterpolatorPreInclude' */
        
        // Includes
        #include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
        #include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/RenderingLayers.hlsl"
        #include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ProbeVolumeVariants.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
        #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Shadows.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DBuffer.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
        
        // --------------------------------------------------
        // Structs and Packing
        
        // custom interpolators pre packing
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPrePacking' */
        
        struct Attributes
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 positionOS : POSITION;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 normalOS : NORMAL;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 tangentOS : TANGENT;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv0 : TEXCOORD0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv1 : TEXCOORD1;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv2 : TEXCOORD2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 color : COLOR;
            #endif
            #if UNITY_ANY_INSTANCING_ENABLED || defined(ATTRIBUTES_NEED_INSTANCEID)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint instanceID : INSTANCEID_SEMANTIC;
            #endif
            #endif
        };
        struct Varyings
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 positionCS : SV_POSITION;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 positionWS;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 normalWS;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 tangentWS;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 color;
            #endif
            #if defined(LIGHTMAP_ON)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float2 staticLightmapUV;
            #endif
            #endif
            #if defined(DYNAMICLIGHTMAP_ON)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float2 dynamicLightmapUV;
            #endif
            #endif
            #if !defined(LIGHTMAP_ON)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 sh;
            #endif
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 fogFactorAndVertexLight;
            #endif
            #if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 shadowCoord;
            #endif
            #endif
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
            #endif
        };
        struct SurfaceDescriptionInputs
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 WorldSpaceNormal;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 TangentSpaceNormal;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 WorldSpaceTangent;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 WorldSpaceBiTangent;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 WorldSpacePosition;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 AbsoluteWorldSpacePosition;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 VertexColor;
            #endif
        };
        struct VertexDescriptionInputs
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 ObjectSpaceNormal;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 ObjectSpaceTangent;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 ObjectSpacePosition;
            #endif
        };
        struct PackedVaryings
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 positionCS : SV_POSITION;
            #endif
            #if defined(LIGHTMAP_ON)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float2 staticLightmapUV : INTERP0;
            #endif
            #endif
            #if defined(DYNAMICLIGHTMAP_ON)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float2 dynamicLightmapUV : INTERP1;
            #endif
            #endif
            #if !defined(LIGHTMAP_ON)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 sh : INTERP2;
            #endif
            #endif
            #if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 shadowCoord : INTERP3;
            #endif
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 tangentWS : INTERP4;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord0 : INTERP5;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord2 : INTERP6;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 color : INTERP7;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 fogFactorAndVertexLight : INTERP8;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 positionWS : INTERP9;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 normalWS : INTERP10;
            #endif
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
            #endif
        };
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        PackedVaryings PackVaryings (Varyings input)
        {
            PackedVaryings output;
            ZERO_INITIALIZE(PackedVaryings, output);
            output.positionCS = input.positionCS;
            #if defined(LIGHTMAP_ON)
            output.staticLightmapUV = input.staticLightmapUV;
            #endif
            #if defined(DYNAMICLIGHTMAP_ON)
            output.dynamicLightmapUV = input.dynamicLightmapUV;
            #endif
            #if !defined(LIGHTMAP_ON)
            output.sh = input.sh;
            #endif
            #if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
            output.shadowCoord = input.shadowCoord;
            #endif
            output.tangentWS.xyzw = input.tangentWS;
            output.texCoord0.xyzw = input.texCoord0;
            output.texCoord2.xyzw = input.texCoord2;
            output.color.xyzw = input.color;
            output.fogFactorAndVertexLight.xyzw = input.fogFactorAndVertexLight;
            output.positionWS.xyz = input.positionWS;
            output.normalWS.xyz = input.normalWS;
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        
        Varyings UnpackVaryings (PackedVaryings input)
        {
            Varyings output;
            output.positionCS = input.positionCS;
            #if defined(LIGHTMAP_ON)
            output.staticLightmapUV = input.staticLightmapUV;
            #endif
            #if defined(DYNAMICLIGHTMAP_ON)
            output.dynamicLightmapUV = input.dynamicLightmapUV;
            #endif
            #if !defined(LIGHTMAP_ON)
            output.sh = input.sh;
            #endif
            #if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
            output.shadowCoord = input.shadowCoord;
            #endif
            output.tangentWS = input.tangentWS.xyzw;
            output.texCoord0 = input.texCoord0.xyzw;
            output.texCoord2 = input.texCoord2.xyzw;
            output.color = input.color.xyzw;
            output.fogFactorAndVertexLight = input.fogFactorAndVertexLight.xyzw;
            output.positionWS = input.positionWS.xyz;
            output.normalWS = input.normalWS.xyz;
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        #endif
        
        // --------------------------------------------------
        // Graph
        
        // Graph Properties
        CBUFFER_START(UnityPerMaterial)
        float _AlphaCutoff;
        float4 _BaseColor;
        float4 _BaseColorMap_TexelSize;
        float _BaseUsePlanarUV;
        float4 _BaseTilingOffset;
        float4 _BaseNormalMap_TexelSize;
        float _BaseNormalScale;
        float4 _BaseMaskMap_TexelSize;
        float _BaseMetallic;
        float _BaseAORemapMin;
        float _BaseAORemapMax;
        float _BaseSmoothnessRemapMin;
        float _BaseSmoothnessRemapMax;
        float4 _CoverMaskA_TexelSize;
        float _CoverMaskPower;
        float _Cover_Amount;
        float _Cover_Amount_Grow_Speed;
        float3 _CoverDirection;
        float _Cover_Max_Angle;
        float _Cover_Min_Height;
        float _Cover_Min_Height_Blending;
        float4 _CoverBaseColor;
        float4 _CoverBaseColorMap_TexelSize;
        float4 _CoverTilingOffset;
        float _CoverTriplanarThreshold;
        float4 _CoverNormalMap_TexelSize;
        float _CoverNormalScale;
        float _CoverNormalBlendHardness;
        float _CoverHardness;
        float _CoverHeightMapMin;
        float _CoverHeightMapMax;
        float _CoverHeightMapOffset;
        float4 _CoverMaskMap_TexelSize;
        float _CoverMetallic;
        float _CoverAORemapMin;
        float _CoverAORemapMax;
        float _CoverSmoothnessRemapMin;
        float _CoverSmoothnessRemapMax;
        float4 _DetailMap_TexelSize;
        float4 _DetailTilingOffset;
        float _DetailAlbedoScale;
        float _DetailNormalScale;
        float _DetailSmoothnessScale;
        float4 _WetColor;
        float _WetSmoothness;
        UNITY_TEXTURE_STREAMING_DEBUG_VARS;
        CBUFFER_END
        
        
        // Object and Global properties
        SAMPLER(SamplerState_Linear_Repeat);
        SAMPLER(SamplerState_Linear_Repeat_Aniso8);
        TEXTURE2D(_BaseColorMap);
        SAMPLER(sampler_BaseColorMap);
        TEXTURE2D(_BaseNormalMap);
        SAMPLER(sampler_BaseNormalMap);
        TEXTURE2D(_BaseMaskMap);
        SAMPLER(sampler_BaseMaskMap);
        TEXTURE2D(_CoverMaskA);
        SAMPLER(sampler_CoverMaskA);
        TEXTURE2D(_CoverBaseColorMap);
        SAMPLER(sampler_CoverBaseColorMap);
        TEXTURE2D(_CoverNormalMap);
        SAMPLER(sampler_CoverNormalMap);
        TEXTURE2D(_CoverMaskMap);
        SAMPLER(sampler_CoverMaskMap);
        TEXTURE2D(_DetailMap);
        SAMPLER(sampler_DetailMap);
        
        // Graph Includes
        // GraphIncludes: <None>
        
        // -- Property used by ScenePickingPass
        #ifdef SCENEPICKINGPASS
        float4 _SelectionID;
        #endif
        
        // -- Properties used by SceneSelectionPass
        #ifdef SCENESELECTIONPASS
        int _ObjectId;
        int _PassValue;
        #endif
        
        // Graph Functions
        
        void Unity_Combine_float(float R, float G, float B, float A, out float4 RGBA, out float3 RGB, out float2 RG)
        {
            RGBA = float4(R, G, B, A);
            RGB = float3(R, G, B);
            RG = float2(R, G);
        }
        
        void Unity_Divide_float(float A, float B, out float Out)
        {
            Out = A / B;
        }
        
        void Unity_Multiply_float4_float4(float4 A, float4 B, out float4 Out)
        {
        Out = A * B;
        }
        
        void Unity_Branch_float4(float Predicate, float4 True, float4 False, out float4 Out)
        {
            Out = Predicate ? True : False;
        }
        
        void Unity_TilingAndOffset_float(float2 UV, float2 Tiling, float2 Offset, out float2 Out)
        {
            Out = UV * Tiling + Offset;
        }
        
        void Unity_Branch_float2(float Predicate, float2 True, float2 False, out float2 Out)
        {
            Out = Predicate ? True : False;
        }
        
        struct Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float
        {
        float3 AbsoluteWorldSpacePosition;
        half4 uv0;
        half4 uv2;
        };
        
        void SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(UnityTexture2D Texture2D_80A3D28F, float4 Vector4_2EBA7A3B, float Boolean_7ABB9909, UnitySamplerState _SamplerState, float Boolean_5ddfe6daabcc4715a44b5f34fc19becb, Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float IN, out float4 XZ_2)
        {
        UnityTexture2D _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D = Texture2D_80A3D28F;
        float _Property_30834f691775a0898a45b1c868520436_Out_0_Boolean = Boolean_7ABB9909;
        float _Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
        float _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
        float _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
        float _Split_89ed63cb625cb3878c183d0b71c03400_A_4_Float = 0;
        float4 _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4;
        float3 _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3;
        float2 _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, float(0), float(0), _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3, _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2);
        float4 _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4 = Vector4_2EBA7A3B;
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_R_1_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[0];
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_G_2_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[1];
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_B_3_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[2];
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_A_4_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[3];
        float _Divide_e64179199923c58289b6aa94ea6c9178_Out_2_Float;
        Unity_Divide_float(float(1), _Split_2f0f52f6ef8c0e81af0da6476402bc1f_R_1_Float, _Divide_e64179199923c58289b6aa94ea6c9178_Out_2_Float);
        float4 _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, (_Divide_e64179199923c58289b6aa94ea6c9178_Out_2_Float.xxxx), _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4);
        float _Property_f17c7bf877e64b6abdd66b1fe9f5accc_Out_0_Boolean = Boolean_5ddfe6daabcc4715a44b5f34fc19becb;
        float4 _UV_029e8e8198564838b9389b902a09fb22_Out_0_Vector4 = IN.uv0;
        float4 _UV_7a6209af1506424fb75c81e87e42035a_Out_0_Vector4 = IN.uv2;
        float4 _Branch_fc37bb4bf641457cbbc6e290603056ff_Out_3_Vector4;
        Unity_Branch_float4(_Property_f17c7bf877e64b6abdd66b1fe9f5accc_Out_0_Boolean, _UV_029e8e8198564838b9389b902a09fb22_Out_0_Vector4, _UV_7a6209af1506424fb75c81e87e42035a_Out_0_Vector4, _Branch_fc37bb4bf641457cbbc6e290603056ff_Out_3_Vector4);
        float2 _Vector2_16c15d3bbdd14b85bd48e3a6cb318af7_Out_0_Vector2 = float2(_Split_2f0f52f6ef8c0e81af0da6476402bc1f_R_1_Float, _Split_2f0f52f6ef8c0e81af0da6476402bc1f_G_2_Float);
        float2 _Vector2_f8d75f54e7705083bbec539a60185577_Out_0_Vector2 = float2(_Split_2f0f52f6ef8c0e81af0da6476402bc1f_B_3_Float, _Split_2f0f52f6ef8c0e81af0da6476402bc1f_A_4_Float);
        float2 _TilingAndOffset_d91e2d25acd34686b562b7fe7e9d1d27_Out_3_Vector2;
        Unity_TilingAndOffset_float((_Branch_fc37bb4bf641457cbbc6e290603056ff_Out_3_Vector4.xy), _Vector2_16c15d3bbdd14b85bd48e3a6cb318af7_Out_0_Vector2, _Vector2_f8d75f54e7705083bbec539a60185577_Out_0_Vector2, _TilingAndOffset_d91e2d25acd34686b562b7fe7e9d1d27_Out_3_Vector2);
        float2 _Branch_8e5a4e8f4d52fc8aadd1f46485afc933_Out_3_Vector2;
        Unity_Branch_float2(_Property_30834f691775a0898a45b1c868520436_Out_0_Boolean, (_Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4.xy), _TilingAndOffset_d91e2d25acd34686b562b7fe7e9d1d27_Out_3_Vector2, _Branch_8e5a4e8f4d52fc8aadd1f46485afc933_Out_3_Vector2);
        UnitySamplerState _Property_e8746b9475c94530ba35ba8019ad2ae0_Out_0_SamplerState = _SamplerState;
        float4 _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, _Property_e8746b9475c94530ba35ba8019ad2ae0_Out_0_SamplerState.samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Branch_8e5a4e8f4d52fc8aadd1f46485afc933_Out_3_Vector2) );
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.r;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.g;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.b;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_A_7_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.a;
        XZ_2 = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4;
        }
        
        void Unity_Multiply_float_float(float A, float B, out float Out)
        {
            Out = A * B;
        }
        
        void Unity_Add_float(float A, float B, out float Out)
        {
            Out = A + B;
        }
        
        void Unity_Saturate_float(float In, out float Out)
        {
            Out = saturate(In);
        }
        
        void Unity_Absolute_float(float In, out float Out)
        {
            Out = abs(In);
        }
        
        void Unity_SquareRoot_float4(float4 In, out float4 Out)
        {
            Out = sqrt(In);
        }
        
        void Unity_Sign_float(float In, out float Out)
        {
            Out = sign(In);
        }
        
        void Unity_Ceiling_float(float In, out float Out)
        {
            Out = ceil(In);
        }
        
        void Unity_Lerp_float4(float4 A, float4 B, float4 T, out float4 Out)
        {
            Out = lerp(A, B, T);
        }
        
        struct Bindings_BlendOverlayBaseColor_acdb3dfca72bd6b42bbc35f4613331a2_float
        {
        };
        
        void SG_BlendOverlayBaseColor_acdb3dfca72bd6b42bbc35f4613331a2_float(float4 Color_9AA111D3, float Vector1_FBE622A2, float Vector1_8C15C351, Bindings_BlendOverlayBaseColor_acdb3dfca72bd6b42bbc35f4613331a2_float IN, out float3 OutVector4_1)
        {
        float4 _Property_012510d774fb7f8b860f5270dca4500f_Out_0_Vector4 = Color_9AA111D3;
        float4 _SquareRoot_c2c57d0223a9538aa9240890c3cacb0c_Out_1_Vector4;
        Unity_SquareRoot_float4(_Property_012510d774fb7f8b860f5270dca4500f_Out_0_Vector4, _SquareRoot_c2c57d0223a9538aa9240890c3cacb0c_Out_1_Vector4);
        float _Property_a00e29241d12f983b30177515b367ec9_Out_0_Float = Vector1_FBE622A2;
        float _Sign_343a45ede7349283a681c6bd9998fd8e_Out_1_Float;
        Unity_Sign_float(_Property_a00e29241d12f983b30177515b367ec9_Out_0_Float, _Sign_343a45ede7349283a681c6bd9998fd8e_Out_1_Float);
        float _Add_681019b8f5d3d68bb482d419c9fc61a9_Out_2_Float;
        Unity_Add_float(_Sign_343a45ede7349283a681c6bd9998fd8e_Out_1_Float, float(1), _Add_681019b8f5d3d68bb482d419c9fc61a9_Out_2_Float);
        float _Multiply_e8f4cb722712a880ac0db6c7461427f7_Out_2_Float;
        Unity_Multiply_float_float(_Add_681019b8f5d3d68bb482d419c9fc61a9_Out_2_Float, 0.5, _Multiply_e8f4cb722712a880ac0db6c7461427f7_Out_2_Float);
        float _Ceiling_95ad15988aa9b98184875fa754feae01_Out_1_Float;
        Unity_Ceiling_float(_Multiply_e8f4cb722712a880ac0db6c7461427f7_Out_2_Float, _Ceiling_95ad15988aa9b98184875fa754feae01_Out_1_Float);
        float _Property_2db1c747a05ee284a8b00076062f91a4_Out_0_Float = Vector1_8C15C351;
        float _Multiply_9564ecda5193bc8286d9ff771c9226cd_Out_2_Float;
        Unity_Multiply_float_float(_Property_2db1c747a05ee284a8b00076062f91a4_Out_0_Float, _Property_2db1c747a05ee284a8b00076062f91a4_Out_0_Float, _Multiply_9564ecda5193bc8286d9ff771c9226cd_Out_2_Float);
        float4 _Lerp_b3cdb01fc3c5b988ac9b184943bf7c01_Out_3_Vector4;
        Unity_Lerp_float4(_SquareRoot_c2c57d0223a9538aa9240890c3cacb0c_Out_1_Vector4, (_Ceiling_95ad15988aa9b98184875fa754feae01_Out_1_Float.xxxx), (_Multiply_9564ecda5193bc8286d9ff771c9226cd_Out_2_Float.xxxx), _Lerp_b3cdb01fc3c5b988ac9b184943bf7c01_Out_3_Vector4);
        float4 _Multiply_39d1daff98488f8ea2cd794ad4f20926_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Lerp_b3cdb01fc3c5b988ac9b184943bf7c01_Out_3_Vector4, _Lerp_b3cdb01fc3c5b988ac9b184943bf7c01_Out_3_Vector4, _Multiply_39d1daff98488f8ea2cd794ad4f20926_Out_2_Vector4);
        OutVector4_1 = (_Multiply_39d1daff98488f8ea2cd794ad4f20926_Out_2_Vector4.xyz);
        }
        
        void Unity_Divide_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A / B;
        }
        
        void Unity_Sign_float3(float3 In, out float3 Out)
        {
            Out = sign(In);
        }
        
        void Unity_Multiply_float2_float2(float2 A, float2 B, out float2 Out)
        {
        Out = A * B;
        }
        
        void Unity_Absolute_float3(float3 In, out float3 Out)
        {
            Out = abs(In);
        }
        
        void Unity_Power_float3(float3 A, float3 B, out float3 Out)
        {
            Out = pow(A, B);
        }
        
        void Unity_Multiply_float3_float3(float3 A, float3 B, out float3 Out)
        {
        Out = A * B;
        }
        
        void Unity_Add_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A + B;
        }
        
        struct Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float
        {
        float3 WorldSpaceNormal;
        float3 AbsoluteWorldSpacePosition;
        };
        
        void SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(UnityTexture2D Texture2D_80A3D28F, float Vector1_41461AC9, float Vector1_E4D1C13A, Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float IN, out float4 XYZ_1, out float4 XZ_2, out float4 YZ_3, out float4 XY_4)
        {
        UnityTexture2D _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D = Texture2D_80A3D28F;
        float _Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
        float _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
        float _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
        float _Split_89ed63cb625cb3878c183d0b71c03400_A_4_Float = 0;
        float4 _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4;
        float3 _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3;
        float2 _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, float(0), float(0), _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3, _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2);
        float _Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float = Vector1_41461AC9;
        float4 _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, (_Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float.xxxx), _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4);
        float3 _Sign_b826e0ff2d95ec8cb2b2cbbd7ea2eab6_Out_1_Vector3;
        Unity_Sign_float3(IN.WorldSpaceNormal, _Sign_b826e0ff2d95ec8cb2b2cbbd7ea2eab6_Out_1_Vector3);
        float _Split_742547a7039de986a646d04c157ae549_R_1_Float = _Sign_b826e0ff2d95ec8cb2b2cbbd7ea2eab6_Out_1_Vector3[0];
        float _Split_742547a7039de986a646d04c157ae549_G_2_Float = _Sign_b826e0ff2d95ec8cb2b2cbbd7ea2eab6_Out_1_Vector3[1];
        float _Split_742547a7039de986a646d04c157ae549_B_3_Float = _Sign_b826e0ff2d95ec8cb2b2cbbd7ea2eab6_Out_1_Vector3[2];
        float _Split_742547a7039de986a646d04c157ae549_A_4_Float = 0;
        float2 _Vector2_40a8919e571ec18499de72022c155b38_Out_0_Vector2 = float2(_Split_742547a7039de986a646d04c157ae549_G_2_Float, float(1));
        float2 _Multiply_5fa32af59cdca88389832336b2268bd5_Out_2_Vector2;
        Unity_Multiply_float2_float2((_Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4.xy), _Vector2_40a8919e571ec18499de72022c155b38_Out_0_Vector2, _Multiply_5fa32af59cdca88389832336b2268bd5_Out_2_Vector2);
        float4 _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Multiply_5fa32af59cdca88389832336b2268bd5_Out_2_Vector2) );
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.r;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.g;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.b;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_A_7_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.a;
        float3 _Absolute_644b798714827680b39bf5d34f70385f_Out_1_Vector3;
        Unity_Absolute_float3(IN.WorldSpaceNormal, _Absolute_644b798714827680b39bf5d34f70385f_Out_1_Vector3);
        float _Property_adc4c59482221c8aad681c6558728ac9_Out_0_Float = Vector1_E4D1C13A;
        float3 _Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3;
        Unity_Power_float3(_Absolute_644b798714827680b39bf5d34f70385f_Out_1_Vector3, (_Property_adc4c59482221c8aad681c6558728ac9_Out_0_Float.xxx), _Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3);
        float3 _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3, _Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3, _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3);
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_R_1_Float = _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3[0];
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_G_2_Float = _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3[1];
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_B_3_Float = _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3[2];
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_A_4_Float = 0;
        float4 _Multiply_2e1040ca9c98d085ace76ee93f094039_Out_2_Vector4;
        Unity_Multiply_float4_float4(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4, (_Split_ae83014fcbd9f7879a0b91fa66dc9718_G_2_Float.xxxx), _Multiply_2e1040ca9c98d085ace76ee93f094039_Out_2_Vector4);
        float4 _Combine_192c2c4a69be588b90ca005a32e22552_RGBA_4_Vector4;
        float3 _Combine_192c2c4a69be588b90ca005a32e22552_RGB_5_Vector3;
        float2 _Combine_192c2c4a69be588b90ca005a32e22552_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float, float(0), float(0), _Combine_192c2c4a69be588b90ca005a32e22552_RGBA_4_Vector4, _Combine_192c2c4a69be588b90ca005a32e22552_RGB_5_Vector3, _Combine_192c2c4a69be588b90ca005a32e22552_RG_6_Vector2);
        float4 _Multiply_138240d0d4846e87b0febabec0d6891b_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_192c2c4a69be588b90ca005a32e22552_RGBA_4_Vector4, (_Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float.xxxx), _Multiply_138240d0d4846e87b0febabec0d6891b_Out_2_Vector4);
        float _Multiply_014402ded5a3988a8c18ba07636ea5a7_Out_2_Float;
        Unity_Multiply_float_float(_Split_742547a7039de986a646d04c157ae549_B_3_Float, -1, _Multiply_014402ded5a3988a8c18ba07636ea5a7_Out_2_Float);
        float2 _Vector2_caa25d55d456a58982bdfc39b1b43f3f_Out_0_Vector2 = float2(_Multiply_014402ded5a3988a8c18ba07636ea5a7_Out_2_Float, float(1));
        float2 _Multiply_a67201b6e1a0a28c98cd9d06e8b09543_Out_2_Vector2;
        Unity_Multiply_float2_float2((_Multiply_138240d0d4846e87b0febabec0d6891b_Out_2_Vector4.xy), _Vector2_caa25d55d456a58982bdfc39b1b43f3f_Out_0_Vector2, _Multiply_a67201b6e1a0a28c98cd9d06e8b09543_Out_2_Vector2);
        float4 _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Multiply_a67201b6e1a0a28c98cd9d06e8b09543_Out_2_Vector2) );
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_R_4_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.r;
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_G_5_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.g;
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_B_6_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.b;
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_A_7_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.a;
        float4 _Multiply_7bb4009c92b108849ac6ca92bc1442f2_Out_2_Vector4;
        Unity_Multiply_float4_float4(_SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4, (_Split_ae83014fcbd9f7879a0b91fa66dc9718_B_3_Float.xxxx), _Multiply_7bb4009c92b108849ac6ca92bc1442f2_Out_2_Vector4);
        float4 _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGBA_4_Vector4;
        float3 _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGB_5_Vector3;
        float2 _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float, float(0), float(0), _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGBA_4_Vector4, _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGB_5_Vector3, _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RG_6_Vector2);
        float4 _Multiply_2c0864423b014f8b8af8523f68cbb63c_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGBA_4_Vector4, (_Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float.xxxx), _Multiply_2c0864423b014f8b8af8523f68cbb63c_Out_2_Vector4);
        float2 _Vector2_54dfd40df2fc78809955dd272f2cf0c3_Out_0_Vector2 = float2(_Split_742547a7039de986a646d04c157ae549_R_1_Float, float(1));
        float2 _Multiply_addbd5fcede95f80bbb806c94e49ef63_Out_2_Vector2;
        Unity_Multiply_float2_float2((_Multiply_2c0864423b014f8b8af8523f68cbb63c_Out_2_Vector4.xy), _Vector2_54dfd40df2fc78809955dd272f2cf0c3_Out_0_Vector2, _Multiply_addbd5fcede95f80bbb806c94e49ef63_Out_2_Vector2);
        float4 _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Multiply_addbd5fcede95f80bbb806c94e49ef63_Out_2_Vector2) );
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_R_4_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.r;
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_G_5_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.g;
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_B_6_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.b;
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_A_7_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.a;
        float4 _Multiply_77818c22e359fc8cbb7dd20216a8db72_Out_2_Vector4;
        Unity_Multiply_float4_float4(_SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4, (_Split_ae83014fcbd9f7879a0b91fa66dc9718_R_1_Float.xxxx), _Multiply_77818c22e359fc8cbb7dd20216a8db72_Out_2_Vector4);
        float4 _Add_769d9ee909c9238dbbf72d2800a2f268_Out_2_Vector4;
        Unity_Add_float4(_Multiply_7bb4009c92b108849ac6ca92bc1442f2_Out_2_Vector4, _Multiply_77818c22e359fc8cbb7dd20216a8db72_Out_2_Vector4, _Add_769d9ee909c9238dbbf72d2800a2f268_Out_2_Vector4);
        float4 _Add_14295f72880e4b87a1baf1ced943ac40_Out_2_Vector4;
        Unity_Add_float4(_Multiply_2e1040ca9c98d085ace76ee93f094039_Out_2_Vector4, _Add_769d9ee909c9238dbbf72d2800a2f268_Out_2_Vector4, _Add_14295f72880e4b87a1baf1ced943ac40_Out_2_Vector4);
        float _Add_e59af300bba2498db32eac1412123447_Out_2_Float;
        Unity_Add_float(_Split_ae83014fcbd9f7879a0b91fa66dc9718_R_1_Float, _Split_ae83014fcbd9f7879a0b91fa66dc9718_G_2_Float, _Add_e59af300bba2498db32eac1412123447_Out_2_Float);
        float _Add_e855069f047fae8ea9027d56acb61e56_Out_2_Float;
        Unity_Add_float(_Add_e59af300bba2498db32eac1412123447_Out_2_Float, _Split_ae83014fcbd9f7879a0b91fa66dc9718_B_3_Float, _Add_e855069f047fae8ea9027d56acb61e56_Out_2_Float);
        float4 _Divide_91ae4b94f1d9b78e99d0472293b8098c_Out_2_Vector4;
        Unity_Divide_float4(_Add_14295f72880e4b87a1baf1ced943ac40_Out_2_Vector4, (_Add_e855069f047fae8ea9027d56acb61e56_Out_2_Float.xxxx), _Divide_91ae4b94f1d9b78e99d0472293b8098c_Out_2_Vector4);
        XYZ_1 = _Divide_91ae4b94f1d9b78e99d0472293b8098c_Out_2_Vector4;
        XZ_2 = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4;
        YZ_3 = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4;
        XY_4 = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4;
        }
        
        void Unity_Clamp_float(float In, float Min, float Max, out float Out)
        {
            Out = clamp(In, Min, Max);
        }
        
        void Unity_Add_float2(float2 A, float2 B, out float2 Out)
        {
            Out = A + B;
        }
        
        void Unity_DotProduct_float2(float2 A, float2 B, out float Out)
        {
            Out = dot(A, B);
        }
        
        void Unity_OneMinus_float(float In, out float Out)
        {
            Out = 1 - In;
        }
        
        void Unity_SquareRoot_float(float In, out float Out)
        {
            Out = sqrt(In);
        }
        
        void Unity_Clamp_float3(float3 In, float3 Min, float3 Max, out float3 Out)
        {
            Out = clamp(In, Min, Max);
        }
        
        void Unity_Normalize_float3(float3 In, out float3 Out)
        {
            Out = normalize(In);
        }
        
        void Unity_Branch_float3(float Predicate, float3 True, float3 False, out float3 Out)
        {
            Out = Predicate ? True : False;
        }
        
        struct Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float
        {
        float3 WorldSpaceNormal;
        float3 WorldSpaceTangent;
        float3 WorldSpaceBiTangent;
        float3 AbsoluteWorldSpacePosition;
        half4 uv0;
        half4 uv2;
        };
        
        void SG_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float(UnityTexture2D Texture2D_80A3D28F, float4 Vector4_82674548, float Boolean_9FF42DF6, UnitySamplerState _SamplerState, float Boolean_5ddfe6daabcc4715a44b5f34fc19becb, Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float IN, out float4 XZ_2)
        {
        float _Property_1ef12cf3201a938993fe6a7951b0e754_Out_0_Boolean = Boolean_9FF42DF6;
        UnityTexture2D _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D = Texture2D_80A3D28F;
        float _Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
        float _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
        float _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
        float _Split_89ed63cb625cb3878c183d0b71c03400_A_4_Float = 0;
        float4 _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4;
        float3 _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3;
        float2 _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, float(0), float(0), _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3, _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2);
        float4 _Property_3fa1d6f912feb481ba60f2e55e62e746_Out_0_Vector4 = Vector4_82674548;
        float _Split_a2e12fa5931da084b2949343a539dfd8_R_1_Float = _Property_3fa1d6f912feb481ba60f2e55e62e746_Out_0_Vector4[0];
        float _Split_a2e12fa5931da084b2949343a539dfd8_G_2_Float = _Property_3fa1d6f912feb481ba60f2e55e62e746_Out_0_Vector4[1];
        float _Split_a2e12fa5931da084b2949343a539dfd8_B_3_Float = _Property_3fa1d6f912feb481ba60f2e55e62e746_Out_0_Vector4[2];
        float _Split_a2e12fa5931da084b2949343a539dfd8_A_4_Float = _Property_3fa1d6f912feb481ba60f2e55e62e746_Out_0_Vector4[3];
        float _Divide_c36b770dfaa0bb8f85ab27da5fd794f0_Out_2_Float;
        Unity_Divide_float(float(1), _Split_a2e12fa5931da084b2949343a539dfd8_R_1_Float, _Divide_c36b770dfaa0bb8f85ab27da5fd794f0_Out_2_Float);
        float4 _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, (_Divide_c36b770dfaa0bb8f85ab27da5fd794f0_Out_2_Float.xxxx), _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4);
        float _Property_058f4fba88c3437288219f1929444bf2_Out_0_Boolean = Boolean_5ddfe6daabcc4715a44b5f34fc19becb;
        float4 _UV_43d85b3291324c848dfbeec6adac2a71_Out_0_Vector4 = IN.uv0;
        float4 _UV_36881dcaab9040168fc5215dcd00f352_Out_0_Vector4 = IN.uv2;
        float4 _Branch_8054d58a73be4ce1b22d48a84389ae07_Out_3_Vector4;
        Unity_Branch_float4(_Property_058f4fba88c3437288219f1929444bf2_Out_0_Boolean, _UV_43d85b3291324c848dfbeec6adac2a71_Out_0_Vector4, _UV_36881dcaab9040168fc5215dcd00f352_Out_0_Vector4, _Branch_8054d58a73be4ce1b22d48a84389ae07_Out_3_Vector4);
        float2 _Vector2_6845d21872714d889783b0cb707df3e9_Out_0_Vector2 = float2(_Split_a2e12fa5931da084b2949343a539dfd8_R_1_Float, _Split_a2e12fa5931da084b2949343a539dfd8_G_2_Float);
        float2 _Vector2_e2e2263627c6098e96a5b5d29350ad03_Out_0_Vector2 = float2(_Split_a2e12fa5931da084b2949343a539dfd8_B_3_Float, _Split_a2e12fa5931da084b2949343a539dfd8_A_4_Float);
        float2 _TilingAndOffset_17582d056c0b8a8dab1017d37497fe59_Out_3_Vector2;
        Unity_TilingAndOffset_float((_Branch_8054d58a73be4ce1b22d48a84389ae07_Out_3_Vector4.xy), _Vector2_6845d21872714d889783b0cb707df3e9_Out_0_Vector2, _Vector2_e2e2263627c6098e96a5b5d29350ad03_Out_0_Vector2, _TilingAndOffset_17582d056c0b8a8dab1017d37497fe59_Out_3_Vector2);
        float2 _Branch_1e152f3aac57448f8518bf2852c000c3_Out_3_Vector2;
        Unity_Branch_float2(_Property_1ef12cf3201a938993fe6a7951b0e754_Out_0_Boolean, (_Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4.xy), _TilingAndOffset_17582d056c0b8a8dab1017d37497fe59_Out_3_Vector2, _Branch_1e152f3aac57448f8518bf2852c000c3_Out_3_Vector2);
        UnitySamplerState _Property_69f1ed7efd1b494e91f626b88ab2363c_Out_0_SamplerState = _SamplerState;
        float4 _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, _Property_69f1ed7efd1b494e91f626b88ab2363c_Out_0_SamplerState.samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Branch_1e152f3aac57448f8518bf2852c000c3_Out_3_Vector2) );
        _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4);
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.r;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.g;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.b;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_A_7_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.a;
        float2 _Vector2_ad6bd100e273d78fa409a30a77bfa2cc_Out_0_Vector2 = float2(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float, _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float);
        float3 _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3;
        Unity_Sign_float3(IN.WorldSpaceNormal, _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3);
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_R_1_Float = _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3[0];
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_G_2_Float = _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3[1];
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_B_3_Float = _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3[2];
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_A_4_Float = 0;
        float2 _Vector2_b76cb1842101e58b9e636d49b075c612_Out_0_Vector2 = float2(_Split_6299d4ddcc4c74828aea40a46fdb896e_G_2_Float, float(1));
        float2 _Multiply_31e8db88ee20c985a9850d1a58f3282b_Out_2_Vector2;
        Unity_Multiply_float2_float2(_Vector2_ad6bd100e273d78fa409a30a77bfa2cc_Out_0_Vector2, _Vector2_b76cb1842101e58b9e636d49b075c612_Out_0_Vector2, _Multiply_31e8db88ee20c985a9850d1a58f3282b_Out_2_Vector2);
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_R_1_Float = IN.WorldSpaceNormal[0];
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_G_2_Float = IN.WorldSpaceNormal[1];
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_B_3_Float = IN.WorldSpaceNormal[2];
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_A_4_Float = 0;
        float2 _Vector2_70e5837843f28b8b9d64cada3697bd5a_Out_0_Vector2 = float2(_Split_5ed44bf2eca0868f81eb18100f49d1fa_R_1_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_B_3_Float);
        float2 _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2;
        Unity_Add_float2(_Multiply_31e8db88ee20c985a9850d1a58f3282b_Out_2_Vector2, _Vector2_70e5837843f28b8b9d64cada3697bd5a_Out_0_Vector2, _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2);
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_R_1_Float = _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2[0];
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_G_2_Float = _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2[1];
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_B_3_Float = 0;
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_A_4_Float = 0;
        float _Multiply_ab12aea87465a78eaf7fc66c2598d266_Out_2_Float;
        Unity_Multiply_float_float(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_G_2_Float, _Multiply_ab12aea87465a78eaf7fc66c2598d266_Out_2_Float);
        float3 _Vector3_433840b555db308b97e9b14b6a957195_Out_0_Vector3 = float3(_Split_2bc77ca2d17bd78cb2383770ce50b179_R_1_Float, _Multiply_ab12aea87465a78eaf7fc66c2598d266_Out_2_Float, _Split_2bc77ca2d17bd78cb2383770ce50b179_G_2_Float);
        float3 _Transform_c7914cc45a011c89b3f53c55afb51673_Out_1_Vector3;
        {
        float3x3 tangentTransform = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
        _Transform_c7914cc45a011c89b3f53c55afb51673_Out_1_Vector3 = TransformWorldToTangentDir(_Vector3_433840b555db308b97e9b14b6a957195_Out_0_Vector3.xyz, tangentTransform, true);
        }
        float3 _Clamp_3837949a36b5428a82af01e7bcd29952_Out_3_Vector3;
        Unity_Clamp_float3(_Transform_c7914cc45a011c89b3f53c55afb51673_Out_1_Vector3, float3(-1, -1, -1), float3(1, 1, 1), _Clamp_3837949a36b5428a82af01e7bcd29952_Out_3_Vector3);
        float3 _Normalize_09bf8a2bd0a4d38e8b97d5c674f79b44_Out_1_Vector3;
        Unity_Normalize_float3(_Clamp_3837949a36b5428a82af01e7bcd29952_Out_3_Vector3, _Normalize_09bf8a2bd0a4d38e8b97d5c674f79b44_Out_1_Vector3);
        float3 _Branch_9eadf909a90f2f80880f8c56ecc2a91f_Out_3_Vector3;
        Unity_Branch_float3(_Property_1ef12cf3201a938993fe6a7951b0e754_Out_0_Boolean, _Normalize_09bf8a2bd0a4d38e8b97d5c674f79b44_Out_1_Vector3, (_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.xyz), _Branch_9eadf909a90f2f80880f8c56ecc2a91f_Out_3_Vector3);
        XZ_2 = (float4(_Branch_9eadf909a90f2f80880f8c56ecc2a91f_Out_3_Vector3, 1.0));
        }
        
        void Unity_NormalStrength_float(float3 In, float Strength, out float3 Out)
        {
            Out = float3(In.rg * Strength, lerp(1, In.b, saturate(Strength)));
        }
        
        void Unity_NormalBlend_float(float3 A, float3 B, out float3 Out)
        {
            Out = SafeNormalize(float3(A.rg + B.rg, A.b * B.b));
        }
        
        void Unity_Add_float3(float3 A, float3 B, out float3 Out)
        {
            Out = A + B;
        }
        
        void Unity_Divide_float3(float3 A, float3 B, out float3 Out)
        {
            Out = A / B;
        }
        
        struct Bindings_TriplanarNMn_059da9746584140498cd018db3c76047_float
        {
        float3 WorldSpaceNormal;
        float3 WorldSpaceTangent;
        float3 WorldSpaceBiTangent;
        float3 WorldSpacePosition;
        };
        
        void SG_TriplanarNMn_059da9746584140498cd018db3c76047_float(UnityTexture2D Texture2D_80A3D28F, float Vector1_41461AC9, float Vector1_E4D1C13A, Bindings_TriplanarNMn_059da9746584140498cd018db3c76047_float IN, out float4 XYZ_1, out float4 XZ_2, out float4 YZ_3, out float4 XY_4)
        {
        UnityTexture2D _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D = Texture2D_80A3D28F;
        float _Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float = IN.WorldSpacePosition[0];
        float _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float = IN.WorldSpacePosition[1];
        float _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float = IN.WorldSpacePosition[2];
        float _Split_89ed63cb625cb3878c183d0b71c03400_A_4_Float = 0;
        float4 _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4;
        float3 _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3;
        float2 _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, float(0), float(0), _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3, _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2);
        float _Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float = Vector1_41461AC9;
        float4 _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, (_Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float.xxxx), _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4);
        float3 _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3;
        Unity_Sign_float3(IN.WorldSpaceNormal, _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3);
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_R_1_Float = _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3[0];
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_G_2_Float = _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3[1];
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_B_3_Float = _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3[2];
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_A_4_Float = 0;
        float2 _Vector2_b76cb1842101e58b9e636d49b075c612_Out_0_Vector2 = float2(_Split_6299d4ddcc4c74828aea40a46fdb896e_G_2_Float, float(1));
        float2 _Multiply_a87753ad90594382bf3a3a95abbadbc8_Out_2_Vector2;
        Unity_Multiply_float2_float2((_Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4.xy), _Vector2_b76cb1842101e58b9e636d49b075c612_Out_0_Vector2, _Multiply_a87753ad90594382bf3a3a95abbadbc8_Out_2_Vector2);
        float4 _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Multiply_a87753ad90594382bf3a3a95abbadbc8_Out_2_Vector2) );
        _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4);
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.r;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.g;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.b;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_A_7_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.a;
        float2 _Vector2_ad6bd100e273d78fa409a30a77bfa2cc_Out_0_Vector2 = float2(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float, _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float);
        float2 _Multiply_31e8db88ee20c985a9850d1a58f3282b_Out_2_Vector2;
        Unity_Multiply_float2_float2(_Vector2_ad6bd100e273d78fa409a30a77bfa2cc_Out_0_Vector2, _Vector2_b76cb1842101e58b9e636d49b075c612_Out_0_Vector2, _Multiply_31e8db88ee20c985a9850d1a58f3282b_Out_2_Vector2);
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_R_1_Float = IN.WorldSpaceNormal[0];
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_G_2_Float = IN.WorldSpaceNormal[1];
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_B_3_Float = IN.WorldSpaceNormal[2];
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_A_4_Float = 0;
        float2 _Vector2_70e5837843f28b8b9d64cada3697bd5a_Out_0_Vector2 = float2(_Split_5ed44bf2eca0868f81eb18100f49d1fa_R_1_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_B_3_Float);
        float2 _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2;
        Unity_Add_float2(_Multiply_31e8db88ee20c985a9850d1a58f3282b_Out_2_Vector2, _Vector2_70e5837843f28b8b9d64cada3697bd5a_Out_0_Vector2, _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2);
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_R_1_Float = _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2[0];
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_G_2_Float = _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2[1];
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_B_3_Float = 0;
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_A_4_Float = 0;
        float _Multiply_e4fe778b81456d819c52bb414cd95968_Out_2_Float;
        Unity_Multiply_float_float(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_G_2_Float, _Multiply_e4fe778b81456d819c52bb414cd95968_Out_2_Float);
        float3 _Vector3_08f62c5c01619e849f1a7d85a44531ac_Out_0_Vector3 = float3(_Split_2bc77ca2d17bd78cb2383770ce50b179_R_1_Float, _Multiply_e4fe778b81456d819c52bb414cd95968_Out_2_Float, _Split_2bc77ca2d17bd78cb2383770ce50b179_G_2_Float);
        float3 _Absolute_644b798714827680b39bf5d34f70385f_Out_1_Vector3;
        Unity_Absolute_float3(IN.WorldSpaceNormal, _Absolute_644b798714827680b39bf5d34f70385f_Out_1_Vector3);
        float _Property_adc4c59482221c8aad681c6558728ac9_Out_0_Float = Vector1_E4D1C13A;
        float3 _Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3;
        Unity_Power_float3(_Absolute_644b798714827680b39bf5d34f70385f_Out_1_Vector3, (_Property_adc4c59482221c8aad681c6558728ac9_Out_0_Float.xxx), _Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3);
        float3 _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3, _Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3, _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3);
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_R_1_Float = _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3[0];
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_G_2_Float = _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3[1];
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_B_3_Float = _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3[2];
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_A_4_Float = 0;
        float3 _Multiply_2e1040ca9c98d085ace76ee93f094039_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Vector3_08f62c5c01619e849f1a7d85a44531ac_Out_0_Vector3, (_Split_ae83014fcbd9f7879a0b91fa66dc9718_G_2_Float.xxx), _Multiply_2e1040ca9c98d085ace76ee93f094039_Out_2_Vector3);
        float4 _Combine_192c2c4a69be588b90ca005a32e22552_RGBA_4_Vector4;
        float3 _Combine_192c2c4a69be588b90ca005a32e22552_RGB_5_Vector3;
        float2 _Combine_192c2c4a69be588b90ca005a32e22552_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float, float(0), float(0), _Combine_192c2c4a69be588b90ca005a32e22552_RGBA_4_Vector4, _Combine_192c2c4a69be588b90ca005a32e22552_RGB_5_Vector3, _Combine_192c2c4a69be588b90ca005a32e22552_RG_6_Vector2);
        float4 _Multiply_138240d0d4846e87b0febabec0d6891b_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_192c2c4a69be588b90ca005a32e22552_RGBA_4_Vector4, (_Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float.xxxx), _Multiply_138240d0d4846e87b0febabec0d6891b_Out_2_Vector4);
        float _Multiply_de711f4a4614bd89a463b53374cf4036_Out_2_Float;
        Unity_Multiply_float_float(_Split_6299d4ddcc4c74828aea40a46fdb896e_B_3_Float, -1, _Multiply_de711f4a4614bd89a463b53374cf4036_Out_2_Float);
        float2 _Vector2_4ed33f0c73b2698fa6f3c1b77fe76808_Out_0_Vector2 = float2(_Multiply_de711f4a4614bd89a463b53374cf4036_Out_2_Float, float(1));
        float2 _Multiply_2af6058cc6ccb88caefd2799bb5941e8_Out_2_Vector2;
        Unity_Multiply_float2_float2((_Multiply_138240d0d4846e87b0febabec0d6891b_Out_2_Vector4.xy), _Vector2_4ed33f0c73b2698fa6f3c1b77fe76808_Out_0_Vector2, _Multiply_2af6058cc6ccb88caefd2799bb5941e8_Out_2_Vector2);
        float4 _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Multiply_2af6058cc6ccb88caefd2799bb5941e8_Out_2_Vector2) );
        _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4);
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_R_4_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.r;
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_G_5_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.g;
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_B_6_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.b;
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_A_7_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.a;
        float2 _Vector2_fe9aedd4528c7486ada4abdca0b0944e_Out_0_Vector2 = float2(_SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_R_4_Float, _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_G_5_Float);
        float2 _Multiply_02b9b4665ad9918d8721bcaddc82f06f_Out_2_Vector2;
        Unity_Multiply_float2_float2(_Vector2_fe9aedd4528c7486ada4abdca0b0944e_Out_0_Vector2, _Vector2_4ed33f0c73b2698fa6f3c1b77fe76808_Out_0_Vector2, _Multiply_02b9b4665ad9918d8721bcaddc82f06f_Out_2_Vector2);
        float2 _Vector2_a74a85274da15181abb63cc5e8df0de1_Out_0_Vector2 = float2(_Split_5ed44bf2eca0868f81eb18100f49d1fa_R_1_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_G_2_Float);
        float2 _Add_b227c84042055e8faa1a9fdc69529707_Out_2_Vector2;
        Unity_Add_float2(_Multiply_02b9b4665ad9918d8721bcaddc82f06f_Out_2_Vector2, _Vector2_a74a85274da15181abb63cc5e8df0de1_Out_0_Vector2, _Add_b227c84042055e8faa1a9fdc69529707_Out_2_Vector2);
        float _Split_2cfb9eacd8762483941459cdf28bda97_R_1_Float = _Add_b227c84042055e8faa1a9fdc69529707_Out_2_Vector2[0];
        float _Split_2cfb9eacd8762483941459cdf28bda97_G_2_Float = _Add_b227c84042055e8faa1a9fdc69529707_Out_2_Vector2[1];
        float _Split_2cfb9eacd8762483941459cdf28bda97_B_3_Float = 0;
        float _Split_2cfb9eacd8762483941459cdf28bda97_A_4_Float = 0;
        float _Multiply_1d65ce08ce672087879125f2e13c4004_Out_2_Float;
        Unity_Multiply_float_float(_SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_B_6_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_B_3_Float, _Multiply_1d65ce08ce672087879125f2e13c4004_Out_2_Float);
        float3 _Vector3_ba6cfb4671e8c58f9b41ea1dc23102ca_Out_0_Vector3 = float3(_Split_2cfb9eacd8762483941459cdf28bda97_R_1_Float, _Split_2cfb9eacd8762483941459cdf28bda97_G_2_Float, _Multiply_1d65ce08ce672087879125f2e13c4004_Out_2_Float);
        float3 _Multiply_7bb4009c92b108849ac6ca92bc1442f2_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Vector3_ba6cfb4671e8c58f9b41ea1dc23102ca_Out_0_Vector3, (_Split_ae83014fcbd9f7879a0b91fa66dc9718_B_3_Float.xxx), _Multiply_7bb4009c92b108849ac6ca92bc1442f2_Out_2_Vector3);
        float4 _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGBA_4_Vector4;
        float3 _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGB_5_Vector3;
        float2 _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float, float(0), float(0), _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGBA_4_Vector4, _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGB_5_Vector3, _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RG_6_Vector2);
        float4 _Multiply_2c0864423b014f8b8af8523f68cbb63c_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGBA_4_Vector4, (_Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float.xxxx), _Multiply_2c0864423b014f8b8af8523f68cbb63c_Out_2_Vector4);
        float2 _Vector2_a1e23e0f921b6484818f009a2b12a5ba_Out_0_Vector2 = float2(_Split_6299d4ddcc4c74828aea40a46fdb896e_R_1_Float, float(1));
        float2 _Multiply_862402885a49f18cb87278ab53bc6744_Out_2_Vector2;
        Unity_Multiply_float2_float2((_Multiply_2c0864423b014f8b8af8523f68cbb63c_Out_2_Vector4.xy), _Vector2_a1e23e0f921b6484818f009a2b12a5ba_Out_0_Vector2, _Multiply_862402885a49f18cb87278ab53bc6744_Out_2_Vector2);
        float4 _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Multiply_862402885a49f18cb87278ab53bc6744_Out_2_Vector2) );
        _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4);
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_R_4_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.r;
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_G_5_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.g;
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_B_6_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.b;
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_A_7_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.a;
        float _Multiply_4649b768be76d784a3284bacde795359_Out_2_Float;
        Unity_Multiply_float_float(_SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_B_6_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_R_1_Float, _Multiply_4649b768be76d784a3284bacde795359_Out_2_Float);
        float2 _Vector2_819fcd5eb484438eacad1987576d7d67_Out_0_Vector2 = float2(_SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_R_4_Float, _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_G_5_Float);
        float2 _Multiply_58530ebb3c6d798b93686a76247bf505_Out_2_Vector2;
        Unity_Multiply_float2_float2(_Vector2_819fcd5eb484438eacad1987576d7d67_Out_0_Vector2, _Vector2_a1e23e0f921b6484818f009a2b12a5ba_Out_0_Vector2, _Multiply_58530ebb3c6d798b93686a76247bf505_Out_2_Vector2);
        float2 _Vector2_e293c112b2f49e88a5fe46dfb1fbeb40_Out_0_Vector2 = float2(_Split_5ed44bf2eca0868f81eb18100f49d1fa_B_3_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_G_2_Float);
        float2 _Add_cf00fb232c6e2b8e973ab2f84453f55e_Out_2_Vector2;
        Unity_Add_float2(_Multiply_58530ebb3c6d798b93686a76247bf505_Out_2_Vector2, _Vector2_e293c112b2f49e88a5fe46dfb1fbeb40_Out_0_Vector2, _Add_cf00fb232c6e2b8e973ab2f84453f55e_Out_2_Vector2);
        float _Split_3ea3e61d32bdd78f82c686b75ff3fd9b_R_1_Float = _Add_cf00fb232c6e2b8e973ab2f84453f55e_Out_2_Vector2[0];
        float _Split_3ea3e61d32bdd78f82c686b75ff3fd9b_G_2_Float = _Add_cf00fb232c6e2b8e973ab2f84453f55e_Out_2_Vector2[1];
        float _Split_3ea3e61d32bdd78f82c686b75ff3fd9b_B_3_Float = 0;
        float _Split_3ea3e61d32bdd78f82c686b75ff3fd9b_A_4_Float = 0;
        float3 _Vector3_13a08d5940172a84a78ee3d9b8766833_Out_0_Vector3 = float3(_Multiply_4649b768be76d784a3284bacde795359_Out_2_Float, _Split_3ea3e61d32bdd78f82c686b75ff3fd9b_G_2_Float, _Split_3ea3e61d32bdd78f82c686b75ff3fd9b_R_1_Float);
        float3 _Multiply_77818c22e359fc8cbb7dd20216a8db72_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Vector3_13a08d5940172a84a78ee3d9b8766833_Out_0_Vector3, (_Split_ae83014fcbd9f7879a0b91fa66dc9718_R_1_Float.xxx), _Multiply_77818c22e359fc8cbb7dd20216a8db72_Out_2_Vector3);
        float3 _Add_769d9ee909c9238dbbf72d2800a2f268_Out_2_Vector3;
        Unity_Add_float3(_Multiply_7bb4009c92b108849ac6ca92bc1442f2_Out_2_Vector3, _Multiply_77818c22e359fc8cbb7dd20216a8db72_Out_2_Vector3, _Add_769d9ee909c9238dbbf72d2800a2f268_Out_2_Vector3);
        float3 _Add_14295f72880e4b87a1baf1ced943ac40_Out_2_Vector3;
        Unity_Add_float3(_Multiply_2e1040ca9c98d085ace76ee93f094039_Out_2_Vector3, _Add_769d9ee909c9238dbbf72d2800a2f268_Out_2_Vector3, _Add_14295f72880e4b87a1baf1ced943ac40_Out_2_Vector3);
        float _Add_e59af300bba2498db32eac1412123447_Out_2_Float;
        Unity_Add_float(_Split_ae83014fcbd9f7879a0b91fa66dc9718_R_1_Float, _Split_ae83014fcbd9f7879a0b91fa66dc9718_G_2_Float, _Add_e59af300bba2498db32eac1412123447_Out_2_Float);
        float _Add_e855069f047fae8ea9027d56acb61e56_Out_2_Float;
        Unity_Add_float(_Add_e59af300bba2498db32eac1412123447_Out_2_Float, _Split_ae83014fcbd9f7879a0b91fa66dc9718_B_3_Float, _Add_e855069f047fae8ea9027d56acb61e56_Out_2_Float);
        float3 _Divide_91ae4b94f1d9b78e99d0472293b8098c_Out_2_Vector3;
        Unity_Divide_float3(_Add_14295f72880e4b87a1baf1ced943ac40_Out_2_Vector3, (_Add_e855069f047fae8ea9027d56acb61e56_Out_2_Float.xxx), _Divide_91ae4b94f1d9b78e99d0472293b8098c_Out_2_Vector3);
        float3 _Transform_73eecc0c3689d184a34c8d0f28a58adf_Out_1_Vector3;
        {
        float3x3 tangentTransform = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
        _Transform_73eecc0c3689d184a34c8d0f28a58adf_Out_1_Vector3 = TransformWorldToTangentDir(_Divide_91ae4b94f1d9b78e99d0472293b8098c_Out_2_Vector3.xyz, tangentTransform, true);
        }
        float3 _Normalize_15ef346824db0a8797631ed8b998e673_Out_1_Vector3;
        Unity_Normalize_float3(_Transform_73eecc0c3689d184a34c8d0f28a58adf_Out_1_Vector3, _Normalize_15ef346824db0a8797631ed8b998e673_Out_1_Vector3);
        XYZ_1 = (float4(_Normalize_15ef346824db0a8797631ed8b998e673_Out_1_Vector3, 1.0));
        XZ_2 = (float4(_Vector3_08f62c5c01619e849f1a7d85a44531ac_Out_0_Vector3, 1.0));
        YZ_3 = (float4(_Vector3_ba6cfb4671e8c58f9b41ea1dc23102ca_Out_0_Vector3, 1.0));
        XY_4 = (float4(_Vector3_13a08d5940172a84a78ee3d9b8766833_Out_0_Vector3, 1.0));
        }
        
        void Unity_Subtract_float(float A, float B, out float Out)
        {
            Out = A - B;
        }
        
        void Unity_Power_float(float A, float B, out float Out)
        {
            Out = pow(A, B);
        }
        
        void Unity_Lerp_float3(float3 A, float3 B, float3 T, out float3 Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Remap_float(float In, float2 InMinMax, float2 OutMinMax, out float Out)
        {
            Out = OutMinMax.x + (In - InMinMax.x) * (OutMinMax.y - OutMinMax.x) / (InMinMax.y - InMinMax.x);
        }
        
        void Unity_Lerp_float(float A, float B, float T, out float Out)
        {
            Out = lerp(A, B, T);
        }
        
        struct Bindings_BlendOverlayDetailSmoothness_06e12138dc89c0040b45a57abe520a1a_float
        {
        };
        
        void SG_BlendOverlayDetailSmoothness_06e12138dc89c0040b45a57abe520a1a_float(float Vector1_32317166, float Vector1_FBE622A2, float Vector1_8C15C351, Bindings_BlendOverlayDetailSmoothness_06e12138dc89c0040b45a57abe520a1a_float IN, out float SmoothnessOverlay_1)
        {
        float _Property_728cc50521e9e988ac9cbff4872d5139_Out_0_Float = Vector1_32317166;
        float _Property_a00e29241d12f983b30177515b367ec9_Out_0_Float = Vector1_FBE622A2;
        float _Sign_343a45ede7349283a681c6bd9998fd8e_Out_1_Float;
        Unity_Sign_float(_Property_a00e29241d12f983b30177515b367ec9_Out_0_Float, _Sign_343a45ede7349283a681c6bd9998fd8e_Out_1_Float);
        float _Add_681019b8f5d3d68bb482d419c9fc61a9_Out_2_Float;
        Unity_Add_float(_Sign_343a45ede7349283a681c6bd9998fd8e_Out_1_Float, float(1), _Add_681019b8f5d3d68bb482d419c9fc61a9_Out_2_Float);
        float _Multiply_e8f4cb722712a880ac0db6c7461427f7_Out_2_Float;
        Unity_Multiply_float_float(_Add_681019b8f5d3d68bb482d419c9fc61a9_Out_2_Float, 0.5, _Multiply_e8f4cb722712a880ac0db6c7461427f7_Out_2_Float);
        float _Ceiling_95ad15988aa9b98184875fa754feae01_Out_1_Float;
        Unity_Ceiling_float(_Multiply_e8f4cb722712a880ac0db6c7461427f7_Out_2_Float, _Ceiling_95ad15988aa9b98184875fa754feae01_Out_1_Float);
        float _Property_2db1c747a05ee284a8b00076062f91a4_Out_0_Float = Vector1_8C15C351;
        float _Lerp_b3cdb01fc3c5b988ac9b184943bf7c01_Out_3_Float;
        Unity_Lerp_float(_Property_728cc50521e9e988ac9cbff4872d5139_Out_0_Float, _Ceiling_95ad15988aa9b98184875fa754feae01_Out_1_Float, _Property_2db1c747a05ee284a8b00076062f91a4_Out_0_Float, _Lerp_b3cdb01fc3c5b988ac9b184943bf7c01_Out_3_Float);
        SmoothnessOverlay_1 = _Lerp_b3cdb01fc3c5b988ac9b184943bf7c01_Out_3_Float;
        }
        
        // Custom interpolators pre vertex
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPreVertex' */
        
        // Graph Vertex
        struct VertexDescription
        {
            float3 Position;
            float3 Normal;
            float3 Tangent;
        };
        
        VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
        {
            VertexDescription description = (VertexDescription)0;
            description.Position = IN.ObjectSpacePosition;
            description.Normal = IN.ObjectSpaceNormal;
            description.Tangent = IN.ObjectSpaceTangent;
            return description;
        }
        
        // Custom interpolators, pre surface
        #ifdef FEATURES_GRAPH_VERTEX
        Varyings CustomInterpolatorPassThroughFunc(inout Varyings output, VertexDescription input)
        {
        return output;
        }
        #define CUSTOMINTERPOLATOR_VARYPASSTHROUGH_FUNC
        #endif
        
        // Graph Pixel
        struct SurfaceDescription
        {
            float3 BaseColor;
            float3 NormalTS;
            float3 Emission;
            float Metallic;
            float3 Specular;
            float Smoothness;
            float Occlusion;
            float Alpha;
            float AlphaClipThreshold;
        };
        
        SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
        {
            SurfaceDescription surface = (SurfaceDescription)0;
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_05d49814100eb3808cd61a6177622291_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseColorMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_e21be9beec8d858fa2818b2fddc4577c_Out_0_Vector4 = _BaseTilingOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_1b1963c0ccb4d78fa3474b362fd31d15_Out_0_Boolean = _BaseUsePlanarUV;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae;
            _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae.uv0 = IN.uv0;
            _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae.uv2 = IN.uv2;
            float4 _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_05d49814100eb3808cd61a6177622291_Out_0_Texture2D, _Property_e21be9beec8d858fa2818b2fddc4577c_Out_0_Vector4, _Property_1b1963c0ccb4d78fa3474b362fd31d15_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), 1, _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae, _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae_XZ_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_03a155c84233b98dbb11cd710d6e1539_Out_0_Vector4 = _BaseColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Multiply_9cb5181459454189b39d6838c2a6fb85_Out_2_Vector4;
            Unity_Multiply_float4_float4(_PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae_XZ_2_Vector4, _Property_03a155c84233b98dbb11cd710d6e1539_Out_0_Vector4, _Multiply_9cb5181459454189b39d6838c2a6fb85_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_b26f64bfa09eb48584b1dc9133f5b840_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_DetailMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_bb28507cb268918795cf74b32a6b3693_Out_0_Vector4 = _DetailTilingOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_a5f9848f7817b48ca226ca228efcc28e_R_1_Float = _Property_bb28507cb268918795cf74b32a6b3693_Out_0_Vector4[0];
            float _Split_a5f9848f7817b48ca226ca228efcc28e_G_2_Float = _Property_bb28507cb268918795cf74b32a6b3693_Out_0_Vector4[1];
            float _Split_a5f9848f7817b48ca226ca228efcc28e_B_3_Float = _Property_bb28507cb268918795cf74b32a6b3693_Out_0_Vector4[2];
            float _Split_a5f9848f7817b48ca226ca228efcc28e_A_4_Float = _Property_bb28507cb268918795cf74b32a6b3693_Out_0_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_257255e4b3cee8888b124cb1330da379_Out_0_Vector2 = float2(_Split_a5f9848f7817b48ca226ca228efcc28e_R_1_Float, _Split_a5f9848f7817b48ca226ca228efcc28e_G_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_2ba978ab0f3ccc84b3fe592845432576_Out_0_Vector2 = float2(_Split_a5f9848f7817b48ca226ca228efcc28e_B_3_Float, _Split_a5f9848f7817b48ca226ca228efcc28e_A_4_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _TilingAndOffset_9bc6b1e938f4668f9476625fa68aff4e_Out_3_Vector2;
            Unity_TilingAndOffset_float(IN.uv0.xy, _Vector2_257255e4b3cee8888b124cb1330da379_Out_0_Vector2, _Vector2_2ba978ab0f3ccc84b3fe592845432576_Out_0_Vector2, _TilingAndOffset_9bc6b1e938f4668f9476625fa68aff4e_Out_3_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_b26f64bfa09eb48584b1dc9133f5b840_Out_0_Texture2D.tex, _Property_b26f64bfa09eb48584b1dc9133f5b840_Out_0_Texture2D.samplerstate, _Property_b26f64bfa09eb48584b1dc9133f5b840_Out_0_Texture2D.GetTransformedUV(_TilingAndOffset_9bc6b1e938f4668f9476625fa68aff4e_Out_3_Vector2) );
            float _SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_R_4_Float = _SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_RGBA_0_Vector4.r;
            float _SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_G_5_Float = _SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_RGBA_0_Vector4.g;
            float _SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_B_6_Float = _SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_RGBA_0_Vector4.b;
            float _SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_A_7_Float = _SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_99a7a45efebe0588afbd74b8df9b4750_Out_2_Float;
            Unity_Multiply_float_float(_SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_R_4_Float, 2, _Multiply_99a7a45efebe0588afbd74b8df9b4750_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_ddcd7f2c8505e0818230ed34d7ecdf92_Out_2_Float;
            Unity_Add_float(_Multiply_99a7a45efebe0588afbd74b8df9b4750_Out_2_Float, float(-1), _Add_ddcd7f2c8505e0818230ed34d7ecdf92_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_b7367df1085ac580b7d5b9785921d152_Out_0_Float = _DetailAlbedoScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_874d814eeb0e7782842ad64a4d97f43e_Out_2_Float;
            Unity_Multiply_float_float(_Add_ddcd7f2c8505e0818230ed34d7ecdf92_Out_2_Float, _Property_b7367df1085ac580b7d5b9785921d152_Out_0_Float, _Multiply_874d814eeb0e7782842ad64a4d97f43e_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Saturate_40d0c48fa8fb008799c2060b9ccfede9_Out_1_Float;
            Unity_Saturate_float(_Multiply_874d814eeb0e7782842ad64a4d97f43e_Out_2_Float, _Saturate_40d0c48fa8fb008799c2060b9ccfede9_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Absolute_7ea0f8a0aaf24186a357f11eca841a0c_Out_1_Float;
            Unity_Absolute_float(_Saturate_40d0c48fa8fb008799c2060b9ccfede9_Out_1_Float, _Absolute_7ea0f8a0aaf24186a357f11eca841a0c_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_BlendOverlayBaseColor_acdb3dfca72bd6b42bbc35f4613331a2_float _BlendOverlayBaseColor_9ac50a6865d3648181da5f6189b8832d;
            float3 _BlendOverlayBaseColor_9ac50a6865d3648181da5f6189b8832d_OutVector4_1_Vector3;
            SG_BlendOverlayBaseColor_acdb3dfca72bd6b42bbc35f4613331a2_float(_Multiply_9cb5181459454189b39d6838c2a6fb85_Out_2_Vector4, _Add_ddcd7f2c8505e0818230ed34d7ecdf92_Out_2_Float, _Absolute_7ea0f8a0aaf24186a357f11eca841a0c_Out_1_Float, _BlendOverlayBaseColor_9ac50a6865d3648181da5f6189b8832d, _BlendOverlayBaseColor_9ac50a6865d3648181da5f6189b8832d_OutVector4_1_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_5d67b392da5ceb81b51a3bfe5384ad00_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverBaseColorMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_e95f6f4e76cecb87871151040535a080_Out_0_Vector4 = _CoverTilingOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Divide_acbbd9727ffda783aeafe28ccafbde8e_Out_2_Vector4;
            Unity_Divide_float4(float4(1, 1, 0, 0), _Property_e95f6f4e76cecb87871151040535a080_Out_0_Vector4, _Divide_acbbd9727ffda783aeafe28ccafbde8e_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_faa4f436225f4e8eb99135b1d078135e_Out_0_Float = _CoverTriplanarThreshold;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_cd8ee86e67e5fe898c7968f92e11e481;
            _TriplanarNM_cd8ee86e67e5fe898c7968f92e11e481.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_cd8ee86e67e5fe898c7968f92e11e481.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_cd8ee86e67e5fe898c7968f92e11e481_XYZ_1_Vector4;
            float4 _TriplanarNM_cd8ee86e67e5fe898c7968f92e11e481_XZ_2_Vector4;
            float4 _TriplanarNM_cd8ee86e67e5fe898c7968f92e11e481_YZ_3_Vector4;
            float4 _TriplanarNM_cd8ee86e67e5fe898c7968f92e11e481_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_5d67b392da5ceb81b51a3bfe5384ad00_Out_0_Texture2D, (_Divide_acbbd9727ffda783aeafe28ccafbde8e_Out_2_Vector4).x, _Property_faa4f436225f4e8eb99135b1d078135e_Out_0_Float, _TriplanarNM_cd8ee86e67e5fe898c7968f92e11e481, _TriplanarNM_cd8ee86e67e5fe898c7968f92e11e481_XYZ_1_Vector4, _TriplanarNM_cd8ee86e67e5fe898c7968f92e11e481_XZ_2_Vector4, _TriplanarNM_cd8ee86e67e5fe898c7968f92e11e481_YZ_3_Vector4, _TriplanarNM_cd8ee86e67e5fe898c7968f92e11e481_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_65c5d9a1688ae98ba437bc3f4b866f99_Out_0_Vector4 = _CoverBaseColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Multiply_b7294cbf7c9daa85b18c13beaf3dc8bd_Out_2_Vector4;
            Unity_Multiply_float4_float4(_TriplanarNM_cd8ee86e67e5fe898c7968f92e11e481_XYZ_1_Vector4, _Property_65c5d9a1688ae98ba437bc3f4b866f99_Out_0_Vector4, _Multiply_b7294cbf7c9daa85b18c13beaf3dc8bd_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_43c6facd1f553289befba1782fe8ad70_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverMaskA);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _UV_5b74fb710ad3d187a00f16e1d8f8bd63_Out_0_Vector4 = IN.uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _SampleTexture2D_4d4c63c65e48c28ba5f624928f181789_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_43c6facd1f553289befba1782fe8ad70_Out_0_Texture2D.tex, _Property_43c6facd1f553289befba1782fe8ad70_Out_0_Texture2D.samplerstate, _Property_43c6facd1f553289befba1782fe8ad70_Out_0_Texture2D.GetTransformedUV((_UV_5b74fb710ad3d187a00f16e1d8f8bd63_Out_0_Vector4.xy)) );
            float _SampleTexture2D_4d4c63c65e48c28ba5f624928f181789_R_4_Float = _SampleTexture2D_4d4c63c65e48c28ba5f624928f181789_RGBA_0_Vector4.r;
            float _SampleTexture2D_4d4c63c65e48c28ba5f624928f181789_G_5_Float = _SampleTexture2D_4d4c63c65e48c28ba5f624928f181789_RGBA_0_Vector4.g;
            float _SampleTexture2D_4d4c63c65e48c28ba5f624928f181789_B_6_Float = _SampleTexture2D_4d4c63c65e48c28ba5f624928f181789_RGBA_0_Vector4.b;
            float _SampleTexture2D_4d4c63c65e48c28ba5f624928f181789_A_7_Float = _SampleTexture2D_4d4c63c65e48c28ba5f624928f181789_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_4080f51767261687a64910057bc980cb_Out_0_Float = _CoverMaskPower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_2660ad962697408681e2e8c36648ca12_Out_2_Float;
            Unity_Multiply_float_float(_SampleTexture2D_4d4c63c65e48c28ba5f624928f181789_A_7_Float, _Property_4080f51767261687a64910057bc980cb_Out_0_Float, _Multiply_2660ad962697408681e2e8c36648ca12_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_572d83500486058c99890c5d609b30b0_Out_3_Float;
            Unity_Clamp_float(_Multiply_2660ad962697408681e2e8c36648ca12_Out_2_Float, float(0), float(1), _Clamp_572d83500486058c99890c5d609b30b0_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Property_3d047323d7f9778ca2b1b7d7d4d43210_Out_0_Vector3 = _CoverDirection;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_3f76f18aa45a858dab65f5835e23f0b9_Out_0_Vector2 = float2(_SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_A_7_Float, _SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_G_5_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Multiply_a3cb438c86db8a839543847f1fa26666_Out_2_Vector2;
            Unity_Multiply_float2_float2(_Vector2_3f76f18aa45a858dab65f5835e23f0b9_Out_0_Vector2, float2(2, 2), _Multiply_a3cb438c86db8a839543847f1fa26666_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Add_21eb70b8cab75f8a852dd8dd64767430_Out_2_Vector2;
            Unity_Add_float2(_Multiply_a3cb438c86db8a839543847f1fa26666_Out_2_Vector2, float2(-1, -1), _Add_21eb70b8cab75f8a852dd8dd64767430_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_cbbb2e4ef035b58e8c751d96843d987e_Out_0_Float = _DetailNormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Multiply_d4afe7aea32def8ca3c89b2f7e87af44_Out_2_Vector2;
            Unity_Multiply_float2_float2(_Add_21eb70b8cab75f8a852dd8dd64767430_Out_2_Vector2, (_Property_cbbb2e4ef035b58e8c751d96843d987e_Out_0_Float.xx), _Multiply_d4afe7aea32def8ca3c89b2f7e87af44_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_f88dc76333998681a9031ef1324e052a_R_1_Float = _Multiply_d4afe7aea32def8ca3c89b2f7e87af44_Out_2_Vector2[0];
            float _Split_f88dc76333998681a9031ef1324e052a_G_2_Float = _Multiply_d4afe7aea32def8ca3c89b2f7e87af44_Out_2_Vector2[1];
            float _Split_f88dc76333998681a9031ef1324e052a_B_3_Float = 0;
            float _Split_f88dc76333998681a9031ef1324e052a_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _DotProduct_970a707dd71afa80887b08c47998be6e_Out_2_Float;
            Unity_DotProduct_float2(_Multiply_d4afe7aea32def8ca3c89b2f7e87af44_Out_2_Vector2, _Multiply_d4afe7aea32def8ca3c89b2f7e87af44_Out_2_Vector2, _DotProduct_970a707dd71afa80887b08c47998be6e_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Saturate_6a42dc6ad32c63849dbf7844d1081b82_Out_1_Float;
            Unity_Saturate_float(_DotProduct_970a707dd71afa80887b08c47998be6e_Out_2_Float, _Saturate_6a42dc6ad32c63849dbf7844d1081b82_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_a724d53a195cd387a0d6ec2d11ec64e8_Out_1_Float;
            Unity_OneMinus_float(_Saturate_6a42dc6ad32c63849dbf7844d1081b82_Out_1_Float, _OneMinus_a724d53a195cd387a0d6ec2d11ec64e8_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _SquareRoot_6e074ca49330118a958f11e9487fe5c6_Out_1_Float;
            Unity_SquareRoot_float(_OneMinus_a724d53a195cd387a0d6ec2d11ec64e8_Out_1_Float, _SquareRoot_6e074ca49330118a958f11e9487fe5c6_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Vector3_a6a5e3fb326314838a5e436f55de8dcc_Out_0_Vector3 = float3(_Split_f88dc76333998681a9031ef1324e052a_R_1_Float, _Split_f88dc76333998681a9031ef1324e052a_G_2_Float, _SquareRoot_6e074ca49330118a958f11e9487fe5c6_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_2e4a88374e8ffd8db37352d79f10740a_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseNormalMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float _PlanarNMn_126f337c769a878bb33ea56bcab1d637;
            _PlanarNMn_126f337c769a878bb33ea56bcab1d637.WorldSpaceNormal = IN.WorldSpaceNormal;
            _PlanarNMn_126f337c769a878bb33ea56bcab1d637.WorldSpaceTangent = IN.WorldSpaceTangent;
            _PlanarNMn_126f337c769a878bb33ea56bcab1d637.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _PlanarNMn_126f337c769a878bb33ea56bcab1d637.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNMn_126f337c769a878bb33ea56bcab1d637.uv0 = IN.uv0;
            _PlanarNMn_126f337c769a878bb33ea56bcab1d637.uv2 = IN.uv2;
            float4 _PlanarNMn_126f337c769a878bb33ea56bcab1d637_XZ_2_Vector4;
            SG_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float(_Property_2e4a88374e8ffd8db37352d79f10740a_Out_0_Texture2D, _Property_e21be9beec8d858fa2818b2fddc4577c_Out_0_Vector4, _Property_1b1963c0ccb4d78fa3474b362fd31d15_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), 1, _PlanarNMn_126f337c769a878bb33ea56bcab1d637, _PlanarNMn_126f337c769a878bb33ea56bcab1d637_XZ_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_ea100595101f088a94e70278a910a34c_Out_0_Float = _BaseNormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _NormalStrength_70f3e500f60967898e02d8fc8200db59_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_126f337c769a878bb33ea56bcab1d637_XZ_2_Vector4.xyz), _Property_ea100595101f088a94e70278a910a34c_Out_0_Float, _NormalStrength_70f3e500f60967898e02d8fc8200db59_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _NormalBlend_58a0c0d45b55168cbfa43fa9d9da21c6_Out_2_Vector3;
            Unity_NormalBlend_float(_Vector3_a6a5e3fb326314838a5e436f55de8dcc_Out_0_Vector3, _NormalStrength_70f3e500f60967898e02d8fc8200db59_Out_2_Vector3, _NormalBlend_58a0c0d45b55168cbfa43fa9d9da21c6_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_bb2720e978ff4782bb872fb7b877636f_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverNormalMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNMn_059da9746584140498cd018db3c76047_float _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b;
            _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b.WorldSpaceTangent = IN.WorldSpaceTangent;
            _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b.WorldSpacePosition = IN.WorldSpacePosition;
            float4 _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b_XYZ_1_Vector4;
            float4 _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b_XZ_2_Vector4;
            float4 _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b_YZ_3_Vector4;
            float4 _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b_XY_4_Vector4;
            SG_TriplanarNMn_059da9746584140498cd018db3c76047_float(_Property_bb2720e978ff4782bb872fb7b877636f_Out_0_Texture2D, (_Divide_acbbd9727ffda783aeafe28ccafbde8e_Out_2_Vector4).x, _Property_faa4f436225f4e8eb99135b1d078135e_Out_0_Float, _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b, _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b_XYZ_1_Vector4, _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b_XZ_2_Vector4, _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b_YZ_3_Vector4, _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_f6ae16d8d2c85685b4072d78c56e29e9_Out_0_Float = _CoverNormalBlendHardness;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _NormalStrength_11fab77b71140d8ab0735a9615b728ec_Out_2_Vector3;
            Unity_NormalStrength_float((_TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b_XYZ_1_Vector4.xyz), _Property_f6ae16d8d2c85685b4072d78c56e29e9_Out_0_Float, _NormalStrength_11fab77b71140d8ab0735a9615b728ec_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Multiply_fa49280de269898ebbfe89d446d57ecc_Out_2_Vector3;
            Unity_Multiply_float3_float3(_Property_3d047323d7f9778ca2b1b7d7d4d43210_Out_0_Vector3, IN.WorldSpaceNormal, _Multiply_fa49280de269898ebbfe89d446d57ecc_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_91e143818eee6187b799b2a4652eeb95_R_1_Float = _Multiply_fa49280de269898ebbfe89d446d57ecc_Out_2_Vector3[0];
            float _Split_91e143818eee6187b799b2a4652eeb95_G_2_Float = _Multiply_fa49280de269898ebbfe89d446d57ecc_Out_2_Vector3[1];
            float _Split_91e143818eee6187b799b2a4652eeb95_B_3_Float = _Multiply_fa49280de269898ebbfe89d446d57ecc_Out_2_Vector3[2];
            float _Split_91e143818eee6187b799b2a4652eeb95_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_f99764306bf31e8484b14d9a1ba660a3_Out_2_Float;
            Unity_Add_float(_Split_91e143818eee6187b799b2a4652eeb95_R_1_Float, _Split_91e143818eee6187b799b2a4652eeb95_G_2_Float, _Add_f99764306bf31e8484b14d9a1ba660a3_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_25d0cda769439c85a6176b0cf9af06c0_Out_2_Float;
            Unity_Add_float(_Add_f99764306bf31e8484b14d9a1ba660a3_Out_2_Float, _Split_91e143818eee6187b799b2a4652eeb95_B_3_Float, _Add_25d0cda769439c85a6176b0cf9af06c0_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_24df69e5dc52008e891c2b3f99e28991_Out_0_Float = _Cover_Amount;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_7b25e9aea29e888e99e5155562106e70_Out_0_Float = _Cover_Amount_Grow_Speed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Subtract_a31b2e64f122188ea610c77d3f62f810_Out_2_Float;
            Unity_Subtract_float(float(4), _Property_7b25e9aea29e888e99e5155562106e70_Out_0_Float, _Subtract_a31b2e64f122188ea610c77d3f62f810_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_15277685f0785f8a90f4492c80247159_Out_2_Float;
            Unity_Divide_float(_Property_24df69e5dc52008e891c2b3f99e28991_Out_0_Float, _Subtract_a31b2e64f122188ea610c77d3f62f810_Out_2_Float, _Divide_15277685f0785f8a90f4492c80247159_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Absolute_ac1c6e27d47e508e8aed26d3db167120_Out_1_Float;
            Unity_Absolute_float(_Divide_15277685f0785f8a90f4492c80247159_Out_2_Float, _Absolute_ac1c6e27d47e508e8aed26d3db167120_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Power_d5a03bba02ea638f84c50ca9f6a3e112_Out_2_Float;
            Unity_Power_float(_Absolute_ac1c6e27d47e508e8aed26d3db167120_Out_1_Float, _Subtract_a31b2e64f122188ea610c77d3f62f810_Out_2_Float, _Power_d5a03bba02ea638f84c50ca9f6a3e112_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_1be0e9928e2c0489b16295f57a026487_Out_3_Float;
            Unity_Clamp_float(_Power_d5a03bba02ea638f84c50ca9f6a3e112_Out_2_Float, float(0), float(2), _Clamp_1be0e9928e2c0489b16295f57a026487_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_041ba179c4133288bd6ebb7932697351_Out_2_Float;
            Unity_Multiply_float_float(_Add_25d0cda769439c85a6176b0cf9af06c0_Out_2_Float, _Clamp_1be0e9928e2c0489b16295f57a026487_Out_3_Float, _Multiply_041ba179c4133288bd6ebb7932697351_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Saturate_f03610d99dc38b8688cdf6c95924daaf_Out_1_Float;
            Unity_Saturate_float(_Multiply_041ba179c4133288bd6ebb7932697351_Out_2_Float, _Saturate_f03610d99dc38b8688cdf6c95924daaf_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_78437b2d5aa53f829edcee712f066e04_Out_3_Float;
            Unity_Clamp_float(_Add_25d0cda769439c85a6176b0cf9af06c0_Out_2_Float, float(0), float(0.9999), _Clamp_78437b2d5aa53f829edcee712f066e04_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_32c30bd23dc33184849662569cd46759_Out_0_Float = _Cover_Max_Angle;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_9d9e98ea75888d85877f3863930719aa_Out_2_Float;
            Unity_Divide_float(_Property_32c30bd23dc33184849662569cd46759_Out_0_Float, float(45), _Divide_9d9e98ea75888d85877f3863930719aa_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_fa817fbd2ba8aa81bf3977d104f66ffd_Out_1_Float;
            Unity_OneMinus_float(_Divide_9d9e98ea75888d85877f3863930719aa_Out_2_Float, _OneMinus_fa817fbd2ba8aa81bf3977d104f66ffd_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Subtract_66c9a128aff075848cbe14a74ba8d3c5_Out_2_Float;
            Unity_Subtract_float(_Clamp_78437b2d5aa53f829edcee712f066e04_Out_3_Float, _OneMinus_fa817fbd2ba8aa81bf3977d104f66ffd_Out_1_Float, _Subtract_66c9a128aff075848cbe14a74ba8d3c5_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_b81e19ff4b40e889bbc2a0d75a043d55_Out_3_Float;
            Unity_Clamp_float(_Subtract_66c9a128aff075848cbe14a74ba8d3c5_Out_2_Float, float(0), float(2), _Clamp_b81e19ff4b40e889bbc2a0d75a043d55_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_df9b9eb99573a286b66090f1a88825c2_Out_2_Float;
            Unity_Divide_float(float(1), _Divide_9d9e98ea75888d85877f3863930719aa_Out_2_Float, _Divide_df9b9eb99573a286b66090f1a88825c2_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_b1c6bc199993da8e8690b8204063c06f_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_b81e19ff4b40e889bbc2a0d75a043d55_Out_3_Float, _Divide_df9b9eb99573a286b66090f1a88825c2_Out_2_Float, _Multiply_b1c6bc199993da8e8690b8204063c06f_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Absolute_47d15fbc856f1982992c9f6f8cf095df_Out_1_Float;
            Unity_Absolute_float(_Multiply_b1c6bc199993da8e8690b8204063c06f_Out_2_Float, _Absolute_47d15fbc856f1982992c9f6f8cf095df_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_84ecf6d44066108b958a4bbf89eb2bbb_Out_0_Float = _CoverHardness;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Power_e2326e473b1f15869db22e412e3f9fde_Out_2_Float;
            Unity_Power_float(_Absolute_47d15fbc856f1982992c9f6f8cf095df_Out_1_Float, _Property_84ecf6d44066108b958a4bbf89eb2bbb_Out_0_Float, _Power_e2326e473b1f15869db22e412e3f9fde_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_e5173dd322cb9c87a827b3d6d416e8c4_Out_0_Float = _Cover_Min_Height;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_d6102fe1df60cf8f9be5eb4f6774b363_Out_1_Float;
            Unity_OneMinus_float(_Property_e5173dd322cb9c87a827b3d6d416e8c4_Out_0_Float, _OneMinus_d6102fe1df60cf8f9be5eb4f6774b363_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_c2c0822a4c066887bdce2476ce07e03b_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
            float _Split_c2c0822a4c066887bdce2476ce07e03b_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
            float _Split_c2c0822a4c066887bdce2476ce07e03b_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
            float _Split_c2c0822a4c066887bdce2476ce07e03b_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_d67ba628c117b784982b2b0e7335f121_Out_2_Float;
            Unity_Add_float(_OneMinus_d6102fe1df60cf8f9be5eb4f6774b363_Out_1_Float, _Split_c2c0822a4c066887bdce2476ce07e03b_G_2_Float, _Add_d67ba628c117b784982b2b0e7335f121_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_cacc637f6d247382b610fa5e29099efb_Out_2_Float;
            Unity_Add_float(_Add_d67ba628c117b784982b2b0e7335f121_Out_2_Float, float(1), _Add_cacc637f6d247382b610fa5e29099efb_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_305f17dcc5012d81886e7fe415a513d4_Out_3_Float;
            Unity_Clamp_float(_Add_cacc637f6d247382b610fa5e29099efb_Out_2_Float, float(0), float(1), _Clamp_305f17dcc5012d81886e7fe415a513d4_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_6b0e17b7e3d2fd8db358cf2468c498e6_Out_0_Float = _Cover_Min_Height_Blending;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_3a4b967d185bc881b41c30791f6f1e62_Out_2_Float;
            Unity_Add_float(_Add_d67ba628c117b784982b2b0e7335f121_Out_2_Float, _Property_6b0e17b7e3d2fd8db358cf2468c498e6_Out_0_Float, _Add_3a4b967d185bc881b41c30791f6f1e62_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_fd0dcb913f15e88e902812b438aebbc3_Out_2_Float;
            Unity_Divide_float(_Add_3a4b967d185bc881b41c30791f6f1e62_Out_2_Float, _Add_d67ba628c117b784982b2b0e7335f121_Out_2_Float, _Divide_fd0dcb913f15e88e902812b438aebbc3_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_a7b7b5823dc9398d8328371fb23de257_Out_1_Float;
            Unity_OneMinus_float(_Divide_fd0dcb913f15e88e902812b438aebbc3_Out_2_Float, _OneMinus_a7b7b5823dc9398d8328371fb23de257_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_caa2bc8711bde98886b2e04bc3895333_Out_2_Float;
            Unity_Add_float(_OneMinus_a7b7b5823dc9398d8328371fb23de257_Out_1_Float, float(-0.5), _Add_caa2bc8711bde98886b2e04bc3895333_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_9958b4bb870ca78bb4f436357f6e4ed4_Out_3_Float;
            Unity_Clamp_float(_Add_caa2bc8711bde98886b2e04bc3895333_Out_2_Float, float(0), float(1), _Clamp_9958b4bb870ca78bb4f436357f6e4ed4_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_f4c52e99fecae983bba5ca957ceaea70_Out_2_Float;
            Unity_Add_float(_Clamp_305f17dcc5012d81886e7fe415a513d4_Out_3_Float, _Clamp_9958b4bb870ca78bb4f436357f6e4ed4_Out_3_Float, _Add_f4c52e99fecae983bba5ca957ceaea70_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_4b0ba629f5691b8985bcb46fe077634b_Out_3_Float;
            Unity_Clamp_float(_Add_f4c52e99fecae983bba5ca957ceaea70_Out_2_Float, float(0), float(1), _Clamp_4b0ba629f5691b8985bcb46fe077634b_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_dc9146fa086a698db159220c4b551f8d_Out_2_Float;
            Unity_Multiply_float_float(_Power_e2326e473b1f15869db22e412e3f9fde_Out_2_Float, _Clamp_4b0ba629f5691b8985bcb46fe077634b_Out_3_Float, _Multiply_dc9146fa086a698db159220c4b551f8d_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_4a4cdbb11047088c86f3455cd5a51981_Out_2_Float;
            Unity_Multiply_float_float(_Saturate_f03610d99dc38b8688cdf6c95924daaf_Out_1_Float, _Multiply_dc9146fa086a698db159220c4b551f8d_Out_2_Float, _Multiply_4a4cdbb11047088c86f3455cd5a51981_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Lerp_81e093150193e5818ea2e7cdf113600f_Out_3_Vector3;
            Unity_Lerp_float3(_NormalBlend_58a0c0d45b55168cbfa43fa9d9da21c6_Out_2_Vector3, _NormalStrength_11fab77b71140d8ab0735a9615b728ec_Out_2_Vector3, (_Multiply_4a4cdbb11047088c86f3455cd5a51981_Out_2_Float.xxx), _Lerp_81e093150193e5818ea2e7cdf113600f_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Transform_fcfe6aed8d17598ebf576390e09b3662_Out_1_Vector3;
            {
                float3x3 tangentTransform = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
                _Transform_fcfe6aed8d17598ebf576390e09b3662_Out_1_Vector3 = TransformTangentToWorldDir(_Lerp_81e093150193e5818ea2e7cdf113600f_Out_3_Vector3.xyz, tangentTransform, true).xyz;
            }
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Multiply_87cc0f3ed4675989b51b1b58a173bc24_Out_2_Vector3;
            Unity_Multiply_float3_float3(_Property_3d047323d7f9778ca2b1b7d7d4d43210_Out_0_Vector3, _Transform_fcfe6aed8d17598ebf576390e09b3662_Out_1_Vector3, _Multiply_87cc0f3ed4675989b51b1b58a173bc24_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_60ee188afca81787a8e8fac74a174b99_R_1_Float = _Multiply_87cc0f3ed4675989b51b1b58a173bc24_Out_2_Vector3[0];
            float _Split_60ee188afca81787a8e8fac74a174b99_G_2_Float = _Multiply_87cc0f3ed4675989b51b1b58a173bc24_Out_2_Vector3[1];
            float _Split_60ee188afca81787a8e8fac74a174b99_B_3_Float = _Multiply_87cc0f3ed4675989b51b1b58a173bc24_Out_2_Vector3[2];
            float _Split_60ee188afca81787a8e8fac74a174b99_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_dc15dd3b0cae3e89bd698e7f843f7b1a_Out_2_Float;
            Unity_Add_float(_Split_60ee188afca81787a8e8fac74a174b99_R_1_Float, _Split_60ee188afca81787a8e8fac74a174b99_G_2_Float, _Add_dc15dd3b0cae3e89bd698e7f843f7b1a_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_5239bb98d15c0889b20e04a2eb89ee8d_Out_2_Float;
            Unity_Add_float(_Add_dc15dd3b0cae3e89bd698e7f843f7b1a_Out_2_Float, _Split_60ee188afca81787a8e8fac74a174b99_B_3_Float, _Add_5239bb98d15c0889b20e04a2eb89ee8d_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_04ad5b9da8d13d80977bd2661241c39d_Out_2_Float;
            Unity_Multiply_float_float(_Add_5239bb98d15c0889b20e04a2eb89ee8d_Out_2_Float, _Clamp_1be0e9928e2c0489b16295f57a026487_Out_3_Float, _Multiply_04ad5b9da8d13d80977bd2661241c39d_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_ffe9545eefb14c85b9db82fa15044921_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_1be0e9928e2c0489b16295f57a026487_Out_3_Float, _Property_84ecf6d44066108b958a4bbf89eb2bbb_Out_0_Float, _Multiply_ffe9545eefb14c85b9db82fa15044921_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_49be95001b6ff98ea3ddca613a01d693_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_ffe9545eefb14c85b9db82fa15044921_Out_2_Float, _Multiply_dc9146fa086a698db159220c4b551f8d_Out_2_Float, _Multiply_49be95001b6ff98ea3ddca613a01d693_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_821af040af6e558284ae449187584b00_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_04ad5b9da8d13d80977bd2661241c39d_Out_2_Float, _Multiply_49be95001b6ff98ea3ddca613a01d693_Out_2_Float, _Multiply_821af040af6e558284ae449187584b00_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_b98b3357cae0358aae44a13c442bbfcf_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverMaskMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3;
            _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_XYZ_1_Vector4;
            float4 _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_XZ_2_Vector4;
            float4 _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_YZ_3_Vector4;
            float4 _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_b98b3357cae0358aae44a13c442bbfcf_Out_0_Texture2D, (_Divide_acbbd9727ffda783aeafe28ccafbde8e_Out_2_Vector4).x, _Property_faa4f436225f4e8eb99135b1d078135e_Out_0_Float, _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3, _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_XYZ_1_Vector4, _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_XZ_2_Vector4, _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_YZ_3_Vector4, _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_d45fa36c68c6428bb4f8080e2005e0ec_R_1_Float = _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_XYZ_1_Vector4[0];
            float _Split_d45fa36c68c6428bb4f8080e2005e0ec_G_2_Float = _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_XYZ_1_Vector4[1];
            float _Split_d45fa36c68c6428bb4f8080e2005e0ec_B_3_Float = _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_XYZ_1_Vector4[2];
            float _Split_d45fa36c68c6428bb4f8080e2005e0ec_A_4_Float = _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_XYZ_1_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_98ac4ea177a183869352488b4c2d0d34_Out_0_Float = _CoverHeightMapMin;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_5d5eb0a63075b184be1f8ed7f1969793_Out_0_Float = _CoverHeightMapMax;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_068b903f7986bb8da7741fd6f472d4d3_Out_0_Vector2 = float2(_Property_98ac4ea177a183869352488b4c2d0d34_Out_0_Float, _Property_5d5eb0a63075b184be1f8ed7f1969793_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_dbf8fa97bfdf2f819d547b2836d5eb88_Out_0_Float = _CoverHeightMapOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Add_7e64ff79e725df80a9231cb40178da18_Out_2_Vector2;
            Unity_Add_float2(_Vector2_068b903f7986bb8da7741fd6f472d4d3_Out_0_Vector2, (_Property_dbf8fa97bfdf2f819d547b2836d5eb88_Out_0_Float.xx), _Add_7e64ff79e725df80a9231cb40178da18_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_0792f0dacec10e82954597c385120c5f_Out_3_Float;
            Unity_Remap_float(_Split_d45fa36c68c6428bb4f8080e2005e0ec_B_3_Float, float2 (0, 1), _Add_7e64ff79e725df80a9231cb40178da18_Out_2_Vector2, _Remap_0792f0dacec10e82954597c385120c5f_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_fef4ce95d06ced86899c58782dd5e9ac_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_821af040af6e558284ae449187584b00_Out_2_Float, _Remap_0792f0dacec10e82954597c385120c5f_Out_3_Float, _Multiply_fef4ce95d06ced86899c58782dd5e9ac_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_f38ac593c11c408685b4081df7f9a736_R_1_Float = IN.VertexColor[0];
            float _Split_f38ac593c11c408685b4081df7f9a736_G_2_Float = IN.VertexColor[1];
            float _Split_f38ac593c11c408685b4081df7f9a736_B_3_Float = IN.VertexColor[2];
            float _Split_f38ac593c11c408685b4081df7f9a736_A_4_Float = IN.VertexColor[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_26b43e2c517d7982b34d1c541939b6f5_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_fef4ce95d06ced86899c58782dd5e9ac_Out_2_Float, _Split_f38ac593c11c408685b4081df7f9a736_G_2_Float, _Multiply_26b43e2c517d7982b34d1c541939b6f5_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Saturate_3d2efb20d5b29381bfb3003845307b1f_Out_1_Float;
            Unity_Saturate_float(_Multiply_26b43e2c517d7982b34d1c541939b6f5_Out_2_Float, _Saturate_3d2efb20d5b29381bfb3003845307b1f_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_97e8d2e584b4e587a8ffaa3d3b1b30f5_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_572d83500486058c99890c5d609b30b0_Out_3_Float, _Saturate_3d2efb20d5b29381bfb3003845307b1f_Out_1_Float, _Multiply_97e8d2e584b4e587a8ffaa3d3b1b30f5_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            #if defined(_USEDYNAMICCOVERTSTATICMASKF_ON)
            float _UseDynamicCoverTStaticMaskF_ea4efcf79fa41489897aef4bbf5e655f_Out_0_Float = _Multiply_97e8d2e584b4e587a8ffaa3d3b1b30f5_Out_2_Float;
            #else
            float _UseDynamicCoverTStaticMaskF_ea4efcf79fa41489897aef4bbf5e655f_Out_0_Float = _Clamp_572d83500486058c99890c5d609b30b0_Out_3_Float;
            #endif
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Lerp_55b6201a01421f8b87ba535381db6a03_Out_3_Vector3;
            Unity_Lerp_float3(_BlendOverlayBaseColor_9ac50a6865d3648181da5f6189b8832d_OutVector4_1_Vector3, (_Multiply_b7294cbf7c9daa85b18c13beaf3dc8bd_Out_2_Vector4.xyz), (_UseDynamicCoverTStaticMaskF_ea4efcf79fa41489897aef4bbf5e655f_Out_0_Float.xxx), _Lerp_55b6201a01421f8b87ba535381db6a03_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_1c3992584ba29481b2683ce78818f520_Out_0_Vector4 = _WetColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Multiply_25f2ae8d79d4a388a6cbd74c831c0177_Out_2_Vector3;
            Unity_Multiply_float3_float3((_Property_1c3992584ba29481b2683ce78818f520_Out_0_Vector4.xyz), _Lerp_55b6201a01421f8b87ba535381db6a03_Out_3_Vector3, _Multiply_25f2ae8d79d4a388a6cbd74c831c0177_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_93980743aa69fb86bf250c5a7d50ef20_Out_1_Float;
            Unity_OneMinus_float(_Split_f38ac593c11c408685b4081df7f9a736_R_1_Float, _OneMinus_93980743aa69fb86bf250c5a7d50ef20_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Lerp_19abc331acee5482a25ee61d5a1861cf_Out_3_Vector3;
            Unity_Lerp_float3(_Lerp_55b6201a01421f8b87ba535381db6a03_Out_3_Vector3, _Multiply_25f2ae8d79d4a388a6cbd74c831c0177_Out_2_Vector3, (_OneMinus_93980743aa69fb86bf250c5a7d50ef20_Out_1_Float.xxx), _Lerp_19abc331acee5482a25ee61d5a1861cf_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_b4e25e28683cfa839d36c1919793b680_Out_0_Float = _CoverNormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _NormalStrength_3204e89c6d863484958f2b78ddab5dd5_Out_2_Vector3;
            Unity_NormalStrength_float((_TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b_XYZ_1_Vector4.xyz), _Property_b4e25e28683cfa839d36c1919793b680_Out_0_Float, _NormalStrength_3204e89c6d863484958f2b78ddab5dd5_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Lerp_ddd428cec97e91869b2eec0aace3820c_Out_3_Vector3;
            Unity_Lerp_float3(_NormalBlend_58a0c0d45b55168cbfa43fa9d9da21c6_Out_2_Vector3, _NormalStrength_3204e89c6d863484958f2b78ddab5dd5_Out_2_Vector3, (_UseDynamicCoverTStaticMaskF_ea4efcf79fa41489897aef4bbf5e655f_Out_0_Float.xxx), _Lerp_ddd428cec97e91869b2eec0aace3820c_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_3876d08547d6ec8797d20cbe2c48586d_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseMaskMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_473741cc1ef44c87bb090c6f2487c368;
            _PlanarNM_473741cc1ef44c87bb090c6f2487c368.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_473741cc1ef44c87bb090c6f2487c368.uv0 = IN.uv0;
            _PlanarNM_473741cc1ef44c87bb090c6f2487c368.uv2 = IN.uv2;
            float4 _PlanarNM_473741cc1ef44c87bb090c6f2487c368_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_3876d08547d6ec8797d20cbe2c48586d_Out_0_Texture2D, _Property_e21be9beec8d858fa2818b2fddc4577c_Out_0_Vector4, _Property_1b1963c0ccb4d78fa3474b362fd31d15_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), 1, _PlanarNM_473741cc1ef44c87bb090c6f2487c368, _PlanarNM_473741cc1ef44c87bb090c6f2487c368_XZ_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_7fe5eb12669d4c8a8c20f31f338c8397_R_1_Float = _PlanarNM_473741cc1ef44c87bb090c6f2487c368_XZ_2_Vector4[0];
            float _Split_7fe5eb12669d4c8a8c20f31f338c8397_G_2_Float = _PlanarNM_473741cc1ef44c87bb090c6f2487c368_XZ_2_Vector4[1];
            float _Split_7fe5eb12669d4c8a8c20f31f338c8397_B_3_Float = _PlanarNM_473741cc1ef44c87bb090c6f2487c368_XZ_2_Vector4[2];
            float _Split_7fe5eb12669d4c8a8c20f31f338c8397_A_4_Float = _PlanarNM_473741cc1ef44c87bb090c6f2487c368_XZ_2_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_0341eeccbc4d978a896181416653e2ff_Out_0_Float = _BaseMetallic;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_278b207135e2778aa9bf8d0a7a017a40_Out_2_Float;
            Unity_Multiply_float_float(_Split_7fe5eb12669d4c8a8c20f31f338c8397_R_1_Float, _Property_0341eeccbc4d978a896181416653e2ff_Out_0_Float, _Multiply_278b207135e2778aa9bf8d0a7a017a40_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_49c4138948a1c783b243279625c9552d_Out_0_Float = _BaseAORemapMin;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_dfb5b686d2c404848a58258dd35097bd_Out_0_Float = _BaseAORemapMax;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_284734915ee7d58bb51f29ca62e42039_Out_0_Vector2 = float2(_Property_49c4138948a1c783b243279625c9552d_Out_0_Float, _Property_dfb5b686d2c404848a58258dd35097bd_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_b7cb902e80b8978c9cb00dc6468bac09_Out_3_Float;
            Unity_Remap_float(_Split_7fe5eb12669d4c8a8c20f31f338c8397_G_2_Float, float2 (0, 1), _Vector2_284734915ee7d58bb51f29ca62e42039_Out_0_Vector2, _Remap_b7cb902e80b8978c9cb00dc6468bac09_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_e8e0c807c3942d85896691316499350a_Out_0_Float = _BaseSmoothnessRemapMin;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_0549faf3f215b988850044d78c536992_Out_0_Float = _BaseSmoothnessRemapMax;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_6f793600058fe9809ed375dab39006b9_Out_0_Vector2 = float2(_Property_e8e0c807c3942d85896691316499350a_Out_0_Float, _Property_0549faf3f215b988850044d78c536992_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_13ead59094b737848900d4e63ebebbb3_Out_3_Float;
            Unity_Remap_float(_Split_7fe5eb12669d4c8a8c20f31f338c8397_A_4_Float, float2 (0, 1), _Vector2_6f793600058fe9809ed375dab39006b9_Out_0_Vector2, _Remap_13ead59094b737848900d4e63ebebbb3_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_f7a4b1832ea11a8a8ec52972758cc9e4_Out_2_Float;
            Unity_Multiply_float_float(_SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_B_6_Float, 2, _Multiply_f7a4b1832ea11a8a8ec52972758cc9e4_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_0b75140e53d72d83ae3e255de46e5da4_Out_2_Float;
            Unity_Add_float(_Multiply_f7a4b1832ea11a8a8ec52972758cc9e4_Out_2_Float, float(-1), _Add_0b75140e53d72d83ae3e255de46e5da4_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_39a9bd06e1c7a280af50cd2a384e4438_Out_0_Float = _DetailSmoothnessScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_abefbf3a3f84e0899238487765d0c6d8_Out_2_Float;
            Unity_Multiply_float_float(_Add_0b75140e53d72d83ae3e255de46e5da4_Out_2_Float, _Property_39a9bd06e1c7a280af50cd2a384e4438_Out_0_Float, _Multiply_abefbf3a3f84e0899238487765d0c6d8_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Saturate_d2b0d0dfd4b474868a4ef5f31a175a50_Out_1_Float;
            Unity_Saturate_float(_Multiply_abefbf3a3f84e0899238487765d0c6d8_Out_2_Float, _Saturate_d2b0d0dfd4b474868a4ef5f31a175a50_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Absolute_b19c5992c0eef288b5f88b7297531b62_Out_1_Float;
            Unity_Absolute_float(_Saturate_d2b0d0dfd4b474868a4ef5f31a175a50_Out_1_Float, _Absolute_b19c5992c0eef288b5f88b7297531b62_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_BlendOverlayDetailSmoothness_06e12138dc89c0040b45a57abe520a1a_float _BlendOverlayDetailSmoothness_583d8fed3a50da838e161b9e32275570;
            float _BlendOverlayDetailSmoothness_583d8fed3a50da838e161b9e32275570_SmoothnessOverlay_1_Float;
            SG_BlendOverlayDetailSmoothness_06e12138dc89c0040b45a57abe520a1a_float(_Remap_13ead59094b737848900d4e63ebebbb3_Out_3_Float, _Add_0b75140e53d72d83ae3e255de46e5da4_Out_2_Float, _Absolute_b19c5992c0eef288b5f88b7297531b62_Out_1_Float, _BlendOverlayDetailSmoothness_583d8fed3a50da838e161b9e32275570, _BlendOverlayDetailSmoothness_583d8fed3a50da838e161b9e32275570_SmoothnessOverlay_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Saturate_022595f0f1136682a367ce4fee42f768_Out_1_Float;
            Unity_Saturate_float(_BlendOverlayDetailSmoothness_583d8fed3a50da838e161b9e32275570_SmoothnessOverlay_1_Float, _Saturate_022595f0f1136682a367ce4fee42f768_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Vector3_05b64199abf81188ad251e6cb71cc2c8_Out_0_Vector3 = float3(_Multiply_278b207135e2778aa9bf8d0a7a017a40_Out_2_Float, _Remap_b7cb902e80b8978c9cb00dc6468bac09_Out_3_Float, _Saturate_022595f0f1136682a367ce4fee42f768_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_b603ccfd42f8ef88a78978820f2d2591_Out_0_Float = _CoverMetallic;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_fa4c21b20cf56b8c8844b015bde2d666_Out_2_Float;
            Unity_Multiply_float_float(_Split_d45fa36c68c6428bb4f8080e2005e0ec_R_1_Float, _Property_b603ccfd42f8ef88a78978820f2d2591_Out_0_Float, _Multiply_fa4c21b20cf56b8c8844b015bde2d666_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_49d9c484bdaf088aab97c0f3d87179a4_Out_0_Float = _CoverAORemapMin;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_9b3d764b53fbc9808fd7a6fd7c73993e_Out_0_Float = _CoverAORemapMax;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_787cdcc8eed2fb86afe1dad66892a963_Out_0_Vector2 = float2(_Property_49d9c484bdaf088aab97c0f3d87179a4_Out_0_Float, _Property_9b3d764b53fbc9808fd7a6fd7c73993e_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_0c91273704cf6f8d80d2365c0311db0c_Out_3_Float;
            Unity_Remap_float(_Split_d45fa36c68c6428bb4f8080e2005e0ec_G_2_Float, float2 (0, 1), _Vector2_787cdcc8eed2fb86afe1dad66892a963_Out_0_Vector2, _Remap_0c91273704cf6f8d80d2365c0311db0c_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_312e366a6f346c8a93a9a101b9407a7f_Out_0_Float = _CoverSmoothnessRemapMin;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_cbd9db9d07c3068cbc64c30b3ca0e64b_Out_0_Float = _CoverSmoothnessRemapMax;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_33727db9c2402f859e7bf0e16d80cb40_Out_0_Vector2 = float2(_Property_312e366a6f346c8a93a9a101b9407a7f_Out_0_Float, _Property_cbd9db9d07c3068cbc64c30b3ca0e64b_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_5f073c5f6df66687a17442ebcfddc751_Out_3_Float;
            Unity_Remap_float(_Split_d45fa36c68c6428bb4f8080e2005e0ec_A_4_Float, float2 (0, 1), _Vector2_33727db9c2402f859e7bf0e16d80cb40_Out_0_Vector2, _Remap_5f073c5f6df66687a17442ebcfddc751_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Vector3_3d691bd99e22fd8fb81324aa1809d41a_Out_0_Vector3 = float3(_Multiply_fa4c21b20cf56b8c8844b015bde2d666_Out_2_Float, _Remap_0c91273704cf6f8d80d2365c0311db0c_Out_3_Float, _Remap_5f073c5f6df66687a17442ebcfddc751_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Lerp_c37c1874c700ef83ac7f382075fc755f_Out_3_Vector3;
            Unity_Lerp_float3(_Vector3_05b64199abf81188ad251e6cb71cc2c8_Out_0_Vector3, _Vector3_3d691bd99e22fd8fb81324aa1809d41a_Out_0_Vector3, (_UseDynamicCoverTStaticMaskF_ea4efcf79fa41489897aef4bbf5e655f_Out_0_Float.xxx), _Lerp_c37c1874c700ef83ac7f382075fc755f_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_837d0b2f5d8ac989b3977f5f374d2bb2_R_1_Float = _Lerp_c37c1874c700ef83ac7f382075fc755f_Out_3_Vector3[0];
            float _Split_837d0b2f5d8ac989b3977f5f374d2bb2_G_2_Float = _Lerp_c37c1874c700ef83ac7f382075fc755f_Out_3_Vector3[1];
            float _Split_837d0b2f5d8ac989b3977f5f374d2bb2_B_3_Float = _Lerp_c37c1874c700ef83ac7f382075fc755f_Out_3_Vector3[2];
            float _Split_837d0b2f5d8ac989b3977f5f374d2bb2_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_b3ccd24affa1b388a6dd4b19eaed8757_Out_0_Float = _WetSmoothness;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Lerp_73844a0c1a0eea8ea0563041ca489a0e_Out_3_Float;
            Unity_Lerp_float(_Split_837d0b2f5d8ac989b3977f5f374d2bb2_B_3_Float, _Property_b3ccd24affa1b388a6dd4b19eaed8757_Out_0_Float, _OneMinus_93980743aa69fb86bf250c5a7d50ef20_Out_1_Float, _Lerp_73844a0c1a0eea8ea0563041ca489a0e_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_4bb7737116edbd81bca06201348456ea_R_1_Float = _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae_XZ_2_Vector4[0];
            float _Split_4bb7737116edbd81bca06201348456ea_G_2_Float = _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae_XZ_2_Vector4[1];
            float _Split_4bb7737116edbd81bca06201348456ea_B_3_Float = _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae_XZ_2_Vector4[2];
            float _Split_4bb7737116edbd81bca06201348456ea_A_4_Float = _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae_XZ_2_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_f9637076944eae8abdcc79dc2702814b_Out_0_Float = _AlphaCutoff;
            #endif
            surface.BaseColor = _Lerp_19abc331acee5482a25ee61d5a1861cf_Out_3_Vector3;
            surface.NormalTS = _Lerp_ddd428cec97e91869b2eec0aace3820c_Out_3_Vector3;
            surface.Emission = float3(0, 0, 0);
            surface.Metallic = _Split_837d0b2f5d8ac989b3977f5f374d2bb2_R_1_Float;
            surface.Specular = IsGammaSpace() ? float3(0.5, 0.5, 0.5) : SRGBToLinear(float3(0.5, 0.5, 0.5));
            surface.Smoothness = _Lerp_73844a0c1a0eea8ea0563041ca489a0e_Out_3_Float;
            surface.Occlusion = _Split_837d0b2f5d8ac989b3977f5f374d2bb2_G_2_Float;
            surface.Alpha = _Split_4bb7737116edbd81bca06201348456ea_A_4_Float;
            surface.AlphaClipThreshold = _Property_f9637076944eae8abdcc79dc2702814b_Out_0_Float;
            return surface;
        }
        
        // --------------------------------------------------
        // Build Graph Inputs
        #ifdef HAVE_VFX_MODIFICATION
        #define VFX_SRP_ATTRIBUTES Attributes
        #define VFX_SRP_VARYINGS Varyings
        #define VFX_SRP_SURFACE_INPUTS SurfaceDescriptionInputs
        #endif
        VertexDescriptionInputs BuildVertexDescriptionInputs(Attributes input)
        {
            VertexDescriptionInputs output;
            ZERO_INITIALIZE(VertexDescriptionInputs, output);
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.ObjectSpaceNormal =                          input.normalOS;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.ObjectSpaceTangent =                         input.tangentOS.xyz;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.ObjectSpacePosition =                        input.positionOS;
        #endif
        
        #if UNITY_ANY_INSTANCING_ENABLED
        #else // TODO: XR support for procedural instancing because in this case UNITY_ANY_INSTANCING_ENABLED is not defined and instanceID is incorrect.
        #endif
        
            return output;
        }
        SurfaceDescriptionInputs BuildSurfaceDescriptionInputs(Varyings input)
        {
            SurfaceDescriptionInputs output;
            ZERO_INITIALIZE(SurfaceDescriptionInputs, output);
        
        #ifdef HAVE_VFX_MODIFICATION
        #if VFX_USE_GRAPH_VALUES
            uint instanceActiveIndex = asuint(UNITY_ACCESS_INSTANCED_PROP(PerInstance, _InstanceActiveIndex));
            /* WARNING: $splice Could not find named fragment 'VFXLoadGraphValues' */
        #endif
            /* WARNING: $splice Could not find named fragment 'VFXSetFragInputs' */
        
        #endif
        
            
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        // must use interpolated tangent, bitangent and normal before they are normalized in the pixel shader.
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        float3 unnormalizedNormalWS = input.normalWS;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        const float renormFactor = 1.0 / length(unnormalizedNormalWS);
        #endif
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        // use bitangent on the fly like in hdrp
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        // IMPORTANT! If we ever support Flip on double sided materials ensure bitangent and tangent are NOT flipped.
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        float crossSign = (input.tangentWS.w > 0.0 ? 1.0 : -1.0)* GetOddNegativeScale();
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        float3 bitang = crossSign * cross(input.normalWS.xyz, input.tangentWS.xyz);
        #endif
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.WorldSpaceNormal = renormFactor * input.normalWS.xyz;      // we want a unit length Normal Vector node in shader graph
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.TangentSpaceNormal = float3(0.0f, 0.0f, 1.0f);
        #endif
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        // to pr               eserve mikktspace compliance we use same scale renormFactor as was used on the normal.
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        // This                is explained in section 2.2 in "surface gradient based bump mapping framework"
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.WorldSpaceTangent = renormFactor * input.tangentWS.xyz;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.WorldSpaceBiTangent = renormFactor * bitang;
        #endif
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.WorldSpacePosition = input.positionWS;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.AbsoluteWorldSpacePosition = GetAbsolutePositionWS(input.positionWS);
        #endif
        
        
            #if UNITY_UV_STARTS_AT_TOP
            #else
            #endif
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.uv0 = input.texCoord0;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.uv2 = input.texCoord2;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.VertexColor = input.color;
        #endif
        
        #if UNITY_ANY_INSTANCING_ENABLED
        #else // TODO: XR support for procedural instancing because in this case UNITY_ANY_INSTANCING_ENABLED is not defined and instanceID is incorrect.
        #endif
        #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN output.FaceSign =                    IS_FRONT_VFACE(input.cullFace, true, false);
        #else
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        #endif
        #undef BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        
                return output;
        }
        
        // --------------------------------------------------
        // Main
        
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/PBRForwardPass.hlsl"
        
        // --------------------------------------------------
        // Visual Effect Vertex Invocations
        #ifdef HAVE_VFX_MODIFICATION
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
        #endif
        
        ENDHLSL
        }
        Pass
        {
            Name "GBuffer"
            Tags
            {
                "LightMode" = "UniversalGBuffer"
            }
        
        // Render State
        Cull [_Cull]
        Blend [_SrcBlend] [_DstBlend]
        ZTest [_ZTest]
        ZWrite [_ZWrite]
        
        // Debug
        // <None>
        
        // --------------------------------------------------
        // Pass
        
        HLSLPROGRAM
        
        // Pragmas
        #pragma target 4.5
        #pragma exclude_renderers gles3 glcore
        #pragma multi_compile_instancing
        #pragma multi_compile_fog
        #pragma instancing_options renderinglayer
        #pragma vertex vert
        #pragma fragment frag
        
        // Keywords
        #pragma multi_compile _ LIGHTMAP_ON
        #pragma multi_compile _ DYNAMICLIGHTMAP_ON
        #pragma multi_compile _ DIRLIGHTMAP_COMBINED
        #pragma multi_compile _ USE_LEGACY_LIGHTMAPS
        #pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN
        #pragma multi_compile_fragment _ _REFLECTION_PROBE_BLENDING
        #pragma multi_compile_fragment _ _REFLECTION_PROBE_BOX_PROJECTION
        #pragma multi_compile_fragment _ _SHADOWS_SOFT _SHADOWS_SOFT_LOW _SHADOWS_SOFT_MEDIUM _SHADOWS_SOFT_HIGH
        #pragma multi_compile _ LIGHTMAP_SHADOW_MIXING
        #pragma multi_compile _ SHADOWS_SHADOWMASK
        #pragma multi_compile _ _MIXED_LIGHTING_SUBTRACTIVE
        #pragma multi_compile_fragment _ _DBUFFER_MRT1 _DBUFFER_MRT2 _DBUFFER_MRT3
        #pragma multi_compile_fragment _ _GBUFFER_NORMALS_OCT
        #pragma multi_compile_fragment _ _RENDER_PASS_ENABLED
        #pragma multi_compile_fragment _ DEBUG_DISPLAY
        #pragma shader_feature_fragment _ _SURFACE_TYPE_TRANSPARENT
        #pragma shader_feature_local_fragment _ _ALPHAPREMULTIPLY_ON
        #pragma shader_feature_local_fragment _ _ALPHAMODULATE_ON
        #pragma shader_feature_local_fragment _ _ALPHATEST_ON
        #pragma shader_feature_local_fragment _ _SPECULAR_SETUP
        #pragma shader_feature_local _ _RECEIVE_SHADOWS_OFF
        #pragma multi_compile _ LOD_FADE_CROSSFADE
        #pragma shader_feature_local _ _USEDYNAMICCOVERTSTATICMASKF_ON
        
        #if defined(_USEDYNAMICCOVERTSTATICMASKF_ON)
            #define KEYWORD_PERMUTATION_0
        #else
            #define KEYWORD_PERMUTATION_1
        #endif
        
        
        // Defines
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define _NORMALMAP 1
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define _NORMAL_DROPOFF_TS 1
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_NORMAL
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_TANGENT
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_TEXCOORD0
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_TEXCOORD1
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_TEXCOORD2
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_COLOR
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define FEATURES_GRAPH_VERTEX_NORMAL_OUTPUT
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define FEATURES_GRAPH_VERTEX_TANGENT_OUTPUT
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_POSITION_WS
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_NORMAL_WS
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_TANGENT_WS
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_TEXCOORD0
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_TEXCOORD2
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_COLOR
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_FOG_AND_VERTEX_LIGHT
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_SHADOW_COORD
        #endif
        
        #define FEATURES_GRAPH_VERTEX
        /* WARNING: $splice Could not find named fragment 'PassInstancing' */
        #define SHADERPASS SHADERPASS_GBUFFER
        #define _FOG_FRAGMENT 1
        #define USE_UNITY_CROSSFADE 1
        
        
        // custom interpolator pre-include
        /* WARNING: $splice Could not find named fragment 'sgci_CustomInterpolatorPreInclude' */
        
        // Includes
        #include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
        #include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/RenderingLayers.hlsl"
        #include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ProbeVolumeVariants.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
        #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Shadows.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DBuffer.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
        
        // --------------------------------------------------
        // Structs and Packing
        
        // custom interpolators pre packing
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPrePacking' */
        
        struct Attributes
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 positionOS : POSITION;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 normalOS : NORMAL;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 tangentOS : TANGENT;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv0 : TEXCOORD0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv1 : TEXCOORD1;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv2 : TEXCOORD2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 color : COLOR;
            #endif
            #if UNITY_ANY_INSTANCING_ENABLED || defined(ATTRIBUTES_NEED_INSTANCEID)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint instanceID : INSTANCEID_SEMANTIC;
            #endif
            #endif
        };
        struct Varyings
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 positionCS : SV_POSITION;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 positionWS;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 normalWS;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 tangentWS;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 color;
            #endif
            #if defined(LIGHTMAP_ON)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float2 staticLightmapUV;
            #endif
            #endif
            #if defined(DYNAMICLIGHTMAP_ON)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float2 dynamicLightmapUV;
            #endif
            #endif
            #if !defined(LIGHTMAP_ON)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 sh;
            #endif
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 fogFactorAndVertexLight;
            #endif
            #if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 shadowCoord;
            #endif
            #endif
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
            #endif
        };
        struct SurfaceDescriptionInputs
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 WorldSpaceNormal;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 TangentSpaceNormal;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 WorldSpaceTangent;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 WorldSpaceBiTangent;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 WorldSpacePosition;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 AbsoluteWorldSpacePosition;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 VertexColor;
            #endif
        };
        struct VertexDescriptionInputs
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 ObjectSpaceNormal;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 ObjectSpaceTangent;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 ObjectSpacePosition;
            #endif
        };
        struct PackedVaryings
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 positionCS : SV_POSITION;
            #endif
            #if defined(LIGHTMAP_ON)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float2 staticLightmapUV : INTERP0;
            #endif
            #endif
            #if defined(DYNAMICLIGHTMAP_ON)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float2 dynamicLightmapUV : INTERP1;
            #endif
            #endif
            #if !defined(LIGHTMAP_ON)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 sh : INTERP2;
            #endif
            #endif
            #if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 shadowCoord : INTERP3;
            #endif
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 tangentWS : INTERP4;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord0 : INTERP5;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord2 : INTERP6;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 color : INTERP7;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 fogFactorAndVertexLight : INTERP8;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 positionWS : INTERP9;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 normalWS : INTERP10;
            #endif
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
            #endif
        };
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        PackedVaryings PackVaryings (Varyings input)
        {
            PackedVaryings output;
            ZERO_INITIALIZE(PackedVaryings, output);
            output.positionCS = input.positionCS;
            #if defined(LIGHTMAP_ON)
            output.staticLightmapUV = input.staticLightmapUV;
            #endif
            #if defined(DYNAMICLIGHTMAP_ON)
            output.dynamicLightmapUV = input.dynamicLightmapUV;
            #endif
            #if !defined(LIGHTMAP_ON)
            output.sh = input.sh;
            #endif
            #if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
            output.shadowCoord = input.shadowCoord;
            #endif
            output.tangentWS.xyzw = input.tangentWS;
            output.texCoord0.xyzw = input.texCoord0;
            output.texCoord2.xyzw = input.texCoord2;
            output.color.xyzw = input.color;
            output.fogFactorAndVertexLight.xyzw = input.fogFactorAndVertexLight;
            output.positionWS.xyz = input.positionWS;
            output.normalWS.xyz = input.normalWS;
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        
        Varyings UnpackVaryings (PackedVaryings input)
        {
            Varyings output;
            output.positionCS = input.positionCS;
            #if defined(LIGHTMAP_ON)
            output.staticLightmapUV = input.staticLightmapUV;
            #endif
            #if defined(DYNAMICLIGHTMAP_ON)
            output.dynamicLightmapUV = input.dynamicLightmapUV;
            #endif
            #if !defined(LIGHTMAP_ON)
            output.sh = input.sh;
            #endif
            #if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
            output.shadowCoord = input.shadowCoord;
            #endif
            output.tangentWS = input.tangentWS.xyzw;
            output.texCoord0 = input.texCoord0.xyzw;
            output.texCoord2 = input.texCoord2.xyzw;
            output.color = input.color.xyzw;
            output.fogFactorAndVertexLight = input.fogFactorAndVertexLight.xyzw;
            output.positionWS = input.positionWS.xyz;
            output.normalWS = input.normalWS.xyz;
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        #endif
        
        // --------------------------------------------------
        // Graph
        
        // Graph Properties
        CBUFFER_START(UnityPerMaterial)
        float _AlphaCutoff;
        float4 _BaseColor;
        float4 _BaseColorMap_TexelSize;
        float _BaseUsePlanarUV;
        float4 _BaseTilingOffset;
        float4 _BaseNormalMap_TexelSize;
        float _BaseNormalScale;
        float4 _BaseMaskMap_TexelSize;
        float _BaseMetallic;
        float _BaseAORemapMin;
        float _BaseAORemapMax;
        float _BaseSmoothnessRemapMin;
        float _BaseSmoothnessRemapMax;
        float4 _CoverMaskA_TexelSize;
        float _CoverMaskPower;
        float _Cover_Amount;
        float _Cover_Amount_Grow_Speed;
        float3 _CoverDirection;
        float _Cover_Max_Angle;
        float _Cover_Min_Height;
        float _Cover_Min_Height_Blending;
        float4 _CoverBaseColor;
        float4 _CoverBaseColorMap_TexelSize;
        float4 _CoverTilingOffset;
        float _CoverTriplanarThreshold;
        float4 _CoverNormalMap_TexelSize;
        float _CoverNormalScale;
        float _CoverNormalBlendHardness;
        float _CoverHardness;
        float _CoverHeightMapMin;
        float _CoverHeightMapMax;
        float _CoverHeightMapOffset;
        float4 _CoverMaskMap_TexelSize;
        float _CoverMetallic;
        float _CoverAORemapMin;
        float _CoverAORemapMax;
        float _CoverSmoothnessRemapMin;
        float _CoverSmoothnessRemapMax;
        float4 _DetailMap_TexelSize;
        float4 _DetailTilingOffset;
        float _DetailAlbedoScale;
        float _DetailNormalScale;
        float _DetailSmoothnessScale;
        float4 _WetColor;
        float _WetSmoothness;
        UNITY_TEXTURE_STREAMING_DEBUG_VARS;
        CBUFFER_END
        
        
        // Object and Global properties
        SAMPLER(SamplerState_Linear_Repeat);
        SAMPLER(SamplerState_Linear_Repeat_Aniso8);
        TEXTURE2D(_BaseColorMap);
        SAMPLER(sampler_BaseColorMap);
        TEXTURE2D(_BaseNormalMap);
        SAMPLER(sampler_BaseNormalMap);
        TEXTURE2D(_BaseMaskMap);
        SAMPLER(sampler_BaseMaskMap);
        TEXTURE2D(_CoverMaskA);
        SAMPLER(sampler_CoverMaskA);
        TEXTURE2D(_CoverBaseColorMap);
        SAMPLER(sampler_CoverBaseColorMap);
        TEXTURE2D(_CoverNormalMap);
        SAMPLER(sampler_CoverNormalMap);
        TEXTURE2D(_CoverMaskMap);
        SAMPLER(sampler_CoverMaskMap);
        TEXTURE2D(_DetailMap);
        SAMPLER(sampler_DetailMap);
        
        // Graph Includes
        // GraphIncludes: <None>
        
        // -- Property used by ScenePickingPass
        #ifdef SCENEPICKINGPASS
        float4 _SelectionID;
        #endif
        
        // -- Properties used by SceneSelectionPass
        #ifdef SCENESELECTIONPASS
        int _ObjectId;
        int _PassValue;
        #endif
        
        // Graph Functions
        
        void Unity_Combine_float(float R, float G, float B, float A, out float4 RGBA, out float3 RGB, out float2 RG)
        {
            RGBA = float4(R, G, B, A);
            RGB = float3(R, G, B);
            RG = float2(R, G);
        }
        
        void Unity_Divide_float(float A, float B, out float Out)
        {
            Out = A / B;
        }
        
        void Unity_Multiply_float4_float4(float4 A, float4 B, out float4 Out)
        {
        Out = A * B;
        }
        
        void Unity_Branch_float4(float Predicate, float4 True, float4 False, out float4 Out)
        {
            Out = Predicate ? True : False;
        }
        
        void Unity_TilingAndOffset_float(float2 UV, float2 Tiling, float2 Offset, out float2 Out)
        {
            Out = UV * Tiling + Offset;
        }
        
        void Unity_Branch_float2(float Predicate, float2 True, float2 False, out float2 Out)
        {
            Out = Predicate ? True : False;
        }
        
        struct Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float
        {
        float3 AbsoluteWorldSpacePosition;
        half4 uv0;
        half4 uv2;
        };
        
        void SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(UnityTexture2D Texture2D_80A3D28F, float4 Vector4_2EBA7A3B, float Boolean_7ABB9909, UnitySamplerState _SamplerState, float Boolean_5ddfe6daabcc4715a44b5f34fc19becb, Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float IN, out float4 XZ_2)
        {
        UnityTexture2D _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D = Texture2D_80A3D28F;
        float _Property_30834f691775a0898a45b1c868520436_Out_0_Boolean = Boolean_7ABB9909;
        float _Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
        float _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
        float _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
        float _Split_89ed63cb625cb3878c183d0b71c03400_A_4_Float = 0;
        float4 _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4;
        float3 _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3;
        float2 _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, float(0), float(0), _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3, _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2);
        float4 _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4 = Vector4_2EBA7A3B;
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_R_1_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[0];
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_G_2_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[1];
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_B_3_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[2];
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_A_4_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[3];
        float _Divide_e64179199923c58289b6aa94ea6c9178_Out_2_Float;
        Unity_Divide_float(float(1), _Split_2f0f52f6ef8c0e81af0da6476402bc1f_R_1_Float, _Divide_e64179199923c58289b6aa94ea6c9178_Out_2_Float);
        float4 _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, (_Divide_e64179199923c58289b6aa94ea6c9178_Out_2_Float.xxxx), _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4);
        float _Property_f17c7bf877e64b6abdd66b1fe9f5accc_Out_0_Boolean = Boolean_5ddfe6daabcc4715a44b5f34fc19becb;
        float4 _UV_029e8e8198564838b9389b902a09fb22_Out_0_Vector4 = IN.uv0;
        float4 _UV_7a6209af1506424fb75c81e87e42035a_Out_0_Vector4 = IN.uv2;
        float4 _Branch_fc37bb4bf641457cbbc6e290603056ff_Out_3_Vector4;
        Unity_Branch_float4(_Property_f17c7bf877e64b6abdd66b1fe9f5accc_Out_0_Boolean, _UV_029e8e8198564838b9389b902a09fb22_Out_0_Vector4, _UV_7a6209af1506424fb75c81e87e42035a_Out_0_Vector4, _Branch_fc37bb4bf641457cbbc6e290603056ff_Out_3_Vector4);
        float2 _Vector2_16c15d3bbdd14b85bd48e3a6cb318af7_Out_0_Vector2 = float2(_Split_2f0f52f6ef8c0e81af0da6476402bc1f_R_1_Float, _Split_2f0f52f6ef8c0e81af0da6476402bc1f_G_2_Float);
        float2 _Vector2_f8d75f54e7705083bbec539a60185577_Out_0_Vector2 = float2(_Split_2f0f52f6ef8c0e81af0da6476402bc1f_B_3_Float, _Split_2f0f52f6ef8c0e81af0da6476402bc1f_A_4_Float);
        float2 _TilingAndOffset_d91e2d25acd34686b562b7fe7e9d1d27_Out_3_Vector2;
        Unity_TilingAndOffset_float((_Branch_fc37bb4bf641457cbbc6e290603056ff_Out_3_Vector4.xy), _Vector2_16c15d3bbdd14b85bd48e3a6cb318af7_Out_0_Vector2, _Vector2_f8d75f54e7705083bbec539a60185577_Out_0_Vector2, _TilingAndOffset_d91e2d25acd34686b562b7fe7e9d1d27_Out_3_Vector2);
        float2 _Branch_8e5a4e8f4d52fc8aadd1f46485afc933_Out_3_Vector2;
        Unity_Branch_float2(_Property_30834f691775a0898a45b1c868520436_Out_0_Boolean, (_Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4.xy), _TilingAndOffset_d91e2d25acd34686b562b7fe7e9d1d27_Out_3_Vector2, _Branch_8e5a4e8f4d52fc8aadd1f46485afc933_Out_3_Vector2);
        UnitySamplerState _Property_e8746b9475c94530ba35ba8019ad2ae0_Out_0_SamplerState = _SamplerState;
        float4 _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, _Property_e8746b9475c94530ba35ba8019ad2ae0_Out_0_SamplerState.samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Branch_8e5a4e8f4d52fc8aadd1f46485afc933_Out_3_Vector2) );
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.r;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.g;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.b;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_A_7_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.a;
        XZ_2 = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4;
        }
        
        void Unity_Multiply_float_float(float A, float B, out float Out)
        {
            Out = A * B;
        }
        
        void Unity_Add_float(float A, float B, out float Out)
        {
            Out = A + B;
        }
        
        void Unity_Saturate_float(float In, out float Out)
        {
            Out = saturate(In);
        }
        
        void Unity_Absolute_float(float In, out float Out)
        {
            Out = abs(In);
        }
        
        void Unity_SquareRoot_float4(float4 In, out float4 Out)
        {
            Out = sqrt(In);
        }
        
        void Unity_Sign_float(float In, out float Out)
        {
            Out = sign(In);
        }
        
        void Unity_Ceiling_float(float In, out float Out)
        {
            Out = ceil(In);
        }
        
        void Unity_Lerp_float4(float4 A, float4 B, float4 T, out float4 Out)
        {
            Out = lerp(A, B, T);
        }
        
        struct Bindings_BlendOverlayBaseColor_acdb3dfca72bd6b42bbc35f4613331a2_float
        {
        };
        
        void SG_BlendOverlayBaseColor_acdb3dfca72bd6b42bbc35f4613331a2_float(float4 Color_9AA111D3, float Vector1_FBE622A2, float Vector1_8C15C351, Bindings_BlendOverlayBaseColor_acdb3dfca72bd6b42bbc35f4613331a2_float IN, out float3 OutVector4_1)
        {
        float4 _Property_012510d774fb7f8b860f5270dca4500f_Out_0_Vector4 = Color_9AA111D3;
        float4 _SquareRoot_c2c57d0223a9538aa9240890c3cacb0c_Out_1_Vector4;
        Unity_SquareRoot_float4(_Property_012510d774fb7f8b860f5270dca4500f_Out_0_Vector4, _SquareRoot_c2c57d0223a9538aa9240890c3cacb0c_Out_1_Vector4);
        float _Property_a00e29241d12f983b30177515b367ec9_Out_0_Float = Vector1_FBE622A2;
        float _Sign_343a45ede7349283a681c6bd9998fd8e_Out_1_Float;
        Unity_Sign_float(_Property_a00e29241d12f983b30177515b367ec9_Out_0_Float, _Sign_343a45ede7349283a681c6bd9998fd8e_Out_1_Float);
        float _Add_681019b8f5d3d68bb482d419c9fc61a9_Out_2_Float;
        Unity_Add_float(_Sign_343a45ede7349283a681c6bd9998fd8e_Out_1_Float, float(1), _Add_681019b8f5d3d68bb482d419c9fc61a9_Out_2_Float);
        float _Multiply_e8f4cb722712a880ac0db6c7461427f7_Out_2_Float;
        Unity_Multiply_float_float(_Add_681019b8f5d3d68bb482d419c9fc61a9_Out_2_Float, 0.5, _Multiply_e8f4cb722712a880ac0db6c7461427f7_Out_2_Float);
        float _Ceiling_95ad15988aa9b98184875fa754feae01_Out_1_Float;
        Unity_Ceiling_float(_Multiply_e8f4cb722712a880ac0db6c7461427f7_Out_2_Float, _Ceiling_95ad15988aa9b98184875fa754feae01_Out_1_Float);
        float _Property_2db1c747a05ee284a8b00076062f91a4_Out_0_Float = Vector1_8C15C351;
        float _Multiply_9564ecda5193bc8286d9ff771c9226cd_Out_2_Float;
        Unity_Multiply_float_float(_Property_2db1c747a05ee284a8b00076062f91a4_Out_0_Float, _Property_2db1c747a05ee284a8b00076062f91a4_Out_0_Float, _Multiply_9564ecda5193bc8286d9ff771c9226cd_Out_2_Float);
        float4 _Lerp_b3cdb01fc3c5b988ac9b184943bf7c01_Out_3_Vector4;
        Unity_Lerp_float4(_SquareRoot_c2c57d0223a9538aa9240890c3cacb0c_Out_1_Vector4, (_Ceiling_95ad15988aa9b98184875fa754feae01_Out_1_Float.xxxx), (_Multiply_9564ecda5193bc8286d9ff771c9226cd_Out_2_Float.xxxx), _Lerp_b3cdb01fc3c5b988ac9b184943bf7c01_Out_3_Vector4);
        float4 _Multiply_39d1daff98488f8ea2cd794ad4f20926_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Lerp_b3cdb01fc3c5b988ac9b184943bf7c01_Out_3_Vector4, _Lerp_b3cdb01fc3c5b988ac9b184943bf7c01_Out_3_Vector4, _Multiply_39d1daff98488f8ea2cd794ad4f20926_Out_2_Vector4);
        OutVector4_1 = (_Multiply_39d1daff98488f8ea2cd794ad4f20926_Out_2_Vector4.xyz);
        }
        
        void Unity_Divide_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A / B;
        }
        
        void Unity_Sign_float3(float3 In, out float3 Out)
        {
            Out = sign(In);
        }
        
        void Unity_Multiply_float2_float2(float2 A, float2 B, out float2 Out)
        {
        Out = A * B;
        }
        
        void Unity_Absolute_float3(float3 In, out float3 Out)
        {
            Out = abs(In);
        }
        
        void Unity_Power_float3(float3 A, float3 B, out float3 Out)
        {
            Out = pow(A, B);
        }
        
        void Unity_Multiply_float3_float3(float3 A, float3 B, out float3 Out)
        {
        Out = A * B;
        }
        
        void Unity_Add_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A + B;
        }
        
        struct Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float
        {
        float3 WorldSpaceNormal;
        float3 AbsoluteWorldSpacePosition;
        };
        
        void SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(UnityTexture2D Texture2D_80A3D28F, float Vector1_41461AC9, float Vector1_E4D1C13A, Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float IN, out float4 XYZ_1, out float4 XZ_2, out float4 YZ_3, out float4 XY_4)
        {
        UnityTexture2D _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D = Texture2D_80A3D28F;
        float _Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
        float _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
        float _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
        float _Split_89ed63cb625cb3878c183d0b71c03400_A_4_Float = 0;
        float4 _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4;
        float3 _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3;
        float2 _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, float(0), float(0), _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3, _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2);
        float _Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float = Vector1_41461AC9;
        float4 _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, (_Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float.xxxx), _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4);
        float3 _Sign_b826e0ff2d95ec8cb2b2cbbd7ea2eab6_Out_1_Vector3;
        Unity_Sign_float3(IN.WorldSpaceNormal, _Sign_b826e0ff2d95ec8cb2b2cbbd7ea2eab6_Out_1_Vector3);
        float _Split_742547a7039de986a646d04c157ae549_R_1_Float = _Sign_b826e0ff2d95ec8cb2b2cbbd7ea2eab6_Out_1_Vector3[0];
        float _Split_742547a7039de986a646d04c157ae549_G_2_Float = _Sign_b826e0ff2d95ec8cb2b2cbbd7ea2eab6_Out_1_Vector3[1];
        float _Split_742547a7039de986a646d04c157ae549_B_3_Float = _Sign_b826e0ff2d95ec8cb2b2cbbd7ea2eab6_Out_1_Vector3[2];
        float _Split_742547a7039de986a646d04c157ae549_A_4_Float = 0;
        float2 _Vector2_40a8919e571ec18499de72022c155b38_Out_0_Vector2 = float2(_Split_742547a7039de986a646d04c157ae549_G_2_Float, float(1));
        float2 _Multiply_5fa32af59cdca88389832336b2268bd5_Out_2_Vector2;
        Unity_Multiply_float2_float2((_Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4.xy), _Vector2_40a8919e571ec18499de72022c155b38_Out_0_Vector2, _Multiply_5fa32af59cdca88389832336b2268bd5_Out_2_Vector2);
        float4 _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Multiply_5fa32af59cdca88389832336b2268bd5_Out_2_Vector2) );
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.r;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.g;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.b;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_A_7_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.a;
        float3 _Absolute_644b798714827680b39bf5d34f70385f_Out_1_Vector3;
        Unity_Absolute_float3(IN.WorldSpaceNormal, _Absolute_644b798714827680b39bf5d34f70385f_Out_1_Vector3);
        float _Property_adc4c59482221c8aad681c6558728ac9_Out_0_Float = Vector1_E4D1C13A;
        float3 _Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3;
        Unity_Power_float3(_Absolute_644b798714827680b39bf5d34f70385f_Out_1_Vector3, (_Property_adc4c59482221c8aad681c6558728ac9_Out_0_Float.xxx), _Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3);
        float3 _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3, _Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3, _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3);
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_R_1_Float = _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3[0];
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_G_2_Float = _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3[1];
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_B_3_Float = _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3[2];
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_A_4_Float = 0;
        float4 _Multiply_2e1040ca9c98d085ace76ee93f094039_Out_2_Vector4;
        Unity_Multiply_float4_float4(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4, (_Split_ae83014fcbd9f7879a0b91fa66dc9718_G_2_Float.xxxx), _Multiply_2e1040ca9c98d085ace76ee93f094039_Out_2_Vector4);
        float4 _Combine_192c2c4a69be588b90ca005a32e22552_RGBA_4_Vector4;
        float3 _Combine_192c2c4a69be588b90ca005a32e22552_RGB_5_Vector3;
        float2 _Combine_192c2c4a69be588b90ca005a32e22552_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float, float(0), float(0), _Combine_192c2c4a69be588b90ca005a32e22552_RGBA_4_Vector4, _Combine_192c2c4a69be588b90ca005a32e22552_RGB_5_Vector3, _Combine_192c2c4a69be588b90ca005a32e22552_RG_6_Vector2);
        float4 _Multiply_138240d0d4846e87b0febabec0d6891b_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_192c2c4a69be588b90ca005a32e22552_RGBA_4_Vector4, (_Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float.xxxx), _Multiply_138240d0d4846e87b0febabec0d6891b_Out_2_Vector4);
        float _Multiply_014402ded5a3988a8c18ba07636ea5a7_Out_2_Float;
        Unity_Multiply_float_float(_Split_742547a7039de986a646d04c157ae549_B_3_Float, -1, _Multiply_014402ded5a3988a8c18ba07636ea5a7_Out_2_Float);
        float2 _Vector2_caa25d55d456a58982bdfc39b1b43f3f_Out_0_Vector2 = float2(_Multiply_014402ded5a3988a8c18ba07636ea5a7_Out_2_Float, float(1));
        float2 _Multiply_a67201b6e1a0a28c98cd9d06e8b09543_Out_2_Vector2;
        Unity_Multiply_float2_float2((_Multiply_138240d0d4846e87b0febabec0d6891b_Out_2_Vector4.xy), _Vector2_caa25d55d456a58982bdfc39b1b43f3f_Out_0_Vector2, _Multiply_a67201b6e1a0a28c98cd9d06e8b09543_Out_2_Vector2);
        float4 _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Multiply_a67201b6e1a0a28c98cd9d06e8b09543_Out_2_Vector2) );
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_R_4_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.r;
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_G_5_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.g;
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_B_6_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.b;
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_A_7_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.a;
        float4 _Multiply_7bb4009c92b108849ac6ca92bc1442f2_Out_2_Vector4;
        Unity_Multiply_float4_float4(_SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4, (_Split_ae83014fcbd9f7879a0b91fa66dc9718_B_3_Float.xxxx), _Multiply_7bb4009c92b108849ac6ca92bc1442f2_Out_2_Vector4);
        float4 _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGBA_4_Vector4;
        float3 _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGB_5_Vector3;
        float2 _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float, float(0), float(0), _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGBA_4_Vector4, _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGB_5_Vector3, _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RG_6_Vector2);
        float4 _Multiply_2c0864423b014f8b8af8523f68cbb63c_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGBA_4_Vector4, (_Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float.xxxx), _Multiply_2c0864423b014f8b8af8523f68cbb63c_Out_2_Vector4);
        float2 _Vector2_54dfd40df2fc78809955dd272f2cf0c3_Out_0_Vector2 = float2(_Split_742547a7039de986a646d04c157ae549_R_1_Float, float(1));
        float2 _Multiply_addbd5fcede95f80bbb806c94e49ef63_Out_2_Vector2;
        Unity_Multiply_float2_float2((_Multiply_2c0864423b014f8b8af8523f68cbb63c_Out_2_Vector4.xy), _Vector2_54dfd40df2fc78809955dd272f2cf0c3_Out_0_Vector2, _Multiply_addbd5fcede95f80bbb806c94e49ef63_Out_2_Vector2);
        float4 _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Multiply_addbd5fcede95f80bbb806c94e49ef63_Out_2_Vector2) );
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_R_4_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.r;
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_G_5_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.g;
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_B_6_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.b;
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_A_7_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.a;
        float4 _Multiply_77818c22e359fc8cbb7dd20216a8db72_Out_2_Vector4;
        Unity_Multiply_float4_float4(_SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4, (_Split_ae83014fcbd9f7879a0b91fa66dc9718_R_1_Float.xxxx), _Multiply_77818c22e359fc8cbb7dd20216a8db72_Out_2_Vector4);
        float4 _Add_769d9ee909c9238dbbf72d2800a2f268_Out_2_Vector4;
        Unity_Add_float4(_Multiply_7bb4009c92b108849ac6ca92bc1442f2_Out_2_Vector4, _Multiply_77818c22e359fc8cbb7dd20216a8db72_Out_2_Vector4, _Add_769d9ee909c9238dbbf72d2800a2f268_Out_2_Vector4);
        float4 _Add_14295f72880e4b87a1baf1ced943ac40_Out_2_Vector4;
        Unity_Add_float4(_Multiply_2e1040ca9c98d085ace76ee93f094039_Out_2_Vector4, _Add_769d9ee909c9238dbbf72d2800a2f268_Out_2_Vector4, _Add_14295f72880e4b87a1baf1ced943ac40_Out_2_Vector4);
        float _Add_e59af300bba2498db32eac1412123447_Out_2_Float;
        Unity_Add_float(_Split_ae83014fcbd9f7879a0b91fa66dc9718_R_1_Float, _Split_ae83014fcbd9f7879a0b91fa66dc9718_G_2_Float, _Add_e59af300bba2498db32eac1412123447_Out_2_Float);
        float _Add_e855069f047fae8ea9027d56acb61e56_Out_2_Float;
        Unity_Add_float(_Add_e59af300bba2498db32eac1412123447_Out_2_Float, _Split_ae83014fcbd9f7879a0b91fa66dc9718_B_3_Float, _Add_e855069f047fae8ea9027d56acb61e56_Out_2_Float);
        float4 _Divide_91ae4b94f1d9b78e99d0472293b8098c_Out_2_Vector4;
        Unity_Divide_float4(_Add_14295f72880e4b87a1baf1ced943ac40_Out_2_Vector4, (_Add_e855069f047fae8ea9027d56acb61e56_Out_2_Float.xxxx), _Divide_91ae4b94f1d9b78e99d0472293b8098c_Out_2_Vector4);
        XYZ_1 = _Divide_91ae4b94f1d9b78e99d0472293b8098c_Out_2_Vector4;
        XZ_2 = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4;
        YZ_3 = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4;
        XY_4 = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4;
        }
        
        void Unity_Clamp_float(float In, float Min, float Max, out float Out)
        {
            Out = clamp(In, Min, Max);
        }
        
        void Unity_Add_float2(float2 A, float2 B, out float2 Out)
        {
            Out = A + B;
        }
        
        void Unity_DotProduct_float2(float2 A, float2 B, out float Out)
        {
            Out = dot(A, B);
        }
        
        void Unity_OneMinus_float(float In, out float Out)
        {
            Out = 1 - In;
        }
        
        void Unity_SquareRoot_float(float In, out float Out)
        {
            Out = sqrt(In);
        }
        
        void Unity_Clamp_float3(float3 In, float3 Min, float3 Max, out float3 Out)
        {
            Out = clamp(In, Min, Max);
        }
        
        void Unity_Normalize_float3(float3 In, out float3 Out)
        {
            Out = normalize(In);
        }
        
        void Unity_Branch_float3(float Predicate, float3 True, float3 False, out float3 Out)
        {
            Out = Predicate ? True : False;
        }
        
        struct Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float
        {
        float3 WorldSpaceNormal;
        float3 WorldSpaceTangent;
        float3 WorldSpaceBiTangent;
        float3 AbsoluteWorldSpacePosition;
        half4 uv0;
        half4 uv2;
        };
        
        void SG_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float(UnityTexture2D Texture2D_80A3D28F, float4 Vector4_82674548, float Boolean_9FF42DF6, UnitySamplerState _SamplerState, float Boolean_5ddfe6daabcc4715a44b5f34fc19becb, Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float IN, out float4 XZ_2)
        {
        float _Property_1ef12cf3201a938993fe6a7951b0e754_Out_0_Boolean = Boolean_9FF42DF6;
        UnityTexture2D _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D = Texture2D_80A3D28F;
        float _Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
        float _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
        float _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
        float _Split_89ed63cb625cb3878c183d0b71c03400_A_4_Float = 0;
        float4 _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4;
        float3 _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3;
        float2 _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, float(0), float(0), _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3, _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2);
        float4 _Property_3fa1d6f912feb481ba60f2e55e62e746_Out_0_Vector4 = Vector4_82674548;
        float _Split_a2e12fa5931da084b2949343a539dfd8_R_1_Float = _Property_3fa1d6f912feb481ba60f2e55e62e746_Out_0_Vector4[0];
        float _Split_a2e12fa5931da084b2949343a539dfd8_G_2_Float = _Property_3fa1d6f912feb481ba60f2e55e62e746_Out_0_Vector4[1];
        float _Split_a2e12fa5931da084b2949343a539dfd8_B_3_Float = _Property_3fa1d6f912feb481ba60f2e55e62e746_Out_0_Vector4[2];
        float _Split_a2e12fa5931da084b2949343a539dfd8_A_4_Float = _Property_3fa1d6f912feb481ba60f2e55e62e746_Out_0_Vector4[3];
        float _Divide_c36b770dfaa0bb8f85ab27da5fd794f0_Out_2_Float;
        Unity_Divide_float(float(1), _Split_a2e12fa5931da084b2949343a539dfd8_R_1_Float, _Divide_c36b770dfaa0bb8f85ab27da5fd794f0_Out_2_Float);
        float4 _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, (_Divide_c36b770dfaa0bb8f85ab27da5fd794f0_Out_2_Float.xxxx), _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4);
        float _Property_058f4fba88c3437288219f1929444bf2_Out_0_Boolean = Boolean_5ddfe6daabcc4715a44b5f34fc19becb;
        float4 _UV_43d85b3291324c848dfbeec6adac2a71_Out_0_Vector4 = IN.uv0;
        float4 _UV_36881dcaab9040168fc5215dcd00f352_Out_0_Vector4 = IN.uv2;
        float4 _Branch_8054d58a73be4ce1b22d48a84389ae07_Out_3_Vector4;
        Unity_Branch_float4(_Property_058f4fba88c3437288219f1929444bf2_Out_0_Boolean, _UV_43d85b3291324c848dfbeec6adac2a71_Out_0_Vector4, _UV_36881dcaab9040168fc5215dcd00f352_Out_0_Vector4, _Branch_8054d58a73be4ce1b22d48a84389ae07_Out_3_Vector4);
        float2 _Vector2_6845d21872714d889783b0cb707df3e9_Out_0_Vector2 = float2(_Split_a2e12fa5931da084b2949343a539dfd8_R_1_Float, _Split_a2e12fa5931da084b2949343a539dfd8_G_2_Float);
        float2 _Vector2_e2e2263627c6098e96a5b5d29350ad03_Out_0_Vector2 = float2(_Split_a2e12fa5931da084b2949343a539dfd8_B_3_Float, _Split_a2e12fa5931da084b2949343a539dfd8_A_4_Float);
        float2 _TilingAndOffset_17582d056c0b8a8dab1017d37497fe59_Out_3_Vector2;
        Unity_TilingAndOffset_float((_Branch_8054d58a73be4ce1b22d48a84389ae07_Out_3_Vector4.xy), _Vector2_6845d21872714d889783b0cb707df3e9_Out_0_Vector2, _Vector2_e2e2263627c6098e96a5b5d29350ad03_Out_0_Vector2, _TilingAndOffset_17582d056c0b8a8dab1017d37497fe59_Out_3_Vector2);
        float2 _Branch_1e152f3aac57448f8518bf2852c000c3_Out_3_Vector2;
        Unity_Branch_float2(_Property_1ef12cf3201a938993fe6a7951b0e754_Out_0_Boolean, (_Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4.xy), _TilingAndOffset_17582d056c0b8a8dab1017d37497fe59_Out_3_Vector2, _Branch_1e152f3aac57448f8518bf2852c000c3_Out_3_Vector2);
        UnitySamplerState _Property_69f1ed7efd1b494e91f626b88ab2363c_Out_0_SamplerState = _SamplerState;
        float4 _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, _Property_69f1ed7efd1b494e91f626b88ab2363c_Out_0_SamplerState.samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Branch_1e152f3aac57448f8518bf2852c000c3_Out_3_Vector2) );
        _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4);
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.r;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.g;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.b;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_A_7_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.a;
        float2 _Vector2_ad6bd100e273d78fa409a30a77bfa2cc_Out_0_Vector2 = float2(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float, _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float);
        float3 _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3;
        Unity_Sign_float3(IN.WorldSpaceNormal, _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3);
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_R_1_Float = _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3[0];
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_G_2_Float = _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3[1];
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_B_3_Float = _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3[2];
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_A_4_Float = 0;
        float2 _Vector2_b76cb1842101e58b9e636d49b075c612_Out_0_Vector2 = float2(_Split_6299d4ddcc4c74828aea40a46fdb896e_G_2_Float, float(1));
        float2 _Multiply_31e8db88ee20c985a9850d1a58f3282b_Out_2_Vector2;
        Unity_Multiply_float2_float2(_Vector2_ad6bd100e273d78fa409a30a77bfa2cc_Out_0_Vector2, _Vector2_b76cb1842101e58b9e636d49b075c612_Out_0_Vector2, _Multiply_31e8db88ee20c985a9850d1a58f3282b_Out_2_Vector2);
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_R_1_Float = IN.WorldSpaceNormal[0];
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_G_2_Float = IN.WorldSpaceNormal[1];
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_B_3_Float = IN.WorldSpaceNormal[2];
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_A_4_Float = 0;
        float2 _Vector2_70e5837843f28b8b9d64cada3697bd5a_Out_0_Vector2 = float2(_Split_5ed44bf2eca0868f81eb18100f49d1fa_R_1_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_B_3_Float);
        float2 _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2;
        Unity_Add_float2(_Multiply_31e8db88ee20c985a9850d1a58f3282b_Out_2_Vector2, _Vector2_70e5837843f28b8b9d64cada3697bd5a_Out_0_Vector2, _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2);
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_R_1_Float = _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2[0];
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_G_2_Float = _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2[1];
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_B_3_Float = 0;
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_A_4_Float = 0;
        float _Multiply_ab12aea87465a78eaf7fc66c2598d266_Out_2_Float;
        Unity_Multiply_float_float(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_G_2_Float, _Multiply_ab12aea87465a78eaf7fc66c2598d266_Out_2_Float);
        float3 _Vector3_433840b555db308b97e9b14b6a957195_Out_0_Vector3 = float3(_Split_2bc77ca2d17bd78cb2383770ce50b179_R_1_Float, _Multiply_ab12aea87465a78eaf7fc66c2598d266_Out_2_Float, _Split_2bc77ca2d17bd78cb2383770ce50b179_G_2_Float);
        float3 _Transform_c7914cc45a011c89b3f53c55afb51673_Out_1_Vector3;
        {
        float3x3 tangentTransform = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
        _Transform_c7914cc45a011c89b3f53c55afb51673_Out_1_Vector3 = TransformWorldToTangentDir(_Vector3_433840b555db308b97e9b14b6a957195_Out_0_Vector3.xyz, tangentTransform, true);
        }
        float3 _Clamp_3837949a36b5428a82af01e7bcd29952_Out_3_Vector3;
        Unity_Clamp_float3(_Transform_c7914cc45a011c89b3f53c55afb51673_Out_1_Vector3, float3(-1, -1, -1), float3(1, 1, 1), _Clamp_3837949a36b5428a82af01e7bcd29952_Out_3_Vector3);
        float3 _Normalize_09bf8a2bd0a4d38e8b97d5c674f79b44_Out_1_Vector3;
        Unity_Normalize_float3(_Clamp_3837949a36b5428a82af01e7bcd29952_Out_3_Vector3, _Normalize_09bf8a2bd0a4d38e8b97d5c674f79b44_Out_1_Vector3);
        float3 _Branch_9eadf909a90f2f80880f8c56ecc2a91f_Out_3_Vector3;
        Unity_Branch_float3(_Property_1ef12cf3201a938993fe6a7951b0e754_Out_0_Boolean, _Normalize_09bf8a2bd0a4d38e8b97d5c674f79b44_Out_1_Vector3, (_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.xyz), _Branch_9eadf909a90f2f80880f8c56ecc2a91f_Out_3_Vector3);
        XZ_2 = (float4(_Branch_9eadf909a90f2f80880f8c56ecc2a91f_Out_3_Vector3, 1.0));
        }
        
        void Unity_NormalStrength_float(float3 In, float Strength, out float3 Out)
        {
            Out = float3(In.rg * Strength, lerp(1, In.b, saturate(Strength)));
        }
        
        void Unity_NormalBlend_float(float3 A, float3 B, out float3 Out)
        {
            Out = SafeNormalize(float3(A.rg + B.rg, A.b * B.b));
        }
        
        void Unity_Add_float3(float3 A, float3 B, out float3 Out)
        {
            Out = A + B;
        }
        
        void Unity_Divide_float3(float3 A, float3 B, out float3 Out)
        {
            Out = A / B;
        }
        
        struct Bindings_TriplanarNMn_059da9746584140498cd018db3c76047_float
        {
        float3 WorldSpaceNormal;
        float3 WorldSpaceTangent;
        float3 WorldSpaceBiTangent;
        float3 WorldSpacePosition;
        };
        
        void SG_TriplanarNMn_059da9746584140498cd018db3c76047_float(UnityTexture2D Texture2D_80A3D28F, float Vector1_41461AC9, float Vector1_E4D1C13A, Bindings_TriplanarNMn_059da9746584140498cd018db3c76047_float IN, out float4 XYZ_1, out float4 XZ_2, out float4 YZ_3, out float4 XY_4)
        {
        UnityTexture2D _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D = Texture2D_80A3D28F;
        float _Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float = IN.WorldSpacePosition[0];
        float _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float = IN.WorldSpacePosition[1];
        float _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float = IN.WorldSpacePosition[2];
        float _Split_89ed63cb625cb3878c183d0b71c03400_A_4_Float = 0;
        float4 _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4;
        float3 _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3;
        float2 _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, float(0), float(0), _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3, _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2);
        float _Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float = Vector1_41461AC9;
        float4 _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, (_Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float.xxxx), _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4);
        float3 _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3;
        Unity_Sign_float3(IN.WorldSpaceNormal, _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3);
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_R_1_Float = _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3[0];
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_G_2_Float = _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3[1];
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_B_3_Float = _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3[2];
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_A_4_Float = 0;
        float2 _Vector2_b76cb1842101e58b9e636d49b075c612_Out_0_Vector2 = float2(_Split_6299d4ddcc4c74828aea40a46fdb896e_G_2_Float, float(1));
        float2 _Multiply_a87753ad90594382bf3a3a95abbadbc8_Out_2_Vector2;
        Unity_Multiply_float2_float2((_Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4.xy), _Vector2_b76cb1842101e58b9e636d49b075c612_Out_0_Vector2, _Multiply_a87753ad90594382bf3a3a95abbadbc8_Out_2_Vector2);
        float4 _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Multiply_a87753ad90594382bf3a3a95abbadbc8_Out_2_Vector2) );
        _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4);
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.r;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.g;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.b;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_A_7_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.a;
        float2 _Vector2_ad6bd100e273d78fa409a30a77bfa2cc_Out_0_Vector2 = float2(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float, _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float);
        float2 _Multiply_31e8db88ee20c985a9850d1a58f3282b_Out_2_Vector2;
        Unity_Multiply_float2_float2(_Vector2_ad6bd100e273d78fa409a30a77bfa2cc_Out_0_Vector2, _Vector2_b76cb1842101e58b9e636d49b075c612_Out_0_Vector2, _Multiply_31e8db88ee20c985a9850d1a58f3282b_Out_2_Vector2);
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_R_1_Float = IN.WorldSpaceNormal[0];
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_G_2_Float = IN.WorldSpaceNormal[1];
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_B_3_Float = IN.WorldSpaceNormal[2];
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_A_4_Float = 0;
        float2 _Vector2_70e5837843f28b8b9d64cada3697bd5a_Out_0_Vector2 = float2(_Split_5ed44bf2eca0868f81eb18100f49d1fa_R_1_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_B_3_Float);
        float2 _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2;
        Unity_Add_float2(_Multiply_31e8db88ee20c985a9850d1a58f3282b_Out_2_Vector2, _Vector2_70e5837843f28b8b9d64cada3697bd5a_Out_0_Vector2, _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2);
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_R_1_Float = _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2[0];
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_G_2_Float = _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2[1];
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_B_3_Float = 0;
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_A_4_Float = 0;
        float _Multiply_e4fe778b81456d819c52bb414cd95968_Out_2_Float;
        Unity_Multiply_float_float(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_G_2_Float, _Multiply_e4fe778b81456d819c52bb414cd95968_Out_2_Float);
        float3 _Vector3_08f62c5c01619e849f1a7d85a44531ac_Out_0_Vector3 = float3(_Split_2bc77ca2d17bd78cb2383770ce50b179_R_1_Float, _Multiply_e4fe778b81456d819c52bb414cd95968_Out_2_Float, _Split_2bc77ca2d17bd78cb2383770ce50b179_G_2_Float);
        float3 _Absolute_644b798714827680b39bf5d34f70385f_Out_1_Vector3;
        Unity_Absolute_float3(IN.WorldSpaceNormal, _Absolute_644b798714827680b39bf5d34f70385f_Out_1_Vector3);
        float _Property_adc4c59482221c8aad681c6558728ac9_Out_0_Float = Vector1_E4D1C13A;
        float3 _Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3;
        Unity_Power_float3(_Absolute_644b798714827680b39bf5d34f70385f_Out_1_Vector3, (_Property_adc4c59482221c8aad681c6558728ac9_Out_0_Float.xxx), _Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3);
        float3 _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3, _Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3, _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3);
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_R_1_Float = _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3[0];
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_G_2_Float = _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3[1];
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_B_3_Float = _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3[2];
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_A_4_Float = 0;
        float3 _Multiply_2e1040ca9c98d085ace76ee93f094039_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Vector3_08f62c5c01619e849f1a7d85a44531ac_Out_0_Vector3, (_Split_ae83014fcbd9f7879a0b91fa66dc9718_G_2_Float.xxx), _Multiply_2e1040ca9c98d085ace76ee93f094039_Out_2_Vector3);
        float4 _Combine_192c2c4a69be588b90ca005a32e22552_RGBA_4_Vector4;
        float3 _Combine_192c2c4a69be588b90ca005a32e22552_RGB_5_Vector3;
        float2 _Combine_192c2c4a69be588b90ca005a32e22552_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float, float(0), float(0), _Combine_192c2c4a69be588b90ca005a32e22552_RGBA_4_Vector4, _Combine_192c2c4a69be588b90ca005a32e22552_RGB_5_Vector3, _Combine_192c2c4a69be588b90ca005a32e22552_RG_6_Vector2);
        float4 _Multiply_138240d0d4846e87b0febabec0d6891b_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_192c2c4a69be588b90ca005a32e22552_RGBA_4_Vector4, (_Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float.xxxx), _Multiply_138240d0d4846e87b0febabec0d6891b_Out_2_Vector4);
        float _Multiply_de711f4a4614bd89a463b53374cf4036_Out_2_Float;
        Unity_Multiply_float_float(_Split_6299d4ddcc4c74828aea40a46fdb896e_B_3_Float, -1, _Multiply_de711f4a4614bd89a463b53374cf4036_Out_2_Float);
        float2 _Vector2_4ed33f0c73b2698fa6f3c1b77fe76808_Out_0_Vector2 = float2(_Multiply_de711f4a4614bd89a463b53374cf4036_Out_2_Float, float(1));
        float2 _Multiply_2af6058cc6ccb88caefd2799bb5941e8_Out_2_Vector2;
        Unity_Multiply_float2_float2((_Multiply_138240d0d4846e87b0febabec0d6891b_Out_2_Vector4.xy), _Vector2_4ed33f0c73b2698fa6f3c1b77fe76808_Out_0_Vector2, _Multiply_2af6058cc6ccb88caefd2799bb5941e8_Out_2_Vector2);
        float4 _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Multiply_2af6058cc6ccb88caefd2799bb5941e8_Out_2_Vector2) );
        _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4);
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_R_4_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.r;
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_G_5_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.g;
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_B_6_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.b;
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_A_7_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.a;
        float2 _Vector2_fe9aedd4528c7486ada4abdca0b0944e_Out_0_Vector2 = float2(_SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_R_4_Float, _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_G_5_Float);
        float2 _Multiply_02b9b4665ad9918d8721bcaddc82f06f_Out_2_Vector2;
        Unity_Multiply_float2_float2(_Vector2_fe9aedd4528c7486ada4abdca0b0944e_Out_0_Vector2, _Vector2_4ed33f0c73b2698fa6f3c1b77fe76808_Out_0_Vector2, _Multiply_02b9b4665ad9918d8721bcaddc82f06f_Out_2_Vector2);
        float2 _Vector2_a74a85274da15181abb63cc5e8df0de1_Out_0_Vector2 = float2(_Split_5ed44bf2eca0868f81eb18100f49d1fa_R_1_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_G_2_Float);
        float2 _Add_b227c84042055e8faa1a9fdc69529707_Out_2_Vector2;
        Unity_Add_float2(_Multiply_02b9b4665ad9918d8721bcaddc82f06f_Out_2_Vector2, _Vector2_a74a85274da15181abb63cc5e8df0de1_Out_0_Vector2, _Add_b227c84042055e8faa1a9fdc69529707_Out_2_Vector2);
        float _Split_2cfb9eacd8762483941459cdf28bda97_R_1_Float = _Add_b227c84042055e8faa1a9fdc69529707_Out_2_Vector2[0];
        float _Split_2cfb9eacd8762483941459cdf28bda97_G_2_Float = _Add_b227c84042055e8faa1a9fdc69529707_Out_2_Vector2[1];
        float _Split_2cfb9eacd8762483941459cdf28bda97_B_3_Float = 0;
        float _Split_2cfb9eacd8762483941459cdf28bda97_A_4_Float = 0;
        float _Multiply_1d65ce08ce672087879125f2e13c4004_Out_2_Float;
        Unity_Multiply_float_float(_SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_B_6_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_B_3_Float, _Multiply_1d65ce08ce672087879125f2e13c4004_Out_2_Float);
        float3 _Vector3_ba6cfb4671e8c58f9b41ea1dc23102ca_Out_0_Vector3 = float3(_Split_2cfb9eacd8762483941459cdf28bda97_R_1_Float, _Split_2cfb9eacd8762483941459cdf28bda97_G_2_Float, _Multiply_1d65ce08ce672087879125f2e13c4004_Out_2_Float);
        float3 _Multiply_7bb4009c92b108849ac6ca92bc1442f2_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Vector3_ba6cfb4671e8c58f9b41ea1dc23102ca_Out_0_Vector3, (_Split_ae83014fcbd9f7879a0b91fa66dc9718_B_3_Float.xxx), _Multiply_7bb4009c92b108849ac6ca92bc1442f2_Out_2_Vector3);
        float4 _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGBA_4_Vector4;
        float3 _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGB_5_Vector3;
        float2 _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float, float(0), float(0), _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGBA_4_Vector4, _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGB_5_Vector3, _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RG_6_Vector2);
        float4 _Multiply_2c0864423b014f8b8af8523f68cbb63c_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGBA_4_Vector4, (_Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float.xxxx), _Multiply_2c0864423b014f8b8af8523f68cbb63c_Out_2_Vector4);
        float2 _Vector2_a1e23e0f921b6484818f009a2b12a5ba_Out_0_Vector2 = float2(_Split_6299d4ddcc4c74828aea40a46fdb896e_R_1_Float, float(1));
        float2 _Multiply_862402885a49f18cb87278ab53bc6744_Out_2_Vector2;
        Unity_Multiply_float2_float2((_Multiply_2c0864423b014f8b8af8523f68cbb63c_Out_2_Vector4.xy), _Vector2_a1e23e0f921b6484818f009a2b12a5ba_Out_0_Vector2, _Multiply_862402885a49f18cb87278ab53bc6744_Out_2_Vector2);
        float4 _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Multiply_862402885a49f18cb87278ab53bc6744_Out_2_Vector2) );
        _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4);
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_R_4_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.r;
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_G_5_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.g;
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_B_6_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.b;
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_A_7_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.a;
        float _Multiply_4649b768be76d784a3284bacde795359_Out_2_Float;
        Unity_Multiply_float_float(_SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_B_6_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_R_1_Float, _Multiply_4649b768be76d784a3284bacde795359_Out_2_Float);
        float2 _Vector2_819fcd5eb484438eacad1987576d7d67_Out_0_Vector2 = float2(_SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_R_4_Float, _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_G_5_Float);
        float2 _Multiply_58530ebb3c6d798b93686a76247bf505_Out_2_Vector2;
        Unity_Multiply_float2_float2(_Vector2_819fcd5eb484438eacad1987576d7d67_Out_0_Vector2, _Vector2_a1e23e0f921b6484818f009a2b12a5ba_Out_0_Vector2, _Multiply_58530ebb3c6d798b93686a76247bf505_Out_2_Vector2);
        float2 _Vector2_e293c112b2f49e88a5fe46dfb1fbeb40_Out_0_Vector2 = float2(_Split_5ed44bf2eca0868f81eb18100f49d1fa_B_3_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_G_2_Float);
        float2 _Add_cf00fb232c6e2b8e973ab2f84453f55e_Out_2_Vector2;
        Unity_Add_float2(_Multiply_58530ebb3c6d798b93686a76247bf505_Out_2_Vector2, _Vector2_e293c112b2f49e88a5fe46dfb1fbeb40_Out_0_Vector2, _Add_cf00fb232c6e2b8e973ab2f84453f55e_Out_2_Vector2);
        float _Split_3ea3e61d32bdd78f82c686b75ff3fd9b_R_1_Float = _Add_cf00fb232c6e2b8e973ab2f84453f55e_Out_2_Vector2[0];
        float _Split_3ea3e61d32bdd78f82c686b75ff3fd9b_G_2_Float = _Add_cf00fb232c6e2b8e973ab2f84453f55e_Out_2_Vector2[1];
        float _Split_3ea3e61d32bdd78f82c686b75ff3fd9b_B_3_Float = 0;
        float _Split_3ea3e61d32bdd78f82c686b75ff3fd9b_A_4_Float = 0;
        float3 _Vector3_13a08d5940172a84a78ee3d9b8766833_Out_0_Vector3 = float3(_Multiply_4649b768be76d784a3284bacde795359_Out_2_Float, _Split_3ea3e61d32bdd78f82c686b75ff3fd9b_G_2_Float, _Split_3ea3e61d32bdd78f82c686b75ff3fd9b_R_1_Float);
        float3 _Multiply_77818c22e359fc8cbb7dd20216a8db72_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Vector3_13a08d5940172a84a78ee3d9b8766833_Out_0_Vector3, (_Split_ae83014fcbd9f7879a0b91fa66dc9718_R_1_Float.xxx), _Multiply_77818c22e359fc8cbb7dd20216a8db72_Out_2_Vector3);
        float3 _Add_769d9ee909c9238dbbf72d2800a2f268_Out_2_Vector3;
        Unity_Add_float3(_Multiply_7bb4009c92b108849ac6ca92bc1442f2_Out_2_Vector3, _Multiply_77818c22e359fc8cbb7dd20216a8db72_Out_2_Vector3, _Add_769d9ee909c9238dbbf72d2800a2f268_Out_2_Vector3);
        float3 _Add_14295f72880e4b87a1baf1ced943ac40_Out_2_Vector3;
        Unity_Add_float3(_Multiply_2e1040ca9c98d085ace76ee93f094039_Out_2_Vector3, _Add_769d9ee909c9238dbbf72d2800a2f268_Out_2_Vector3, _Add_14295f72880e4b87a1baf1ced943ac40_Out_2_Vector3);
        float _Add_e59af300bba2498db32eac1412123447_Out_2_Float;
        Unity_Add_float(_Split_ae83014fcbd9f7879a0b91fa66dc9718_R_1_Float, _Split_ae83014fcbd9f7879a0b91fa66dc9718_G_2_Float, _Add_e59af300bba2498db32eac1412123447_Out_2_Float);
        float _Add_e855069f047fae8ea9027d56acb61e56_Out_2_Float;
        Unity_Add_float(_Add_e59af300bba2498db32eac1412123447_Out_2_Float, _Split_ae83014fcbd9f7879a0b91fa66dc9718_B_3_Float, _Add_e855069f047fae8ea9027d56acb61e56_Out_2_Float);
        float3 _Divide_91ae4b94f1d9b78e99d0472293b8098c_Out_2_Vector3;
        Unity_Divide_float3(_Add_14295f72880e4b87a1baf1ced943ac40_Out_2_Vector3, (_Add_e855069f047fae8ea9027d56acb61e56_Out_2_Float.xxx), _Divide_91ae4b94f1d9b78e99d0472293b8098c_Out_2_Vector3);
        float3 _Transform_73eecc0c3689d184a34c8d0f28a58adf_Out_1_Vector3;
        {
        float3x3 tangentTransform = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
        _Transform_73eecc0c3689d184a34c8d0f28a58adf_Out_1_Vector3 = TransformWorldToTangentDir(_Divide_91ae4b94f1d9b78e99d0472293b8098c_Out_2_Vector3.xyz, tangentTransform, true);
        }
        float3 _Normalize_15ef346824db0a8797631ed8b998e673_Out_1_Vector3;
        Unity_Normalize_float3(_Transform_73eecc0c3689d184a34c8d0f28a58adf_Out_1_Vector3, _Normalize_15ef346824db0a8797631ed8b998e673_Out_1_Vector3);
        XYZ_1 = (float4(_Normalize_15ef346824db0a8797631ed8b998e673_Out_1_Vector3, 1.0));
        XZ_2 = (float4(_Vector3_08f62c5c01619e849f1a7d85a44531ac_Out_0_Vector3, 1.0));
        YZ_3 = (float4(_Vector3_ba6cfb4671e8c58f9b41ea1dc23102ca_Out_0_Vector3, 1.0));
        XY_4 = (float4(_Vector3_13a08d5940172a84a78ee3d9b8766833_Out_0_Vector3, 1.0));
        }
        
        void Unity_Subtract_float(float A, float B, out float Out)
        {
            Out = A - B;
        }
        
        void Unity_Power_float(float A, float B, out float Out)
        {
            Out = pow(A, B);
        }
        
        void Unity_Lerp_float3(float3 A, float3 B, float3 T, out float3 Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Remap_float(float In, float2 InMinMax, float2 OutMinMax, out float Out)
        {
            Out = OutMinMax.x + (In - InMinMax.x) * (OutMinMax.y - OutMinMax.x) / (InMinMax.y - InMinMax.x);
        }
        
        void Unity_Lerp_float(float A, float B, float T, out float Out)
        {
            Out = lerp(A, B, T);
        }
        
        struct Bindings_BlendOverlayDetailSmoothness_06e12138dc89c0040b45a57abe520a1a_float
        {
        };
        
        void SG_BlendOverlayDetailSmoothness_06e12138dc89c0040b45a57abe520a1a_float(float Vector1_32317166, float Vector1_FBE622A2, float Vector1_8C15C351, Bindings_BlendOverlayDetailSmoothness_06e12138dc89c0040b45a57abe520a1a_float IN, out float SmoothnessOverlay_1)
        {
        float _Property_728cc50521e9e988ac9cbff4872d5139_Out_0_Float = Vector1_32317166;
        float _Property_a00e29241d12f983b30177515b367ec9_Out_0_Float = Vector1_FBE622A2;
        float _Sign_343a45ede7349283a681c6bd9998fd8e_Out_1_Float;
        Unity_Sign_float(_Property_a00e29241d12f983b30177515b367ec9_Out_0_Float, _Sign_343a45ede7349283a681c6bd9998fd8e_Out_1_Float);
        float _Add_681019b8f5d3d68bb482d419c9fc61a9_Out_2_Float;
        Unity_Add_float(_Sign_343a45ede7349283a681c6bd9998fd8e_Out_1_Float, float(1), _Add_681019b8f5d3d68bb482d419c9fc61a9_Out_2_Float);
        float _Multiply_e8f4cb722712a880ac0db6c7461427f7_Out_2_Float;
        Unity_Multiply_float_float(_Add_681019b8f5d3d68bb482d419c9fc61a9_Out_2_Float, 0.5, _Multiply_e8f4cb722712a880ac0db6c7461427f7_Out_2_Float);
        float _Ceiling_95ad15988aa9b98184875fa754feae01_Out_1_Float;
        Unity_Ceiling_float(_Multiply_e8f4cb722712a880ac0db6c7461427f7_Out_2_Float, _Ceiling_95ad15988aa9b98184875fa754feae01_Out_1_Float);
        float _Property_2db1c747a05ee284a8b00076062f91a4_Out_0_Float = Vector1_8C15C351;
        float _Lerp_b3cdb01fc3c5b988ac9b184943bf7c01_Out_3_Float;
        Unity_Lerp_float(_Property_728cc50521e9e988ac9cbff4872d5139_Out_0_Float, _Ceiling_95ad15988aa9b98184875fa754feae01_Out_1_Float, _Property_2db1c747a05ee284a8b00076062f91a4_Out_0_Float, _Lerp_b3cdb01fc3c5b988ac9b184943bf7c01_Out_3_Float);
        SmoothnessOverlay_1 = _Lerp_b3cdb01fc3c5b988ac9b184943bf7c01_Out_3_Float;
        }
        
        // Custom interpolators pre vertex
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPreVertex' */
        
        // Graph Vertex
        struct VertexDescription
        {
            float3 Position;
            float3 Normal;
            float3 Tangent;
        };
        
        VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
        {
            VertexDescription description = (VertexDescription)0;
            description.Position = IN.ObjectSpacePosition;
            description.Normal = IN.ObjectSpaceNormal;
            description.Tangent = IN.ObjectSpaceTangent;
            return description;
        }
        
        // Custom interpolators, pre surface
        #ifdef FEATURES_GRAPH_VERTEX
        Varyings CustomInterpolatorPassThroughFunc(inout Varyings output, VertexDescription input)
        {
        return output;
        }
        #define CUSTOMINTERPOLATOR_VARYPASSTHROUGH_FUNC
        #endif
        
        // Graph Pixel
        struct SurfaceDescription
        {
            float3 BaseColor;
            float3 NormalTS;
            float3 Emission;
            float Metallic;
            float3 Specular;
            float Smoothness;
            float Occlusion;
            float Alpha;
            float AlphaClipThreshold;
        };
        
        SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
        {
            SurfaceDescription surface = (SurfaceDescription)0;
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_05d49814100eb3808cd61a6177622291_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseColorMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_e21be9beec8d858fa2818b2fddc4577c_Out_0_Vector4 = _BaseTilingOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_1b1963c0ccb4d78fa3474b362fd31d15_Out_0_Boolean = _BaseUsePlanarUV;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae;
            _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae.uv0 = IN.uv0;
            _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae.uv2 = IN.uv2;
            float4 _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_05d49814100eb3808cd61a6177622291_Out_0_Texture2D, _Property_e21be9beec8d858fa2818b2fddc4577c_Out_0_Vector4, _Property_1b1963c0ccb4d78fa3474b362fd31d15_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), 1, _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae, _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae_XZ_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_03a155c84233b98dbb11cd710d6e1539_Out_0_Vector4 = _BaseColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Multiply_9cb5181459454189b39d6838c2a6fb85_Out_2_Vector4;
            Unity_Multiply_float4_float4(_PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae_XZ_2_Vector4, _Property_03a155c84233b98dbb11cd710d6e1539_Out_0_Vector4, _Multiply_9cb5181459454189b39d6838c2a6fb85_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_b26f64bfa09eb48584b1dc9133f5b840_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_DetailMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_bb28507cb268918795cf74b32a6b3693_Out_0_Vector4 = _DetailTilingOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_a5f9848f7817b48ca226ca228efcc28e_R_1_Float = _Property_bb28507cb268918795cf74b32a6b3693_Out_0_Vector4[0];
            float _Split_a5f9848f7817b48ca226ca228efcc28e_G_2_Float = _Property_bb28507cb268918795cf74b32a6b3693_Out_0_Vector4[1];
            float _Split_a5f9848f7817b48ca226ca228efcc28e_B_3_Float = _Property_bb28507cb268918795cf74b32a6b3693_Out_0_Vector4[2];
            float _Split_a5f9848f7817b48ca226ca228efcc28e_A_4_Float = _Property_bb28507cb268918795cf74b32a6b3693_Out_0_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_257255e4b3cee8888b124cb1330da379_Out_0_Vector2 = float2(_Split_a5f9848f7817b48ca226ca228efcc28e_R_1_Float, _Split_a5f9848f7817b48ca226ca228efcc28e_G_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_2ba978ab0f3ccc84b3fe592845432576_Out_0_Vector2 = float2(_Split_a5f9848f7817b48ca226ca228efcc28e_B_3_Float, _Split_a5f9848f7817b48ca226ca228efcc28e_A_4_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _TilingAndOffset_9bc6b1e938f4668f9476625fa68aff4e_Out_3_Vector2;
            Unity_TilingAndOffset_float(IN.uv0.xy, _Vector2_257255e4b3cee8888b124cb1330da379_Out_0_Vector2, _Vector2_2ba978ab0f3ccc84b3fe592845432576_Out_0_Vector2, _TilingAndOffset_9bc6b1e938f4668f9476625fa68aff4e_Out_3_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_b26f64bfa09eb48584b1dc9133f5b840_Out_0_Texture2D.tex, _Property_b26f64bfa09eb48584b1dc9133f5b840_Out_0_Texture2D.samplerstate, _Property_b26f64bfa09eb48584b1dc9133f5b840_Out_0_Texture2D.GetTransformedUV(_TilingAndOffset_9bc6b1e938f4668f9476625fa68aff4e_Out_3_Vector2) );
            float _SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_R_4_Float = _SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_RGBA_0_Vector4.r;
            float _SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_G_5_Float = _SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_RGBA_0_Vector4.g;
            float _SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_B_6_Float = _SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_RGBA_0_Vector4.b;
            float _SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_A_7_Float = _SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_99a7a45efebe0588afbd74b8df9b4750_Out_2_Float;
            Unity_Multiply_float_float(_SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_R_4_Float, 2, _Multiply_99a7a45efebe0588afbd74b8df9b4750_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_ddcd7f2c8505e0818230ed34d7ecdf92_Out_2_Float;
            Unity_Add_float(_Multiply_99a7a45efebe0588afbd74b8df9b4750_Out_2_Float, float(-1), _Add_ddcd7f2c8505e0818230ed34d7ecdf92_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_b7367df1085ac580b7d5b9785921d152_Out_0_Float = _DetailAlbedoScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_874d814eeb0e7782842ad64a4d97f43e_Out_2_Float;
            Unity_Multiply_float_float(_Add_ddcd7f2c8505e0818230ed34d7ecdf92_Out_2_Float, _Property_b7367df1085ac580b7d5b9785921d152_Out_0_Float, _Multiply_874d814eeb0e7782842ad64a4d97f43e_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Saturate_40d0c48fa8fb008799c2060b9ccfede9_Out_1_Float;
            Unity_Saturate_float(_Multiply_874d814eeb0e7782842ad64a4d97f43e_Out_2_Float, _Saturate_40d0c48fa8fb008799c2060b9ccfede9_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Absolute_7ea0f8a0aaf24186a357f11eca841a0c_Out_1_Float;
            Unity_Absolute_float(_Saturate_40d0c48fa8fb008799c2060b9ccfede9_Out_1_Float, _Absolute_7ea0f8a0aaf24186a357f11eca841a0c_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_BlendOverlayBaseColor_acdb3dfca72bd6b42bbc35f4613331a2_float _BlendOverlayBaseColor_9ac50a6865d3648181da5f6189b8832d;
            float3 _BlendOverlayBaseColor_9ac50a6865d3648181da5f6189b8832d_OutVector4_1_Vector3;
            SG_BlendOverlayBaseColor_acdb3dfca72bd6b42bbc35f4613331a2_float(_Multiply_9cb5181459454189b39d6838c2a6fb85_Out_2_Vector4, _Add_ddcd7f2c8505e0818230ed34d7ecdf92_Out_2_Float, _Absolute_7ea0f8a0aaf24186a357f11eca841a0c_Out_1_Float, _BlendOverlayBaseColor_9ac50a6865d3648181da5f6189b8832d, _BlendOverlayBaseColor_9ac50a6865d3648181da5f6189b8832d_OutVector4_1_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_5d67b392da5ceb81b51a3bfe5384ad00_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverBaseColorMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_e95f6f4e76cecb87871151040535a080_Out_0_Vector4 = _CoverTilingOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Divide_acbbd9727ffda783aeafe28ccafbde8e_Out_2_Vector4;
            Unity_Divide_float4(float4(1, 1, 0, 0), _Property_e95f6f4e76cecb87871151040535a080_Out_0_Vector4, _Divide_acbbd9727ffda783aeafe28ccafbde8e_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_faa4f436225f4e8eb99135b1d078135e_Out_0_Float = _CoverTriplanarThreshold;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_cd8ee86e67e5fe898c7968f92e11e481;
            _TriplanarNM_cd8ee86e67e5fe898c7968f92e11e481.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_cd8ee86e67e5fe898c7968f92e11e481.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_cd8ee86e67e5fe898c7968f92e11e481_XYZ_1_Vector4;
            float4 _TriplanarNM_cd8ee86e67e5fe898c7968f92e11e481_XZ_2_Vector4;
            float4 _TriplanarNM_cd8ee86e67e5fe898c7968f92e11e481_YZ_3_Vector4;
            float4 _TriplanarNM_cd8ee86e67e5fe898c7968f92e11e481_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_5d67b392da5ceb81b51a3bfe5384ad00_Out_0_Texture2D, (_Divide_acbbd9727ffda783aeafe28ccafbde8e_Out_2_Vector4).x, _Property_faa4f436225f4e8eb99135b1d078135e_Out_0_Float, _TriplanarNM_cd8ee86e67e5fe898c7968f92e11e481, _TriplanarNM_cd8ee86e67e5fe898c7968f92e11e481_XYZ_1_Vector4, _TriplanarNM_cd8ee86e67e5fe898c7968f92e11e481_XZ_2_Vector4, _TriplanarNM_cd8ee86e67e5fe898c7968f92e11e481_YZ_3_Vector4, _TriplanarNM_cd8ee86e67e5fe898c7968f92e11e481_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_65c5d9a1688ae98ba437bc3f4b866f99_Out_0_Vector4 = _CoverBaseColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Multiply_b7294cbf7c9daa85b18c13beaf3dc8bd_Out_2_Vector4;
            Unity_Multiply_float4_float4(_TriplanarNM_cd8ee86e67e5fe898c7968f92e11e481_XYZ_1_Vector4, _Property_65c5d9a1688ae98ba437bc3f4b866f99_Out_0_Vector4, _Multiply_b7294cbf7c9daa85b18c13beaf3dc8bd_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_43c6facd1f553289befba1782fe8ad70_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverMaskA);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _UV_5b74fb710ad3d187a00f16e1d8f8bd63_Out_0_Vector4 = IN.uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _SampleTexture2D_4d4c63c65e48c28ba5f624928f181789_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_43c6facd1f553289befba1782fe8ad70_Out_0_Texture2D.tex, _Property_43c6facd1f553289befba1782fe8ad70_Out_0_Texture2D.samplerstate, _Property_43c6facd1f553289befba1782fe8ad70_Out_0_Texture2D.GetTransformedUV((_UV_5b74fb710ad3d187a00f16e1d8f8bd63_Out_0_Vector4.xy)) );
            float _SampleTexture2D_4d4c63c65e48c28ba5f624928f181789_R_4_Float = _SampleTexture2D_4d4c63c65e48c28ba5f624928f181789_RGBA_0_Vector4.r;
            float _SampleTexture2D_4d4c63c65e48c28ba5f624928f181789_G_5_Float = _SampleTexture2D_4d4c63c65e48c28ba5f624928f181789_RGBA_0_Vector4.g;
            float _SampleTexture2D_4d4c63c65e48c28ba5f624928f181789_B_6_Float = _SampleTexture2D_4d4c63c65e48c28ba5f624928f181789_RGBA_0_Vector4.b;
            float _SampleTexture2D_4d4c63c65e48c28ba5f624928f181789_A_7_Float = _SampleTexture2D_4d4c63c65e48c28ba5f624928f181789_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_4080f51767261687a64910057bc980cb_Out_0_Float = _CoverMaskPower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_2660ad962697408681e2e8c36648ca12_Out_2_Float;
            Unity_Multiply_float_float(_SampleTexture2D_4d4c63c65e48c28ba5f624928f181789_A_7_Float, _Property_4080f51767261687a64910057bc980cb_Out_0_Float, _Multiply_2660ad962697408681e2e8c36648ca12_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_572d83500486058c99890c5d609b30b0_Out_3_Float;
            Unity_Clamp_float(_Multiply_2660ad962697408681e2e8c36648ca12_Out_2_Float, float(0), float(1), _Clamp_572d83500486058c99890c5d609b30b0_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Property_3d047323d7f9778ca2b1b7d7d4d43210_Out_0_Vector3 = _CoverDirection;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_3f76f18aa45a858dab65f5835e23f0b9_Out_0_Vector2 = float2(_SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_A_7_Float, _SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_G_5_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Multiply_a3cb438c86db8a839543847f1fa26666_Out_2_Vector2;
            Unity_Multiply_float2_float2(_Vector2_3f76f18aa45a858dab65f5835e23f0b9_Out_0_Vector2, float2(2, 2), _Multiply_a3cb438c86db8a839543847f1fa26666_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Add_21eb70b8cab75f8a852dd8dd64767430_Out_2_Vector2;
            Unity_Add_float2(_Multiply_a3cb438c86db8a839543847f1fa26666_Out_2_Vector2, float2(-1, -1), _Add_21eb70b8cab75f8a852dd8dd64767430_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_cbbb2e4ef035b58e8c751d96843d987e_Out_0_Float = _DetailNormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Multiply_d4afe7aea32def8ca3c89b2f7e87af44_Out_2_Vector2;
            Unity_Multiply_float2_float2(_Add_21eb70b8cab75f8a852dd8dd64767430_Out_2_Vector2, (_Property_cbbb2e4ef035b58e8c751d96843d987e_Out_0_Float.xx), _Multiply_d4afe7aea32def8ca3c89b2f7e87af44_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_f88dc76333998681a9031ef1324e052a_R_1_Float = _Multiply_d4afe7aea32def8ca3c89b2f7e87af44_Out_2_Vector2[0];
            float _Split_f88dc76333998681a9031ef1324e052a_G_2_Float = _Multiply_d4afe7aea32def8ca3c89b2f7e87af44_Out_2_Vector2[1];
            float _Split_f88dc76333998681a9031ef1324e052a_B_3_Float = 0;
            float _Split_f88dc76333998681a9031ef1324e052a_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _DotProduct_970a707dd71afa80887b08c47998be6e_Out_2_Float;
            Unity_DotProduct_float2(_Multiply_d4afe7aea32def8ca3c89b2f7e87af44_Out_2_Vector2, _Multiply_d4afe7aea32def8ca3c89b2f7e87af44_Out_2_Vector2, _DotProduct_970a707dd71afa80887b08c47998be6e_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Saturate_6a42dc6ad32c63849dbf7844d1081b82_Out_1_Float;
            Unity_Saturate_float(_DotProduct_970a707dd71afa80887b08c47998be6e_Out_2_Float, _Saturate_6a42dc6ad32c63849dbf7844d1081b82_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_a724d53a195cd387a0d6ec2d11ec64e8_Out_1_Float;
            Unity_OneMinus_float(_Saturate_6a42dc6ad32c63849dbf7844d1081b82_Out_1_Float, _OneMinus_a724d53a195cd387a0d6ec2d11ec64e8_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _SquareRoot_6e074ca49330118a958f11e9487fe5c6_Out_1_Float;
            Unity_SquareRoot_float(_OneMinus_a724d53a195cd387a0d6ec2d11ec64e8_Out_1_Float, _SquareRoot_6e074ca49330118a958f11e9487fe5c6_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Vector3_a6a5e3fb326314838a5e436f55de8dcc_Out_0_Vector3 = float3(_Split_f88dc76333998681a9031ef1324e052a_R_1_Float, _Split_f88dc76333998681a9031ef1324e052a_G_2_Float, _SquareRoot_6e074ca49330118a958f11e9487fe5c6_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_2e4a88374e8ffd8db37352d79f10740a_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseNormalMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float _PlanarNMn_126f337c769a878bb33ea56bcab1d637;
            _PlanarNMn_126f337c769a878bb33ea56bcab1d637.WorldSpaceNormal = IN.WorldSpaceNormal;
            _PlanarNMn_126f337c769a878bb33ea56bcab1d637.WorldSpaceTangent = IN.WorldSpaceTangent;
            _PlanarNMn_126f337c769a878bb33ea56bcab1d637.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _PlanarNMn_126f337c769a878bb33ea56bcab1d637.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNMn_126f337c769a878bb33ea56bcab1d637.uv0 = IN.uv0;
            _PlanarNMn_126f337c769a878bb33ea56bcab1d637.uv2 = IN.uv2;
            float4 _PlanarNMn_126f337c769a878bb33ea56bcab1d637_XZ_2_Vector4;
            SG_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float(_Property_2e4a88374e8ffd8db37352d79f10740a_Out_0_Texture2D, _Property_e21be9beec8d858fa2818b2fddc4577c_Out_0_Vector4, _Property_1b1963c0ccb4d78fa3474b362fd31d15_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), 1, _PlanarNMn_126f337c769a878bb33ea56bcab1d637, _PlanarNMn_126f337c769a878bb33ea56bcab1d637_XZ_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_ea100595101f088a94e70278a910a34c_Out_0_Float = _BaseNormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _NormalStrength_70f3e500f60967898e02d8fc8200db59_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_126f337c769a878bb33ea56bcab1d637_XZ_2_Vector4.xyz), _Property_ea100595101f088a94e70278a910a34c_Out_0_Float, _NormalStrength_70f3e500f60967898e02d8fc8200db59_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _NormalBlend_58a0c0d45b55168cbfa43fa9d9da21c6_Out_2_Vector3;
            Unity_NormalBlend_float(_Vector3_a6a5e3fb326314838a5e436f55de8dcc_Out_0_Vector3, _NormalStrength_70f3e500f60967898e02d8fc8200db59_Out_2_Vector3, _NormalBlend_58a0c0d45b55168cbfa43fa9d9da21c6_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_bb2720e978ff4782bb872fb7b877636f_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverNormalMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNMn_059da9746584140498cd018db3c76047_float _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b;
            _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b.WorldSpaceTangent = IN.WorldSpaceTangent;
            _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b.WorldSpacePosition = IN.WorldSpacePosition;
            float4 _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b_XYZ_1_Vector4;
            float4 _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b_XZ_2_Vector4;
            float4 _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b_YZ_3_Vector4;
            float4 _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b_XY_4_Vector4;
            SG_TriplanarNMn_059da9746584140498cd018db3c76047_float(_Property_bb2720e978ff4782bb872fb7b877636f_Out_0_Texture2D, (_Divide_acbbd9727ffda783aeafe28ccafbde8e_Out_2_Vector4).x, _Property_faa4f436225f4e8eb99135b1d078135e_Out_0_Float, _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b, _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b_XYZ_1_Vector4, _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b_XZ_2_Vector4, _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b_YZ_3_Vector4, _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_f6ae16d8d2c85685b4072d78c56e29e9_Out_0_Float = _CoverNormalBlendHardness;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _NormalStrength_11fab77b71140d8ab0735a9615b728ec_Out_2_Vector3;
            Unity_NormalStrength_float((_TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b_XYZ_1_Vector4.xyz), _Property_f6ae16d8d2c85685b4072d78c56e29e9_Out_0_Float, _NormalStrength_11fab77b71140d8ab0735a9615b728ec_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Multiply_fa49280de269898ebbfe89d446d57ecc_Out_2_Vector3;
            Unity_Multiply_float3_float3(_Property_3d047323d7f9778ca2b1b7d7d4d43210_Out_0_Vector3, IN.WorldSpaceNormal, _Multiply_fa49280de269898ebbfe89d446d57ecc_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_91e143818eee6187b799b2a4652eeb95_R_1_Float = _Multiply_fa49280de269898ebbfe89d446d57ecc_Out_2_Vector3[0];
            float _Split_91e143818eee6187b799b2a4652eeb95_G_2_Float = _Multiply_fa49280de269898ebbfe89d446d57ecc_Out_2_Vector3[1];
            float _Split_91e143818eee6187b799b2a4652eeb95_B_3_Float = _Multiply_fa49280de269898ebbfe89d446d57ecc_Out_2_Vector3[2];
            float _Split_91e143818eee6187b799b2a4652eeb95_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_f99764306bf31e8484b14d9a1ba660a3_Out_2_Float;
            Unity_Add_float(_Split_91e143818eee6187b799b2a4652eeb95_R_1_Float, _Split_91e143818eee6187b799b2a4652eeb95_G_2_Float, _Add_f99764306bf31e8484b14d9a1ba660a3_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_25d0cda769439c85a6176b0cf9af06c0_Out_2_Float;
            Unity_Add_float(_Add_f99764306bf31e8484b14d9a1ba660a3_Out_2_Float, _Split_91e143818eee6187b799b2a4652eeb95_B_3_Float, _Add_25d0cda769439c85a6176b0cf9af06c0_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_24df69e5dc52008e891c2b3f99e28991_Out_0_Float = _Cover_Amount;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_7b25e9aea29e888e99e5155562106e70_Out_0_Float = _Cover_Amount_Grow_Speed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Subtract_a31b2e64f122188ea610c77d3f62f810_Out_2_Float;
            Unity_Subtract_float(float(4), _Property_7b25e9aea29e888e99e5155562106e70_Out_0_Float, _Subtract_a31b2e64f122188ea610c77d3f62f810_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_15277685f0785f8a90f4492c80247159_Out_2_Float;
            Unity_Divide_float(_Property_24df69e5dc52008e891c2b3f99e28991_Out_0_Float, _Subtract_a31b2e64f122188ea610c77d3f62f810_Out_2_Float, _Divide_15277685f0785f8a90f4492c80247159_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Absolute_ac1c6e27d47e508e8aed26d3db167120_Out_1_Float;
            Unity_Absolute_float(_Divide_15277685f0785f8a90f4492c80247159_Out_2_Float, _Absolute_ac1c6e27d47e508e8aed26d3db167120_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Power_d5a03bba02ea638f84c50ca9f6a3e112_Out_2_Float;
            Unity_Power_float(_Absolute_ac1c6e27d47e508e8aed26d3db167120_Out_1_Float, _Subtract_a31b2e64f122188ea610c77d3f62f810_Out_2_Float, _Power_d5a03bba02ea638f84c50ca9f6a3e112_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_1be0e9928e2c0489b16295f57a026487_Out_3_Float;
            Unity_Clamp_float(_Power_d5a03bba02ea638f84c50ca9f6a3e112_Out_2_Float, float(0), float(2), _Clamp_1be0e9928e2c0489b16295f57a026487_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_041ba179c4133288bd6ebb7932697351_Out_2_Float;
            Unity_Multiply_float_float(_Add_25d0cda769439c85a6176b0cf9af06c0_Out_2_Float, _Clamp_1be0e9928e2c0489b16295f57a026487_Out_3_Float, _Multiply_041ba179c4133288bd6ebb7932697351_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Saturate_f03610d99dc38b8688cdf6c95924daaf_Out_1_Float;
            Unity_Saturate_float(_Multiply_041ba179c4133288bd6ebb7932697351_Out_2_Float, _Saturate_f03610d99dc38b8688cdf6c95924daaf_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_78437b2d5aa53f829edcee712f066e04_Out_3_Float;
            Unity_Clamp_float(_Add_25d0cda769439c85a6176b0cf9af06c0_Out_2_Float, float(0), float(0.9999), _Clamp_78437b2d5aa53f829edcee712f066e04_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_32c30bd23dc33184849662569cd46759_Out_0_Float = _Cover_Max_Angle;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_9d9e98ea75888d85877f3863930719aa_Out_2_Float;
            Unity_Divide_float(_Property_32c30bd23dc33184849662569cd46759_Out_0_Float, float(45), _Divide_9d9e98ea75888d85877f3863930719aa_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_fa817fbd2ba8aa81bf3977d104f66ffd_Out_1_Float;
            Unity_OneMinus_float(_Divide_9d9e98ea75888d85877f3863930719aa_Out_2_Float, _OneMinus_fa817fbd2ba8aa81bf3977d104f66ffd_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Subtract_66c9a128aff075848cbe14a74ba8d3c5_Out_2_Float;
            Unity_Subtract_float(_Clamp_78437b2d5aa53f829edcee712f066e04_Out_3_Float, _OneMinus_fa817fbd2ba8aa81bf3977d104f66ffd_Out_1_Float, _Subtract_66c9a128aff075848cbe14a74ba8d3c5_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_b81e19ff4b40e889bbc2a0d75a043d55_Out_3_Float;
            Unity_Clamp_float(_Subtract_66c9a128aff075848cbe14a74ba8d3c5_Out_2_Float, float(0), float(2), _Clamp_b81e19ff4b40e889bbc2a0d75a043d55_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_df9b9eb99573a286b66090f1a88825c2_Out_2_Float;
            Unity_Divide_float(float(1), _Divide_9d9e98ea75888d85877f3863930719aa_Out_2_Float, _Divide_df9b9eb99573a286b66090f1a88825c2_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_b1c6bc199993da8e8690b8204063c06f_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_b81e19ff4b40e889bbc2a0d75a043d55_Out_3_Float, _Divide_df9b9eb99573a286b66090f1a88825c2_Out_2_Float, _Multiply_b1c6bc199993da8e8690b8204063c06f_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Absolute_47d15fbc856f1982992c9f6f8cf095df_Out_1_Float;
            Unity_Absolute_float(_Multiply_b1c6bc199993da8e8690b8204063c06f_Out_2_Float, _Absolute_47d15fbc856f1982992c9f6f8cf095df_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_84ecf6d44066108b958a4bbf89eb2bbb_Out_0_Float = _CoverHardness;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Power_e2326e473b1f15869db22e412e3f9fde_Out_2_Float;
            Unity_Power_float(_Absolute_47d15fbc856f1982992c9f6f8cf095df_Out_1_Float, _Property_84ecf6d44066108b958a4bbf89eb2bbb_Out_0_Float, _Power_e2326e473b1f15869db22e412e3f9fde_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_e5173dd322cb9c87a827b3d6d416e8c4_Out_0_Float = _Cover_Min_Height;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_d6102fe1df60cf8f9be5eb4f6774b363_Out_1_Float;
            Unity_OneMinus_float(_Property_e5173dd322cb9c87a827b3d6d416e8c4_Out_0_Float, _OneMinus_d6102fe1df60cf8f9be5eb4f6774b363_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_c2c0822a4c066887bdce2476ce07e03b_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
            float _Split_c2c0822a4c066887bdce2476ce07e03b_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
            float _Split_c2c0822a4c066887bdce2476ce07e03b_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
            float _Split_c2c0822a4c066887bdce2476ce07e03b_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_d67ba628c117b784982b2b0e7335f121_Out_2_Float;
            Unity_Add_float(_OneMinus_d6102fe1df60cf8f9be5eb4f6774b363_Out_1_Float, _Split_c2c0822a4c066887bdce2476ce07e03b_G_2_Float, _Add_d67ba628c117b784982b2b0e7335f121_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_cacc637f6d247382b610fa5e29099efb_Out_2_Float;
            Unity_Add_float(_Add_d67ba628c117b784982b2b0e7335f121_Out_2_Float, float(1), _Add_cacc637f6d247382b610fa5e29099efb_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_305f17dcc5012d81886e7fe415a513d4_Out_3_Float;
            Unity_Clamp_float(_Add_cacc637f6d247382b610fa5e29099efb_Out_2_Float, float(0), float(1), _Clamp_305f17dcc5012d81886e7fe415a513d4_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_6b0e17b7e3d2fd8db358cf2468c498e6_Out_0_Float = _Cover_Min_Height_Blending;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_3a4b967d185bc881b41c30791f6f1e62_Out_2_Float;
            Unity_Add_float(_Add_d67ba628c117b784982b2b0e7335f121_Out_2_Float, _Property_6b0e17b7e3d2fd8db358cf2468c498e6_Out_0_Float, _Add_3a4b967d185bc881b41c30791f6f1e62_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_fd0dcb913f15e88e902812b438aebbc3_Out_2_Float;
            Unity_Divide_float(_Add_3a4b967d185bc881b41c30791f6f1e62_Out_2_Float, _Add_d67ba628c117b784982b2b0e7335f121_Out_2_Float, _Divide_fd0dcb913f15e88e902812b438aebbc3_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_a7b7b5823dc9398d8328371fb23de257_Out_1_Float;
            Unity_OneMinus_float(_Divide_fd0dcb913f15e88e902812b438aebbc3_Out_2_Float, _OneMinus_a7b7b5823dc9398d8328371fb23de257_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_caa2bc8711bde98886b2e04bc3895333_Out_2_Float;
            Unity_Add_float(_OneMinus_a7b7b5823dc9398d8328371fb23de257_Out_1_Float, float(-0.5), _Add_caa2bc8711bde98886b2e04bc3895333_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_9958b4bb870ca78bb4f436357f6e4ed4_Out_3_Float;
            Unity_Clamp_float(_Add_caa2bc8711bde98886b2e04bc3895333_Out_2_Float, float(0), float(1), _Clamp_9958b4bb870ca78bb4f436357f6e4ed4_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_f4c52e99fecae983bba5ca957ceaea70_Out_2_Float;
            Unity_Add_float(_Clamp_305f17dcc5012d81886e7fe415a513d4_Out_3_Float, _Clamp_9958b4bb870ca78bb4f436357f6e4ed4_Out_3_Float, _Add_f4c52e99fecae983bba5ca957ceaea70_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_4b0ba629f5691b8985bcb46fe077634b_Out_3_Float;
            Unity_Clamp_float(_Add_f4c52e99fecae983bba5ca957ceaea70_Out_2_Float, float(0), float(1), _Clamp_4b0ba629f5691b8985bcb46fe077634b_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_dc9146fa086a698db159220c4b551f8d_Out_2_Float;
            Unity_Multiply_float_float(_Power_e2326e473b1f15869db22e412e3f9fde_Out_2_Float, _Clamp_4b0ba629f5691b8985bcb46fe077634b_Out_3_Float, _Multiply_dc9146fa086a698db159220c4b551f8d_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_4a4cdbb11047088c86f3455cd5a51981_Out_2_Float;
            Unity_Multiply_float_float(_Saturate_f03610d99dc38b8688cdf6c95924daaf_Out_1_Float, _Multiply_dc9146fa086a698db159220c4b551f8d_Out_2_Float, _Multiply_4a4cdbb11047088c86f3455cd5a51981_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Lerp_81e093150193e5818ea2e7cdf113600f_Out_3_Vector3;
            Unity_Lerp_float3(_NormalBlend_58a0c0d45b55168cbfa43fa9d9da21c6_Out_2_Vector3, _NormalStrength_11fab77b71140d8ab0735a9615b728ec_Out_2_Vector3, (_Multiply_4a4cdbb11047088c86f3455cd5a51981_Out_2_Float.xxx), _Lerp_81e093150193e5818ea2e7cdf113600f_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Transform_fcfe6aed8d17598ebf576390e09b3662_Out_1_Vector3;
            {
                float3x3 tangentTransform = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
                _Transform_fcfe6aed8d17598ebf576390e09b3662_Out_1_Vector3 = TransformTangentToWorldDir(_Lerp_81e093150193e5818ea2e7cdf113600f_Out_3_Vector3.xyz, tangentTransform, true).xyz;
            }
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Multiply_87cc0f3ed4675989b51b1b58a173bc24_Out_2_Vector3;
            Unity_Multiply_float3_float3(_Property_3d047323d7f9778ca2b1b7d7d4d43210_Out_0_Vector3, _Transform_fcfe6aed8d17598ebf576390e09b3662_Out_1_Vector3, _Multiply_87cc0f3ed4675989b51b1b58a173bc24_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_60ee188afca81787a8e8fac74a174b99_R_1_Float = _Multiply_87cc0f3ed4675989b51b1b58a173bc24_Out_2_Vector3[0];
            float _Split_60ee188afca81787a8e8fac74a174b99_G_2_Float = _Multiply_87cc0f3ed4675989b51b1b58a173bc24_Out_2_Vector3[1];
            float _Split_60ee188afca81787a8e8fac74a174b99_B_3_Float = _Multiply_87cc0f3ed4675989b51b1b58a173bc24_Out_2_Vector3[2];
            float _Split_60ee188afca81787a8e8fac74a174b99_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_dc15dd3b0cae3e89bd698e7f843f7b1a_Out_2_Float;
            Unity_Add_float(_Split_60ee188afca81787a8e8fac74a174b99_R_1_Float, _Split_60ee188afca81787a8e8fac74a174b99_G_2_Float, _Add_dc15dd3b0cae3e89bd698e7f843f7b1a_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_5239bb98d15c0889b20e04a2eb89ee8d_Out_2_Float;
            Unity_Add_float(_Add_dc15dd3b0cae3e89bd698e7f843f7b1a_Out_2_Float, _Split_60ee188afca81787a8e8fac74a174b99_B_3_Float, _Add_5239bb98d15c0889b20e04a2eb89ee8d_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_04ad5b9da8d13d80977bd2661241c39d_Out_2_Float;
            Unity_Multiply_float_float(_Add_5239bb98d15c0889b20e04a2eb89ee8d_Out_2_Float, _Clamp_1be0e9928e2c0489b16295f57a026487_Out_3_Float, _Multiply_04ad5b9da8d13d80977bd2661241c39d_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_ffe9545eefb14c85b9db82fa15044921_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_1be0e9928e2c0489b16295f57a026487_Out_3_Float, _Property_84ecf6d44066108b958a4bbf89eb2bbb_Out_0_Float, _Multiply_ffe9545eefb14c85b9db82fa15044921_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_49be95001b6ff98ea3ddca613a01d693_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_ffe9545eefb14c85b9db82fa15044921_Out_2_Float, _Multiply_dc9146fa086a698db159220c4b551f8d_Out_2_Float, _Multiply_49be95001b6ff98ea3ddca613a01d693_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_821af040af6e558284ae449187584b00_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_04ad5b9da8d13d80977bd2661241c39d_Out_2_Float, _Multiply_49be95001b6ff98ea3ddca613a01d693_Out_2_Float, _Multiply_821af040af6e558284ae449187584b00_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_b98b3357cae0358aae44a13c442bbfcf_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverMaskMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3;
            _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_XYZ_1_Vector4;
            float4 _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_XZ_2_Vector4;
            float4 _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_YZ_3_Vector4;
            float4 _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_b98b3357cae0358aae44a13c442bbfcf_Out_0_Texture2D, (_Divide_acbbd9727ffda783aeafe28ccafbde8e_Out_2_Vector4).x, _Property_faa4f436225f4e8eb99135b1d078135e_Out_0_Float, _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3, _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_XYZ_1_Vector4, _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_XZ_2_Vector4, _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_YZ_3_Vector4, _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_d45fa36c68c6428bb4f8080e2005e0ec_R_1_Float = _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_XYZ_1_Vector4[0];
            float _Split_d45fa36c68c6428bb4f8080e2005e0ec_G_2_Float = _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_XYZ_1_Vector4[1];
            float _Split_d45fa36c68c6428bb4f8080e2005e0ec_B_3_Float = _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_XYZ_1_Vector4[2];
            float _Split_d45fa36c68c6428bb4f8080e2005e0ec_A_4_Float = _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_XYZ_1_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_98ac4ea177a183869352488b4c2d0d34_Out_0_Float = _CoverHeightMapMin;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_5d5eb0a63075b184be1f8ed7f1969793_Out_0_Float = _CoverHeightMapMax;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_068b903f7986bb8da7741fd6f472d4d3_Out_0_Vector2 = float2(_Property_98ac4ea177a183869352488b4c2d0d34_Out_0_Float, _Property_5d5eb0a63075b184be1f8ed7f1969793_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_dbf8fa97bfdf2f819d547b2836d5eb88_Out_0_Float = _CoverHeightMapOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Add_7e64ff79e725df80a9231cb40178da18_Out_2_Vector2;
            Unity_Add_float2(_Vector2_068b903f7986bb8da7741fd6f472d4d3_Out_0_Vector2, (_Property_dbf8fa97bfdf2f819d547b2836d5eb88_Out_0_Float.xx), _Add_7e64ff79e725df80a9231cb40178da18_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_0792f0dacec10e82954597c385120c5f_Out_3_Float;
            Unity_Remap_float(_Split_d45fa36c68c6428bb4f8080e2005e0ec_B_3_Float, float2 (0, 1), _Add_7e64ff79e725df80a9231cb40178da18_Out_2_Vector2, _Remap_0792f0dacec10e82954597c385120c5f_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_fef4ce95d06ced86899c58782dd5e9ac_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_821af040af6e558284ae449187584b00_Out_2_Float, _Remap_0792f0dacec10e82954597c385120c5f_Out_3_Float, _Multiply_fef4ce95d06ced86899c58782dd5e9ac_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_f38ac593c11c408685b4081df7f9a736_R_1_Float = IN.VertexColor[0];
            float _Split_f38ac593c11c408685b4081df7f9a736_G_2_Float = IN.VertexColor[1];
            float _Split_f38ac593c11c408685b4081df7f9a736_B_3_Float = IN.VertexColor[2];
            float _Split_f38ac593c11c408685b4081df7f9a736_A_4_Float = IN.VertexColor[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_26b43e2c517d7982b34d1c541939b6f5_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_fef4ce95d06ced86899c58782dd5e9ac_Out_2_Float, _Split_f38ac593c11c408685b4081df7f9a736_G_2_Float, _Multiply_26b43e2c517d7982b34d1c541939b6f5_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Saturate_3d2efb20d5b29381bfb3003845307b1f_Out_1_Float;
            Unity_Saturate_float(_Multiply_26b43e2c517d7982b34d1c541939b6f5_Out_2_Float, _Saturate_3d2efb20d5b29381bfb3003845307b1f_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_97e8d2e584b4e587a8ffaa3d3b1b30f5_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_572d83500486058c99890c5d609b30b0_Out_3_Float, _Saturate_3d2efb20d5b29381bfb3003845307b1f_Out_1_Float, _Multiply_97e8d2e584b4e587a8ffaa3d3b1b30f5_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            #if defined(_USEDYNAMICCOVERTSTATICMASKF_ON)
            float _UseDynamicCoverTStaticMaskF_ea4efcf79fa41489897aef4bbf5e655f_Out_0_Float = _Multiply_97e8d2e584b4e587a8ffaa3d3b1b30f5_Out_2_Float;
            #else
            float _UseDynamicCoverTStaticMaskF_ea4efcf79fa41489897aef4bbf5e655f_Out_0_Float = _Clamp_572d83500486058c99890c5d609b30b0_Out_3_Float;
            #endif
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Lerp_55b6201a01421f8b87ba535381db6a03_Out_3_Vector3;
            Unity_Lerp_float3(_BlendOverlayBaseColor_9ac50a6865d3648181da5f6189b8832d_OutVector4_1_Vector3, (_Multiply_b7294cbf7c9daa85b18c13beaf3dc8bd_Out_2_Vector4.xyz), (_UseDynamicCoverTStaticMaskF_ea4efcf79fa41489897aef4bbf5e655f_Out_0_Float.xxx), _Lerp_55b6201a01421f8b87ba535381db6a03_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_1c3992584ba29481b2683ce78818f520_Out_0_Vector4 = _WetColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Multiply_25f2ae8d79d4a388a6cbd74c831c0177_Out_2_Vector3;
            Unity_Multiply_float3_float3((_Property_1c3992584ba29481b2683ce78818f520_Out_0_Vector4.xyz), _Lerp_55b6201a01421f8b87ba535381db6a03_Out_3_Vector3, _Multiply_25f2ae8d79d4a388a6cbd74c831c0177_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_93980743aa69fb86bf250c5a7d50ef20_Out_1_Float;
            Unity_OneMinus_float(_Split_f38ac593c11c408685b4081df7f9a736_R_1_Float, _OneMinus_93980743aa69fb86bf250c5a7d50ef20_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Lerp_19abc331acee5482a25ee61d5a1861cf_Out_3_Vector3;
            Unity_Lerp_float3(_Lerp_55b6201a01421f8b87ba535381db6a03_Out_3_Vector3, _Multiply_25f2ae8d79d4a388a6cbd74c831c0177_Out_2_Vector3, (_OneMinus_93980743aa69fb86bf250c5a7d50ef20_Out_1_Float.xxx), _Lerp_19abc331acee5482a25ee61d5a1861cf_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_b4e25e28683cfa839d36c1919793b680_Out_0_Float = _CoverNormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _NormalStrength_3204e89c6d863484958f2b78ddab5dd5_Out_2_Vector3;
            Unity_NormalStrength_float((_TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b_XYZ_1_Vector4.xyz), _Property_b4e25e28683cfa839d36c1919793b680_Out_0_Float, _NormalStrength_3204e89c6d863484958f2b78ddab5dd5_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Lerp_ddd428cec97e91869b2eec0aace3820c_Out_3_Vector3;
            Unity_Lerp_float3(_NormalBlend_58a0c0d45b55168cbfa43fa9d9da21c6_Out_2_Vector3, _NormalStrength_3204e89c6d863484958f2b78ddab5dd5_Out_2_Vector3, (_UseDynamicCoverTStaticMaskF_ea4efcf79fa41489897aef4bbf5e655f_Out_0_Float.xxx), _Lerp_ddd428cec97e91869b2eec0aace3820c_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_3876d08547d6ec8797d20cbe2c48586d_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseMaskMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_473741cc1ef44c87bb090c6f2487c368;
            _PlanarNM_473741cc1ef44c87bb090c6f2487c368.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_473741cc1ef44c87bb090c6f2487c368.uv0 = IN.uv0;
            _PlanarNM_473741cc1ef44c87bb090c6f2487c368.uv2 = IN.uv2;
            float4 _PlanarNM_473741cc1ef44c87bb090c6f2487c368_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_3876d08547d6ec8797d20cbe2c48586d_Out_0_Texture2D, _Property_e21be9beec8d858fa2818b2fddc4577c_Out_0_Vector4, _Property_1b1963c0ccb4d78fa3474b362fd31d15_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), 1, _PlanarNM_473741cc1ef44c87bb090c6f2487c368, _PlanarNM_473741cc1ef44c87bb090c6f2487c368_XZ_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_7fe5eb12669d4c8a8c20f31f338c8397_R_1_Float = _PlanarNM_473741cc1ef44c87bb090c6f2487c368_XZ_2_Vector4[0];
            float _Split_7fe5eb12669d4c8a8c20f31f338c8397_G_2_Float = _PlanarNM_473741cc1ef44c87bb090c6f2487c368_XZ_2_Vector4[1];
            float _Split_7fe5eb12669d4c8a8c20f31f338c8397_B_3_Float = _PlanarNM_473741cc1ef44c87bb090c6f2487c368_XZ_2_Vector4[2];
            float _Split_7fe5eb12669d4c8a8c20f31f338c8397_A_4_Float = _PlanarNM_473741cc1ef44c87bb090c6f2487c368_XZ_2_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_0341eeccbc4d978a896181416653e2ff_Out_0_Float = _BaseMetallic;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_278b207135e2778aa9bf8d0a7a017a40_Out_2_Float;
            Unity_Multiply_float_float(_Split_7fe5eb12669d4c8a8c20f31f338c8397_R_1_Float, _Property_0341eeccbc4d978a896181416653e2ff_Out_0_Float, _Multiply_278b207135e2778aa9bf8d0a7a017a40_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_49c4138948a1c783b243279625c9552d_Out_0_Float = _BaseAORemapMin;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_dfb5b686d2c404848a58258dd35097bd_Out_0_Float = _BaseAORemapMax;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_284734915ee7d58bb51f29ca62e42039_Out_0_Vector2 = float2(_Property_49c4138948a1c783b243279625c9552d_Out_0_Float, _Property_dfb5b686d2c404848a58258dd35097bd_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_b7cb902e80b8978c9cb00dc6468bac09_Out_3_Float;
            Unity_Remap_float(_Split_7fe5eb12669d4c8a8c20f31f338c8397_G_2_Float, float2 (0, 1), _Vector2_284734915ee7d58bb51f29ca62e42039_Out_0_Vector2, _Remap_b7cb902e80b8978c9cb00dc6468bac09_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_e8e0c807c3942d85896691316499350a_Out_0_Float = _BaseSmoothnessRemapMin;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_0549faf3f215b988850044d78c536992_Out_0_Float = _BaseSmoothnessRemapMax;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_6f793600058fe9809ed375dab39006b9_Out_0_Vector2 = float2(_Property_e8e0c807c3942d85896691316499350a_Out_0_Float, _Property_0549faf3f215b988850044d78c536992_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_13ead59094b737848900d4e63ebebbb3_Out_3_Float;
            Unity_Remap_float(_Split_7fe5eb12669d4c8a8c20f31f338c8397_A_4_Float, float2 (0, 1), _Vector2_6f793600058fe9809ed375dab39006b9_Out_0_Vector2, _Remap_13ead59094b737848900d4e63ebebbb3_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_f7a4b1832ea11a8a8ec52972758cc9e4_Out_2_Float;
            Unity_Multiply_float_float(_SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_B_6_Float, 2, _Multiply_f7a4b1832ea11a8a8ec52972758cc9e4_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_0b75140e53d72d83ae3e255de46e5da4_Out_2_Float;
            Unity_Add_float(_Multiply_f7a4b1832ea11a8a8ec52972758cc9e4_Out_2_Float, float(-1), _Add_0b75140e53d72d83ae3e255de46e5da4_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_39a9bd06e1c7a280af50cd2a384e4438_Out_0_Float = _DetailSmoothnessScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_abefbf3a3f84e0899238487765d0c6d8_Out_2_Float;
            Unity_Multiply_float_float(_Add_0b75140e53d72d83ae3e255de46e5da4_Out_2_Float, _Property_39a9bd06e1c7a280af50cd2a384e4438_Out_0_Float, _Multiply_abefbf3a3f84e0899238487765d0c6d8_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Saturate_d2b0d0dfd4b474868a4ef5f31a175a50_Out_1_Float;
            Unity_Saturate_float(_Multiply_abefbf3a3f84e0899238487765d0c6d8_Out_2_Float, _Saturate_d2b0d0dfd4b474868a4ef5f31a175a50_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Absolute_b19c5992c0eef288b5f88b7297531b62_Out_1_Float;
            Unity_Absolute_float(_Saturate_d2b0d0dfd4b474868a4ef5f31a175a50_Out_1_Float, _Absolute_b19c5992c0eef288b5f88b7297531b62_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_BlendOverlayDetailSmoothness_06e12138dc89c0040b45a57abe520a1a_float _BlendOverlayDetailSmoothness_583d8fed3a50da838e161b9e32275570;
            float _BlendOverlayDetailSmoothness_583d8fed3a50da838e161b9e32275570_SmoothnessOverlay_1_Float;
            SG_BlendOverlayDetailSmoothness_06e12138dc89c0040b45a57abe520a1a_float(_Remap_13ead59094b737848900d4e63ebebbb3_Out_3_Float, _Add_0b75140e53d72d83ae3e255de46e5da4_Out_2_Float, _Absolute_b19c5992c0eef288b5f88b7297531b62_Out_1_Float, _BlendOverlayDetailSmoothness_583d8fed3a50da838e161b9e32275570, _BlendOverlayDetailSmoothness_583d8fed3a50da838e161b9e32275570_SmoothnessOverlay_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Saturate_022595f0f1136682a367ce4fee42f768_Out_1_Float;
            Unity_Saturate_float(_BlendOverlayDetailSmoothness_583d8fed3a50da838e161b9e32275570_SmoothnessOverlay_1_Float, _Saturate_022595f0f1136682a367ce4fee42f768_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Vector3_05b64199abf81188ad251e6cb71cc2c8_Out_0_Vector3 = float3(_Multiply_278b207135e2778aa9bf8d0a7a017a40_Out_2_Float, _Remap_b7cb902e80b8978c9cb00dc6468bac09_Out_3_Float, _Saturate_022595f0f1136682a367ce4fee42f768_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_b603ccfd42f8ef88a78978820f2d2591_Out_0_Float = _CoverMetallic;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_fa4c21b20cf56b8c8844b015bde2d666_Out_2_Float;
            Unity_Multiply_float_float(_Split_d45fa36c68c6428bb4f8080e2005e0ec_R_1_Float, _Property_b603ccfd42f8ef88a78978820f2d2591_Out_0_Float, _Multiply_fa4c21b20cf56b8c8844b015bde2d666_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_49d9c484bdaf088aab97c0f3d87179a4_Out_0_Float = _CoverAORemapMin;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_9b3d764b53fbc9808fd7a6fd7c73993e_Out_0_Float = _CoverAORemapMax;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_787cdcc8eed2fb86afe1dad66892a963_Out_0_Vector2 = float2(_Property_49d9c484bdaf088aab97c0f3d87179a4_Out_0_Float, _Property_9b3d764b53fbc9808fd7a6fd7c73993e_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_0c91273704cf6f8d80d2365c0311db0c_Out_3_Float;
            Unity_Remap_float(_Split_d45fa36c68c6428bb4f8080e2005e0ec_G_2_Float, float2 (0, 1), _Vector2_787cdcc8eed2fb86afe1dad66892a963_Out_0_Vector2, _Remap_0c91273704cf6f8d80d2365c0311db0c_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_312e366a6f346c8a93a9a101b9407a7f_Out_0_Float = _CoverSmoothnessRemapMin;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_cbd9db9d07c3068cbc64c30b3ca0e64b_Out_0_Float = _CoverSmoothnessRemapMax;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_33727db9c2402f859e7bf0e16d80cb40_Out_0_Vector2 = float2(_Property_312e366a6f346c8a93a9a101b9407a7f_Out_0_Float, _Property_cbd9db9d07c3068cbc64c30b3ca0e64b_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_5f073c5f6df66687a17442ebcfddc751_Out_3_Float;
            Unity_Remap_float(_Split_d45fa36c68c6428bb4f8080e2005e0ec_A_4_Float, float2 (0, 1), _Vector2_33727db9c2402f859e7bf0e16d80cb40_Out_0_Vector2, _Remap_5f073c5f6df66687a17442ebcfddc751_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Vector3_3d691bd99e22fd8fb81324aa1809d41a_Out_0_Vector3 = float3(_Multiply_fa4c21b20cf56b8c8844b015bde2d666_Out_2_Float, _Remap_0c91273704cf6f8d80d2365c0311db0c_Out_3_Float, _Remap_5f073c5f6df66687a17442ebcfddc751_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Lerp_c37c1874c700ef83ac7f382075fc755f_Out_3_Vector3;
            Unity_Lerp_float3(_Vector3_05b64199abf81188ad251e6cb71cc2c8_Out_0_Vector3, _Vector3_3d691bd99e22fd8fb81324aa1809d41a_Out_0_Vector3, (_UseDynamicCoverTStaticMaskF_ea4efcf79fa41489897aef4bbf5e655f_Out_0_Float.xxx), _Lerp_c37c1874c700ef83ac7f382075fc755f_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_837d0b2f5d8ac989b3977f5f374d2bb2_R_1_Float = _Lerp_c37c1874c700ef83ac7f382075fc755f_Out_3_Vector3[0];
            float _Split_837d0b2f5d8ac989b3977f5f374d2bb2_G_2_Float = _Lerp_c37c1874c700ef83ac7f382075fc755f_Out_3_Vector3[1];
            float _Split_837d0b2f5d8ac989b3977f5f374d2bb2_B_3_Float = _Lerp_c37c1874c700ef83ac7f382075fc755f_Out_3_Vector3[2];
            float _Split_837d0b2f5d8ac989b3977f5f374d2bb2_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_b3ccd24affa1b388a6dd4b19eaed8757_Out_0_Float = _WetSmoothness;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Lerp_73844a0c1a0eea8ea0563041ca489a0e_Out_3_Float;
            Unity_Lerp_float(_Split_837d0b2f5d8ac989b3977f5f374d2bb2_B_3_Float, _Property_b3ccd24affa1b388a6dd4b19eaed8757_Out_0_Float, _OneMinus_93980743aa69fb86bf250c5a7d50ef20_Out_1_Float, _Lerp_73844a0c1a0eea8ea0563041ca489a0e_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_4bb7737116edbd81bca06201348456ea_R_1_Float = _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae_XZ_2_Vector4[0];
            float _Split_4bb7737116edbd81bca06201348456ea_G_2_Float = _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae_XZ_2_Vector4[1];
            float _Split_4bb7737116edbd81bca06201348456ea_B_3_Float = _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae_XZ_2_Vector4[2];
            float _Split_4bb7737116edbd81bca06201348456ea_A_4_Float = _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae_XZ_2_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_f9637076944eae8abdcc79dc2702814b_Out_0_Float = _AlphaCutoff;
            #endif
            surface.BaseColor = _Lerp_19abc331acee5482a25ee61d5a1861cf_Out_3_Vector3;
            surface.NormalTS = _Lerp_ddd428cec97e91869b2eec0aace3820c_Out_3_Vector3;
            surface.Emission = float3(0, 0, 0);
            surface.Metallic = _Split_837d0b2f5d8ac989b3977f5f374d2bb2_R_1_Float;
            surface.Specular = IsGammaSpace() ? float3(0.5, 0.5, 0.5) : SRGBToLinear(float3(0.5, 0.5, 0.5));
            surface.Smoothness = _Lerp_73844a0c1a0eea8ea0563041ca489a0e_Out_3_Float;
            surface.Occlusion = _Split_837d0b2f5d8ac989b3977f5f374d2bb2_G_2_Float;
            surface.Alpha = _Split_4bb7737116edbd81bca06201348456ea_A_4_Float;
            surface.AlphaClipThreshold = _Property_f9637076944eae8abdcc79dc2702814b_Out_0_Float;
            return surface;
        }
        
        // --------------------------------------------------
        // Build Graph Inputs
        #ifdef HAVE_VFX_MODIFICATION
        #define VFX_SRP_ATTRIBUTES Attributes
        #define VFX_SRP_VARYINGS Varyings
        #define VFX_SRP_SURFACE_INPUTS SurfaceDescriptionInputs
        #endif
        VertexDescriptionInputs BuildVertexDescriptionInputs(Attributes input)
        {
            VertexDescriptionInputs output;
            ZERO_INITIALIZE(VertexDescriptionInputs, output);
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.ObjectSpaceNormal =                          input.normalOS;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.ObjectSpaceTangent =                         input.tangentOS.xyz;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.ObjectSpacePosition =                        input.positionOS;
        #endif
        
        #if UNITY_ANY_INSTANCING_ENABLED
        #else // TODO: XR support for procedural instancing because in this case UNITY_ANY_INSTANCING_ENABLED is not defined and instanceID is incorrect.
        #endif
        
            return output;
        }
        SurfaceDescriptionInputs BuildSurfaceDescriptionInputs(Varyings input)
        {
            SurfaceDescriptionInputs output;
            ZERO_INITIALIZE(SurfaceDescriptionInputs, output);
        
        #ifdef HAVE_VFX_MODIFICATION
        #if VFX_USE_GRAPH_VALUES
            uint instanceActiveIndex = asuint(UNITY_ACCESS_INSTANCED_PROP(PerInstance, _InstanceActiveIndex));
            /* WARNING: $splice Could not find named fragment 'VFXLoadGraphValues' */
        #endif
            /* WARNING: $splice Could not find named fragment 'VFXSetFragInputs' */
        
        #endif
        
            
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        // must use interpolated tangent, bitangent and normal before they are normalized in the pixel shader.
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        float3 unnormalizedNormalWS = input.normalWS;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        const float renormFactor = 1.0 / length(unnormalizedNormalWS);
        #endif
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        // use bitangent on the fly like in hdrp
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        // IMPORTANT! If we ever support Flip on double sided materials ensure bitangent and tangent are NOT flipped.
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        float crossSign = (input.tangentWS.w > 0.0 ? 1.0 : -1.0)* GetOddNegativeScale();
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        float3 bitang = crossSign * cross(input.normalWS.xyz, input.tangentWS.xyz);
        #endif
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.WorldSpaceNormal = renormFactor * input.normalWS.xyz;      // we want a unit length Normal Vector node in shader graph
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.TangentSpaceNormal = float3(0.0f, 0.0f, 1.0f);
        #endif
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        // to pr               eserve mikktspace compliance we use same scale renormFactor as was used on the normal.
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        // This                is explained in section 2.2 in "surface gradient based bump mapping framework"
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.WorldSpaceTangent = renormFactor * input.tangentWS.xyz;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.WorldSpaceBiTangent = renormFactor * bitang;
        #endif
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.WorldSpacePosition = input.positionWS;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.AbsoluteWorldSpacePosition = GetAbsolutePositionWS(input.positionWS);
        #endif
        
        
            #if UNITY_UV_STARTS_AT_TOP
            #else
            #endif
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.uv0 = input.texCoord0;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.uv2 = input.texCoord2;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.VertexColor = input.color;
        #endif
        
        #if UNITY_ANY_INSTANCING_ENABLED
        #else // TODO: XR support for procedural instancing because in this case UNITY_ANY_INSTANCING_ENABLED is not defined and instanceID is incorrect.
        #endif
        #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN output.FaceSign =                    IS_FRONT_VFACE(input.cullFace, true, false);
        #else
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        #endif
        #undef BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        
                return output;
        }
        
        // --------------------------------------------------
        // Main
        
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/UnityGBuffer.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/PBRGBufferPass.hlsl"
        
        // --------------------------------------------------
        // Visual Effect Vertex Invocations
        #ifdef HAVE_VFX_MODIFICATION
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
        #endif
        
        ENDHLSL
        }
        Pass
        {
            Name "ShadowCaster"
            Tags
            {
                "LightMode" = "ShadowCaster"
            }
        
        // Render State
        Cull [_Cull]
        ZTest LEqual
        ZWrite On
        ColorMask 0
        
        // Debug
        // <None>
        
        // --------------------------------------------------
        // Pass
        
        HLSLPROGRAM
        
        // Pragmas
        #pragma target 2.0
        #pragma multi_compile_instancing
        #pragma vertex vert
        #pragma fragment frag
        
        // Keywords
        #pragma multi_compile_vertex _ _CASTING_PUNCTUAL_LIGHT_SHADOW
        #pragma shader_feature_local_fragment _ _ALPHATEST_ON
        #pragma multi_compile _ LOD_FADE_CROSSFADE
        #pragma shader_feature_local _ _USEDYNAMICCOVERTSTATICMASKF_ON
        
        #if defined(_USEDYNAMICCOVERTSTATICMASKF_ON)
            #define KEYWORD_PERMUTATION_0
        #else
            #define KEYWORD_PERMUTATION_1
        #endif
        
        
        // Defines
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define _NORMALMAP 1
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define _NORMAL_DROPOFF_TS 1
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_NORMAL
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_TANGENT
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_TEXCOORD0
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_TEXCOORD2
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define FEATURES_GRAPH_VERTEX_NORMAL_OUTPUT
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define FEATURES_GRAPH_VERTEX_TANGENT_OUTPUT
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_POSITION_WS
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_NORMAL_WS
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_TEXCOORD0
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_TEXCOORD2
        #endif
        
        #define FEATURES_GRAPH_VERTEX
        /* WARNING: $splice Could not find named fragment 'PassInstancing' */
        #define SHADERPASS SHADERPASS_SHADOWCASTER
        #define USE_UNITY_CROSSFADE 1
        
        
        // custom interpolator pre-include
        /* WARNING: $splice Could not find named fragment 'sgci_CustomInterpolatorPreInclude' */
        
        // Includes
        #include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
        #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
        
        // --------------------------------------------------
        // Structs and Packing
        
        // custom interpolators pre packing
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPrePacking' */
        
        struct Attributes
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 positionOS : POSITION;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 normalOS : NORMAL;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 tangentOS : TANGENT;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv0 : TEXCOORD0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv2 : TEXCOORD2;
            #endif
            #if UNITY_ANY_INSTANCING_ENABLED || defined(ATTRIBUTES_NEED_INSTANCEID)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint instanceID : INSTANCEID_SEMANTIC;
            #endif
            #endif
        };
        struct Varyings
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 positionCS : SV_POSITION;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 positionWS;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 normalWS;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord2;
            #endif
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
            #endif
        };
        struct SurfaceDescriptionInputs
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 AbsoluteWorldSpacePosition;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv2;
            #endif
        };
        struct VertexDescriptionInputs
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 ObjectSpaceNormal;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 ObjectSpaceTangent;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 ObjectSpacePosition;
            #endif
        };
        struct PackedVaryings
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 positionCS : SV_POSITION;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord0 : INTERP0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord2 : INTERP1;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 positionWS : INTERP2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 normalWS : INTERP3;
            #endif
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
            #endif
        };
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        PackedVaryings PackVaryings (Varyings input)
        {
            PackedVaryings output;
            ZERO_INITIALIZE(PackedVaryings, output);
            output.positionCS = input.positionCS;
            output.texCoord0.xyzw = input.texCoord0;
            output.texCoord2.xyzw = input.texCoord2;
            output.positionWS.xyz = input.positionWS;
            output.normalWS.xyz = input.normalWS;
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        
        Varyings UnpackVaryings (PackedVaryings input)
        {
            Varyings output;
            output.positionCS = input.positionCS;
            output.texCoord0 = input.texCoord0.xyzw;
            output.texCoord2 = input.texCoord2.xyzw;
            output.positionWS = input.positionWS.xyz;
            output.normalWS = input.normalWS.xyz;
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        #endif
        
        // --------------------------------------------------
        // Graph
        
        // Graph Properties
        CBUFFER_START(UnityPerMaterial)
        float _AlphaCutoff;
        float4 _BaseColor;
        float4 _BaseColorMap_TexelSize;
        float _BaseUsePlanarUV;
        float4 _BaseTilingOffset;
        float4 _BaseNormalMap_TexelSize;
        float _BaseNormalScale;
        float4 _BaseMaskMap_TexelSize;
        float _BaseMetallic;
        float _BaseAORemapMin;
        float _BaseAORemapMax;
        float _BaseSmoothnessRemapMin;
        float _BaseSmoothnessRemapMax;
        float4 _CoverMaskA_TexelSize;
        float _CoverMaskPower;
        float _Cover_Amount;
        float _Cover_Amount_Grow_Speed;
        float3 _CoverDirection;
        float _Cover_Max_Angle;
        float _Cover_Min_Height;
        float _Cover_Min_Height_Blending;
        float4 _CoverBaseColor;
        float4 _CoverBaseColorMap_TexelSize;
        float4 _CoverTilingOffset;
        float _CoverTriplanarThreshold;
        float4 _CoverNormalMap_TexelSize;
        float _CoverNormalScale;
        float _CoverNormalBlendHardness;
        float _CoverHardness;
        float _CoverHeightMapMin;
        float _CoverHeightMapMax;
        float _CoverHeightMapOffset;
        float4 _CoverMaskMap_TexelSize;
        float _CoverMetallic;
        float _CoverAORemapMin;
        float _CoverAORemapMax;
        float _CoverSmoothnessRemapMin;
        float _CoverSmoothnessRemapMax;
        float4 _DetailMap_TexelSize;
        float4 _DetailTilingOffset;
        float _DetailAlbedoScale;
        float _DetailNormalScale;
        float _DetailSmoothnessScale;
        float4 _WetColor;
        float _WetSmoothness;
        UNITY_TEXTURE_STREAMING_DEBUG_VARS;
        CBUFFER_END
        
        
        // Object and Global properties
        SAMPLER(SamplerState_Linear_Repeat);
        SAMPLER(SamplerState_Linear_Repeat_Aniso8);
        TEXTURE2D(_BaseColorMap);
        SAMPLER(sampler_BaseColorMap);
        TEXTURE2D(_BaseNormalMap);
        SAMPLER(sampler_BaseNormalMap);
        TEXTURE2D(_BaseMaskMap);
        SAMPLER(sampler_BaseMaskMap);
        TEXTURE2D(_CoverMaskA);
        SAMPLER(sampler_CoverMaskA);
        TEXTURE2D(_CoverBaseColorMap);
        SAMPLER(sampler_CoverBaseColorMap);
        TEXTURE2D(_CoverNormalMap);
        SAMPLER(sampler_CoverNormalMap);
        TEXTURE2D(_CoverMaskMap);
        SAMPLER(sampler_CoverMaskMap);
        TEXTURE2D(_DetailMap);
        SAMPLER(sampler_DetailMap);
        
        // Graph Includes
        // GraphIncludes: <None>
        
        // -- Property used by ScenePickingPass
        #ifdef SCENEPICKINGPASS
        float4 _SelectionID;
        #endif
        
        // -- Properties used by SceneSelectionPass
        #ifdef SCENESELECTIONPASS
        int _ObjectId;
        int _PassValue;
        #endif
        
        // Graph Functions
        
        void Unity_Combine_float(float R, float G, float B, float A, out float4 RGBA, out float3 RGB, out float2 RG)
        {
            RGBA = float4(R, G, B, A);
            RGB = float3(R, G, B);
            RG = float2(R, G);
        }
        
        void Unity_Divide_float(float A, float B, out float Out)
        {
            Out = A / B;
        }
        
        void Unity_Multiply_float4_float4(float4 A, float4 B, out float4 Out)
        {
        Out = A * B;
        }
        
        void Unity_Branch_float4(float Predicate, float4 True, float4 False, out float4 Out)
        {
            Out = Predicate ? True : False;
        }
        
        void Unity_TilingAndOffset_float(float2 UV, float2 Tiling, float2 Offset, out float2 Out)
        {
            Out = UV * Tiling + Offset;
        }
        
        void Unity_Branch_float2(float Predicate, float2 True, float2 False, out float2 Out)
        {
            Out = Predicate ? True : False;
        }
        
        struct Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float
        {
        float3 AbsoluteWorldSpacePosition;
        half4 uv0;
        half4 uv2;
        };
        
        void SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(UnityTexture2D Texture2D_80A3D28F, float4 Vector4_2EBA7A3B, float Boolean_7ABB9909, UnitySamplerState _SamplerState, float Boolean_5ddfe6daabcc4715a44b5f34fc19becb, Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float IN, out float4 XZ_2)
        {
        UnityTexture2D _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D = Texture2D_80A3D28F;
        float _Property_30834f691775a0898a45b1c868520436_Out_0_Boolean = Boolean_7ABB9909;
        float _Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
        float _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
        float _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
        float _Split_89ed63cb625cb3878c183d0b71c03400_A_4_Float = 0;
        float4 _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4;
        float3 _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3;
        float2 _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, float(0), float(0), _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3, _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2);
        float4 _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4 = Vector4_2EBA7A3B;
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_R_1_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[0];
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_G_2_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[1];
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_B_3_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[2];
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_A_4_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[3];
        float _Divide_e64179199923c58289b6aa94ea6c9178_Out_2_Float;
        Unity_Divide_float(float(1), _Split_2f0f52f6ef8c0e81af0da6476402bc1f_R_1_Float, _Divide_e64179199923c58289b6aa94ea6c9178_Out_2_Float);
        float4 _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, (_Divide_e64179199923c58289b6aa94ea6c9178_Out_2_Float.xxxx), _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4);
        float _Property_f17c7bf877e64b6abdd66b1fe9f5accc_Out_0_Boolean = Boolean_5ddfe6daabcc4715a44b5f34fc19becb;
        float4 _UV_029e8e8198564838b9389b902a09fb22_Out_0_Vector4 = IN.uv0;
        float4 _UV_7a6209af1506424fb75c81e87e42035a_Out_0_Vector4 = IN.uv2;
        float4 _Branch_fc37bb4bf641457cbbc6e290603056ff_Out_3_Vector4;
        Unity_Branch_float4(_Property_f17c7bf877e64b6abdd66b1fe9f5accc_Out_0_Boolean, _UV_029e8e8198564838b9389b902a09fb22_Out_0_Vector4, _UV_7a6209af1506424fb75c81e87e42035a_Out_0_Vector4, _Branch_fc37bb4bf641457cbbc6e290603056ff_Out_3_Vector4);
        float2 _Vector2_16c15d3bbdd14b85bd48e3a6cb318af7_Out_0_Vector2 = float2(_Split_2f0f52f6ef8c0e81af0da6476402bc1f_R_1_Float, _Split_2f0f52f6ef8c0e81af0da6476402bc1f_G_2_Float);
        float2 _Vector2_f8d75f54e7705083bbec539a60185577_Out_0_Vector2 = float2(_Split_2f0f52f6ef8c0e81af0da6476402bc1f_B_3_Float, _Split_2f0f52f6ef8c0e81af0da6476402bc1f_A_4_Float);
        float2 _TilingAndOffset_d91e2d25acd34686b562b7fe7e9d1d27_Out_3_Vector2;
        Unity_TilingAndOffset_float((_Branch_fc37bb4bf641457cbbc6e290603056ff_Out_3_Vector4.xy), _Vector2_16c15d3bbdd14b85bd48e3a6cb318af7_Out_0_Vector2, _Vector2_f8d75f54e7705083bbec539a60185577_Out_0_Vector2, _TilingAndOffset_d91e2d25acd34686b562b7fe7e9d1d27_Out_3_Vector2);
        float2 _Branch_8e5a4e8f4d52fc8aadd1f46485afc933_Out_3_Vector2;
        Unity_Branch_float2(_Property_30834f691775a0898a45b1c868520436_Out_0_Boolean, (_Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4.xy), _TilingAndOffset_d91e2d25acd34686b562b7fe7e9d1d27_Out_3_Vector2, _Branch_8e5a4e8f4d52fc8aadd1f46485afc933_Out_3_Vector2);
        UnitySamplerState _Property_e8746b9475c94530ba35ba8019ad2ae0_Out_0_SamplerState = _SamplerState;
        float4 _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, _Property_e8746b9475c94530ba35ba8019ad2ae0_Out_0_SamplerState.samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Branch_8e5a4e8f4d52fc8aadd1f46485afc933_Out_3_Vector2) );
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.r;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.g;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.b;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_A_7_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.a;
        XZ_2 = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4;
        }
        
        // Custom interpolators pre vertex
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPreVertex' */
        
        // Graph Vertex
        struct VertexDescription
        {
            float3 Position;
            float3 Normal;
            float3 Tangent;
        };
        
        VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
        {
            VertexDescription description = (VertexDescription)0;
            description.Position = IN.ObjectSpacePosition;
            description.Normal = IN.ObjectSpaceNormal;
            description.Tangent = IN.ObjectSpaceTangent;
            return description;
        }
        
        // Custom interpolators, pre surface
        #ifdef FEATURES_GRAPH_VERTEX
        Varyings CustomInterpolatorPassThroughFunc(inout Varyings output, VertexDescription input)
        {
        return output;
        }
        #define CUSTOMINTERPOLATOR_VARYPASSTHROUGH_FUNC
        #endif
        
        // Graph Pixel
        struct SurfaceDescription
        {
            float Alpha;
            float AlphaClipThreshold;
        };
        
        SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
        {
            SurfaceDescription surface = (SurfaceDescription)0;
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_05d49814100eb3808cd61a6177622291_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseColorMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_e21be9beec8d858fa2818b2fddc4577c_Out_0_Vector4 = _BaseTilingOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_1b1963c0ccb4d78fa3474b362fd31d15_Out_0_Boolean = _BaseUsePlanarUV;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae;
            _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae.uv0 = IN.uv0;
            _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae.uv2 = IN.uv2;
            float4 _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_05d49814100eb3808cd61a6177622291_Out_0_Texture2D, _Property_e21be9beec8d858fa2818b2fddc4577c_Out_0_Vector4, _Property_1b1963c0ccb4d78fa3474b362fd31d15_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), 1, _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae, _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae_XZ_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_4bb7737116edbd81bca06201348456ea_R_1_Float = _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae_XZ_2_Vector4[0];
            float _Split_4bb7737116edbd81bca06201348456ea_G_2_Float = _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae_XZ_2_Vector4[1];
            float _Split_4bb7737116edbd81bca06201348456ea_B_3_Float = _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae_XZ_2_Vector4[2];
            float _Split_4bb7737116edbd81bca06201348456ea_A_4_Float = _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae_XZ_2_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_f9637076944eae8abdcc79dc2702814b_Out_0_Float = _AlphaCutoff;
            #endif
            surface.Alpha = _Split_4bb7737116edbd81bca06201348456ea_A_4_Float;
            surface.AlphaClipThreshold = _Property_f9637076944eae8abdcc79dc2702814b_Out_0_Float;
            return surface;
        }
        
        // --------------------------------------------------
        // Build Graph Inputs
        #ifdef HAVE_VFX_MODIFICATION
        #define VFX_SRP_ATTRIBUTES Attributes
        #define VFX_SRP_VARYINGS Varyings
        #define VFX_SRP_SURFACE_INPUTS SurfaceDescriptionInputs
        #endif
        VertexDescriptionInputs BuildVertexDescriptionInputs(Attributes input)
        {
            VertexDescriptionInputs output;
            ZERO_INITIALIZE(VertexDescriptionInputs, output);
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.ObjectSpaceNormal =                          input.normalOS;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.ObjectSpaceTangent =                         input.tangentOS.xyz;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.ObjectSpacePosition =                        input.positionOS;
        #endif
        
        #if UNITY_ANY_INSTANCING_ENABLED
        #else // TODO: XR support for procedural instancing because in this case UNITY_ANY_INSTANCING_ENABLED is not defined and instanceID is incorrect.
        #endif
        
            return output;
        }
        SurfaceDescriptionInputs BuildSurfaceDescriptionInputs(Varyings input)
        {
            SurfaceDescriptionInputs output;
            ZERO_INITIALIZE(SurfaceDescriptionInputs, output);
        
        #ifdef HAVE_VFX_MODIFICATION
        #if VFX_USE_GRAPH_VALUES
            uint instanceActiveIndex = asuint(UNITY_ACCESS_INSTANCED_PROP(PerInstance, _InstanceActiveIndex));
            /* WARNING: $splice Could not find named fragment 'VFXLoadGraphValues' */
        #endif
            /* WARNING: $splice Could not find named fragment 'VFXSetFragInputs' */
        
        #endif
        
            
        
        
        
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.AbsoluteWorldSpacePosition = GetAbsolutePositionWS(input.positionWS);
        #endif
        
        
            #if UNITY_UV_STARTS_AT_TOP
            #else
            #endif
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.uv0 = input.texCoord0;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.uv2 = input.texCoord2;
        #endif
        
        #if UNITY_ANY_INSTANCING_ENABLED
        #else // TODO: XR support for procedural instancing because in this case UNITY_ANY_INSTANCING_ENABLED is not defined and instanceID is incorrect.
        #endif
        #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN output.FaceSign =                    IS_FRONT_VFACE(input.cullFace, true, false);
        #else
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        #endif
        #undef BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        
                return output;
        }
        
        // --------------------------------------------------
        // Main
        
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShadowCasterPass.hlsl"
        
        // --------------------------------------------------
        // Visual Effect Vertex Invocations
        #ifdef HAVE_VFX_MODIFICATION
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
        #endif
        
        ENDHLSL
        }
        Pass
        {
            Name "MotionVectors"
            Tags
            {
                "LightMode" = "MotionVectors"
            }
        
        // Render State
        Cull [_Cull]
        ZTest LEqual
        ZWrite On
        ColorMask RG
        
        // Debug
        // <None>
        
        // --------------------------------------------------
        // Pass
        
        HLSLPROGRAM
        
        // Pragmas
        #pragma target 3.5
        #pragma multi_compile_instancing
        #pragma vertex vert
        #pragma fragment frag
        
        // Keywords
        #pragma shader_feature_local_fragment _ _ALPHATEST_ON
        #pragma multi_compile _ LOD_FADE_CROSSFADE
        #pragma shader_feature_local _ _USEDYNAMICCOVERTSTATICMASKF_ON
        
        #if defined(_USEDYNAMICCOVERTSTATICMASKF_ON)
            #define KEYWORD_PERMUTATION_0
        #else
            #define KEYWORD_PERMUTATION_1
        #endif
        
        
        // Defines
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define _NORMALMAP 1
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define _NORMAL_DROPOFF_TS 1
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_TEXCOORD0
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_TEXCOORD2
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_POSITION_WS
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_TEXCOORD0
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_TEXCOORD2
        #endif
        
        #define FEATURES_GRAPH_VERTEX
        /* WARNING: $splice Could not find named fragment 'PassInstancing' */
        #define SHADERPASS SHADERPASS_MOTION_VECTORS
        #define USE_UNITY_CROSSFADE 1
        
        
        // custom interpolator pre-include
        /* WARNING: $splice Could not find named fragment 'sgci_CustomInterpolatorPreInclude' */
        
        // Includes
        #include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
        #include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/RenderingLayers.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
        #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
        
        // --------------------------------------------------
        // Structs and Packing
        
        // custom interpolators pre packing
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPrePacking' */
        
        struct Attributes
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 positionOS : POSITION;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv0 : TEXCOORD0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv2 : TEXCOORD2;
            #endif
            #if UNITY_ANY_INSTANCING_ENABLED || defined(ATTRIBUTES_NEED_INSTANCEID)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint instanceID : INSTANCEID_SEMANTIC;
            #endif
            #endif
        };
        struct Varyings
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 positionCS : SV_POSITION;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 positionWS;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord2;
            #endif
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
            #endif
        };
        struct SurfaceDescriptionInputs
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 AbsoluteWorldSpacePosition;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv2;
            #endif
        };
        struct VertexDescriptionInputs
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 ObjectSpacePosition;
            #endif
        };
        struct PackedVaryings
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 positionCS : SV_POSITION;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord0 : INTERP0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord2 : INTERP1;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 positionWS : INTERP2;
            #endif
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
            #endif
        };
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        PackedVaryings PackVaryings (Varyings input)
        {
            PackedVaryings output;
            ZERO_INITIALIZE(PackedVaryings, output);
            output.positionCS = input.positionCS;
            output.texCoord0.xyzw = input.texCoord0;
            output.texCoord2.xyzw = input.texCoord2;
            output.positionWS.xyz = input.positionWS;
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        
        Varyings UnpackVaryings (PackedVaryings input)
        {
            Varyings output;
            output.positionCS = input.positionCS;
            output.texCoord0 = input.texCoord0.xyzw;
            output.texCoord2 = input.texCoord2.xyzw;
            output.positionWS = input.positionWS.xyz;
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        #endif
        
        // --------------------------------------------------
        // Graph
        
        // Graph Properties
        CBUFFER_START(UnityPerMaterial)
        float _AlphaCutoff;
        float4 _BaseColor;
        float4 _BaseColorMap_TexelSize;
        float _BaseUsePlanarUV;
        float4 _BaseTilingOffset;
        float4 _BaseNormalMap_TexelSize;
        float _BaseNormalScale;
        float4 _BaseMaskMap_TexelSize;
        float _BaseMetallic;
        float _BaseAORemapMin;
        float _BaseAORemapMax;
        float _BaseSmoothnessRemapMin;
        float _BaseSmoothnessRemapMax;
        float4 _CoverMaskA_TexelSize;
        float _CoverMaskPower;
        float _Cover_Amount;
        float _Cover_Amount_Grow_Speed;
        float3 _CoverDirection;
        float _Cover_Max_Angle;
        float _Cover_Min_Height;
        float _Cover_Min_Height_Blending;
        float4 _CoverBaseColor;
        float4 _CoverBaseColorMap_TexelSize;
        float4 _CoverTilingOffset;
        float _CoverTriplanarThreshold;
        float4 _CoverNormalMap_TexelSize;
        float _CoverNormalScale;
        float _CoverNormalBlendHardness;
        float _CoverHardness;
        float _CoverHeightMapMin;
        float _CoverHeightMapMax;
        float _CoverHeightMapOffset;
        float4 _CoverMaskMap_TexelSize;
        float _CoverMetallic;
        float _CoverAORemapMin;
        float _CoverAORemapMax;
        float _CoverSmoothnessRemapMin;
        float _CoverSmoothnessRemapMax;
        float4 _DetailMap_TexelSize;
        float4 _DetailTilingOffset;
        float _DetailAlbedoScale;
        float _DetailNormalScale;
        float _DetailSmoothnessScale;
        float4 _WetColor;
        float _WetSmoothness;
        UNITY_TEXTURE_STREAMING_DEBUG_VARS;
        CBUFFER_END
        
        
        // Object and Global properties
        SAMPLER(SamplerState_Linear_Repeat);
        SAMPLER(SamplerState_Linear_Repeat_Aniso8);
        TEXTURE2D(_BaseColorMap);
        SAMPLER(sampler_BaseColorMap);
        TEXTURE2D(_BaseNormalMap);
        SAMPLER(sampler_BaseNormalMap);
        TEXTURE2D(_BaseMaskMap);
        SAMPLER(sampler_BaseMaskMap);
        TEXTURE2D(_CoverMaskA);
        SAMPLER(sampler_CoverMaskA);
        TEXTURE2D(_CoverBaseColorMap);
        SAMPLER(sampler_CoverBaseColorMap);
        TEXTURE2D(_CoverNormalMap);
        SAMPLER(sampler_CoverNormalMap);
        TEXTURE2D(_CoverMaskMap);
        SAMPLER(sampler_CoverMaskMap);
        TEXTURE2D(_DetailMap);
        SAMPLER(sampler_DetailMap);
        
        // Graph Includes
        // GraphIncludes: <None>
        
        // -- Property used by ScenePickingPass
        #ifdef SCENEPICKINGPASS
        float4 _SelectionID;
        #endif
        
        // -- Properties used by SceneSelectionPass
        #ifdef SCENESELECTIONPASS
        int _ObjectId;
        int _PassValue;
        #endif
        
        // Graph Functions
        
        void Unity_Combine_float(float R, float G, float B, float A, out float4 RGBA, out float3 RGB, out float2 RG)
        {
            RGBA = float4(R, G, B, A);
            RGB = float3(R, G, B);
            RG = float2(R, G);
        }
        
        void Unity_Divide_float(float A, float B, out float Out)
        {
            Out = A / B;
        }
        
        void Unity_Multiply_float4_float4(float4 A, float4 B, out float4 Out)
        {
        Out = A * B;
        }
        
        void Unity_Branch_float4(float Predicate, float4 True, float4 False, out float4 Out)
        {
            Out = Predicate ? True : False;
        }
        
        void Unity_TilingAndOffset_float(float2 UV, float2 Tiling, float2 Offset, out float2 Out)
        {
            Out = UV * Tiling + Offset;
        }
        
        void Unity_Branch_float2(float Predicate, float2 True, float2 False, out float2 Out)
        {
            Out = Predicate ? True : False;
        }
        
        struct Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float
        {
        float3 AbsoluteWorldSpacePosition;
        half4 uv0;
        half4 uv2;
        };
        
        void SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(UnityTexture2D Texture2D_80A3D28F, float4 Vector4_2EBA7A3B, float Boolean_7ABB9909, UnitySamplerState _SamplerState, float Boolean_5ddfe6daabcc4715a44b5f34fc19becb, Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float IN, out float4 XZ_2)
        {
        UnityTexture2D _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D = Texture2D_80A3D28F;
        float _Property_30834f691775a0898a45b1c868520436_Out_0_Boolean = Boolean_7ABB9909;
        float _Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
        float _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
        float _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
        float _Split_89ed63cb625cb3878c183d0b71c03400_A_4_Float = 0;
        float4 _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4;
        float3 _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3;
        float2 _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, float(0), float(0), _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3, _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2);
        float4 _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4 = Vector4_2EBA7A3B;
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_R_1_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[0];
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_G_2_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[1];
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_B_3_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[2];
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_A_4_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[3];
        float _Divide_e64179199923c58289b6aa94ea6c9178_Out_2_Float;
        Unity_Divide_float(float(1), _Split_2f0f52f6ef8c0e81af0da6476402bc1f_R_1_Float, _Divide_e64179199923c58289b6aa94ea6c9178_Out_2_Float);
        float4 _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, (_Divide_e64179199923c58289b6aa94ea6c9178_Out_2_Float.xxxx), _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4);
        float _Property_f17c7bf877e64b6abdd66b1fe9f5accc_Out_0_Boolean = Boolean_5ddfe6daabcc4715a44b5f34fc19becb;
        float4 _UV_029e8e8198564838b9389b902a09fb22_Out_0_Vector4 = IN.uv0;
        float4 _UV_7a6209af1506424fb75c81e87e42035a_Out_0_Vector4 = IN.uv2;
        float4 _Branch_fc37bb4bf641457cbbc6e290603056ff_Out_3_Vector4;
        Unity_Branch_float4(_Property_f17c7bf877e64b6abdd66b1fe9f5accc_Out_0_Boolean, _UV_029e8e8198564838b9389b902a09fb22_Out_0_Vector4, _UV_7a6209af1506424fb75c81e87e42035a_Out_0_Vector4, _Branch_fc37bb4bf641457cbbc6e290603056ff_Out_3_Vector4);
        float2 _Vector2_16c15d3bbdd14b85bd48e3a6cb318af7_Out_0_Vector2 = float2(_Split_2f0f52f6ef8c0e81af0da6476402bc1f_R_1_Float, _Split_2f0f52f6ef8c0e81af0da6476402bc1f_G_2_Float);
        float2 _Vector2_f8d75f54e7705083bbec539a60185577_Out_0_Vector2 = float2(_Split_2f0f52f6ef8c0e81af0da6476402bc1f_B_3_Float, _Split_2f0f52f6ef8c0e81af0da6476402bc1f_A_4_Float);
        float2 _TilingAndOffset_d91e2d25acd34686b562b7fe7e9d1d27_Out_3_Vector2;
        Unity_TilingAndOffset_float((_Branch_fc37bb4bf641457cbbc6e290603056ff_Out_3_Vector4.xy), _Vector2_16c15d3bbdd14b85bd48e3a6cb318af7_Out_0_Vector2, _Vector2_f8d75f54e7705083bbec539a60185577_Out_0_Vector2, _TilingAndOffset_d91e2d25acd34686b562b7fe7e9d1d27_Out_3_Vector2);
        float2 _Branch_8e5a4e8f4d52fc8aadd1f46485afc933_Out_3_Vector2;
        Unity_Branch_float2(_Property_30834f691775a0898a45b1c868520436_Out_0_Boolean, (_Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4.xy), _TilingAndOffset_d91e2d25acd34686b562b7fe7e9d1d27_Out_3_Vector2, _Branch_8e5a4e8f4d52fc8aadd1f46485afc933_Out_3_Vector2);
        UnitySamplerState _Property_e8746b9475c94530ba35ba8019ad2ae0_Out_0_SamplerState = _SamplerState;
        float4 _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, _Property_e8746b9475c94530ba35ba8019ad2ae0_Out_0_SamplerState.samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Branch_8e5a4e8f4d52fc8aadd1f46485afc933_Out_3_Vector2) );
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.r;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.g;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.b;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_A_7_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.a;
        XZ_2 = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4;
        }
        
        // Custom interpolators pre vertex
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPreVertex' */
        
        // Graph Vertex
        struct VertexDescription
        {
            float3 Position;
        };
        
        VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
        {
            VertexDescription description = (VertexDescription)0;
            description.Position = IN.ObjectSpacePosition;
            return description;
        }
        
        // Custom interpolators, pre surface
        #ifdef FEATURES_GRAPH_VERTEX
        Varyings CustomInterpolatorPassThroughFunc(inout Varyings output, VertexDescription input)
        {
        return output;
        }
        #define CUSTOMINTERPOLATOR_VARYPASSTHROUGH_FUNC
        #endif
        
        // Graph Pixel
        struct SurfaceDescription
        {
            float Alpha;
            float AlphaClipThreshold;
        };
        
        SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
        {
            SurfaceDescription surface = (SurfaceDescription)0;
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_05d49814100eb3808cd61a6177622291_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseColorMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_e21be9beec8d858fa2818b2fddc4577c_Out_0_Vector4 = _BaseTilingOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_1b1963c0ccb4d78fa3474b362fd31d15_Out_0_Boolean = _BaseUsePlanarUV;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae;
            _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae.uv0 = IN.uv0;
            _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae.uv2 = IN.uv2;
            float4 _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_05d49814100eb3808cd61a6177622291_Out_0_Texture2D, _Property_e21be9beec8d858fa2818b2fddc4577c_Out_0_Vector4, _Property_1b1963c0ccb4d78fa3474b362fd31d15_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), 1, _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae, _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae_XZ_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_4bb7737116edbd81bca06201348456ea_R_1_Float = _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae_XZ_2_Vector4[0];
            float _Split_4bb7737116edbd81bca06201348456ea_G_2_Float = _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae_XZ_2_Vector4[1];
            float _Split_4bb7737116edbd81bca06201348456ea_B_3_Float = _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae_XZ_2_Vector4[2];
            float _Split_4bb7737116edbd81bca06201348456ea_A_4_Float = _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae_XZ_2_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_f9637076944eae8abdcc79dc2702814b_Out_0_Float = _AlphaCutoff;
            #endif
            surface.Alpha = _Split_4bb7737116edbd81bca06201348456ea_A_4_Float;
            surface.AlphaClipThreshold = _Property_f9637076944eae8abdcc79dc2702814b_Out_0_Float;
            return surface;
        }
        
        // --------------------------------------------------
        // Build Graph Inputs
        #ifdef HAVE_VFX_MODIFICATION
        #define VFX_SRP_ATTRIBUTES Attributes
        #define VFX_SRP_VARYINGS Varyings
        #define VFX_SRP_SURFACE_INPUTS SurfaceDescriptionInputs
        #endif
        VertexDescriptionInputs BuildVertexDescriptionInputs(Attributes input)
        {
            VertexDescriptionInputs output;
            ZERO_INITIALIZE(VertexDescriptionInputs, output);
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.ObjectSpacePosition =                        input.positionOS;
        #endif
        
        #if UNITY_ANY_INSTANCING_ENABLED
        #else // TODO: XR support for procedural instancing because in this case UNITY_ANY_INSTANCING_ENABLED is not defined and instanceID is incorrect.
        #endif
        
            return output;
        }
        SurfaceDescriptionInputs BuildSurfaceDescriptionInputs(Varyings input)
        {
            SurfaceDescriptionInputs output;
            ZERO_INITIALIZE(SurfaceDescriptionInputs, output);
        
        #ifdef HAVE_VFX_MODIFICATION
        #if VFX_USE_GRAPH_VALUES
            uint instanceActiveIndex = asuint(UNITY_ACCESS_INSTANCED_PROP(PerInstance, _InstanceActiveIndex));
            /* WARNING: $splice Could not find named fragment 'VFXLoadGraphValues' */
        #endif
            /* WARNING: $splice Could not find named fragment 'VFXSetFragInputs' */
        
        #endif
        
            
        
        
        
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.AbsoluteWorldSpacePosition = GetAbsolutePositionWS(input.positionWS);
        #endif
        
        
            #if UNITY_UV_STARTS_AT_TOP
            #else
            #endif
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.uv0 = input.texCoord0;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.uv2 = input.texCoord2;
        #endif
        
        #if UNITY_ANY_INSTANCING_ENABLED
        #else // TODO: XR support for procedural instancing because in this case UNITY_ANY_INSTANCING_ENABLED is not defined and instanceID is incorrect.
        #endif
        #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN output.FaceSign =                    IS_FRONT_VFACE(input.cullFace, true, false);
        #else
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        #endif
        #undef BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        
                return output;
        }
        
        // --------------------------------------------------
        // Main
        
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/MotionVectorPass.hlsl"
        
        // --------------------------------------------------
        // Visual Effect Vertex Invocations
        #ifdef HAVE_VFX_MODIFICATION
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
        #endif
        
        ENDHLSL
        }
        Pass
        {
            Name "DepthOnly"
            Tags
            {
                "LightMode" = "DepthOnly"
            }
        
        // Render State
        Cull [_Cull]
        ZTest LEqual
        ZWrite On
        ColorMask R
        
        // Debug
        // <None>
        
        // --------------------------------------------------
        // Pass
        
        HLSLPROGRAM
        
        // Pragmas
        #pragma target 2.0
        #pragma multi_compile_instancing
        #pragma vertex vert
        #pragma fragment frag
        
        // Keywords
        #pragma shader_feature_local_fragment _ _ALPHATEST_ON
        #pragma multi_compile _ LOD_FADE_CROSSFADE
        #pragma shader_feature_local _ _USEDYNAMICCOVERTSTATICMASKF_ON
        
        #if defined(_USEDYNAMICCOVERTSTATICMASKF_ON)
            #define KEYWORD_PERMUTATION_0
        #else
            #define KEYWORD_PERMUTATION_1
        #endif
        
        
        // Defines
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define _NORMALMAP 1
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define _NORMAL_DROPOFF_TS 1
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_NORMAL
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_TANGENT
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_TEXCOORD0
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_TEXCOORD2
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define FEATURES_GRAPH_VERTEX_NORMAL_OUTPUT
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define FEATURES_GRAPH_VERTEX_TANGENT_OUTPUT
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_POSITION_WS
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_TEXCOORD0
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_TEXCOORD2
        #endif
        
        #define FEATURES_GRAPH_VERTEX
        /* WARNING: $splice Could not find named fragment 'PassInstancing' */
        #define SHADERPASS SHADERPASS_DEPTHONLY
        #define USE_UNITY_CROSSFADE 1
        
        
        // custom interpolator pre-include
        /* WARNING: $splice Could not find named fragment 'sgci_CustomInterpolatorPreInclude' */
        
        // Includes
        #include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
        #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
        
        // --------------------------------------------------
        // Structs and Packing
        
        // custom interpolators pre packing
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPrePacking' */
        
        struct Attributes
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 positionOS : POSITION;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 normalOS : NORMAL;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 tangentOS : TANGENT;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv0 : TEXCOORD0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv2 : TEXCOORD2;
            #endif
            #if UNITY_ANY_INSTANCING_ENABLED || defined(ATTRIBUTES_NEED_INSTANCEID)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint instanceID : INSTANCEID_SEMANTIC;
            #endif
            #endif
        };
        struct Varyings
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 positionCS : SV_POSITION;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 positionWS;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord2;
            #endif
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
            #endif
        };
        struct SurfaceDescriptionInputs
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 AbsoluteWorldSpacePosition;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv2;
            #endif
        };
        struct VertexDescriptionInputs
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 ObjectSpaceNormal;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 ObjectSpaceTangent;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 ObjectSpacePosition;
            #endif
        };
        struct PackedVaryings
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 positionCS : SV_POSITION;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord0 : INTERP0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord2 : INTERP1;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 positionWS : INTERP2;
            #endif
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
            #endif
        };
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        PackedVaryings PackVaryings (Varyings input)
        {
            PackedVaryings output;
            ZERO_INITIALIZE(PackedVaryings, output);
            output.positionCS = input.positionCS;
            output.texCoord0.xyzw = input.texCoord0;
            output.texCoord2.xyzw = input.texCoord2;
            output.positionWS.xyz = input.positionWS;
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        
        Varyings UnpackVaryings (PackedVaryings input)
        {
            Varyings output;
            output.positionCS = input.positionCS;
            output.texCoord0 = input.texCoord0.xyzw;
            output.texCoord2 = input.texCoord2.xyzw;
            output.positionWS = input.positionWS.xyz;
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        #endif
        
        // --------------------------------------------------
        // Graph
        
        // Graph Properties
        CBUFFER_START(UnityPerMaterial)
        float _AlphaCutoff;
        float4 _BaseColor;
        float4 _BaseColorMap_TexelSize;
        float _BaseUsePlanarUV;
        float4 _BaseTilingOffset;
        float4 _BaseNormalMap_TexelSize;
        float _BaseNormalScale;
        float4 _BaseMaskMap_TexelSize;
        float _BaseMetallic;
        float _BaseAORemapMin;
        float _BaseAORemapMax;
        float _BaseSmoothnessRemapMin;
        float _BaseSmoothnessRemapMax;
        float4 _CoverMaskA_TexelSize;
        float _CoverMaskPower;
        float _Cover_Amount;
        float _Cover_Amount_Grow_Speed;
        float3 _CoverDirection;
        float _Cover_Max_Angle;
        float _Cover_Min_Height;
        float _Cover_Min_Height_Blending;
        float4 _CoverBaseColor;
        float4 _CoverBaseColorMap_TexelSize;
        float4 _CoverTilingOffset;
        float _CoverTriplanarThreshold;
        float4 _CoverNormalMap_TexelSize;
        float _CoverNormalScale;
        float _CoverNormalBlendHardness;
        float _CoverHardness;
        float _CoverHeightMapMin;
        float _CoverHeightMapMax;
        float _CoverHeightMapOffset;
        float4 _CoverMaskMap_TexelSize;
        float _CoverMetallic;
        float _CoverAORemapMin;
        float _CoverAORemapMax;
        float _CoverSmoothnessRemapMin;
        float _CoverSmoothnessRemapMax;
        float4 _DetailMap_TexelSize;
        float4 _DetailTilingOffset;
        float _DetailAlbedoScale;
        float _DetailNormalScale;
        float _DetailSmoothnessScale;
        float4 _WetColor;
        float _WetSmoothness;
        UNITY_TEXTURE_STREAMING_DEBUG_VARS;
        CBUFFER_END
        
        
        // Object and Global properties
        SAMPLER(SamplerState_Linear_Repeat);
        SAMPLER(SamplerState_Linear_Repeat_Aniso8);
        TEXTURE2D(_BaseColorMap);
        SAMPLER(sampler_BaseColorMap);
        TEXTURE2D(_BaseNormalMap);
        SAMPLER(sampler_BaseNormalMap);
        TEXTURE2D(_BaseMaskMap);
        SAMPLER(sampler_BaseMaskMap);
        TEXTURE2D(_CoverMaskA);
        SAMPLER(sampler_CoverMaskA);
        TEXTURE2D(_CoverBaseColorMap);
        SAMPLER(sampler_CoverBaseColorMap);
        TEXTURE2D(_CoverNormalMap);
        SAMPLER(sampler_CoverNormalMap);
        TEXTURE2D(_CoverMaskMap);
        SAMPLER(sampler_CoverMaskMap);
        TEXTURE2D(_DetailMap);
        SAMPLER(sampler_DetailMap);
        
        // Graph Includes
        // GraphIncludes: <None>
        
        // -- Property used by ScenePickingPass
        #ifdef SCENEPICKINGPASS
        float4 _SelectionID;
        #endif
        
        // -- Properties used by SceneSelectionPass
        #ifdef SCENESELECTIONPASS
        int _ObjectId;
        int _PassValue;
        #endif
        
        // Graph Functions
        
        void Unity_Combine_float(float R, float G, float B, float A, out float4 RGBA, out float3 RGB, out float2 RG)
        {
            RGBA = float4(R, G, B, A);
            RGB = float3(R, G, B);
            RG = float2(R, G);
        }
        
        void Unity_Divide_float(float A, float B, out float Out)
        {
            Out = A / B;
        }
        
        void Unity_Multiply_float4_float4(float4 A, float4 B, out float4 Out)
        {
        Out = A * B;
        }
        
        void Unity_Branch_float4(float Predicate, float4 True, float4 False, out float4 Out)
        {
            Out = Predicate ? True : False;
        }
        
        void Unity_TilingAndOffset_float(float2 UV, float2 Tiling, float2 Offset, out float2 Out)
        {
            Out = UV * Tiling + Offset;
        }
        
        void Unity_Branch_float2(float Predicate, float2 True, float2 False, out float2 Out)
        {
            Out = Predicate ? True : False;
        }
        
        struct Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float
        {
        float3 AbsoluteWorldSpacePosition;
        half4 uv0;
        half4 uv2;
        };
        
        void SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(UnityTexture2D Texture2D_80A3D28F, float4 Vector4_2EBA7A3B, float Boolean_7ABB9909, UnitySamplerState _SamplerState, float Boolean_5ddfe6daabcc4715a44b5f34fc19becb, Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float IN, out float4 XZ_2)
        {
        UnityTexture2D _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D = Texture2D_80A3D28F;
        float _Property_30834f691775a0898a45b1c868520436_Out_0_Boolean = Boolean_7ABB9909;
        float _Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
        float _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
        float _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
        float _Split_89ed63cb625cb3878c183d0b71c03400_A_4_Float = 0;
        float4 _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4;
        float3 _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3;
        float2 _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, float(0), float(0), _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3, _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2);
        float4 _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4 = Vector4_2EBA7A3B;
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_R_1_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[0];
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_G_2_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[1];
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_B_3_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[2];
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_A_4_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[3];
        float _Divide_e64179199923c58289b6aa94ea6c9178_Out_2_Float;
        Unity_Divide_float(float(1), _Split_2f0f52f6ef8c0e81af0da6476402bc1f_R_1_Float, _Divide_e64179199923c58289b6aa94ea6c9178_Out_2_Float);
        float4 _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, (_Divide_e64179199923c58289b6aa94ea6c9178_Out_2_Float.xxxx), _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4);
        float _Property_f17c7bf877e64b6abdd66b1fe9f5accc_Out_0_Boolean = Boolean_5ddfe6daabcc4715a44b5f34fc19becb;
        float4 _UV_029e8e8198564838b9389b902a09fb22_Out_0_Vector4 = IN.uv0;
        float4 _UV_7a6209af1506424fb75c81e87e42035a_Out_0_Vector4 = IN.uv2;
        float4 _Branch_fc37bb4bf641457cbbc6e290603056ff_Out_3_Vector4;
        Unity_Branch_float4(_Property_f17c7bf877e64b6abdd66b1fe9f5accc_Out_0_Boolean, _UV_029e8e8198564838b9389b902a09fb22_Out_0_Vector4, _UV_7a6209af1506424fb75c81e87e42035a_Out_0_Vector4, _Branch_fc37bb4bf641457cbbc6e290603056ff_Out_3_Vector4);
        float2 _Vector2_16c15d3bbdd14b85bd48e3a6cb318af7_Out_0_Vector2 = float2(_Split_2f0f52f6ef8c0e81af0da6476402bc1f_R_1_Float, _Split_2f0f52f6ef8c0e81af0da6476402bc1f_G_2_Float);
        float2 _Vector2_f8d75f54e7705083bbec539a60185577_Out_0_Vector2 = float2(_Split_2f0f52f6ef8c0e81af0da6476402bc1f_B_3_Float, _Split_2f0f52f6ef8c0e81af0da6476402bc1f_A_4_Float);
        float2 _TilingAndOffset_d91e2d25acd34686b562b7fe7e9d1d27_Out_3_Vector2;
        Unity_TilingAndOffset_float((_Branch_fc37bb4bf641457cbbc6e290603056ff_Out_3_Vector4.xy), _Vector2_16c15d3bbdd14b85bd48e3a6cb318af7_Out_0_Vector2, _Vector2_f8d75f54e7705083bbec539a60185577_Out_0_Vector2, _TilingAndOffset_d91e2d25acd34686b562b7fe7e9d1d27_Out_3_Vector2);
        float2 _Branch_8e5a4e8f4d52fc8aadd1f46485afc933_Out_3_Vector2;
        Unity_Branch_float2(_Property_30834f691775a0898a45b1c868520436_Out_0_Boolean, (_Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4.xy), _TilingAndOffset_d91e2d25acd34686b562b7fe7e9d1d27_Out_3_Vector2, _Branch_8e5a4e8f4d52fc8aadd1f46485afc933_Out_3_Vector2);
        UnitySamplerState _Property_e8746b9475c94530ba35ba8019ad2ae0_Out_0_SamplerState = _SamplerState;
        float4 _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, _Property_e8746b9475c94530ba35ba8019ad2ae0_Out_0_SamplerState.samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Branch_8e5a4e8f4d52fc8aadd1f46485afc933_Out_3_Vector2) );
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.r;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.g;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.b;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_A_7_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.a;
        XZ_2 = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4;
        }
        
        // Custom interpolators pre vertex
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPreVertex' */
        
        // Graph Vertex
        struct VertexDescription
        {
            float3 Position;
            float3 Normal;
            float3 Tangent;
        };
        
        VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
        {
            VertexDescription description = (VertexDescription)0;
            description.Position = IN.ObjectSpacePosition;
            description.Normal = IN.ObjectSpaceNormal;
            description.Tangent = IN.ObjectSpaceTangent;
            return description;
        }
        
        // Custom interpolators, pre surface
        #ifdef FEATURES_GRAPH_VERTEX
        Varyings CustomInterpolatorPassThroughFunc(inout Varyings output, VertexDescription input)
        {
        return output;
        }
        #define CUSTOMINTERPOLATOR_VARYPASSTHROUGH_FUNC
        #endif
        
        // Graph Pixel
        struct SurfaceDescription
        {
            float Alpha;
            float AlphaClipThreshold;
        };
        
        SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
        {
            SurfaceDescription surface = (SurfaceDescription)0;
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_05d49814100eb3808cd61a6177622291_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseColorMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_e21be9beec8d858fa2818b2fddc4577c_Out_0_Vector4 = _BaseTilingOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_1b1963c0ccb4d78fa3474b362fd31d15_Out_0_Boolean = _BaseUsePlanarUV;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae;
            _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae.uv0 = IN.uv0;
            _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae.uv2 = IN.uv2;
            float4 _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_05d49814100eb3808cd61a6177622291_Out_0_Texture2D, _Property_e21be9beec8d858fa2818b2fddc4577c_Out_0_Vector4, _Property_1b1963c0ccb4d78fa3474b362fd31d15_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), 1, _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae, _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae_XZ_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_4bb7737116edbd81bca06201348456ea_R_1_Float = _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae_XZ_2_Vector4[0];
            float _Split_4bb7737116edbd81bca06201348456ea_G_2_Float = _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae_XZ_2_Vector4[1];
            float _Split_4bb7737116edbd81bca06201348456ea_B_3_Float = _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae_XZ_2_Vector4[2];
            float _Split_4bb7737116edbd81bca06201348456ea_A_4_Float = _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae_XZ_2_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_f9637076944eae8abdcc79dc2702814b_Out_0_Float = _AlphaCutoff;
            #endif
            surface.Alpha = _Split_4bb7737116edbd81bca06201348456ea_A_4_Float;
            surface.AlphaClipThreshold = _Property_f9637076944eae8abdcc79dc2702814b_Out_0_Float;
            return surface;
        }
        
        // --------------------------------------------------
        // Build Graph Inputs
        #ifdef HAVE_VFX_MODIFICATION
        #define VFX_SRP_ATTRIBUTES Attributes
        #define VFX_SRP_VARYINGS Varyings
        #define VFX_SRP_SURFACE_INPUTS SurfaceDescriptionInputs
        #endif
        VertexDescriptionInputs BuildVertexDescriptionInputs(Attributes input)
        {
            VertexDescriptionInputs output;
            ZERO_INITIALIZE(VertexDescriptionInputs, output);
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.ObjectSpaceNormal =                          input.normalOS;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.ObjectSpaceTangent =                         input.tangentOS.xyz;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.ObjectSpacePosition =                        input.positionOS;
        #endif
        
        #if UNITY_ANY_INSTANCING_ENABLED
        #else // TODO: XR support for procedural instancing because in this case UNITY_ANY_INSTANCING_ENABLED is not defined and instanceID is incorrect.
        #endif
        
            return output;
        }
        SurfaceDescriptionInputs BuildSurfaceDescriptionInputs(Varyings input)
        {
            SurfaceDescriptionInputs output;
            ZERO_INITIALIZE(SurfaceDescriptionInputs, output);
        
        #ifdef HAVE_VFX_MODIFICATION
        #if VFX_USE_GRAPH_VALUES
            uint instanceActiveIndex = asuint(UNITY_ACCESS_INSTANCED_PROP(PerInstance, _InstanceActiveIndex));
            /* WARNING: $splice Could not find named fragment 'VFXLoadGraphValues' */
        #endif
            /* WARNING: $splice Could not find named fragment 'VFXSetFragInputs' */
        
        #endif
        
            
        
        
        
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.AbsoluteWorldSpacePosition = GetAbsolutePositionWS(input.positionWS);
        #endif
        
        
            #if UNITY_UV_STARTS_AT_TOP
            #else
            #endif
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.uv0 = input.texCoord0;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.uv2 = input.texCoord2;
        #endif
        
        #if UNITY_ANY_INSTANCING_ENABLED
        #else // TODO: XR support for procedural instancing because in this case UNITY_ANY_INSTANCING_ENABLED is not defined and instanceID is incorrect.
        #endif
        #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN output.FaceSign =                    IS_FRONT_VFACE(input.cullFace, true, false);
        #else
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        #endif
        #undef BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        
                return output;
        }
        
        // --------------------------------------------------
        // Main
        
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/DepthOnlyPass.hlsl"
        
        // --------------------------------------------------
        // Visual Effect Vertex Invocations
        #ifdef HAVE_VFX_MODIFICATION
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
        #endif
        
        ENDHLSL
        }
        Pass
        {
            Name "DepthNormals"
            Tags
            {
                "LightMode" = "DepthNormals"
            }
        
        // Render State
        Cull [_Cull]
        ZTest LEqual
        ZWrite On
        
        // Debug
        // <None>
        
        // --------------------------------------------------
        // Pass
        
        HLSLPROGRAM
        
        // Pragmas
        #pragma target 2.0
        #pragma multi_compile_instancing
        #pragma vertex vert
        #pragma fragment frag
        
        // Keywords
        #pragma shader_feature_local_fragment _ _ALPHATEST_ON
        #pragma multi_compile _ LOD_FADE_CROSSFADE
        #pragma shader_feature_local _ _USEDYNAMICCOVERTSTATICMASKF_ON
        
        #if defined(_USEDYNAMICCOVERTSTATICMASKF_ON)
            #define KEYWORD_PERMUTATION_0
        #else
            #define KEYWORD_PERMUTATION_1
        #endif
        
        
        // Defines
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define _NORMALMAP 1
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define _NORMAL_DROPOFF_TS 1
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_NORMAL
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_TANGENT
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_TEXCOORD0
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_TEXCOORD1
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_TEXCOORD2
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_COLOR
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define FEATURES_GRAPH_VERTEX_NORMAL_OUTPUT
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define FEATURES_GRAPH_VERTEX_TANGENT_OUTPUT
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_POSITION_WS
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_NORMAL_WS
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_TANGENT_WS
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_TEXCOORD0
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_TEXCOORD2
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_COLOR
        #endif
        
        #define FEATURES_GRAPH_VERTEX
        /* WARNING: $splice Could not find named fragment 'PassInstancing' */
        #define SHADERPASS SHADERPASS_DEPTHNORMALS
        #define USE_UNITY_CROSSFADE 1
        
        
        // custom interpolator pre-include
        /* WARNING: $splice Could not find named fragment 'sgci_CustomInterpolatorPreInclude' */
        
        // Includes
        #include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
        #include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/RenderingLayers.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
        #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
        
        // --------------------------------------------------
        // Structs and Packing
        
        // custom interpolators pre packing
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPrePacking' */
        
        struct Attributes
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 positionOS : POSITION;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 normalOS : NORMAL;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 tangentOS : TANGENT;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv0 : TEXCOORD0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv1 : TEXCOORD1;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv2 : TEXCOORD2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 color : COLOR;
            #endif
            #if UNITY_ANY_INSTANCING_ENABLED || defined(ATTRIBUTES_NEED_INSTANCEID)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint instanceID : INSTANCEID_SEMANTIC;
            #endif
            #endif
        };
        struct Varyings
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 positionCS : SV_POSITION;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 positionWS;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 normalWS;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 tangentWS;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 color;
            #endif
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
            #endif
        };
        struct SurfaceDescriptionInputs
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 WorldSpaceNormal;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 TangentSpaceNormal;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 WorldSpaceTangent;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 WorldSpaceBiTangent;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 WorldSpacePosition;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 AbsoluteWorldSpacePosition;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 VertexColor;
            #endif
        };
        struct VertexDescriptionInputs
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 ObjectSpaceNormal;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 ObjectSpaceTangent;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 ObjectSpacePosition;
            #endif
        };
        struct PackedVaryings
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 positionCS : SV_POSITION;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 tangentWS : INTERP0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord0 : INTERP1;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord2 : INTERP2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 color : INTERP3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 positionWS : INTERP4;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 normalWS : INTERP5;
            #endif
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
            #endif
        };
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        PackedVaryings PackVaryings (Varyings input)
        {
            PackedVaryings output;
            ZERO_INITIALIZE(PackedVaryings, output);
            output.positionCS = input.positionCS;
            output.tangentWS.xyzw = input.tangentWS;
            output.texCoord0.xyzw = input.texCoord0;
            output.texCoord2.xyzw = input.texCoord2;
            output.color.xyzw = input.color;
            output.positionWS.xyz = input.positionWS;
            output.normalWS.xyz = input.normalWS;
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        
        Varyings UnpackVaryings (PackedVaryings input)
        {
            Varyings output;
            output.positionCS = input.positionCS;
            output.tangentWS = input.tangentWS.xyzw;
            output.texCoord0 = input.texCoord0.xyzw;
            output.texCoord2 = input.texCoord2.xyzw;
            output.color = input.color.xyzw;
            output.positionWS = input.positionWS.xyz;
            output.normalWS = input.normalWS.xyz;
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        #endif
        
        // --------------------------------------------------
        // Graph
        
        // Graph Properties
        CBUFFER_START(UnityPerMaterial)
        float _AlphaCutoff;
        float4 _BaseColor;
        float4 _BaseColorMap_TexelSize;
        float _BaseUsePlanarUV;
        float4 _BaseTilingOffset;
        float4 _BaseNormalMap_TexelSize;
        float _BaseNormalScale;
        float4 _BaseMaskMap_TexelSize;
        float _BaseMetallic;
        float _BaseAORemapMin;
        float _BaseAORemapMax;
        float _BaseSmoothnessRemapMin;
        float _BaseSmoothnessRemapMax;
        float4 _CoverMaskA_TexelSize;
        float _CoverMaskPower;
        float _Cover_Amount;
        float _Cover_Amount_Grow_Speed;
        float3 _CoverDirection;
        float _Cover_Max_Angle;
        float _Cover_Min_Height;
        float _Cover_Min_Height_Blending;
        float4 _CoverBaseColor;
        float4 _CoverBaseColorMap_TexelSize;
        float4 _CoverTilingOffset;
        float _CoverTriplanarThreshold;
        float4 _CoverNormalMap_TexelSize;
        float _CoverNormalScale;
        float _CoverNormalBlendHardness;
        float _CoverHardness;
        float _CoverHeightMapMin;
        float _CoverHeightMapMax;
        float _CoverHeightMapOffset;
        float4 _CoverMaskMap_TexelSize;
        float _CoverMetallic;
        float _CoverAORemapMin;
        float _CoverAORemapMax;
        float _CoverSmoothnessRemapMin;
        float _CoverSmoothnessRemapMax;
        float4 _DetailMap_TexelSize;
        float4 _DetailTilingOffset;
        float _DetailAlbedoScale;
        float _DetailNormalScale;
        float _DetailSmoothnessScale;
        float4 _WetColor;
        float _WetSmoothness;
        UNITY_TEXTURE_STREAMING_DEBUG_VARS;
        CBUFFER_END
        
        
        // Object and Global properties
        SAMPLER(SamplerState_Linear_Repeat);
        SAMPLER(SamplerState_Linear_Repeat_Aniso8);
        TEXTURE2D(_BaseColorMap);
        SAMPLER(sampler_BaseColorMap);
        TEXTURE2D(_BaseNormalMap);
        SAMPLER(sampler_BaseNormalMap);
        TEXTURE2D(_BaseMaskMap);
        SAMPLER(sampler_BaseMaskMap);
        TEXTURE2D(_CoverMaskA);
        SAMPLER(sampler_CoverMaskA);
        TEXTURE2D(_CoverBaseColorMap);
        SAMPLER(sampler_CoverBaseColorMap);
        TEXTURE2D(_CoverNormalMap);
        SAMPLER(sampler_CoverNormalMap);
        TEXTURE2D(_CoverMaskMap);
        SAMPLER(sampler_CoverMaskMap);
        TEXTURE2D(_DetailMap);
        SAMPLER(sampler_DetailMap);
        
        // Graph Includes
        // GraphIncludes: <None>
        
        // -- Property used by ScenePickingPass
        #ifdef SCENEPICKINGPASS
        float4 _SelectionID;
        #endif
        
        // -- Properties used by SceneSelectionPass
        #ifdef SCENESELECTIONPASS
        int _ObjectId;
        int _PassValue;
        #endif
        
        // Graph Functions
        
        void Unity_TilingAndOffset_float(float2 UV, float2 Tiling, float2 Offset, out float2 Out)
        {
            Out = UV * Tiling + Offset;
        }
        
        void Unity_Multiply_float2_float2(float2 A, float2 B, out float2 Out)
        {
            Out = A * B;
        }
        
        void Unity_Add_float2(float2 A, float2 B, out float2 Out)
        {
            Out = A + B;
        }
        
        void Unity_DotProduct_float2(float2 A, float2 B, out float Out)
        {
            Out = dot(A, B);
        }
        
        void Unity_Saturate_float(float In, out float Out)
        {
            Out = saturate(In);
        }
        
        void Unity_OneMinus_float(float In, out float Out)
        {
            Out = 1 - In;
        }
        
        void Unity_SquareRoot_float(float In, out float Out)
        {
            Out = sqrt(In);
        }
        
        void Unity_Combine_float(float R, float G, float B, float A, out float4 RGBA, out float3 RGB, out float2 RG)
        {
            RGBA = float4(R, G, B, A);
            RGB = float3(R, G, B);
            RG = float2(R, G);
        }
        
        void Unity_Divide_float(float A, float B, out float Out)
        {
            Out = A / B;
        }
        
        void Unity_Multiply_float4_float4(float4 A, float4 B, out float4 Out)
        {
        Out = A * B;
        }
        
        void Unity_Branch_float4(float Predicate, float4 True, float4 False, out float4 Out)
        {
            Out = Predicate ? True : False;
        }
        
        void Unity_Branch_float2(float Predicate, float2 True, float2 False, out float2 Out)
        {
            Out = Predicate ? True : False;
        }
        
        void Unity_Sign_float3(float3 In, out float3 Out)
        {
            Out = sign(In);
        }
        
        void Unity_Multiply_float_float(float A, float B, out float Out)
        {
        Out = A * B;
        }
        
        void Unity_Clamp_float3(float3 In, float3 Min, float3 Max, out float3 Out)
        {
            Out = clamp(In, Min, Max);
        }
        
        void Unity_Normalize_float3(float3 In, out float3 Out)
        {
            Out = normalize(In);
        }
        
        void Unity_Branch_float3(float Predicate, float3 True, float3 False, out float3 Out)
        {
            Out = Predicate ? True : False;
        }
        
        struct Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float
        {
        float3 WorldSpaceNormal;
        float3 WorldSpaceTangent;
        float3 WorldSpaceBiTangent;
        float3 AbsoluteWorldSpacePosition;
        half4 uv0;
        half4 uv2;
        };
        
        void SG_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float(UnityTexture2D Texture2D_80A3D28F, float4 Vector4_82674548, float Boolean_9FF42DF6, UnitySamplerState _SamplerState, float Boolean_5ddfe6daabcc4715a44b5f34fc19becb, Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float IN, out float4 XZ_2)
        {
        float _Property_1ef12cf3201a938993fe6a7951b0e754_Out_0_Boolean = Boolean_9FF42DF6;
        UnityTexture2D _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D = Texture2D_80A3D28F;
        float _Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
        float _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
        float _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
        float _Split_89ed63cb625cb3878c183d0b71c03400_A_4_Float = 0;
        float4 _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4;
        float3 _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3;
        float2 _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, float(0), float(0), _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3, _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2);
        float4 _Property_3fa1d6f912feb481ba60f2e55e62e746_Out_0_Vector4 = Vector4_82674548;
        float _Split_a2e12fa5931da084b2949343a539dfd8_R_1_Float = _Property_3fa1d6f912feb481ba60f2e55e62e746_Out_0_Vector4[0];
        float _Split_a2e12fa5931da084b2949343a539dfd8_G_2_Float = _Property_3fa1d6f912feb481ba60f2e55e62e746_Out_0_Vector4[1];
        float _Split_a2e12fa5931da084b2949343a539dfd8_B_3_Float = _Property_3fa1d6f912feb481ba60f2e55e62e746_Out_0_Vector4[2];
        float _Split_a2e12fa5931da084b2949343a539dfd8_A_4_Float = _Property_3fa1d6f912feb481ba60f2e55e62e746_Out_0_Vector4[3];
        float _Divide_c36b770dfaa0bb8f85ab27da5fd794f0_Out_2_Float;
        Unity_Divide_float(float(1), _Split_a2e12fa5931da084b2949343a539dfd8_R_1_Float, _Divide_c36b770dfaa0bb8f85ab27da5fd794f0_Out_2_Float);
        float4 _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, (_Divide_c36b770dfaa0bb8f85ab27da5fd794f0_Out_2_Float.xxxx), _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4);
        float _Property_058f4fba88c3437288219f1929444bf2_Out_0_Boolean = Boolean_5ddfe6daabcc4715a44b5f34fc19becb;
        float4 _UV_43d85b3291324c848dfbeec6adac2a71_Out_0_Vector4 = IN.uv0;
        float4 _UV_36881dcaab9040168fc5215dcd00f352_Out_0_Vector4 = IN.uv2;
        float4 _Branch_8054d58a73be4ce1b22d48a84389ae07_Out_3_Vector4;
        Unity_Branch_float4(_Property_058f4fba88c3437288219f1929444bf2_Out_0_Boolean, _UV_43d85b3291324c848dfbeec6adac2a71_Out_0_Vector4, _UV_36881dcaab9040168fc5215dcd00f352_Out_0_Vector4, _Branch_8054d58a73be4ce1b22d48a84389ae07_Out_3_Vector4);
        float2 _Vector2_6845d21872714d889783b0cb707df3e9_Out_0_Vector2 = float2(_Split_a2e12fa5931da084b2949343a539dfd8_R_1_Float, _Split_a2e12fa5931da084b2949343a539dfd8_G_2_Float);
        float2 _Vector2_e2e2263627c6098e96a5b5d29350ad03_Out_0_Vector2 = float2(_Split_a2e12fa5931da084b2949343a539dfd8_B_3_Float, _Split_a2e12fa5931da084b2949343a539dfd8_A_4_Float);
        float2 _TilingAndOffset_17582d056c0b8a8dab1017d37497fe59_Out_3_Vector2;
        Unity_TilingAndOffset_float((_Branch_8054d58a73be4ce1b22d48a84389ae07_Out_3_Vector4.xy), _Vector2_6845d21872714d889783b0cb707df3e9_Out_0_Vector2, _Vector2_e2e2263627c6098e96a5b5d29350ad03_Out_0_Vector2, _TilingAndOffset_17582d056c0b8a8dab1017d37497fe59_Out_3_Vector2);
        float2 _Branch_1e152f3aac57448f8518bf2852c000c3_Out_3_Vector2;
        Unity_Branch_float2(_Property_1ef12cf3201a938993fe6a7951b0e754_Out_0_Boolean, (_Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4.xy), _TilingAndOffset_17582d056c0b8a8dab1017d37497fe59_Out_3_Vector2, _Branch_1e152f3aac57448f8518bf2852c000c3_Out_3_Vector2);
        UnitySamplerState _Property_69f1ed7efd1b494e91f626b88ab2363c_Out_0_SamplerState = _SamplerState;
        float4 _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, _Property_69f1ed7efd1b494e91f626b88ab2363c_Out_0_SamplerState.samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Branch_1e152f3aac57448f8518bf2852c000c3_Out_3_Vector2) );
        _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4);
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.r;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.g;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.b;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_A_7_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.a;
        float2 _Vector2_ad6bd100e273d78fa409a30a77bfa2cc_Out_0_Vector2 = float2(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float, _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float);
        float3 _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3;
        Unity_Sign_float3(IN.WorldSpaceNormal, _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3);
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_R_1_Float = _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3[0];
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_G_2_Float = _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3[1];
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_B_3_Float = _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3[2];
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_A_4_Float = 0;
        float2 _Vector2_b76cb1842101e58b9e636d49b075c612_Out_0_Vector2 = float2(_Split_6299d4ddcc4c74828aea40a46fdb896e_G_2_Float, float(1));
        float2 _Multiply_31e8db88ee20c985a9850d1a58f3282b_Out_2_Vector2;
        Unity_Multiply_float2_float2(_Vector2_ad6bd100e273d78fa409a30a77bfa2cc_Out_0_Vector2, _Vector2_b76cb1842101e58b9e636d49b075c612_Out_0_Vector2, _Multiply_31e8db88ee20c985a9850d1a58f3282b_Out_2_Vector2);
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_R_1_Float = IN.WorldSpaceNormal[0];
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_G_2_Float = IN.WorldSpaceNormal[1];
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_B_3_Float = IN.WorldSpaceNormal[2];
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_A_4_Float = 0;
        float2 _Vector2_70e5837843f28b8b9d64cada3697bd5a_Out_0_Vector2 = float2(_Split_5ed44bf2eca0868f81eb18100f49d1fa_R_1_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_B_3_Float);
        float2 _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2;
        Unity_Add_float2(_Multiply_31e8db88ee20c985a9850d1a58f3282b_Out_2_Vector2, _Vector2_70e5837843f28b8b9d64cada3697bd5a_Out_0_Vector2, _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2);
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_R_1_Float = _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2[0];
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_G_2_Float = _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2[1];
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_B_3_Float = 0;
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_A_4_Float = 0;
        float _Multiply_ab12aea87465a78eaf7fc66c2598d266_Out_2_Float;
        Unity_Multiply_float_float(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_G_2_Float, _Multiply_ab12aea87465a78eaf7fc66c2598d266_Out_2_Float);
        float3 _Vector3_433840b555db308b97e9b14b6a957195_Out_0_Vector3 = float3(_Split_2bc77ca2d17bd78cb2383770ce50b179_R_1_Float, _Multiply_ab12aea87465a78eaf7fc66c2598d266_Out_2_Float, _Split_2bc77ca2d17bd78cb2383770ce50b179_G_2_Float);
        float3 _Transform_c7914cc45a011c89b3f53c55afb51673_Out_1_Vector3;
        {
        float3x3 tangentTransform = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
        _Transform_c7914cc45a011c89b3f53c55afb51673_Out_1_Vector3 = TransformWorldToTangentDir(_Vector3_433840b555db308b97e9b14b6a957195_Out_0_Vector3.xyz, tangentTransform, true);
        }
        float3 _Clamp_3837949a36b5428a82af01e7bcd29952_Out_3_Vector3;
        Unity_Clamp_float3(_Transform_c7914cc45a011c89b3f53c55afb51673_Out_1_Vector3, float3(-1, -1, -1), float3(1, 1, 1), _Clamp_3837949a36b5428a82af01e7bcd29952_Out_3_Vector3);
        float3 _Normalize_09bf8a2bd0a4d38e8b97d5c674f79b44_Out_1_Vector3;
        Unity_Normalize_float3(_Clamp_3837949a36b5428a82af01e7bcd29952_Out_3_Vector3, _Normalize_09bf8a2bd0a4d38e8b97d5c674f79b44_Out_1_Vector3);
        float3 _Branch_9eadf909a90f2f80880f8c56ecc2a91f_Out_3_Vector3;
        Unity_Branch_float3(_Property_1ef12cf3201a938993fe6a7951b0e754_Out_0_Boolean, _Normalize_09bf8a2bd0a4d38e8b97d5c674f79b44_Out_1_Vector3, (_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.xyz), _Branch_9eadf909a90f2f80880f8c56ecc2a91f_Out_3_Vector3);
        XZ_2 = (float4(_Branch_9eadf909a90f2f80880f8c56ecc2a91f_Out_3_Vector3, 1.0));
        }
        
        void Unity_NormalStrength_float(float3 In, float Strength, out float3 Out)
        {
            Out = float3(In.rg * Strength, lerp(1, In.b, saturate(Strength)));
        }
        
        void Unity_NormalBlend_float(float3 A, float3 B, out float3 Out)
        {
            Out = SafeNormalize(float3(A.rg + B.rg, A.b * B.b));
        }
        
        void Unity_Divide_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A / B;
        }
        
        void Unity_Absolute_float3(float3 In, out float3 Out)
        {
            Out = abs(In);
        }
        
        void Unity_Power_float3(float3 A, float3 B, out float3 Out)
        {
            Out = pow(A, B);
        }
        
        void Unity_Multiply_float3_float3(float3 A, float3 B, out float3 Out)
        {
        Out = A * B;
        }
        
        void Unity_Add_float3(float3 A, float3 B, out float3 Out)
        {
            Out = A + B;
        }
        
        void Unity_Add_float(float A, float B, out float Out)
        {
            Out = A + B;
        }
        
        void Unity_Divide_float3(float3 A, float3 B, out float3 Out)
        {
            Out = A / B;
        }
        
        struct Bindings_TriplanarNMn_059da9746584140498cd018db3c76047_float
        {
        float3 WorldSpaceNormal;
        float3 WorldSpaceTangent;
        float3 WorldSpaceBiTangent;
        float3 WorldSpacePosition;
        };
        
        void SG_TriplanarNMn_059da9746584140498cd018db3c76047_float(UnityTexture2D Texture2D_80A3D28F, float Vector1_41461AC9, float Vector1_E4D1C13A, Bindings_TriplanarNMn_059da9746584140498cd018db3c76047_float IN, out float4 XYZ_1, out float4 XZ_2, out float4 YZ_3, out float4 XY_4)
        {
        UnityTexture2D _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D = Texture2D_80A3D28F;
        float _Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float = IN.WorldSpacePosition[0];
        float _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float = IN.WorldSpacePosition[1];
        float _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float = IN.WorldSpacePosition[2];
        float _Split_89ed63cb625cb3878c183d0b71c03400_A_4_Float = 0;
        float4 _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4;
        float3 _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3;
        float2 _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, float(0), float(0), _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3, _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2);
        float _Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float = Vector1_41461AC9;
        float4 _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, (_Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float.xxxx), _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4);
        float3 _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3;
        Unity_Sign_float3(IN.WorldSpaceNormal, _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3);
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_R_1_Float = _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3[0];
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_G_2_Float = _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3[1];
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_B_3_Float = _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3[2];
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_A_4_Float = 0;
        float2 _Vector2_b76cb1842101e58b9e636d49b075c612_Out_0_Vector2 = float2(_Split_6299d4ddcc4c74828aea40a46fdb896e_G_2_Float, float(1));
        float2 _Multiply_a87753ad90594382bf3a3a95abbadbc8_Out_2_Vector2;
        Unity_Multiply_float2_float2((_Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4.xy), _Vector2_b76cb1842101e58b9e636d49b075c612_Out_0_Vector2, _Multiply_a87753ad90594382bf3a3a95abbadbc8_Out_2_Vector2);
        float4 _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Multiply_a87753ad90594382bf3a3a95abbadbc8_Out_2_Vector2) );
        _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4);
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.r;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.g;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.b;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_A_7_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.a;
        float2 _Vector2_ad6bd100e273d78fa409a30a77bfa2cc_Out_0_Vector2 = float2(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float, _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float);
        float2 _Multiply_31e8db88ee20c985a9850d1a58f3282b_Out_2_Vector2;
        Unity_Multiply_float2_float2(_Vector2_ad6bd100e273d78fa409a30a77bfa2cc_Out_0_Vector2, _Vector2_b76cb1842101e58b9e636d49b075c612_Out_0_Vector2, _Multiply_31e8db88ee20c985a9850d1a58f3282b_Out_2_Vector2);
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_R_1_Float = IN.WorldSpaceNormal[0];
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_G_2_Float = IN.WorldSpaceNormal[1];
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_B_3_Float = IN.WorldSpaceNormal[2];
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_A_4_Float = 0;
        float2 _Vector2_70e5837843f28b8b9d64cada3697bd5a_Out_0_Vector2 = float2(_Split_5ed44bf2eca0868f81eb18100f49d1fa_R_1_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_B_3_Float);
        float2 _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2;
        Unity_Add_float2(_Multiply_31e8db88ee20c985a9850d1a58f3282b_Out_2_Vector2, _Vector2_70e5837843f28b8b9d64cada3697bd5a_Out_0_Vector2, _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2);
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_R_1_Float = _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2[0];
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_G_2_Float = _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2[1];
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_B_3_Float = 0;
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_A_4_Float = 0;
        float _Multiply_e4fe778b81456d819c52bb414cd95968_Out_2_Float;
        Unity_Multiply_float_float(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_G_2_Float, _Multiply_e4fe778b81456d819c52bb414cd95968_Out_2_Float);
        float3 _Vector3_08f62c5c01619e849f1a7d85a44531ac_Out_0_Vector3 = float3(_Split_2bc77ca2d17bd78cb2383770ce50b179_R_1_Float, _Multiply_e4fe778b81456d819c52bb414cd95968_Out_2_Float, _Split_2bc77ca2d17bd78cb2383770ce50b179_G_2_Float);
        float3 _Absolute_644b798714827680b39bf5d34f70385f_Out_1_Vector3;
        Unity_Absolute_float3(IN.WorldSpaceNormal, _Absolute_644b798714827680b39bf5d34f70385f_Out_1_Vector3);
        float _Property_adc4c59482221c8aad681c6558728ac9_Out_0_Float = Vector1_E4D1C13A;
        float3 _Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3;
        Unity_Power_float3(_Absolute_644b798714827680b39bf5d34f70385f_Out_1_Vector3, (_Property_adc4c59482221c8aad681c6558728ac9_Out_0_Float.xxx), _Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3);
        float3 _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3, _Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3, _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3);
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_R_1_Float = _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3[0];
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_G_2_Float = _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3[1];
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_B_3_Float = _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3[2];
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_A_4_Float = 0;
        float3 _Multiply_2e1040ca9c98d085ace76ee93f094039_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Vector3_08f62c5c01619e849f1a7d85a44531ac_Out_0_Vector3, (_Split_ae83014fcbd9f7879a0b91fa66dc9718_G_2_Float.xxx), _Multiply_2e1040ca9c98d085ace76ee93f094039_Out_2_Vector3);
        float4 _Combine_192c2c4a69be588b90ca005a32e22552_RGBA_4_Vector4;
        float3 _Combine_192c2c4a69be588b90ca005a32e22552_RGB_5_Vector3;
        float2 _Combine_192c2c4a69be588b90ca005a32e22552_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float, float(0), float(0), _Combine_192c2c4a69be588b90ca005a32e22552_RGBA_4_Vector4, _Combine_192c2c4a69be588b90ca005a32e22552_RGB_5_Vector3, _Combine_192c2c4a69be588b90ca005a32e22552_RG_6_Vector2);
        float4 _Multiply_138240d0d4846e87b0febabec0d6891b_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_192c2c4a69be588b90ca005a32e22552_RGBA_4_Vector4, (_Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float.xxxx), _Multiply_138240d0d4846e87b0febabec0d6891b_Out_2_Vector4);
        float _Multiply_de711f4a4614bd89a463b53374cf4036_Out_2_Float;
        Unity_Multiply_float_float(_Split_6299d4ddcc4c74828aea40a46fdb896e_B_3_Float, -1, _Multiply_de711f4a4614bd89a463b53374cf4036_Out_2_Float);
        float2 _Vector2_4ed33f0c73b2698fa6f3c1b77fe76808_Out_0_Vector2 = float2(_Multiply_de711f4a4614bd89a463b53374cf4036_Out_2_Float, float(1));
        float2 _Multiply_2af6058cc6ccb88caefd2799bb5941e8_Out_2_Vector2;
        Unity_Multiply_float2_float2((_Multiply_138240d0d4846e87b0febabec0d6891b_Out_2_Vector4.xy), _Vector2_4ed33f0c73b2698fa6f3c1b77fe76808_Out_0_Vector2, _Multiply_2af6058cc6ccb88caefd2799bb5941e8_Out_2_Vector2);
        float4 _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Multiply_2af6058cc6ccb88caefd2799bb5941e8_Out_2_Vector2) );
        _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4);
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_R_4_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.r;
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_G_5_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.g;
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_B_6_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.b;
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_A_7_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.a;
        float2 _Vector2_fe9aedd4528c7486ada4abdca0b0944e_Out_0_Vector2 = float2(_SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_R_4_Float, _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_G_5_Float);
        float2 _Multiply_02b9b4665ad9918d8721bcaddc82f06f_Out_2_Vector2;
        Unity_Multiply_float2_float2(_Vector2_fe9aedd4528c7486ada4abdca0b0944e_Out_0_Vector2, _Vector2_4ed33f0c73b2698fa6f3c1b77fe76808_Out_0_Vector2, _Multiply_02b9b4665ad9918d8721bcaddc82f06f_Out_2_Vector2);
        float2 _Vector2_a74a85274da15181abb63cc5e8df0de1_Out_0_Vector2 = float2(_Split_5ed44bf2eca0868f81eb18100f49d1fa_R_1_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_G_2_Float);
        float2 _Add_b227c84042055e8faa1a9fdc69529707_Out_2_Vector2;
        Unity_Add_float2(_Multiply_02b9b4665ad9918d8721bcaddc82f06f_Out_2_Vector2, _Vector2_a74a85274da15181abb63cc5e8df0de1_Out_0_Vector2, _Add_b227c84042055e8faa1a9fdc69529707_Out_2_Vector2);
        float _Split_2cfb9eacd8762483941459cdf28bda97_R_1_Float = _Add_b227c84042055e8faa1a9fdc69529707_Out_2_Vector2[0];
        float _Split_2cfb9eacd8762483941459cdf28bda97_G_2_Float = _Add_b227c84042055e8faa1a9fdc69529707_Out_2_Vector2[1];
        float _Split_2cfb9eacd8762483941459cdf28bda97_B_3_Float = 0;
        float _Split_2cfb9eacd8762483941459cdf28bda97_A_4_Float = 0;
        float _Multiply_1d65ce08ce672087879125f2e13c4004_Out_2_Float;
        Unity_Multiply_float_float(_SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_B_6_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_B_3_Float, _Multiply_1d65ce08ce672087879125f2e13c4004_Out_2_Float);
        float3 _Vector3_ba6cfb4671e8c58f9b41ea1dc23102ca_Out_0_Vector3 = float3(_Split_2cfb9eacd8762483941459cdf28bda97_R_1_Float, _Split_2cfb9eacd8762483941459cdf28bda97_G_2_Float, _Multiply_1d65ce08ce672087879125f2e13c4004_Out_2_Float);
        float3 _Multiply_7bb4009c92b108849ac6ca92bc1442f2_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Vector3_ba6cfb4671e8c58f9b41ea1dc23102ca_Out_0_Vector3, (_Split_ae83014fcbd9f7879a0b91fa66dc9718_B_3_Float.xxx), _Multiply_7bb4009c92b108849ac6ca92bc1442f2_Out_2_Vector3);
        float4 _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGBA_4_Vector4;
        float3 _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGB_5_Vector3;
        float2 _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float, float(0), float(0), _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGBA_4_Vector4, _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGB_5_Vector3, _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RG_6_Vector2);
        float4 _Multiply_2c0864423b014f8b8af8523f68cbb63c_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGBA_4_Vector4, (_Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float.xxxx), _Multiply_2c0864423b014f8b8af8523f68cbb63c_Out_2_Vector4);
        float2 _Vector2_a1e23e0f921b6484818f009a2b12a5ba_Out_0_Vector2 = float2(_Split_6299d4ddcc4c74828aea40a46fdb896e_R_1_Float, float(1));
        float2 _Multiply_862402885a49f18cb87278ab53bc6744_Out_2_Vector2;
        Unity_Multiply_float2_float2((_Multiply_2c0864423b014f8b8af8523f68cbb63c_Out_2_Vector4.xy), _Vector2_a1e23e0f921b6484818f009a2b12a5ba_Out_0_Vector2, _Multiply_862402885a49f18cb87278ab53bc6744_Out_2_Vector2);
        float4 _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Multiply_862402885a49f18cb87278ab53bc6744_Out_2_Vector2) );
        _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4);
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_R_4_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.r;
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_G_5_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.g;
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_B_6_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.b;
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_A_7_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.a;
        float _Multiply_4649b768be76d784a3284bacde795359_Out_2_Float;
        Unity_Multiply_float_float(_SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_B_6_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_R_1_Float, _Multiply_4649b768be76d784a3284bacde795359_Out_2_Float);
        float2 _Vector2_819fcd5eb484438eacad1987576d7d67_Out_0_Vector2 = float2(_SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_R_4_Float, _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_G_5_Float);
        float2 _Multiply_58530ebb3c6d798b93686a76247bf505_Out_2_Vector2;
        Unity_Multiply_float2_float2(_Vector2_819fcd5eb484438eacad1987576d7d67_Out_0_Vector2, _Vector2_a1e23e0f921b6484818f009a2b12a5ba_Out_0_Vector2, _Multiply_58530ebb3c6d798b93686a76247bf505_Out_2_Vector2);
        float2 _Vector2_e293c112b2f49e88a5fe46dfb1fbeb40_Out_0_Vector2 = float2(_Split_5ed44bf2eca0868f81eb18100f49d1fa_B_3_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_G_2_Float);
        float2 _Add_cf00fb232c6e2b8e973ab2f84453f55e_Out_2_Vector2;
        Unity_Add_float2(_Multiply_58530ebb3c6d798b93686a76247bf505_Out_2_Vector2, _Vector2_e293c112b2f49e88a5fe46dfb1fbeb40_Out_0_Vector2, _Add_cf00fb232c6e2b8e973ab2f84453f55e_Out_2_Vector2);
        float _Split_3ea3e61d32bdd78f82c686b75ff3fd9b_R_1_Float = _Add_cf00fb232c6e2b8e973ab2f84453f55e_Out_2_Vector2[0];
        float _Split_3ea3e61d32bdd78f82c686b75ff3fd9b_G_2_Float = _Add_cf00fb232c6e2b8e973ab2f84453f55e_Out_2_Vector2[1];
        float _Split_3ea3e61d32bdd78f82c686b75ff3fd9b_B_3_Float = 0;
        float _Split_3ea3e61d32bdd78f82c686b75ff3fd9b_A_4_Float = 0;
        float3 _Vector3_13a08d5940172a84a78ee3d9b8766833_Out_0_Vector3 = float3(_Multiply_4649b768be76d784a3284bacde795359_Out_2_Float, _Split_3ea3e61d32bdd78f82c686b75ff3fd9b_G_2_Float, _Split_3ea3e61d32bdd78f82c686b75ff3fd9b_R_1_Float);
        float3 _Multiply_77818c22e359fc8cbb7dd20216a8db72_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Vector3_13a08d5940172a84a78ee3d9b8766833_Out_0_Vector3, (_Split_ae83014fcbd9f7879a0b91fa66dc9718_R_1_Float.xxx), _Multiply_77818c22e359fc8cbb7dd20216a8db72_Out_2_Vector3);
        float3 _Add_769d9ee909c9238dbbf72d2800a2f268_Out_2_Vector3;
        Unity_Add_float3(_Multiply_7bb4009c92b108849ac6ca92bc1442f2_Out_2_Vector3, _Multiply_77818c22e359fc8cbb7dd20216a8db72_Out_2_Vector3, _Add_769d9ee909c9238dbbf72d2800a2f268_Out_2_Vector3);
        float3 _Add_14295f72880e4b87a1baf1ced943ac40_Out_2_Vector3;
        Unity_Add_float3(_Multiply_2e1040ca9c98d085ace76ee93f094039_Out_2_Vector3, _Add_769d9ee909c9238dbbf72d2800a2f268_Out_2_Vector3, _Add_14295f72880e4b87a1baf1ced943ac40_Out_2_Vector3);
        float _Add_e59af300bba2498db32eac1412123447_Out_2_Float;
        Unity_Add_float(_Split_ae83014fcbd9f7879a0b91fa66dc9718_R_1_Float, _Split_ae83014fcbd9f7879a0b91fa66dc9718_G_2_Float, _Add_e59af300bba2498db32eac1412123447_Out_2_Float);
        float _Add_e855069f047fae8ea9027d56acb61e56_Out_2_Float;
        Unity_Add_float(_Add_e59af300bba2498db32eac1412123447_Out_2_Float, _Split_ae83014fcbd9f7879a0b91fa66dc9718_B_3_Float, _Add_e855069f047fae8ea9027d56acb61e56_Out_2_Float);
        float3 _Divide_91ae4b94f1d9b78e99d0472293b8098c_Out_2_Vector3;
        Unity_Divide_float3(_Add_14295f72880e4b87a1baf1ced943ac40_Out_2_Vector3, (_Add_e855069f047fae8ea9027d56acb61e56_Out_2_Float.xxx), _Divide_91ae4b94f1d9b78e99d0472293b8098c_Out_2_Vector3);
        float3 _Transform_73eecc0c3689d184a34c8d0f28a58adf_Out_1_Vector3;
        {
        float3x3 tangentTransform = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
        _Transform_73eecc0c3689d184a34c8d0f28a58adf_Out_1_Vector3 = TransformWorldToTangentDir(_Divide_91ae4b94f1d9b78e99d0472293b8098c_Out_2_Vector3.xyz, tangentTransform, true);
        }
        float3 _Normalize_15ef346824db0a8797631ed8b998e673_Out_1_Vector3;
        Unity_Normalize_float3(_Transform_73eecc0c3689d184a34c8d0f28a58adf_Out_1_Vector3, _Normalize_15ef346824db0a8797631ed8b998e673_Out_1_Vector3);
        XYZ_1 = (float4(_Normalize_15ef346824db0a8797631ed8b998e673_Out_1_Vector3, 1.0));
        XZ_2 = (float4(_Vector3_08f62c5c01619e849f1a7d85a44531ac_Out_0_Vector3, 1.0));
        YZ_3 = (float4(_Vector3_ba6cfb4671e8c58f9b41ea1dc23102ca_Out_0_Vector3, 1.0));
        XY_4 = (float4(_Vector3_13a08d5940172a84a78ee3d9b8766833_Out_0_Vector3, 1.0));
        }
        
        void Unity_Clamp_float(float In, float Min, float Max, out float Out)
        {
            Out = clamp(In, Min, Max);
        }
        
        void Unity_Subtract_float(float A, float B, out float Out)
        {
            Out = A - B;
        }
        
        void Unity_Absolute_float(float In, out float Out)
        {
            Out = abs(In);
        }
        
        void Unity_Power_float(float A, float B, out float Out)
        {
            Out = pow(A, B);
        }
        
        void Unity_Lerp_float3(float3 A, float3 B, float3 T, out float3 Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Add_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A + B;
        }
        
        struct Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float
        {
        float3 WorldSpaceNormal;
        float3 AbsoluteWorldSpacePosition;
        };
        
        void SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(UnityTexture2D Texture2D_80A3D28F, float Vector1_41461AC9, float Vector1_E4D1C13A, Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float IN, out float4 XYZ_1, out float4 XZ_2, out float4 YZ_3, out float4 XY_4)
        {
        UnityTexture2D _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D = Texture2D_80A3D28F;
        float _Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
        float _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
        float _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
        float _Split_89ed63cb625cb3878c183d0b71c03400_A_4_Float = 0;
        float4 _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4;
        float3 _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3;
        float2 _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, float(0), float(0), _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3, _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2);
        float _Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float = Vector1_41461AC9;
        float4 _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, (_Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float.xxxx), _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4);
        float3 _Sign_b826e0ff2d95ec8cb2b2cbbd7ea2eab6_Out_1_Vector3;
        Unity_Sign_float3(IN.WorldSpaceNormal, _Sign_b826e0ff2d95ec8cb2b2cbbd7ea2eab6_Out_1_Vector3);
        float _Split_742547a7039de986a646d04c157ae549_R_1_Float = _Sign_b826e0ff2d95ec8cb2b2cbbd7ea2eab6_Out_1_Vector3[0];
        float _Split_742547a7039de986a646d04c157ae549_G_2_Float = _Sign_b826e0ff2d95ec8cb2b2cbbd7ea2eab6_Out_1_Vector3[1];
        float _Split_742547a7039de986a646d04c157ae549_B_3_Float = _Sign_b826e0ff2d95ec8cb2b2cbbd7ea2eab6_Out_1_Vector3[2];
        float _Split_742547a7039de986a646d04c157ae549_A_4_Float = 0;
        float2 _Vector2_40a8919e571ec18499de72022c155b38_Out_0_Vector2 = float2(_Split_742547a7039de986a646d04c157ae549_G_2_Float, float(1));
        float2 _Multiply_5fa32af59cdca88389832336b2268bd5_Out_2_Vector2;
        Unity_Multiply_float2_float2((_Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4.xy), _Vector2_40a8919e571ec18499de72022c155b38_Out_0_Vector2, _Multiply_5fa32af59cdca88389832336b2268bd5_Out_2_Vector2);
        float4 _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Multiply_5fa32af59cdca88389832336b2268bd5_Out_2_Vector2) );
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.r;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.g;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.b;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_A_7_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.a;
        float3 _Absolute_644b798714827680b39bf5d34f70385f_Out_1_Vector3;
        Unity_Absolute_float3(IN.WorldSpaceNormal, _Absolute_644b798714827680b39bf5d34f70385f_Out_1_Vector3);
        float _Property_adc4c59482221c8aad681c6558728ac9_Out_0_Float = Vector1_E4D1C13A;
        float3 _Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3;
        Unity_Power_float3(_Absolute_644b798714827680b39bf5d34f70385f_Out_1_Vector3, (_Property_adc4c59482221c8aad681c6558728ac9_Out_0_Float.xxx), _Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3);
        float3 _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3, _Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3, _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3);
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_R_1_Float = _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3[0];
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_G_2_Float = _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3[1];
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_B_3_Float = _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3[2];
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_A_4_Float = 0;
        float4 _Multiply_2e1040ca9c98d085ace76ee93f094039_Out_2_Vector4;
        Unity_Multiply_float4_float4(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4, (_Split_ae83014fcbd9f7879a0b91fa66dc9718_G_2_Float.xxxx), _Multiply_2e1040ca9c98d085ace76ee93f094039_Out_2_Vector4);
        float4 _Combine_192c2c4a69be588b90ca005a32e22552_RGBA_4_Vector4;
        float3 _Combine_192c2c4a69be588b90ca005a32e22552_RGB_5_Vector3;
        float2 _Combine_192c2c4a69be588b90ca005a32e22552_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float, float(0), float(0), _Combine_192c2c4a69be588b90ca005a32e22552_RGBA_4_Vector4, _Combine_192c2c4a69be588b90ca005a32e22552_RGB_5_Vector3, _Combine_192c2c4a69be588b90ca005a32e22552_RG_6_Vector2);
        float4 _Multiply_138240d0d4846e87b0febabec0d6891b_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_192c2c4a69be588b90ca005a32e22552_RGBA_4_Vector4, (_Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float.xxxx), _Multiply_138240d0d4846e87b0febabec0d6891b_Out_2_Vector4);
        float _Multiply_014402ded5a3988a8c18ba07636ea5a7_Out_2_Float;
        Unity_Multiply_float_float(_Split_742547a7039de986a646d04c157ae549_B_3_Float, -1, _Multiply_014402ded5a3988a8c18ba07636ea5a7_Out_2_Float);
        float2 _Vector2_caa25d55d456a58982bdfc39b1b43f3f_Out_0_Vector2 = float2(_Multiply_014402ded5a3988a8c18ba07636ea5a7_Out_2_Float, float(1));
        float2 _Multiply_a67201b6e1a0a28c98cd9d06e8b09543_Out_2_Vector2;
        Unity_Multiply_float2_float2((_Multiply_138240d0d4846e87b0febabec0d6891b_Out_2_Vector4.xy), _Vector2_caa25d55d456a58982bdfc39b1b43f3f_Out_0_Vector2, _Multiply_a67201b6e1a0a28c98cd9d06e8b09543_Out_2_Vector2);
        float4 _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Multiply_a67201b6e1a0a28c98cd9d06e8b09543_Out_2_Vector2) );
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_R_4_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.r;
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_G_5_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.g;
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_B_6_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.b;
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_A_7_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.a;
        float4 _Multiply_7bb4009c92b108849ac6ca92bc1442f2_Out_2_Vector4;
        Unity_Multiply_float4_float4(_SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4, (_Split_ae83014fcbd9f7879a0b91fa66dc9718_B_3_Float.xxxx), _Multiply_7bb4009c92b108849ac6ca92bc1442f2_Out_2_Vector4);
        float4 _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGBA_4_Vector4;
        float3 _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGB_5_Vector3;
        float2 _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float, float(0), float(0), _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGBA_4_Vector4, _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGB_5_Vector3, _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RG_6_Vector2);
        float4 _Multiply_2c0864423b014f8b8af8523f68cbb63c_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGBA_4_Vector4, (_Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float.xxxx), _Multiply_2c0864423b014f8b8af8523f68cbb63c_Out_2_Vector4);
        float2 _Vector2_54dfd40df2fc78809955dd272f2cf0c3_Out_0_Vector2 = float2(_Split_742547a7039de986a646d04c157ae549_R_1_Float, float(1));
        float2 _Multiply_addbd5fcede95f80bbb806c94e49ef63_Out_2_Vector2;
        Unity_Multiply_float2_float2((_Multiply_2c0864423b014f8b8af8523f68cbb63c_Out_2_Vector4.xy), _Vector2_54dfd40df2fc78809955dd272f2cf0c3_Out_0_Vector2, _Multiply_addbd5fcede95f80bbb806c94e49ef63_Out_2_Vector2);
        float4 _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Multiply_addbd5fcede95f80bbb806c94e49ef63_Out_2_Vector2) );
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_R_4_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.r;
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_G_5_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.g;
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_B_6_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.b;
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_A_7_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.a;
        float4 _Multiply_77818c22e359fc8cbb7dd20216a8db72_Out_2_Vector4;
        Unity_Multiply_float4_float4(_SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4, (_Split_ae83014fcbd9f7879a0b91fa66dc9718_R_1_Float.xxxx), _Multiply_77818c22e359fc8cbb7dd20216a8db72_Out_2_Vector4);
        float4 _Add_769d9ee909c9238dbbf72d2800a2f268_Out_2_Vector4;
        Unity_Add_float4(_Multiply_7bb4009c92b108849ac6ca92bc1442f2_Out_2_Vector4, _Multiply_77818c22e359fc8cbb7dd20216a8db72_Out_2_Vector4, _Add_769d9ee909c9238dbbf72d2800a2f268_Out_2_Vector4);
        float4 _Add_14295f72880e4b87a1baf1ced943ac40_Out_2_Vector4;
        Unity_Add_float4(_Multiply_2e1040ca9c98d085ace76ee93f094039_Out_2_Vector4, _Add_769d9ee909c9238dbbf72d2800a2f268_Out_2_Vector4, _Add_14295f72880e4b87a1baf1ced943ac40_Out_2_Vector4);
        float _Add_e59af300bba2498db32eac1412123447_Out_2_Float;
        Unity_Add_float(_Split_ae83014fcbd9f7879a0b91fa66dc9718_R_1_Float, _Split_ae83014fcbd9f7879a0b91fa66dc9718_G_2_Float, _Add_e59af300bba2498db32eac1412123447_Out_2_Float);
        float _Add_e855069f047fae8ea9027d56acb61e56_Out_2_Float;
        Unity_Add_float(_Add_e59af300bba2498db32eac1412123447_Out_2_Float, _Split_ae83014fcbd9f7879a0b91fa66dc9718_B_3_Float, _Add_e855069f047fae8ea9027d56acb61e56_Out_2_Float);
        float4 _Divide_91ae4b94f1d9b78e99d0472293b8098c_Out_2_Vector4;
        Unity_Divide_float4(_Add_14295f72880e4b87a1baf1ced943ac40_Out_2_Vector4, (_Add_e855069f047fae8ea9027d56acb61e56_Out_2_Float.xxxx), _Divide_91ae4b94f1d9b78e99d0472293b8098c_Out_2_Vector4);
        XYZ_1 = _Divide_91ae4b94f1d9b78e99d0472293b8098c_Out_2_Vector4;
        XZ_2 = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4;
        YZ_3 = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4;
        XY_4 = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4;
        }
        
        void Unity_Remap_float(float In, float2 InMinMax, float2 OutMinMax, out float Out)
        {
            Out = OutMinMax.x + (In - InMinMax.x) * (OutMinMax.y - OutMinMax.x) / (InMinMax.y - InMinMax.x);
        }
        
        struct Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float
        {
        float3 AbsoluteWorldSpacePosition;
        half4 uv0;
        half4 uv2;
        };
        
        void SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(UnityTexture2D Texture2D_80A3D28F, float4 Vector4_2EBA7A3B, float Boolean_7ABB9909, UnitySamplerState _SamplerState, float Boolean_5ddfe6daabcc4715a44b5f34fc19becb, Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float IN, out float4 XZ_2)
        {
        UnityTexture2D _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D = Texture2D_80A3D28F;
        float _Property_30834f691775a0898a45b1c868520436_Out_0_Boolean = Boolean_7ABB9909;
        float _Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
        float _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
        float _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
        float _Split_89ed63cb625cb3878c183d0b71c03400_A_4_Float = 0;
        float4 _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4;
        float3 _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3;
        float2 _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, float(0), float(0), _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3, _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2);
        float4 _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4 = Vector4_2EBA7A3B;
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_R_1_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[0];
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_G_2_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[1];
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_B_3_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[2];
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_A_4_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[3];
        float _Divide_e64179199923c58289b6aa94ea6c9178_Out_2_Float;
        Unity_Divide_float(float(1), _Split_2f0f52f6ef8c0e81af0da6476402bc1f_R_1_Float, _Divide_e64179199923c58289b6aa94ea6c9178_Out_2_Float);
        float4 _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, (_Divide_e64179199923c58289b6aa94ea6c9178_Out_2_Float.xxxx), _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4);
        float _Property_f17c7bf877e64b6abdd66b1fe9f5accc_Out_0_Boolean = Boolean_5ddfe6daabcc4715a44b5f34fc19becb;
        float4 _UV_029e8e8198564838b9389b902a09fb22_Out_0_Vector4 = IN.uv0;
        float4 _UV_7a6209af1506424fb75c81e87e42035a_Out_0_Vector4 = IN.uv2;
        float4 _Branch_fc37bb4bf641457cbbc6e290603056ff_Out_3_Vector4;
        Unity_Branch_float4(_Property_f17c7bf877e64b6abdd66b1fe9f5accc_Out_0_Boolean, _UV_029e8e8198564838b9389b902a09fb22_Out_0_Vector4, _UV_7a6209af1506424fb75c81e87e42035a_Out_0_Vector4, _Branch_fc37bb4bf641457cbbc6e290603056ff_Out_3_Vector4);
        float2 _Vector2_16c15d3bbdd14b85bd48e3a6cb318af7_Out_0_Vector2 = float2(_Split_2f0f52f6ef8c0e81af0da6476402bc1f_R_1_Float, _Split_2f0f52f6ef8c0e81af0da6476402bc1f_G_2_Float);
        float2 _Vector2_f8d75f54e7705083bbec539a60185577_Out_0_Vector2 = float2(_Split_2f0f52f6ef8c0e81af0da6476402bc1f_B_3_Float, _Split_2f0f52f6ef8c0e81af0da6476402bc1f_A_4_Float);
        float2 _TilingAndOffset_d91e2d25acd34686b562b7fe7e9d1d27_Out_3_Vector2;
        Unity_TilingAndOffset_float((_Branch_fc37bb4bf641457cbbc6e290603056ff_Out_3_Vector4.xy), _Vector2_16c15d3bbdd14b85bd48e3a6cb318af7_Out_0_Vector2, _Vector2_f8d75f54e7705083bbec539a60185577_Out_0_Vector2, _TilingAndOffset_d91e2d25acd34686b562b7fe7e9d1d27_Out_3_Vector2);
        float2 _Branch_8e5a4e8f4d52fc8aadd1f46485afc933_Out_3_Vector2;
        Unity_Branch_float2(_Property_30834f691775a0898a45b1c868520436_Out_0_Boolean, (_Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4.xy), _TilingAndOffset_d91e2d25acd34686b562b7fe7e9d1d27_Out_3_Vector2, _Branch_8e5a4e8f4d52fc8aadd1f46485afc933_Out_3_Vector2);
        UnitySamplerState _Property_e8746b9475c94530ba35ba8019ad2ae0_Out_0_SamplerState = _SamplerState;
        float4 _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, _Property_e8746b9475c94530ba35ba8019ad2ae0_Out_0_SamplerState.samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Branch_8e5a4e8f4d52fc8aadd1f46485afc933_Out_3_Vector2) );
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.r;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.g;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.b;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_A_7_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.a;
        XZ_2 = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4;
        }
        
        // Custom interpolators pre vertex
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPreVertex' */
        
        // Graph Vertex
        struct VertexDescription
        {
            float3 Position;
            float3 Normal;
            float3 Tangent;
        };
        
        VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
        {
            VertexDescription description = (VertexDescription)0;
            description.Position = IN.ObjectSpacePosition;
            description.Normal = IN.ObjectSpaceNormal;
            description.Tangent = IN.ObjectSpaceTangent;
            return description;
        }
        
        // Custom interpolators, pre surface
        #ifdef FEATURES_GRAPH_VERTEX
        Varyings CustomInterpolatorPassThroughFunc(inout Varyings output, VertexDescription input)
        {
        return output;
        }
        #define CUSTOMINTERPOLATOR_VARYPASSTHROUGH_FUNC
        #endif
        
        // Graph Pixel
        struct SurfaceDescription
        {
            float3 NormalTS;
            float Alpha;
            float AlphaClipThreshold;
        };
        
        SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
        {
            SurfaceDescription surface = (SurfaceDescription)0;
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_b26f64bfa09eb48584b1dc9133f5b840_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_DetailMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_bb28507cb268918795cf74b32a6b3693_Out_0_Vector4 = _DetailTilingOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_a5f9848f7817b48ca226ca228efcc28e_R_1_Float = _Property_bb28507cb268918795cf74b32a6b3693_Out_0_Vector4[0];
            float _Split_a5f9848f7817b48ca226ca228efcc28e_G_2_Float = _Property_bb28507cb268918795cf74b32a6b3693_Out_0_Vector4[1];
            float _Split_a5f9848f7817b48ca226ca228efcc28e_B_3_Float = _Property_bb28507cb268918795cf74b32a6b3693_Out_0_Vector4[2];
            float _Split_a5f9848f7817b48ca226ca228efcc28e_A_4_Float = _Property_bb28507cb268918795cf74b32a6b3693_Out_0_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_257255e4b3cee8888b124cb1330da379_Out_0_Vector2 = float2(_Split_a5f9848f7817b48ca226ca228efcc28e_R_1_Float, _Split_a5f9848f7817b48ca226ca228efcc28e_G_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_2ba978ab0f3ccc84b3fe592845432576_Out_0_Vector2 = float2(_Split_a5f9848f7817b48ca226ca228efcc28e_B_3_Float, _Split_a5f9848f7817b48ca226ca228efcc28e_A_4_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _TilingAndOffset_9bc6b1e938f4668f9476625fa68aff4e_Out_3_Vector2;
            Unity_TilingAndOffset_float(IN.uv0.xy, _Vector2_257255e4b3cee8888b124cb1330da379_Out_0_Vector2, _Vector2_2ba978ab0f3ccc84b3fe592845432576_Out_0_Vector2, _TilingAndOffset_9bc6b1e938f4668f9476625fa68aff4e_Out_3_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_b26f64bfa09eb48584b1dc9133f5b840_Out_0_Texture2D.tex, _Property_b26f64bfa09eb48584b1dc9133f5b840_Out_0_Texture2D.samplerstate, _Property_b26f64bfa09eb48584b1dc9133f5b840_Out_0_Texture2D.GetTransformedUV(_TilingAndOffset_9bc6b1e938f4668f9476625fa68aff4e_Out_3_Vector2) );
            float _SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_R_4_Float = _SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_RGBA_0_Vector4.r;
            float _SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_G_5_Float = _SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_RGBA_0_Vector4.g;
            float _SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_B_6_Float = _SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_RGBA_0_Vector4.b;
            float _SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_A_7_Float = _SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_3f76f18aa45a858dab65f5835e23f0b9_Out_0_Vector2 = float2(_SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_A_7_Float, _SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_G_5_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Multiply_a3cb438c86db8a839543847f1fa26666_Out_2_Vector2;
            Unity_Multiply_float2_float2(_Vector2_3f76f18aa45a858dab65f5835e23f0b9_Out_0_Vector2, float2(2, 2), _Multiply_a3cb438c86db8a839543847f1fa26666_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Add_21eb70b8cab75f8a852dd8dd64767430_Out_2_Vector2;
            Unity_Add_float2(_Multiply_a3cb438c86db8a839543847f1fa26666_Out_2_Vector2, float2(-1, -1), _Add_21eb70b8cab75f8a852dd8dd64767430_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_cbbb2e4ef035b58e8c751d96843d987e_Out_0_Float = _DetailNormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Multiply_d4afe7aea32def8ca3c89b2f7e87af44_Out_2_Vector2;
            Unity_Multiply_float2_float2(_Add_21eb70b8cab75f8a852dd8dd64767430_Out_2_Vector2, (_Property_cbbb2e4ef035b58e8c751d96843d987e_Out_0_Float.xx), _Multiply_d4afe7aea32def8ca3c89b2f7e87af44_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_f88dc76333998681a9031ef1324e052a_R_1_Float = _Multiply_d4afe7aea32def8ca3c89b2f7e87af44_Out_2_Vector2[0];
            float _Split_f88dc76333998681a9031ef1324e052a_G_2_Float = _Multiply_d4afe7aea32def8ca3c89b2f7e87af44_Out_2_Vector2[1];
            float _Split_f88dc76333998681a9031ef1324e052a_B_3_Float = 0;
            float _Split_f88dc76333998681a9031ef1324e052a_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _DotProduct_970a707dd71afa80887b08c47998be6e_Out_2_Float;
            Unity_DotProduct_float2(_Multiply_d4afe7aea32def8ca3c89b2f7e87af44_Out_2_Vector2, _Multiply_d4afe7aea32def8ca3c89b2f7e87af44_Out_2_Vector2, _DotProduct_970a707dd71afa80887b08c47998be6e_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Saturate_6a42dc6ad32c63849dbf7844d1081b82_Out_1_Float;
            Unity_Saturate_float(_DotProduct_970a707dd71afa80887b08c47998be6e_Out_2_Float, _Saturate_6a42dc6ad32c63849dbf7844d1081b82_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_a724d53a195cd387a0d6ec2d11ec64e8_Out_1_Float;
            Unity_OneMinus_float(_Saturate_6a42dc6ad32c63849dbf7844d1081b82_Out_1_Float, _OneMinus_a724d53a195cd387a0d6ec2d11ec64e8_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _SquareRoot_6e074ca49330118a958f11e9487fe5c6_Out_1_Float;
            Unity_SquareRoot_float(_OneMinus_a724d53a195cd387a0d6ec2d11ec64e8_Out_1_Float, _SquareRoot_6e074ca49330118a958f11e9487fe5c6_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Vector3_a6a5e3fb326314838a5e436f55de8dcc_Out_0_Vector3 = float3(_Split_f88dc76333998681a9031ef1324e052a_R_1_Float, _Split_f88dc76333998681a9031ef1324e052a_G_2_Float, _SquareRoot_6e074ca49330118a958f11e9487fe5c6_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_2e4a88374e8ffd8db37352d79f10740a_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseNormalMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_e21be9beec8d858fa2818b2fddc4577c_Out_0_Vector4 = _BaseTilingOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_1b1963c0ccb4d78fa3474b362fd31d15_Out_0_Boolean = _BaseUsePlanarUV;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float _PlanarNMn_126f337c769a878bb33ea56bcab1d637;
            _PlanarNMn_126f337c769a878bb33ea56bcab1d637.WorldSpaceNormal = IN.WorldSpaceNormal;
            _PlanarNMn_126f337c769a878bb33ea56bcab1d637.WorldSpaceTangent = IN.WorldSpaceTangent;
            _PlanarNMn_126f337c769a878bb33ea56bcab1d637.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _PlanarNMn_126f337c769a878bb33ea56bcab1d637.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNMn_126f337c769a878bb33ea56bcab1d637.uv0 = IN.uv0;
            _PlanarNMn_126f337c769a878bb33ea56bcab1d637.uv2 = IN.uv2;
            float4 _PlanarNMn_126f337c769a878bb33ea56bcab1d637_XZ_2_Vector4;
            SG_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float(_Property_2e4a88374e8ffd8db37352d79f10740a_Out_0_Texture2D, _Property_e21be9beec8d858fa2818b2fddc4577c_Out_0_Vector4, _Property_1b1963c0ccb4d78fa3474b362fd31d15_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), 1, _PlanarNMn_126f337c769a878bb33ea56bcab1d637, _PlanarNMn_126f337c769a878bb33ea56bcab1d637_XZ_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_ea100595101f088a94e70278a910a34c_Out_0_Float = _BaseNormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _NormalStrength_70f3e500f60967898e02d8fc8200db59_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_126f337c769a878bb33ea56bcab1d637_XZ_2_Vector4.xyz), _Property_ea100595101f088a94e70278a910a34c_Out_0_Float, _NormalStrength_70f3e500f60967898e02d8fc8200db59_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _NormalBlend_58a0c0d45b55168cbfa43fa9d9da21c6_Out_2_Vector3;
            Unity_NormalBlend_float(_Vector3_a6a5e3fb326314838a5e436f55de8dcc_Out_0_Vector3, _NormalStrength_70f3e500f60967898e02d8fc8200db59_Out_2_Vector3, _NormalBlend_58a0c0d45b55168cbfa43fa9d9da21c6_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_bb2720e978ff4782bb872fb7b877636f_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverNormalMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_e95f6f4e76cecb87871151040535a080_Out_0_Vector4 = _CoverTilingOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Divide_acbbd9727ffda783aeafe28ccafbde8e_Out_2_Vector4;
            Unity_Divide_float4(float4(1, 1, 0, 0), _Property_e95f6f4e76cecb87871151040535a080_Out_0_Vector4, _Divide_acbbd9727ffda783aeafe28ccafbde8e_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_faa4f436225f4e8eb99135b1d078135e_Out_0_Float = _CoverTriplanarThreshold;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNMn_059da9746584140498cd018db3c76047_float _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b;
            _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b.WorldSpaceTangent = IN.WorldSpaceTangent;
            _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b.WorldSpacePosition = IN.WorldSpacePosition;
            float4 _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b_XYZ_1_Vector4;
            float4 _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b_XZ_2_Vector4;
            float4 _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b_YZ_3_Vector4;
            float4 _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b_XY_4_Vector4;
            SG_TriplanarNMn_059da9746584140498cd018db3c76047_float(_Property_bb2720e978ff4782bb872fb7b877636f_Out_0_Texture2D, (_Divide_acbbd9727ffda783aeafe28ccafbde8e_Out_2_Vector4).x, _Property_faa4f436225f4e8eb99135b1d078135e_Out_0_Float, _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b, _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b_XYZ_1_Vector4, _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b_XZ_2_Vector4, _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b_YZ_3_Vector4, _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_b4e25e28683cfa839d36c1919793b680_Out_0_Float = _CoverNormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _NormalStrength_3204e89c6d863484958f2b78ddab5dd5_Out_2_Vector3;
            Unity_NormalStrength_float((_TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b_XYZ_1_Vector4.xyz), _Property_b4e25e28683cfa839d36c1919793b680_Out_0_Float, _NormalStrength_3204e89c6d863484958f2b78ddab5dd5_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_43c6facd1f553289befba1782fe8ad70_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverMaskA);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _UV_5b74fb710ad3d187a00f16e1d8f8bd63_Out_0_Vector4 = IN.uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _SampleTexture2D_4d4c63c65e48c28ba5f624928f181789_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_43c6facd1f553289befba1782fe8ad70_Out_0_Texture2D.tex, _Property_43c6facd1f553289befba1782fe8ad70_Out_0_Texture2D.samplerstate, _Property_43c6facd1f553289befba1782fe8ad70_Out_0_Texture2D.GetTransformedUV((_UV_5b74fb710ad3d187a00f16e1d8f8bd63_Out_0_Vector4.xy)) );
            float _SampleTexture2D_4d4c63c65e48c28ba5f624928f181789_R_4_Float = _SampleTexture2D_4d4c63c65e48c28ba5f624928f181789_RGBA_0_Vector4.r;
            float _SampleTexture2D_4d4c63c65e48c28ba5f624928f181789_G_5_Float = _SampleTexture2D_4d4c63c65e48c28ba5f624928f181789_RGBA_0_Vector4.g;
            float _SampleTexture2D_4d4c63c65e48c28ba5f624928f181789_B_6_Float = _SampleTexture2D_4d4c63c65e48c28ba5f624928f181789_RGBA_0_Vector4.b;
            float _SampleTexture2D_4d4c63c65e48c28ba5f624928f181789_A_7_Float = _SampleTexture2D_4d4c63c65e48c28ba5f624928f181789_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_4080f51767261687a64910057bc980cb_Out_0_Float = _CoverMaskPower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_2660ad962697408681e2e8c36648ca12_Out_2_Float;
            Unity_Multiply_float_float(_SampleTexture2D_4d4c63c65e48c28ba5f624928f181789_A_7_Float, _Property_4080f51767261687a64910057bc980cb_Out_0_Float, _Multiply_2660ad962697408681e2e8c36648ca12_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_572d83500486058c99890c5d609b30b0_Out_3_Float;
            Unity_Clamp_float(_Multiply_2660ad962697408681e2e8c36648ca12_Out_2_Float, float(0), float(1), _Clamp_572d83500486058c99890c5d609b30b0_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Property_3d047323d7f9778ca2b1b7d7d4d43210_Out_0_Vector3 = _CoverDirection;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_f6ae16d8d2c85685b4072d78c56e29e9_Out_0_Float = _CoverNormalBlendHardness;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _NormalStrength_11fab77b71140d8ab0735a9615b728ec_Out_2_Vector3;
            Unity_NormalStrength_float((_TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b_XYZ_1_Vector4.xyz), _Property_f6ae16d8d2c85685b4072d78c56e29e9_Out_0_Float, _NormalStrength_11fab77b71140d8ab0735a9615b728ec_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Multiply_fa49280de269898ebbfe89d446d57ecc_Out_2_Vector3;
            Unity_Multiply_float3_float3(_Property_3d047323d7f9778ca2b1b7d7d4d43210_Out_0_Vector3, IN.WorldSpaceNormal, _Multiply_fa49280de269898ebbfe89d446d57ecc_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_91e143818eee6187b799b2a4652eeb95_R_1_Float = _Multiply_fa49280de269898ebbfe89d446d57ecc_Out_2_Vector3[0];
            float _Split_91e143818eee6187b799b2a4652eeb95_G_2_Float = _Multiply_fa49280de269898ebbfe89d446d57ecc_Out_2_Vector3[1];
            float _Split_91e143818eee6187b799b2a4652eeb95_B_3_Float = _Multiply_fa49280de269898ebbfe89d446d57ecc_Out_2_Vector3[2];
            float _Split_91e143818eee6187b799b2a4652eeb95_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_f99764306bf31e8484b14d9a1ba660a3_Out_2_Float;
            Unity_Add_float(_Split_91e143818eee6187b799b2a4652eeb95_R_1_Float, _Split_91e143818eee6187b799b2a4652eeb95_G_2_Float, _Add_f99764306bf31e8484b14d9a1ba660a3_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_25d0cda769439c85a6176b0cf9af06c0_Out_2_Float;
            Unity_Add_float(_Add_f99764306bf31e8484b14d9a1ba660a3_Out_2_Float, _Split_91e143818eee6187b799b2a4652eeb95_B_3_Float, _Add_25d0cda769439c85a6176b0cf9af06c0_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_24df69e5dc52008e891c2b3f99e28991_Out_0_Float = _Cover_Amount;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_7b25e9aea29e888e99e5155562106e70_Out_0_Float = _Cover_Amount_Grow_Speed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Subtract_a31b2e64f122188ea610c77d3f62f810_Out_2_Float;
            Unity_Subtract_float(float(4), _Property_7b25e9aea29e888e99e5155562106e70_Out_0_Float, _Subtract_a31b2e64f122188ea610c77d3f62f810_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_15277685f0785f8a90f4492c80247159_Out_2_Float;
            Unity_Divide_float(_Property_24df69e5dc52008e891c2b3f99e28991_Out_0_Float, _Subtract_a31b2e64f122188ea610c77d3f62f810_Out_2_Float, _Divide_15277685f0785f8a90f4492c80247159_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Absolute_ac1c6e27d47e508e8aed26d3db167120_Out_1_Float;
            Unity_Absolute_float(_Divide_15277685f0785f8a90f4492c80247159_Out_2_Float, _Absolute_ac1c6e27d47e508e8aed26d3db167120_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Power_d5a03bba02ea638f84c50ca9f6a3e112_Out_2_Float;
            Unity_Power_float(_Absolute_ac1c6e27d47e508e8aed26d3db167120_Out_1_Float, _Subtract_a31b2e64f122188ea610c77d3f62f810_Out_2_Float, _Power_d5a03bba02ea638f84c50ca9f6a3e112_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_1be0e9928e2c0489b16295f57a026487_Out_3_Float;
            Unity_Clamp_float(_Power_d5a03bba02ea638f84c50ca9f6a3e112_Out_2_Float, float(0), float(2), _Clamp_1be0e9928e2c0489b16295f57a026487_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_041ba179c4133288bd6ebb7932697351_Out_2_Float;
            Unity_Multiply_float_float(_Add_25d0cda769439c85a6176b0cf9af06c0_Out_2_Float, _Clamp_1be0e9928e2c0489b16295f57a026487_Out_3_Float, _Multiply_041ba179c4133288bd6ebb7932697351_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Saturate_f03610d99dc38b8688cdf6c95924daaf_Out_1_Float;
            Unity_Saturate_float(_Multiply_041ba179c4133288bd6ebb7932697351_Out_2_Float, _Saturate_f03610d99dc38b8688cdf6c95924daaf_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_78437b2d5aa53f829edcee712f066e04_Out_3_Float;
            Unity_Clamp_float(_Add_25d0cda769439c85a6176b0cf9af06c0_Out_2_Float, float(0), float(0.9999), _Clamp_78437b2d5aa53f829edcee712f066e04_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_32c30bd23dc33184849662569cd46759_Out_0_Float = _Cover_Max_Angle;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_9d9e98ea75888d85877f3863930719aa_Out_2_Float;
            Unity_Divide_float(_Property_32c30bd23dc33184849662569cd46759_Out_0_Float, float(45), _Divide_9d9e98ea75888d85877f3863930719aa_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_fa817fbd2ba8aa81bf3977d104f66ffd_Out_1_Float;
            Unity_OneMinus_float(_Divide_9d9e98ea75888d85877f3863930719aa_Out_2_Float, _OneMinus_fa817fbd2ba8aa81bf3977d104f66ffd_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Subtract_66c9a128aff075848cbe14a74ba8d3c5_Out_2_Float;
            Unity_Subtract_float(_Clamp_78437b2d5aa53f829edcee712f066e04_Out_3_Float, _OneMinus_fa817fbd2ba8aa81bf3977d104f66ffd_Out_1_Float, _Subtract_66c9a128aff075848cbe14a74ba8d3c5_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_b81e19ff4b40e889bbc2a0d75a043d55_Out_3_Float;
            Unity_Clamp_float(_Subtract_66c9a128aff075848cbe14a74ba8d3c5_Out_2_Float, float(0), float(2), _Clamp_b81e19ff4b40e889bbc2a0d75a043d55_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_df9b9eb99573a286b66090f1a88825c2_Out_2_Float;
            Unity_Divide_float(float(1), _Divide_9d9e98ea75888d85877f3863930719aa_Out_2_Float, _Divide_df9b9eb99573a286b66090f1a88825c2_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_b1c6bc199993da8e8690b8204063c06f_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_b81e19ff4b40e889bbc2a0d75a043d55_Out_3_Float, _Divide_df9b9eb99573a286b66090f1a88825c2_Out_2_Float, _Multiply_b1c6bc199993da8e8690b8204063c06f_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Absolute_47d15fbc856f1982992c9f6f8cf095df_Out_1_Float;
            Unity_Absolute_float(_Multiply_b1c6bc199993da8e8690b8204063c06f_Out_2_Float, _Absolute_47d15fbc856f1982992c9f6f8cf095df_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_84ecf6d44066108b958a4bbf89eb2bbb_Out_0_Float = _CoverHardness;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Power_e2326e473b1f15869db22e412e3f9fde_Out_2_Float;
            Unity_Power_float(_Absolute_47d15fbc856f1982992c9f6f8cf095df_Out_1_Float, _Property_84ecf6d44066108b958a4bbf89eb2bbb_Out_0_Float, _Power_e2326e473b1f15869db22e412e3f9fde_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_e5173dd322cb9c87a827b3d6d416e8c4_Out_0_Float = _Cover_Min_Height;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_d6102fe1df60cf8f9be5eb4f6774b363_Out_1_Float;
            Unity_OneMinus_float(_Property_e5173dd322cb9c87a827b3d6d416e8c4_Out_0_Float, _OneMinus_d6102fe1df60cf8f9be5eb4f6774b363_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_c2c0822a4c066887bdce2476ce07e03b_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
            float _Split_c2c0822a4c066887bdce2476ce07e03b_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
            float _Split_c2c0822a4c066887bdce2476ce07e03b_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
            float _Split_c2c0822a4c066887bdce2476ce07e03b_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_d67ba628c117b784982b2b0e7335f121_Out_2_Float;
            Unity_Add_float(_OneMinus_d6102fe1df60cf8f9be5eb4f6774b363_Out_1_Float, _Split_c2c0822a4c066887bdce2476ce07e03b_G_2_Float, _Add_d67ba628c117b784982b2b0e7335f121_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_cacc637f6d247382b610fa5e29099efb_Out_2_Float;
            Unity_Add_float(_Add_d67ba628c117b784982b2b0e7335f121_Out_2_Float, float(1), _Add_cacc637f6d247382b610fa5e29099efb_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_305f17dcc5012d81886e7fe415a513d4_Out_3_Float;
            Unity_Clamp_float(_Add_cacc637f6d247382b610fa5e29099efb_Out_2_Float, float(0), float(1), _Clamp_305f17dcc5012d81886e7fe415a513d4_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_6b0e17b7e3d2fd8db358cf2468c498e6_Out_0_Float = _Cover_Min_Height_Blending;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_3a4b967d185bc881b41c30791f6f1e62_Out_2_Float;
            Unity_Add_float(_Add_d67ba628c117b784982b2b0e7335f121_Out_2_Float, _Property_6b0e17b7e3d2fd8db358cf2468c498e6_Out_0_Float, _Add_3a4b967d185bc881b41c30791f6f1e62_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_fd0dcb913f15e88e902812b438aebbc3_Out_2_Float;
            Unity_Divide_float(_Add_3a4b967d185bc881b41c30791f6f1e62_Out_2_Float, _Add_d67ba628c117b784982b2b0e7335f121_Out_2_Float, _Divide_fd0dcb913f15e88e902812b438aebbc3_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_a7b7b5823dc9398d8328371fb23de257_Out_1_Float;
            Unity_OneMinus_float(_Divide_fd0dcb913f15e88e902812b438aebbc3_Out_2_Float, _OneMinus_a7b7b5823dc9398d8328371fb23de257_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_caa2bc8711bde98886b2e04bc3895333_Out_2_Float;
            Unity_Add_float(_OneMinus_a7b7b5823dc9398d8328371fb23de257_Out_1_Float, float(-0.5), _Add_caa2bc8711bde98886b2e04bc3895333_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_9958b4bb870ca78bb4f436357f6e4ed4_Out_3_Float;
            Unity_Clamp_float(_Add_caa2bc8711bde98886b2e04bc3895333_Out_2_Float, float(0), float(1), _Clamp_9958b4bb870ca78bb4f436357f6e4ed4_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_f4c52e99fecae983bba5ca957ceaea70_Out_2_Float;
            Unity_Add_float(_Clamp_305f17dcc5012d81886e7fe415a513d4_Out_3_Float, _Clamp_9958b4bb870ca78bb4f436357f6e4ed4_Out_3_Float, _Add_f4c52e99fecae983bba5ca957ceaea70_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_4b0ba629f5691b8985bcb46fe077634b_Out_3_Float;
            Unity_Clamp_float(_Add_f4c52e99fecae983bba5ca957ceaea70_Out_2_Float, float(0), float(1), _Clamp_4b0ba629f5691b8985bcb46fe077634b_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_dc9146fa086a698db159220c4b551f8d_Out_2_Float;
            Unity_Multiply_float_float(_Power_e2326e473b1f15869db22e412e3f9fde_Out_2_Float, _Clamp_4b0ba629f5691b8985bcb46fe077634b_Out_3_Float, _Multiply_dc9146fa086a698db159220c4b551f8d_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_4a4cdbb11047088c86f3455cd5a51981_Out_2_Float;
            Unity_Multiply_float_float(_Saturate_f03610d99dc38b8688cdf6c95924daaf_Out_1_Float, _Multiply_dc9146fa086a698db159220c4b551f8d_Out_2_Float, _Multiply_4a4cdbb11047088c86f3455cd5a51981_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Lerp_81e093150193e5818ea2e7cdf113600f_Out_3_Vector3;
            Unity_Lerp_float3(_NormalBlend_58a0c0d45b55168cbfa43fa9d9da21c6_Out_2_Vector3, _NormalStrength_11fab77b71140d8ab0735a9615b728ec_Out_2_Vector3, (_Multiply_4a4cdbb11047088c86f3455cd5a51981_Out_2_Float.xxx), _Lerp_81e093150193e5818ea2e7cdf113600f_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Transform_fcfe6aed8d17598ebf576390e09b3662_Out_1_Vector3;
            {
                float3x3 tangentTransform = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
                _Transform_fcfe6aed8d17598ebf576390e09b3662_Out_1_Vector3 = TransformTangentToWorldDir(_Lerp_81e093150193e5818ea2e7cdf113600f_Out_3_Vector3.xyz, tangentTransform, true).xyz;
            }
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Multiply_87cc0f3ed4675989b51b1b58a173bc24_Out_2_Vector3;
            Unity_Multiply_float3_float3(_Property_3d047323d7f9778ca2b1b7d7d4d43210_Out_0_Vector3, _Transform_fcfe6aed8d17598ebf576390e09b3662_Out_1_Vector3, _Multiply_87cc0f3ed4675989b51b1b58a173bc24_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_60ee188afca81787a8e8fac74a174b99_R_1_Float = _Multiply_87cc0f3ed4675989b51b1b58a173bc24_Out_2_Vector3[0];
            float _Split_60ee188afca81787a8e8fac74a174b99_G_2_Float = _Multiply_87cc0f3ed4675989b51b1b58a173bc24_Out_2_Vector3[1];
            float _Split_60ee188afca81787a8e8fac74a174b99_B_3_Float = _Multiply_87cc0f3ed4675989b51b1b58a173bc24_Out_2_Vector3[2];
            float _Split_60ee188afca81787a8e8fac74a174b99_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_dc15dd3b0cae3e89bd698e7f843f7b1a_Out_2_Float;
            Unity_Add_float(_Split_60ee188afca81787a8e8fac74a174b99_R_1_Float, _Split_60ee188afca81787a8e8fac74a174b99_G_2_Float, _Add_dc15dd3b0cae3e89bd698e7f843f7b1a_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_5239bb98d15c0889b20e04a2eb89ee8d_Out_2_Float;
            Unity_Add_float(_Add_dc15dd3b0cae3e89bd698e7f843f7b1a_Out_2_Float, _Split_60ee188afca81787a8e8fac74a174b99_B_3_Float, _Add_5239bb98d15c0889b20e04a2eb89ee8d_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_04ad5b9da8d13d80977bd2661241c39d_Out_2_Float;
            Unity_Multiply_float_float(_Add_5239bb98d15c0889b20e04a2eb89ee8d_Out_2_Float, _Clamp_1be0e9928e2c0489b16295f57a026487_Out_3_Float, _Multiply_04ad5b9da8d13d80977bd2661241c39d_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_ffe9545eefb14c85b9db82fa15044921_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_1be0e9928e2c0489b16295f57a026487_Out_3_Float, _Property_84ecf6d44066108b958a4bbf89eb2bbb_Out_0_Float, _Multiply_ffe9545eefb14c85b9db82fa15044921_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_49be95001b6ff98ea3ddca613a01d693_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_ffe9545eefb14c85b9db82fa15044921_Out_2_Float, _Multiply_dc9146fa086a698db159220c4b551f8d_Out_2_Float, _Multiply_49be95001b6ff98ea3ddca613a01d693_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_821af040af6e558284ae449187584b00_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_04ad5b9da8d13d80977bd2661241c39d_Out_2_Float, _Multiply_49be95001b6ff98ea3ddca613a01d693_Out_2_Float, _Multiply_821af040af6e558284ae449187584b00_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_b98b3357cae0358aae44a13c442bbfcf_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverMaskMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3;
            _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_XYZ_1_Vector4;
            float4 _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_XZ_2_Vector4;
            float4 _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_YZ_3_Vector4;
            float4 _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_b98b3357cae0358aae44a13c442bbfcf_Out_0_Texture2D, (_Divide_acbbd9727ffda783aeafe28ccafbde8e_Out_2_Vector4).x, _Property_faa4f436225f4e8eb99135b1d078135e_Out_0_Float, _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3, _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_XYZ_1_Vector4, _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_XZ_2_Vector4, _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_YZ_3_Vector4, _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_d45fa36c68c6428bb4f8080e2005e0ec_R_1_Float = _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_XYZ_1_Vector4[0];
            float _Split_d45fa36c68c6428bb4f8080e2005e0ec_G_2_Float = _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_XYZ_1_Vector4[1];
            float _Split_d45fa36c68c6428bb4f8080e2005e0ec_B_3_Float = _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_XYZ_1_Vector4[2];
            float _Split_d45fa36c68c6428bb4f8080e2005e0ec_A_4_Float = _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_XYZ_1_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_98ac4ea177a183869352488b4c2d0d34_Out_0_Float = _CoverHeightMapMin;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_5d5eb0a63075b184be1f8ed7f1969793_Out_0_Float = _CoverHeightMapMax;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_068b903f7986bb8da7741fd6f472d4d3_Out_0_Vector2 = float2(_Property_98ac4ea177a183869352488b4c2d0d34_Out_0_Float, _Property_5d5eb0a63075b184be1f8ed7f1969793_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_dbf8fa97bfdf2f819d547b2836d5eb88_Out_0_Float = _CoverHeightMapOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Add_7e64ff79e725df80a9231cb40178da18_Out_2_Vector2;
            Unity_Add_float2(_Vector2_068b903f7986bb8da7741fd6f472d4d3_Out_0_Vector2, (_Property_dbf8fa97bfdf2f819d547b2836d5eb88_Out_0_Float.xx), _Add_7e64ff79e725df80a9231cb40178da18_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_0792f0dacec10e82954597c385120c5f_Out_3_Float;
            Unity_Remap_float(_Split_d45fa36c68c6428bb4f8080e2005e0ec_B_3_Float, float2 (0, 1), _Add_7e64ff79e725df80a9231cb40178da18_Out_2_Vector2, _Remap_0792f0dacec10e82954597c385120c5f_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_fef4ce95d06ced86899c58782dd5e9ac_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_821af040af6e558284ae449187584b00_Out_2_Float, _Remap_0792f0dacec10e82954597c385120c5f_Out_3_Float, _Multiply_fef4ce95d06ced86899c58782dd5e9ac_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_f38ac593c11c408685b4081df7f9a736_R_1_Float = IN.VertexColor[0];
            float _Split_f38ac593c11c408685b4081df7f9a736_G_2_Float = IN.VertexColor[1];
            float _Split_f38ac593c11c408685b4081df7f9a736_B_3_Float = IN.VertexColor[2];
            float _Split_f38ac593c11c408685b4081df7f9a736_A_4_Float = IN.VertexColor[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_26b43e2c517d7982b34d1c541939b6f5_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_fef4ce95d06ced86899c58782dd5e9ac_Out_2_Float, _Split_f38ac593c11c408685b4081df7f9a736_G_2_Float, _Multiply_26b43e2c517d7982b34d1c541939b6f5_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Saturate_3d2efb20d5b29381bfb3003845307b1f_Out_1_Float;
            Unity_Saturate_float(_Multiply_26b43e2c517d7982b34d1c541939b6f5_Out_2_Float, _Saturate_3d2efb20d5b29381bfb3003845307b1f_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_97e8d2e584b4e587a8ffaa3d3b1b30f5_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_572d83500486058c99890c5d609b30b0_Out_3_Float, _Saturate_3d2efb20d5b29381bfb3003845307b1f_Out_1_Float, _Multiply_97e8d2e584b4e587a8ffaa3d3b1b30f5_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            #if defined(_USEDYNAMICCOVERTSTATICMASKF_ON)
            float _UseDynamicCoverTStaticMaskF_ea4efcf79fa41489897aef4bbf5e655f_Out_0_Float = _Multiply_97e8d2e584b4e587a8ffaa3d3b1b30f5_Out_2_Float;
            #else
            float _UseDynamicCoverTStaticMaskF_ea4efcf79fa41489897aef4bbf5e655f_Out_0_Float = _Clamp_572d83500486058c99890c5d609b30b0_Out_3_Float;
            #endif
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Lerp_ddd428cec97e91869b2eec0aace3820c_Out_3_Vector3;
            Unity_Lerp_float3(_NormalBlend_58a0c0d45b55168cbfa43fa9d9da21c6_Out_2_Vector3, _NormalStrength_3204e89c6d863484958f2b78ddab5dd5_Out_2_Vector3, (_UseDynamicCoverTStaticMaskF_ea4efcf79fa41489897aef4bbf5e655f_Out_0_Float.xxx), _Lerp_ddd428cec97e91869b2eec0aace3820c_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_05d49814100eb3808cd61a6177622291_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseColorMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae;
            _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae.uv0 = IN.uv0;
            _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae.uv2 = IN.uv2;
            float4 _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_05d49814100eb3808cd61a6177622291_Out_0_Texture2D, _Property_e21be9beec8d858fa2818b2fddc4577c_Out_0_Vector4, _Property_1b1963c0ccb4d78fa3474b362fd31d15_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), 1, _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae, _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae_XZ_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_4bb7737116edbd81bca06201348456ea_R_1_Float = _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae_XZ_2_Vector4[0];
            float _Split_4bb7737116edbd81bca06201348456ea_G_2_Float = _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae_XZ_2_Vector4[1];
            float _Split_4bb7737116edbd81bca06201348456ea_B_3_Float = _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae_XZ_2_Vector4[2];
            float _Split_4bb7737116edbd81bca06201348456ea_A_4_Float = _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae_XZ_2_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_f9637076944eae8abdcc79dc2702814b_Out_0_Float = _AlphaCutoff;
            #endif
            surface.NormalTS = _Lerp_ddd428cec97e91869b2eec0aace3820c_Out_3_Vector3;
            surface.Alpha = _Split_4bb7737116edbd81bca06201348456ea_A_4_Float;
            surface.AlphaClipThreshold = _Property_f9637076944eae8abdcc79dc2702814b_Out_0_Float;
            return surface;
        }
        
        // --------------------------------------------------
        // Build Graph Inputs
        #ifdef HAVE_VFX_MODIFICATION
        #define VFX_SRP_ATTRIBUTES Attributes
        #define VFX_SRP_VARYINGS Varyings
        #define VFX_SRP_SURFACE_INPUTS SurfaceDescriptionInputs
        #endif
        VertexDescriptionInputs BuildVertexDescriptionInputs(Attributes input)
        {
            VertexDescriptionInputs output;
            ZERO_INITIALIZE(VertexDescriptionInputs, output);
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.ObjectSpaceNormal =                          input.normalOS;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.ObjectSpaceTangent =                         input.tangentOS.xyz;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.ObjectSpacePosition =                        input.positionOS;
        #endif
        
        #if UNITY_ANY_INSTANCING_ENABLED
        #else // TODO: XR support for procedural instancing because in this case UNITY_ANY_INSTANCING_ENABLED is not defined and instanceID is incorrect.
        #endif
        
            return output;
        }
        SurfaceDescriptionInputs BuildSurfaceDescriptionInputs(Varyings input)
        {
            SurfaceDescriptionInputs output;
            ZERO_INITIALIZE(SurfaceDescriptionInputs, output);
        
        #ifdef HAVE_VFX_MODIFICATION
        #if VFX_USE_GRAPH_VALUES
            uint instanceActiveIndex = asuint(UNITY_ACCESS_INSTANCED_PROP(PerInstance, _InstanceActiveIndex));
            /* WARNING: $splice Could not find named fragment 'VFXLoadGraphValues' */
        #endif
            /* WARNING: $splice Could not find named fragment 'VFXSetFragInputs' */
        
        #endif
        
            
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        // must use interpolated tangent, bitangent and normal before they are normalized in the pixel shader.
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        float3 unnormalizedNormalWS = input.normalWS;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        const float renormFactor = 1.0 / length(unnormalizedNormalWS);
        #endif
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        // use bitangent on the fly like in hdrp
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        // IMPORTANT! If we ever support Flip on double sided materials ensure bitangent and tangent are NOT flipped.
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        float crossSign = (input.tangentWS.w > 0.0 ? 1.0 : -1.0)* GetOddNegativeScale();
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        float3 bitang = crossSign * cross(input.normalWS.xyz, input.tangentWS.xyz);
        #endif
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.WorldSpaceNormal = renormFactor * input.normalWS.xyz;      // we want a unit length Normal Vector node in shader graph
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.TangentSpaceNormal = float3(0.0f, 0.0f, 1.0f);
        #endif
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        // to pr               eserve mikktspace compliance we use same scale renormFactor as was used on the normal.
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        // This                is explained in section 2.2 in "surface gradient based bump mapping framework"
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.WorldSpaceTangent = renormFactor * input.tangentWS.xyz;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.WorldSpaceBiTangent = renormFactor * bitang;
        #endif
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.WorldSpacePosition = input.positionWS;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.AbsoluteWorldSpacePosition = GetAbsolutePositionWS(input.positionWS);
        #endif
        
        
            #if UNITY_UV_STARTS_AT_TOP
            #else
            #endif
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.uv0 = input.texCoord0;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.uv2 = input.texCoord2;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.VertexColor = input.color;
        #endif
        
        #if UNITY_ANY_INSTANCING_ENABLED
        #else // TODO: XR support for procedural instancing because in this case UNITY_ANY_INSTANCING_ENABLED is not defined and instanceID is incorrect.
        #endif
        #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN output.FaceSign =                    IS_FRONT_VFACE(input.cullFace, true, false);
        #else
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        #endif
        #undef BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        
                return output;
        }
        
        // --------------------------------------------------
        // Main
        
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/DepthNormalsOnlyPass.hlsl"
        
        // --------------------------------------------------
        // Visual Effect Vertex Invocations
        #ifdef HAVE_VFX_MODIFICATION
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
        #endif
        
        ENDHLSL
        }
        Pass
        {
            Name "Meta"
            Tags
            {
                "LightMode" = "Meta"
            }
        
        // Render State
        Cull Off
        
        // Debug
        // <None>
        
        // --------------------------------------------------
        // Pass
        
        HLSLPROGRAM
        
        // Pragmas
        #pragma target 2.0
        #pragma vertex vert
        #pragma fragment frag
        
        // Keywords
        #pragma shader_feature _ EDITOR_VISUALIZATION
        #pragma shader_feature_local_fragment _ _ALPHATEST_ON
        #pragma shader_feature_local _ _USEDYNAMICCOVERTSTATICMASKF_ON
        
        #if defined(_USEDYNAMICCOVERTSTATICMASKF_ON)
            #define KEYWORD_PERMUTATION_0
        #else
            #define KEYWORD_PERMUTATION_1
        #endif
        
        
        // Defines
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define _NORMALMAP 1
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define _NORMAL_DROPOFF_TS 1
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_NORMAL
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_TANGENT
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_TEXCOORD0
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_TEXCOORD1
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_TEXCOORD2
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_COLOR
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_INSTANCEID
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define FEATURES_GRAPH_VERTEX_NORMAL_OUTPUT
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define FEATURES_GRAPH_VERTEX_TANGENT_OUTPUT
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_POSITION_WS
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_NORMAL_WS
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_TANGENT_WS
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_TEXCOORD0
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_TEXCOORD1
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_TEXCOORD2
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_COLOR
        #endif
        
        #define FEATURES_GRAPH_VERTEX
        /* WARNING: $splice Could not find named fragment 'PassInstancing' */
        #define SHADERPASS SHADERPASS_META
        #define _FOG_FRAGMENT 1
        
        
        // custom interpolator pre-include
        /* WARNING: $splice Could not find named fragment 'sgci_CustomInterpolatorPreInclude' */
        
        // Includes
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
        #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/MetaInput.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
        
        // --------------------------------------------------
        // Structs and Packing
        
        // custom interpolators pre packing
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPrePacking' */
        
        struct Attributes
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 positionOS : POSITION;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 normalOS : NORMAL;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 tangentOS : TANGENT;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv0 : TEXCOORD0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv1 : TEXCOORD1;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv2 : TEXCOORD2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 color : COLOR;
            #endif
            #if UNITY_ANY_INSTANCING_ENABLED || defined(ATTRIBUTES_NEED_INSTANCEID)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint instanceID : INSTANCEID_SEMANTIC;
            #endif
            #endif
        };
        struct Varyings
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 positionCS : SV_POSITION;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 positionWS;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 normalWS;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 tangentWS;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord1;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 color;
            #endif
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
            #endif
        };
        struct SurfaceDescriptionInputs
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 WorldSpaceNormal;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 WorldSpaceTangent;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 WorldSpaceBiTangent;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 WorldSpacePosition;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 AbsoluteWorldSpacePosition;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 VertexColor;
            #endif
        };
        struct VertexDescriptionInputs
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 ObjectSpaceNormal;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 ObjectSpaceTangent;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 ObjectSpacePosition;
            #endif
        };
        struct PackedVaryings
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 positionCS : SV_POSITION;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 tangentWS : INTERP0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord0 : INTERP1;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord1 : INTERP2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord2 : INTERP3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 color : INTERP4;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 positionWS : INTERP5;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 normalWS : INTERP6;
            #endif
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
            #endif
        };
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        PackedVaryings PackVaryings (Varyings input)
        {
            PackedVaryings output;
            ZERO_INITIALIZE(PackedVaryings, output);
            output.positionCS = input.positionCS;
            output.tangentWS.xyzw = input.tangentWS;
            output.texCoord0.xyzw = input.texCoord0;
            output.texCoord1.xyzw = input.texCoord1;
            output.texCoord2.xyzw = input.texCoord2;
            output.color.xyzw = input.color;
            output.positionWS.xyz = input.positionWS;
            output.normalWS.xyz = input.normalWS;
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        
        Varyings UnpackVaryings (PackedVaryings input)
        {
            Varyings output;
            output.positionCS = input.positionCS;
            output.tangentWS = input.tangentWS.xyzw;
            output.texCoord0 = input.texCoord0.xyzw;
            output.texCoord1 = input.texCoord1.xyzw;
            output.texCoord2 = input.texCoord2.xyzw;
            output.color = input.color.xyzw;
            output.positionWS = input.positionWS.xyz;
            output.normalWS = input.normalWS.xyz;
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        #endif
        
        // --------------------------------------------------
        // Graph
        
        // Graph Properties
        CBUFFER_START(UnityPerMaterial)
        float _AlphaCutoff;
        float4 _BaseColor;
        float4 _BaseColorMap_TexelSize;
        float _BaseUsePlanarUV;
        float4 _BaseTilingOffset;
        float4 _BaseNormalMap_TexelSize;
        float _BaseNormalScale;
        float4 _BaseMaskMap_TexelSize;
        float _BaseMetallic;
        float _BaseAORemapMin;
        float _BaseAORemapMax;
        float _BaseSmoothnessRemapMin;
        float _BaseSmoothnessRemapMax;
        float4 _CoverMaskA_TexelSize;
        float _CoverMaskPower;
        float _Cover_Amount;
        float _Cover_Amount_Grow_Speed;
        float3 _CoverDirection;
        float _Cover_Max_Angle;
        float _Cover_Min_Height;
        float _Cover_Min_Height_Blending;
        float4 _CoverBaseColor;
        float4 _CoverBaseColorMap_TexelSize;
        float4 _CoverTilingOffset;
        float _CoverTriplanarThreshold;
        float4 _CoverNormalMap_TexelSize;
        float _CoverNormalScale;
        float _CoverNormalBlendHardness;
        float _CoverHardness;
        float _CoverHeightMapMin;
        float _CoverHeightMapMax;
        float _CoverHeightMapOffset;
        float4 _CoverMaskMap_TexelSize;
        float _CoverMetallic;
        float _CoverAORemapMin;
        float _CoverAORemapMax;
        float _CoverSmoothnessRemapMin;
        float _CoverSmoothnessRemapMax;
        float4 _DetailMap_TexelSize;
        float4 _DetailTilingOffset;
        float _DetailAlbedoScale;
        float _DetailNormalScale;
        float _DetailSmoothnessScale;
        float4 _WetColor;
        float _WetSmoothness;
        UNITY_TEXTURE_STREAMING_DEBUG_VARS;
        CBUFFER_END
        
        
        // Object and Global properties
        SAMPLER(SamplerState_Linear_Repeat);
        SAMPLER(SamplerState_Linear_Repeat_Aniso8);
        TEXTURE2D(_BaseColorMap);
        SAMPLER(sampler_BaseColorMap);
        TEXTURE2D(_BaseNormalMap);
        SAMPLER(sampler_BaseNormalMap);
        TEXTURE2D(_BaseMaskMap);
        SAMPLER(sampler_BaseMaskMap);
        TEXTURE2D(_CoverMaskA);
        SAMPLER(sampler_CoverMaskA);
        TEXTURE2D(_CoverBaseColorMap);
        SAMPLER(sampler_CoverBaseColorMap);
        TEXTURE2D(_CoverNormalMap);
        SAMPLER(sampler_CoverNormalMap);
        TEXTURE2D(_CoverMaskMap);
        SAMPLER(sampler_CoverMaskMap);
        TEXTURE2D(_DetailMap);
        SAMPLER(sampler_DetailMap);
        
        // Graph Includes
        // GraphIncludes: <None>
        
        // -- Property used by ScenePickingPass
        #ifdef SCENEPICKINGPASS
        float4 _SelectionID;
        #endif
        
        // -- Properties used by SceneSelectionPass
        #ifdef SCENESELECTIONPASS
        int _ObjectId;
        int _PassValue;
        #endif
        
        // Graph Functions
        
        void Unity_Combine_float(float R, float G, float B, float A, out float4 RGBA, out float3 RGB, out float2 RG)
        {
            RGBA = float4(R, G, B, A);
            RGB = float3(R, G, B);
            RG = float2(R, G);
        }
        
        void Unity_Divide_float(float A, float B, out float Out)
        {
            Out = A / B;
        }
        
        void Unity_Multiply_float4_float4(float4 A, float4 B, out float4 Out)
        {
        Out = A * B;
        }
        
        void Unity_Branch_float4(float Predicate, float4 True, float4 False, out float4 Out)
        {
            Out = Predicate ? True : False;
        }
        
        void Unity_TilingAndOffset_float(float2 UV, float2 Tiling, float2 Offset, out float2 Out)
        {
            Out = UV * Tiling + Offset;
        }
        
        void Unity_Branch_float2(float Predicate, float2 True, float2 False, out float2 Out)
        {
            Out = Predicate ? True : False;
        }
        
        struct Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float
        {
        float3 AbsoluteWorldSpacePosition;
        half4 uv0;
        half4 uv2;
        };
        
        void SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(UnityTexture2D Texture2D_80A3D28F, float4 Vector4_2EBA7A3B, float Boolean_7ABB9909, UnitySamplerState _SamplerState, float Boolean_5ddfe6daabcc4715a44b5f34fc19becb, Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float IN, out float4 XZ_2)
        {
        UnityTexture2D _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D = Texture2D_80A3D28F;
        float _Property_30834f691775a0898a45b1c868520436_Out_0_Boolean = Boolean_7ABB9909;
        float _Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
        float _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
        float _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
        float _Split_89ed63cb625cb3878c183d0b71c03400_A_4_Float = 0;
        float4 _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4;
        float3 _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3;
        float2 _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, float(0), float(0), _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3, _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2);
        float4 _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4 = Vector4_2EBA7A3B;
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_R_1_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[0];
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_G_2_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[1];
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_B_3_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[2];
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_A_4_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[3];
        float _Divide_e64179199923c58289b6aa94ea6c9178_Out_2_Float;
        Unity_Divide_float(float(1), _Split_2f0f52f6ef8c0e81af0da6476402bc1f_R_1_Float, _Divide_e64179199923c58289b6aa94ea6c9178_Out_2_Float);
        float4 _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, (_Divide_e64179199923c58289b6aa94ea6c9178_Out_2_Float.xxxx), _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4);
        float _Property_f17c7bf877e64b6abdd66b1fe9f5accc_Out_0_Boolean = Boolean_5ddfe6daabcc4715a44b5f34fc19becb;
        float4 _UV_029e8e8198564838b9389b902a09fb22_Out_0_Vector4 = IN.uv0;
        float4 _UV_7a6209af1506424fb75c81e87e42035a_Out_0_Vector4 = IN.uv2;
        float4 _Branch_fc37bb4bf641457cbbc6e290603056ff_Out_3_Vector4;
        Unity_Branch_float4(_Property_f17c7bf877e64b6abdd66b1fe9f5accc_Out_0_Boolean, _UV_029e8e8198564838b9389b902a09fb22_Out_0_Vector4, _UV_7a6209af1506424fb75c81e87e42035a_Out_0_Vector4, _Branch_fc37bb4bf641457cbbc6e290603056ff_Out_3_Vector4);
        float2 _Vector2_16c15d3bbdd14b85bd48e3a6cb318af7_Out_0_Vector2 = float2(_Split_2f0f52f6ef8c0e81af0da6476402bc1f_R_1_Float, _Split_2f0f52f6ef8c0e81af0da6476402bc1f_G_2_Float);
        float2 _Vector2_f8d75f54e7705083bbec539a60185577_Out_0_Vector2 = float2(_Split_2f0f52f6ef8c0e81af0da6476402bc1f_B_3_Float, _Split_2f0f52f6ef8c0e81af0da6476402bc1f_A_4_Float);
        float2 _TilingAndOffset_d91e2d25acd34686b562b7fe7e9d1d27_Out_3_Vector2;
        Unity_TilingAndOffset_float((_Branch_fc37bb4bf641457cbbc6e290603056ff_Out_3_Vector4.xy), _Vector2_16c15d3bbdd14b85bd48e3a6cb318af7_Out_0_Vector2, _Vector2_f8d75f54e7705083bbec539a60185577_Out_0_Vector2, _TilingAndOffset_d91e2d25acd34686b562b7fe7e9d1d27_Out_3_Vector2);
        float2 _Branch_8e5a4e8f4d52fc8aadd1f46485afc933_Out_3_Vector2;
        Unity_Branch_float2(_Property_30834f691775a0898a45b1c868520436_Out_0_Boolean, (_Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4.xy), _TilingAndOffset_d91e2d25acd34686b562b7fe7e9d1d27_Out_3_Vector2, _Branch_8e5a4e8f4d52fc8aadd1f46485afc933_Out_3_Vector2);
        UnitySamplerState _Property_e8746b9475c94530ba35ba8019ad2ae0_Out_0_SamplerState = _SamplerState;
        float4 _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, _Property_e8746b9475c94530ba35ba8019ad2ae0_Out_0_SamplerState.samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Branch_8e5a4e8f4d52fc8aadd1f46485afc933_Out_3_Vector2) );
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.r;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.g;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.b;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_A_7_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.a;
        XZ_2 = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4;
        }
        
        void Unity_Multiply_float_float(float A, float B, out float Out)
        {
            Out = A * B;
        }
        
        void Unity_Add_float(float A, float B, out float Out)
        {
            Out = A + B;
        }
        
        void Unity_Saturate_float(float In, out float Out)
        {
            Out = saturate(In);
        }
        
        void Unity_Absolute_float(float In, out float Out)
        {
            Out = abs(In);
        }
        
        void Unity_SquareRoot_float4(float4 In, out float4 Out)
        {
            Out = sqrt(In);
        }
        
        void Unity_Sign_float(float In, out float Out)
        {
            Out = sign(In);
        }
        
        void Unity_Ceiling_float(float In, out float Out)
        {
            Out = ceil(In);
        }
        
        void Unity_Lerp_float4(float4 A, float4 B, float4 T, out float4 Out)
        {
            Out = lerp(A, B, T);
        }
        
        struct Bindings_BlendOverlayBaseColor_acdb3dfca72bd6b42bbc35f4613331a2_float
        {
        };
        
        void SG_BlendOverlayBaseColor_acdb3dfca72bd6b42bbc35f4613331a2_float(float4 Color_9AA111D3, float Vector1_FBE622A2, float Vector1_8C15C351, Bindings_BlendOverlayBaseColor_acdb3dfca72bd6b42bbc35f4613331a2_float IN, out float3 OutVector4_1)
        {
        float4 _Property_012510d774fb7f8b860f5270dca4500f_Out_0_Vector4 = Color_9AA111D3;
        float4 _SquareRoot_c2c57d0223a9538aa9240890c3cacb0c_Out_1_Vector4;
        Unity_SquareRoot_float4(_Property_012510d774fb7f8b860f5270dca4500f_Out_0_Vector4, _SquareRoot_c2c57d0223a9538aa9240890c3cacb0c_Out_1_Vector4);
        float _Property_a00e29241d12f983b30177515b367ec9_Out_0_Float = Vector1_FBE622A2;
        float _Sign_343a45ede7349283a681c6bd9998fd8e_Out_1_Float;
        Unity_Sign_float(_Property_a00e29241d12f983b30177515b367ec9_Out_0_Float, _Sign_343a45ede7349283a681c6bd9998fd8e_Out_1_Float);
        float _Add_681019b8f5d3d68bb482d419c9fc61a9_Out_2_Float;
        Unity_Add_float(_Sign_343a45ede7349283a681c6bd9998fd8e_Out_1_Float, float(1), _Add_681019b8f5d3d68bb482d419c9fc61a9_Out_2_Float);
        float _Multiply_e8f4cb722712a880ac0db6c7461427f7_Out_2_Float;
        Unity_Multiply_float_float(_Add_681019b8f5d3d68bb482d419c9fc61a9_Out_2_Float, 0.5, _Multiply_e8f4cb722712a880ac0db6c7461427f7_Out_2_Float);
        float _Ceiling_95ad15988aa9b98184875fa754feae01_Out_1_Float;
        Unity_Ceiling_float(_Multiply_e8f4cb722712a880ac0db6c7461427f7_Out_2_Float, _Ceiling_95ad15988aa9b98184875fa754feae01_Out_1_Float);
        float _Property_2db1c747a05ee284a8b00076062f91a4_Out_0_Float = Vector1_8C15C351;
        float _Multiply_9564ecda5193bc8286d9ff771c9226cd_Out_2_Float;
        Unity_Multiply_float_float(_Property_2db1c747a05ee284a8b00076062f91a4_Out_0_Float, _Property_2db1c747a05ee284a8b00076062f91a4_Out_0_Float, _Multiply_9564ecda5193bc8286d9ff771c9226cd_Out_2_Float);
        float4 _Lerp_b3cdb01fc3c5b988ac9b184943bf7c01_Out_3_Vector4;
        Unity_Lerp_float4(_SquareRoot_c2c57d0223a9538aa9240890c3cacb0c_Out_1_Vector4, (_Ceiling_95ad15988aa9b98184875fa754feae01_Out_1_Float.xxxx), (_Multiply_9564ecda5193bc8286d9ff771c9226cd_Out_2_Float.xxxx), _Lerp_b3cdb01fc3c5b988ac9b184943bf7c01_Out_3_Vector4);
        float4 _Multiply_39d1daff98488f8ea2cd794ad4f20926_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Lerp_b3cdb01fc3c5b988ac9b184943bf7c01_Out_3_Vector4, _Lerp_b3cdb01fc3c5b988ac9b184943bf7c01_Out_3_Vector4, _Multiply_39d1daff98488f8ea2cd794ad4f20926_Out_2_Vector4);
        OutVector4_1 = (_Multiply_39d1daff98488f8ea2cd794ad4f20926_Out_2_Vector4.xyz);
        }
        
        void Unity_Divide_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A / B;
        }
        
        void Unity_Sign_float3(float3 In, out float3 Out)
        {
            Out = sign(In);
        }
        
        void Unity_Multiply_float2_float2(float2 A, float2 B, out float2 Out)
        {
        Out = A * B;
        }
        
        void Unity_Absolute_float3(float3 In, out float3 Out)
        {
            Out = abs(In);
        }
        
        void Unity_Power_float3(float3 A, float3 B, out float3 Out)
        {
            Out = pow(A, B);
        }
        
        void Unity_Multiply_float3_float3(float3 A, float3 B, out float3 Out)
        {
        Out = A * B;
        }
        
        void Unity_Add_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A + B;
        }
        
        struct Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float
        {
        float3 WorldSpaceNormal;
        float3 AbsoluteWorldSpacePosition;
        };
        
        void SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(UnityTexture2D Texture2D_80A3D28F, float Vector1_41461AC9, float Vector1_E4D1C13A, Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float IN, out float4 XYZ_1, out float4 XZ_2, out float4 YZ_3, out float4 XY_4)
        {
        UnityTexture2D _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D = Texture2D_80A3D28F;
        float _Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
        float _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
        float _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
        float _Split_89ed63cb625cb3878c183d0b71c03400_A_4_Float = 0;
        float4 _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4;
        float3 _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3;
        float2 _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, float(0), float(0), _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3, _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2);
        float _Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float = Vector1_41461AC9;
        float4 _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, (_Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float.xxxx), _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4);
        float3 _Sign_b826e0ff2d95ec8cb2b2cbbd7ea2eab6_Out_1_Vector3;
        Unity_Sign_float3(IN.WorldSpaceNormal, _Sign_b826e0ff2d95ec8cb2b2cbbd7ea2eab6_Out_1_Vector3);
        float _Split_742547a7039de986a646d04c157ae549_R_1_Float = _Sign_b826e0ff2d95ec8cb2b2cbbd7ea2eab6_Out_1_Vector3[0];
        float _Split_742547a7039de986a646d04c157ae549_G_2_Float = _Sign_b826e0ff2d95ec8cb2b2cbbd7ea2eab6_Out_1_Vector3[1];
        float _Split_742547a7039de986a646d04c157ae549_B_3_Float = _Sign_b826e0ff2d95ec8cb2b2cbbd7ea2eab6_Out_1_Vector3[2];
        float _Split_742547a7039de986a646d04c157ae549_A_4_Float = 0;
        float2 _Vector2_40a8919e571ec18499de72022c155b38_Out_0_Vector2 = float2(_Split_742547a7039de986a646d04c157ae549_G_2_Float, float(1));
        float2 _Multiply_5fa32af59cdca88389832336b2268bd5_Out_2_Vector2;
        Unity_Multiply_float2_float2((_Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4.xy), _Vector2_40a8919e571ec18499de72022c155b38_Out_0_Vector2, _Multiply_5fa32af59cdca88389832336b2268bd5_Out_2_Vector2);
        float4 _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Multiply_5fa32af59cdca88389832336b2268bd5_Out_2_Vector2) );
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.r;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.g;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.b;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_A_7_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.a;
        float3 _Absolute_644b798714827680b39bf5d34f70385f_Out_1_Vector3;
        Unity_Absolute_float3(IN.WorldSpaceNormal, _Absolute_644b798714827680b39bf5d34f70385f_Out_1_Vector3);
        float _Property_adc4c59482221c8aad681c6558728ac9_Out_0_Float = Vector1_E4D1C13A;
        float3 _Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3;
        Unity_Power_float3(_Absolute_644b798714827680b39bf5d34f70385f_Out_1_Vector3, (_Property_adc4c59482221c8aad681c6558728ac9_Out_0_Float.xxx), _Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3);
        float3 _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3, _Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3, _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3);
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_R_1_Float = _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3[0];
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_G_2_Float = _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3[1];
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_B_3_Float = _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3[2];
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_A_4_Float = 0;
        float4 _Multiply_2e1040ca9c98d085ace76ee93f094039_Out_2_Vector4;
        Unity_Multiply_float4_float4(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4, (_Split_ae83014fcbd9f7879a0b91fa66dc9718_G_2_Float.xxxx), _Multiply_2e1040ca9c98d085ace76ee93f094039_Out_2_Vector4);
        float4 _Combine_192c2c4a69be588b90ca005a32e22552_RGBA_4_Vector4;
        float3 _Combine_192c2c4a69be588b90ca005a32e22552_RGB_5_Vector3;
        float2 _Combine_192c2c4a69be588b90ca005a32e22552_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float, float(0), float(0), _Combine_192c2c4a69be588b90ca005a32e22552_RGBA_4_Vector4, _Combine_192c2c4a69be588b90ca005a32e22552_RGB_5_Vector3, _Combine_192c2c4a69be588b90ca005a32e22552_RG_6_Vector2);
        float4 _Multiply_138240d0d4846e87b0febabec0d6891b_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_192c2c4a69be588b90ca005a32e22552_RGBA_4_Vector4, (_Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float.xxxx), _Multiply_138240d0d4846e87b0febabec0d6891b_Out_2_Vector4);
        float _Multiply_014402ded5a3988a8c18ba07636ea5a7_Out_2_Float;
        Unity_Multiply_float_float(_Split_742547a7039de986a646d04c157ae549_B_3_Float, -1, _Multiply_014402ded5a3988a8c18ba07636ea5a7_Out_2_Float);
        float2 _Vector2_caa25d55d456a58982bdfc39b1b43f3f_Out_0_Vector2 = float2(_Multiply_014402ded5a3988a8c18ba07636ea5a7_Out_2_Float, float(1));
        float2 _Multiply_a67201b6e1a0a28c98cd9d06e8b09543_Out_2_Vector2;
        Unity_Multiply_float2_float2((_Multiply_138240d0d4846e87b0febabec0d6891b_Out_2_Vector4.xy), _Vector2_caa25d55d456a58982bdfc39b1b43f3f_Out_0_Vector2, _Multiply_a67201b6e1a0a28c98cd9d06e8b09543_Out_2_Vector2);
        float4 _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Multiply_a67201b6e1a0a28c98cd9d06e8b09543_Out_2_Vector2) );
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_R_4_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.r;
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_G_5_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.g;
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_B_6_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.b;
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_A_7_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.a;
        float4 _Multiply_7bb4009c92b108849ac6ca92bc1442f2_Out_2_Vector4;
        Unity_Multiply_float4_float4(_SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4, (_Split_ae83014fcbd9f7879a0b91fa66dc9718_B_3_Float.xxxx), _Multiply_7bb4009c92b108849ac6ca92bc1442f2_Out_2_Vector4);
        float4 _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGBA_4_Vector4;
        float3 _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGB_5_Vector3;
        float2 _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float, float(0), float(0), _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGBA_4_Vector4, _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGB_5_Vector3, _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RG_6_Vector2);
        float4 _Multiply_2c0864423b014f8b8af8523f68cbb63c_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGBA_4_Vector4, (_Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float.xxxx), _Multiply_2c0864423b014f8b8af8523f68cbb63c_Out_2_Vector4);
        float2 _Vector2_54dfd40df2fc78809955dd272f2cf0c3_Out_0_Vector2 = float2(_Split_742547a7039de986a646d04c157ae549_R_1_Float, float(1));
        float2 _Multiply_addbd5fcede95f80bbb806c94e49ef63_Out_2_Vector2;
        Unity_Multiply_float2_float2((_Multiply_2c0864423b014f8b8af8523f68cbb63c_Out_2_Vector4.xy), _Vector2_54dfd40df2fc78809955dd272f2cf0c3_Out_0_Vector2, _Multiply_addbd5fcede95f80bbb806c94e49ef63_Out_2_Vector2);
        float4 _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Multiply_addbd5fcede95f80bbb806c94e49ef63_Out_2_Vector2) );
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_R_4_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.r;
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_G_5_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.g;
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_B_6_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.b;
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_A_7_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.a;
        float4 _Multiply_77818c22e359fc8cbb7dd20216a8db72_Out_2_Vector4;
        Unity_Multiply_float4_float4(_SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4, (_Split_ae83014fcbd9f7879a0b91fa66dc9718_R_1_Float.xxxx), _Multiply_77818c22e359fc8cbb7dd20216a8db72_Out_2_Vector4);
        float4 _Add_769d9ee909c9238dbbf72d2800a2f268_Out_2_Vector4;
        Unity_Add_float4(_Multiply_7bb4009c92b108849ac6ca92bc1442f2_Out_2_Vector4, _Multiply_77818c22e359fc8cbb7dd20216a8db72_Out_2_Vector4, _Add_769d9ee909c9238dbbf72d2800a2f268_Out_2_Vector4);
        float4 _Add_14295f72880e4b87a1baf1ced943ac40_Out_2_Vector4;
        Unity_Add_float4(_Multiply_2e1040ca9c98d085ace76ee93f094039_Out_2_Vector4, _Add_769d9ee909c9238dbbf72d2800a2f268_Out_2_Vector4, _Add_14295f72880e4b87a1baf1ced943ac40_Out_2_Vector4);
        float _Add_e59af300bba2498db32eac1412123447_Out_2_Float;
        Unity_Add_float(_Split_ae83014fcbd9f7879a0b91fa66dc9718_R_1_Float, _Split_ae83014fcbd9f7879a0b91fa66dc9718_G_2_Float, _Add_e59af300bba2498db32eac1412123447_Out_2_Float);
        float _Add_e855069f047fae8ea9027d56acb61e56_Out_2_Float;
        Unity_Add_float(_Add_e59af300bba2498db32eac1412123447_Out_2_Float, _Split_ae83014fcbd9f7879a0b91fa66dc9718_B_3_Float, _Add_e855069f047fae8ea9027d56acb61e56_Out_2_Float);
        float4 _Divide_91ae4b94f1d9b78e99d0472293b8098c_Out_2_Vector4;
        Unity_Divide_float4(_Add_14295f72880e4b87a1baf1ced943ac40_Out_2_Vector4, (_Add_e855069f047fae8ea9027d56acb61e56_Out_2_Float.xxxx), _Divide_91ae4b94f1d9b78e99d0472293b8098c_Out_2_Vector4);
        XYZ_1 = _Divide_91ae4b94f1d9b78e99d0472293b8098c_Out_2_Vector4;
        XZ_2 = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4;
        YZ_3 = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4;
        XY_4 = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4;
        }
        
        void Unity_Clamp_float(float In, float Min, float Max, out float Out)
        {
            Out = clamp(In, Min, Max);
        }
        
        void Unity_Add_float2(float2 A, float2 B, out float2 Out)
        {
            Out = A + B;
        }
        
        void Unity_DotProduct_float2(float2 A, float2 B, out float Out)
        {
            Out = dot(A, B);
        }
        
        void Unity_OneMinus_float(float In, out float Out)
        {
            Out = 1 - In;
        }
        
        void Unity_SquareRoot_float(float In, out float Out)
        {
            Out = sqrt(In);
        }
        
        void Unity_Clamp_float3(float3 In, float3 Min, float3 Max, out float3 Out)
        {
            Out = clamp(In, Min, Max);
        }
        
        void Unity_Normalize_float3(float3 In, out float3 Out)
        {
            Out = normalize(In);
        }
        
        void Unity_Branch_float3(float Predicate, float3 True, float3 False, out float3 Out)
        {
            Out = Predicate ? True : False;
        }
        
        struct Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float
        {
        float3 WorldSpaceNormal;
        float3 WorldSpaceTangent;
        float3 WorldSpaceBiTangent;
        float3 AbsoluteWorldSpacePosition;
        half4 uv0;
        half4 uv2;
        };
        
        void SG_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float(UnityTexture2D Texture2D_80A3D28F, float4 Vector4_82674548, float Boolean_9FF42DF6, UnitySamplerState _SamplerState, float Boolean_5ddfe6daabcc4715a44b5f34fc19becb, Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float IN, out float4 XZ_2)
        {
        float _Property_1ef12cf3201a938993fe6a7951b0e754_Out_0_Boolean = Boolean_9FF42DF6;
        UnityTexture2D _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D = Texture2D_80A3D28F;
        float _Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
        float _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
        float _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
        float _Split_89ed63cb625cb3878c183d0b71c03400_A_4_Float = 0;
        float4 _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4;
        float3 _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3;
        float2 _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, float(0), float(0), _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3, _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2);
        float4 _Property_3fa1d6f912feb481ba60f2e55e62e746_Out_0_Vector4 = Vector4_82674548;
        float _Split_a2e12fa5931da084b2949343a539dfd8_R_1_Float = _Property_3fa1d6f912feb481ba60f2e55e62e746_Out_0_Vector4[0];
        float _Split_a2e12fa5931da084b2949343a539dfd8_G_2_Float = _Property_3fa1d6f912feb481ba60f2e55e62e746_Out_0_Vector4[1];
        float _Split_a2e12fa5931da084b2949343a539dfd8_B_3_Float = _Property_3fa1d6f912feb481ba60f2e55e62e746_Out_0_Vector4[2];
        float _Split_a2e12fa5931da084b2949343a539dfd8_A_4_Float = _Property_3fa1d6f912feb481ba60f2e55e62e746_Out_0_Vector4[3];
        float _Divide_c36b770dfaa0bb8f85ab27da5fd794f0_Out_2_Float;
        Unity_Divide_float(float(1), _Split_a2e12fa5931da084b2949343a539dfd8_R_1_Float, _Divide_c36b770dfaa0bb8f85ab27da5fd794f0_Out_2_Float);
        float4 _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, (_Divide_c36b770dfaa0bb8f85ab27da5fd794f0_Out_2_Float.xxxx), _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4);
        float _Property_058f4fba88c3437288219f1929444bf2_Out_0_Boolean = Boolean_5ddfe6daabcc4715a44b5f34fc19becb;
        float4 _UV_43d85b3291324c848dfbeec6adac2a71_Out_0_Vector4 = IN.uv0;
        float4 _UV_36881dcaab9040168fc5215dcd00f352_Out_0_Vector4 = IN.uv2;
        float4 _Branch_8054d58a73be4ce1b22d48a84389ae07_Out_3_Vector4;
        Unity_Branch_float4(_Property_058f4fba88c3437288219f1929444bf2_Out_0_Boolean, _UV_43d85b3291324c848dfbeec6adac2a71_Out_0_Vector4, _UV_36881dcaab9040168fc5215dcd00f352_Out_0_Vector4, _Branch_8054d58a73be4ce1b22d48a84389ae07_Out_3_Vector4);
        float2 _Vector2_6845d21872714d889783b0cb707df3e9_Out_0_Vector2 = float2(_Split_a2e12fa5931da084b2949343a539dfd8_R_1_Float, _Split_a2e12fa5931da084b2949343a539dfd8_G_2_Float);
        float2 _Vector2_e2e2263627c6098e96a5b5d29350ad03_Out_0_Vector2 = float2(_Split_a2e12fa5931da084b2949343a539dfd8_B_3_Float, _Split_a2e12fa5931da084b2949343a539dfd8_A_4_Float);
        float2 _TilingAndOffset_17582d056c0b8a8dab1017d37497fe59_Out_3_Vector2;
        Unity_TilingAndOffset_float((_Branch_8054d58a73be4ce1b22d48a84389ae07_Out_3_Vector4.xy), _Vector2_6845d21872714d889783b0cb707df3e9_Out_0_Vector2, _Vector2_e2e2263627c6098e96a5b5d29350ad03_Out_0_Vector2, _TilingAndOffset_17582d056c0b8a8dab1017d37497fe59_Out_3_Vector2);
        float2 _Branch_1e152f3aac57448f8518bf2852c000c3_Out_3_Vector2;
        Unity_Branch_float2(_Property_1ef12cf3201a938993fe6a7951b0e754_Out_0_Boolean, (_Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4.xy), _TilingAndOffset_17582d056c0b8a8dab1017d37497fe59_Out_3_Vector2, _Branch_1e152f3aac57448f8518bf2852c000c3_Out_3_Vector2);
        UnitySamplerState _Property_69f1ed7efd1b494e91f626b88ab2363c_Out_0_SamplerState = _SamplerState;
        float4 _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, _Property_69f1ed7efd1b494e91f626b88ab2363c_Out_0_SamplerState.samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Branch_1e152f3aac57448f8518bf2852c000c3_Out_3_Vector2) );
        _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4);
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.r;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.g;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.b;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_A_7_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.a;
        float2 _Vector2_ad6bd100e273d78fa409a30a77bfa2cc_Out_0_Vector2 = float2(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float, _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float);
        float3 _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3;
        Unity_Sign_float3(IN.WorldSpaceNormal, _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3);
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_R_1_Float = _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3[0];
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_G_2_Float = _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3[1];
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_B_3_Float = _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3[2];
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_A_4_Float = 0;
        float2 _Vector2_b76cb1842101e58b9e636d49b075c612_Out_0_Vector2 = float2(_Split_6299d4ddcc4c74828aea40a46fdb896e_G_2_Float, float(1));
        float2 _Multiply_31e8db88ee20c985a9850d1a58f3282b_Out_2_Vector2;
        Unity_Multiply_float2_float2(_Vector2_ad6bd100e273d78fa409a30a77bfa2cc_Out_0_Vector2, _Vector2_b76cb1842101e58b9e636d49b075c612_Out_0_Vector2, _Multiply_31e8db88ee20c985a9850d1a58f3282b_Out_2_Vector2);
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_R_1_Float = IN.WorldSpaceNormal[0];
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_G_2_Float = IN.WorldSpaceNormal[1];
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_B_3_Float = IN.WorldSpaceNormal[2];
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_A_4_Float = 0;
        float2 _Vector2_70e5837843f28b8b9d64cada3697bd5a_Out_0_Vector2 = float2(_Split_5ed44bf2eca0868f81eb18100f49d1fa_R_1_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_B_3_Float);
        float2 _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2;
        Unity_Add_float2(_Multiply_31e8db88ee20c985a9850d1a58f3282b_Out_2_Vector2, _Vector2_70e5837843f28b8b9d64cada3697bd5a_Out_0_Vector2, _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2);
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_R_1_Float = _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2[0];
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_G_2_Float = _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2[1];
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_B_3_Float = 0;
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_A_4_Float = 0;
        float _Multiply_ab12aea87465a78eaf7fc66c2598d266_Out_2_Float;
        Unity_Multiply_float_float(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_G_2_Float, _Multiply_ab12aea87465a78eaf7fc66c2598d266_Out_2_Float);
        float3 _Vector3_433840b555db308b97e9b14b6a957195_Out_0_Vector3 = float3(_Split_2bc77ca2d17bd78cb2383770ce50b179_R_1_Float, _Multiply_ab12aea87465a78eaf7fc66c2598d266_Out_2_Float, _Split_2bc77ca2d17bd78cb2383770ce50b179_G_2_Float);
        float3 _Transform_c7914cc45a011c89b3f53c55afb51673_Out_1_Vector3;
        {
        float3x3 tangentTransform = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
        _Transform_c7914cc45a011c89b3f53c55afb51673_Out_1_Vector3 = TransformWorldToTangentDir(_Vector3_433840b555db308b97e9b14b6a957195_Out_0_Vector3.xyz, tangentTransform, true);
        }
        float3 _Clamp_3837949a36b5428a82af01e7bcd29952_Out_3_Vector3;
        Unity_Clamp_float3(_Transform_c7914cc45a011c89b3f53c55afb51673_Out_1_Vector3, float3(-1, -1, -1), float3(1, 1, 1), _Clamp_3837949a36b5428a82af01e7bcd29952_Out_3_Vector3);
        float3 _Normalize_09bf8a2bd0a4d38e8b97d5c674f79b44_Out_1_Vector3;
        Unity_Normalize_float3(_Clamp_3837949a36b5428a82af01e7bcd29952_Out_3_Vector3, _Normalize_09bf8a2bd0a4d38e8b97d5c674f79b44_Out_1_Vector3);
        float3 _Branch_9eadf909a90f2f80880f8c56ecc2a91f_Out_3_Vector3;
        Unity_Branch_float3(_Property_1ef12cf3201a938993fe6a7951b0e754_Out_0_Boolean, _Normalize_09bf8a2bd0a4d38e8b97d5c674f79b44_Out_1_Vector3, (_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.xyz), _Branch_9eadf909a90f2f80880f8c56ecc2a91f_Out_3_Vector3);
        XZ_2 = (float4(_Branch_9eadf909a90f2f80880f8c56ecc2a91f_Out_3_Vector3, 1.0));
        }
        
        void Unity_NormalStrength_float(float3 In, float Strength, out float3 Out)
        {
            Out = float3(In.rg * Strength, lerp(1, In.b, saturate(Strength)));
        }
        
        void Unity_NormalBlend_float(float3 A, float3 B, out float3 Out)
        {
            Out = SafeNormalize(float3(A.rg + B.rg, A.b * B.b));
        }
        
        void Unity_Add_float3(float3 A, float3 B, out float3 Out)
        {
            Out = A + B;
        }
        
        void Unity_Divide_float3(float3 A, float3 B, out float3 Out)
        {
            Out = A / B;
        }
        
        struct Bindings_TriplanarNMn_059da9746584140498cd018db3c76047_float
        {
        float3 WorldSpaceNormal;
        float3 WorldSpaceTangent;
        float3 WorldSpaceBiTangent;
        float3 WorldSpacePosition;
        };
        
        void SG_TriplanarNMn_059da9746584140498cd018db3c76047_float(UnityTexture2D Texture2D_80A3D28F, float Vector1_41461AC9, float Vector1_E4D1C13A, Bindings_TriplanarNMn_059da9746584140498cd018db3c76047_float IN, out float4 XYZ_1, out float4 XZ_2, out float4 YZ_3, out float4 XY_4)
        {
        UnityTexture2D _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D = Texture2D_80A3D28F;
        float _Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float = IN.WorldSpacePosition[0];
        float _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float = IN.WorldSpacePosition[1];
        float _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float = IN.WorldSpacePosition[2];
        float _Split_89ed63cb625cb3878c183d0b71c03400_A_4_Float = 0;
        float4 _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4;
        float3 _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3;
        float2 _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, float(0), float(0), _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3, _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2);
        float _Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float = Vector1_41461AC9;
        float4 _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, (_Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float.xxxx), _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4);
        float3 _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3;
        Unity_Sign_float3(IN.WorldSpaceNormal, _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3);
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_R_1_Float = _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3[0];
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_G_2_Float = _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3[1];
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_B_3_Float = _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3[2];
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_A_4_Float = 0;
        float2 _Vector2_b76cb1842101e58b9e636d49b075c612_Out_0_Vector2 = float2(_Split_6299d4ddcc4c74828aea40a46fdb896e_G_2_Float, float(1));
        float2 _Multiply_a87753ad90594382bf3a3a95abbadbc8_Out_2_Vector2;
        Unity_Multiply_float2_float2((_Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4.xy), _Vector2_b76cb1842101e58b9e636d49b075c612_Out_0_Vector2, _Multiply_a87753ad90594382bf3a3a95abbadbc8_Out_2_Vector2);
        float4 _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Multiply_a87753ad90594382bf3a3a95abbadbc8_Out_2_Vector2) );
        _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4);
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.r;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.g;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.b;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_A_7_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.a;
        float2 _Vector2_ad6bd100e273d78fa409a30a77bfa2cc_Out_0_Vector2 = float2(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float, _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float);
        float2 _Multiply_31e8db88ee20c985a9850d1a58f3282b_Out_2_Vector2;
        Unity_Multiply_float2_float2(_Vector2_ad6bd100e273d78fa409a30a77bfa2cc_Out_0_Vector2, _Vector2_b76cb1842101e58b9e636d49b075c612_Out_0_Vector2, _Multiply_31e8db88ee20c985a9850d1a58f3282b_Out_2_Vector2);
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_R_1_Float = IN.WorldSpaceNormal[0];
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_G_2_Float = IN.WorldSpaceNormal[1];
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_B_3_Float = IN.WorldSpaceNormal[2];
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_A_4_Float = 0;
        float2 _Vector2_70e5837843f28b8b9d64cada3697bd5a_Out_0_Vector2 = float2(_Split_5ed44bf2eca0868f81eb18100f49d1fa_R_1_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_B_3_Float);
        float2 _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2;
        Unity_Add_float2(_Multiply_31e8db88ee20c985a9850d1a58f3282b_Out_2_Vector2, _Vector2_70e5837843f28b8b9d64cada3697bd5a_Out_0_Vector2, _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2);
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_R_1_Float = _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2[0];
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_G_2_Float = _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2[1];
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_B_3_Float = 0;
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_A_4_Float = 0;
        float _Multiply_e4fe778b81456d819c52bb414cd95968_Out_2_Float;
        Unity_Multiply_float_float(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_G_2_Float, _Multiply_e4fe778b81456d819c52bb414cd95968_Out_2_Float);
        float3 _Vector3_08f62c5c01619e849f1a7d85a44531ac_Out_0_Vector3 = float3(_Split_2bc77ca2d17bd78cb2383770ce50b179_R_1_Float, _Multiply_e4fe778b81456d819c52bb414cd95968_Out_2_Float, _Split_2bc77ca2d17bd78cb2383770ce50b179_G_2_Float);
        float3 _Absolute_644b798714827680b39bf5d34f70385f_Out_1_Vector3;
        Unity_Absolute_float3(IN.WorldSpaceNormal, _Absolute_644b798714827680b39bf5d34f70385f_Out_1_Vector3);
        float _Property_adc4c59482221c8aad681c6558728ac9_Out_0_Float = Vector1_E4D1C13A;
        float3 _Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3;
        Unity_Power_float3(_Absolute_644b798714827680b39bf5d34f70385f_Out_1_Vector3, (_Property_adc4c59482221c8aad681c6558728ac9_Out_0_Float.xxx), _Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3);
        float3 _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3, _Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3, _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3);
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_R_1_Float = _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3[0];
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_G_2_Float = _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3[1];
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_B_3_Float = _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3[2];
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_A_4_Float = 0;
        float3 _Multiply_2e1040ca9c98d085ace76ee93f094039_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Vector3_08f62c5c01619e849f1a7d85a44531ac_Out_0_Vector3, (_Split_ae83014fcbd9f7879a0b91fa66dc9718_G_2_Float.xxx), _Multiply_2e1040ca9c98d085ace76ee93f094039_Out_2_Vector3);
        float4 _Combine_192c2c4a69be588b90ca005a32e22552_RGBA_4_Vector4;
        float3 _Combine_192c2c4a69be588b90ca005a32e22552_RGB_5_Vector3;
        float2 _Combine_192c2c4a69be588b90ca005a32e22552_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float, float(0), float(0), _Combine_192c2c4a69be588b90ca005a32e22552_RGBA_4_Vector4, _Combine_192c2c4a69be588b90ca005a32e22552_RGB_5_Vector3, _Combine_192c2c4a69be588b90ca005a32e22552_RG_6_Vector2);
        float4 _Multiply_138240d0d4846e87b0febabec0d6891b_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_192c2c4a69be588b90ca005a32e22552_RGBA_4_Vector4, (_Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float.xxxx), _Multiply_138240d0d4846e87b0febabec0d6891b_Out_2_Vector4);
        float _Multiply_de711f4a4614bd89a463b53374cf4036_Out_2_Float;
        Unity_Multiply_float_float(_Split_6299d4ddcc4c74828aea40a46fdb896e_B_3_Float, -1, _Multiply_de711f4a4614bd89a463b53374cf4036_Out_2_Float);
        float2 _Vector2_4ed33f0c73b2698fa6f3c1b77fe76808_Out_0_Vector2 = float2(_Multiply_de711f4a4614bd89a463b53374cf4036_Out_2_Float, float(1));
        float2 _Multiply_2af6058cc6ccb88caefd2799bb5941e8_Out_2_Vector2;
        Unity_Multiply_float2_float2((_Multiply_138240d0d4846e87b0febabec0d6891b_Out_2_Vector4.xy), _Vector2_4ed33f0c73b2698fa6f3c1b77fe76808_Out_0_Vector2, _Multiply_2af6058cc6ccb88caefd2799bb5941e8_Out_2_Vector2);
        float4 _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Multiply_2af6058cc6ccb88caefd2799bb5941e8_Out_2_Vector2) );
        _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4);
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_R_4_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.r;
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_G_5_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.g;
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_B_6_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.b;
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_A_7_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.a;
        float2 _Vector2_fe9aedd4528c7486ada4abdca0b0944e_Out_0_Vector2 = float2(_SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_R_4_Float, _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_G_5_Float);
        float2 _Multiply_02b9b4665ad9918d8721bcaddc82f06f_Out_2_Vector2;
        Unity_Multiply_float2_float2(_Vector2_fe9aedd4528c7486ada4abdca0b0944e_Out_0_Vector2, _Vector2_4ed33f0c73b2698fa6f3c1b77fe76808_Out_0_Vector2, _Multiply_02b9b4665ad9918d8721bcaddc82f06f_Out_2_Vector2);
        float2 _Vector2_a74a85274da15181abb63cc5e8df0de1_Out_0_Vector2 = float2(_Split_5ed44bf2eca0868f81eb18100f49d1fa_R_1_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_G_2_Float);
        float2 _Add_b227c84042055e8faa1a9fdc69529707_Out_2_Vector2;
        Unity_Add_float2(_Multiply_02b9b4665ad9918d8721bcaddc82f06f_Out_2_Vector2, _Vector2_a74a85274da15181abb63cc5e8df0de1_Out_0_Vector2, _Add_b227c84042055e8faa1a9fdc69529707_Out_2_Vector2);
        float _Split_2cfb9eacd8762483941459cdf28bda97_R_1_Float = _Add_b227c84042055e8faa1a9fdc69529707_Out_2_Vector2[0];
        float _Split_2cfb9eacd8762483941459cdf28bda97_G_2_Float = _Add_b227c84042055e8faa1a9fdc69529707_Out_2_Vector2[1];
        float _Split_2cfb9eacd8762483941459cdf28bda97_B_3_Float = 0;
        float _Split_2cfb9eacd8762483941459cdf28bda97_A_4_Float = 0;
        float _Multiply_1d65ce08ce672087879125f2e13c4004_Out_2_Float;
        Unity_Multiply_float_float(_SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_B_6_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_B_3_Float, _Multiply_1d65ce08ce672087879125f2e13c4004_Out_2_Float);
        float3 _Vector3_ba6cfb4671e8c58f9b41ea1dc23102ca_Out_0_Vector3 = float3(_Split_2cfb9eacd8762483941459cdf28bda97_R_1_Float, _Split_2cfb9eacd8762483941459cdf28bda97_G_2_Float, _Multiply_1d65ce08ce672087879125f2e13c4004_Out_2_Float);
        float3 _Multiply_7bb4009c92b108849ac6ca92bc1442f2_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Vector3_ba6cfb4671e8c58f9b41ea1dc23102ca_Out_0_Vector3, (_Split_ae83014fcbd9f7879a0b91fa66dc9718_B_3_Float.xxx), _Multiply_7bb4009c92b108849ac6ca92bc1442f2_Out_2_Vector3);
        float4 _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGBA_4_Vector4;
        float3 _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGB_5_Vector3;
        float2 _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float, float(0), float(0), _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGBA_4_Vector4, _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGB_5_Vector3, _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RG_6_Vector2);
        float4 _Multiply_2c0864423b014f8b8af8523f68cbb63c_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGBA_4_Vector4, (_Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float.xxxx), _Multiply_2c0864423b014f8b8af8523f68cbb63c_Out_2_Vector4);
        float2 _Vector2_a1e23e0f921b6484818f009a2b12a5ba_Out_0_Vector2 = float2(_Split_6299d4ddcc4c74828aea40a46fdb896e_R_1_Float, float(1));
        float2 _Multiply_862402885a49f18cb87278ab53bc6744_Out_2_Vector2;
        Unity_Multiply_float2_float2((_Multiply_2c0864423b014f8b8af8523f68cbb63c_Out_2_Vector4.xy), _Vector2_a1e23e0f921b6484818f009a2b12a5ba_Out_0_Vector2, _Multiply_862402885a49f18cb87278ab53bc6744_Out_2_Vector2);
        float4 _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Multiply_862402885a49f18cb87278ab53bc6744_Out_2_Vector2) );
        _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4);
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_R_4_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.r;
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_G_5_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.g;
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_B_6_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.b;
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_A_7_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.a;
        float _Multiply_4649b768be76d784a3284bacde795359_Out_2_Float;
        Unity_Multiply_float_float(_SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_B_6_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_R_1_Float, _Multiply_4649b768be76d784a3284bacde795359_Out_2_Float);
        float2 _Vector2_819fcd5eb484438eacad1987576d7d67_Out_0_Vector2 = float2(_SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_R_4_Float, _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_G_5_Float);
        float2 _Multiply_58530ebb3c6d798b93686a76247bf505_Out_2_Vector2;
        Unity_Multiply_float2_float2(_Vector2_819fcd5eb484438eacad1987576d7d67_Out_0_Vector2, _Vector2_a1e23e0f921b6484818f009a2b12a5ba_Out_0_Vector2, _Multiply_58530ebb3c6d798b93686a76247bf505_Out_2_Vector2);
        float2 _Vector2_e293c112b2f49e88a5fe46dfb1fbeb40_Out_0_Vector2 = float2(_Split_5ed44bf2eca0868f81eb18100f49d1fa_B_3_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_G_2_Float);
        float2 _Add_cf00fb232c6e2b8e973ab2f84453f55e_Out_2_Vector2;
        Unity_Add_float2(_Multiply_58530ebb3c6d798b93686a76247bf505_Out_2_Vector2, _Vector2_e293c112b2f49e88a5fe46dfb1fbeb40_Out_0_Vector2, _Add_cf00fb232c6e2b8e973ab2f84453f55e_Out_2_Vector2);
        float _Split_3ea3e61d32bdd78f82c686b75ff3fd9b_R_1_Float = _Add_cf00fb232c6e2b8e973ab2f84453f55e_Out_2_Vector2[0];
        float _Split_3ea3e61d32bdd78f82c686b75ff3fd9b_G_2_Float = _Add_cf00fb232c6e2b8e973ab2f84453f55e_Out_2_Vector2[1];
        float _Split_3ea3e61d32bdd78f82c686b75ff3fd9b_B_3_Float = 0;
        float _Split_3ea3e61d32bdd78f82c686b75ff3fd9b_A_4_Float = 0;
        float3 _Vector3_13a08d5940172a84a78ee3d9b8766833_Out_0_Vector3 = float3(_Multiply_4649b768be76d784a3284bacde795359_Out_2_Float, _Split_3ea3e61d32bdd78f82c686b75ff3fd9b_G_2_Float, _Split_3ea3e61d32bdd78f82c686b75ff3fd9b_R_1_Float);
        float3 _Multiply_77818c22e359fc8cbb7dd20216a8db72_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Vector3_13a08d5940172a84a78ee3d9b8766833_Out_0_Vector3, (_Split_ae83014fcbd9f7879a0b91fa66dc9718_R_1_Float.xxx), _Multiply_77818c22e359fc8cbb7dd20216a8db72_Out_2_Vector3);
        float3 _Add_769d9ee909c9238dbbf72d2800a2f268_Out_2_Vector3;
        Unity_Add_float3(_Multiply_7bb4009c92b108849ac6ca92bc1442f2_Out_2_Vector3, _Multiply_77818c22e359fc8cbb7dd20216a8db72_Out_2_Vector3, _Add_769d9ee909c9238dbbf72d2800a2f268_Out_2_Vector3);
        float3 _Add_14295f72880e4b87a1baf1ced943ac40_Out_2_Vector3;
        Unity_Add_float3(_Multiply_2e1040ca9c98d085ace76ee93f094039_Out_2_Vector3, _Add_769d9ee909c9238dbbf72d2800a2f268_Out_2_Vector3, _Add_14295f72880e4b87a1baf1ced943ac40_Out_2_Vector3);
        float _Add_e59af300bba2498db32eac1412123447_Out_2_Float;
        Unity_Add_float(_Split_ae83014fcbd9f7879a0b91fa66dc9718_R_1_Float, _Split_ae83014fcbd9f7879a0b91fa66dc9718_G_2_Float, _Add_e59af300bba2498db32eac1412123447_Out_2_Float);
        float _Add_e855069f047fae8ea9027d56acb61e56_Out_2_Float;
        Unity_Add_float(_Add_e59af300bba2498db32eac1412123447_Out_2_Float, _Split_ae83014fcbd9f7879a0b91fa66dc9718_B_3_Float, _Add_e855069f047fae8ea9027d56acb61e56_Out_2_Float);
        float3 _Divide_91ae4b94f1d9b78e99d0472293b8098c_Out_2_Vector3;
        Unity_Divide_float3(_Add_14295f72880e4b87a1baf1ced943ac40_Out_2_Vector3, (_Add_e855069f047fae8ea9027d56acb61e56_Out_2_Float.xxx), _Divide_91ae4b94f1d9b78e99d0472293b8098c_Out_2_Vector3);
        float3 _Transform_73eecc0c3689d184a34c8d0f28a58adf_Out_1_Vector3;
        {
        float3x3 tangentTransform = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
        _Transform_73eecc0c3689d184a34c8d0f28a58adf_Out_1_Vector3 = TransformWorldToTangentDir(_Divide_91ae4b94f1d9b78e99d0472293b8098c_Out_2_Vector3.xyz, tangentTransform, true);
        }
        float3 _Normalize_15ef346824db0a8797631ed8b998e673_Out_1_Vector3;
        Unity_Normalize_float3(_Transform_73eecc0c3689d184a34c8d0f28a58adf_Out_1_Vector3, _Normalize_15ef346824db0a8797631ed8b998e673_Out_1_Vector3);
        XYZ_1 = (float4(_Normalize_15ef346824db0a8797631ed8b998e673_Out_1_Vector3, 1.0));
        XZ_2 = (float4(_Vector3_08f62c5c01619e849f1a7d85a44531ac_Out_0_Vector3, 1.0));
        YZ_3 = (float4(_Vector3_ba6cfb4671e8c58f9b41ea1dc23102ca_Out_0_Vector3, 1.0));
        XY_4 = (float4(_Vector3_13a08d5940172a84a78ee3d9b8766833_Out_0_Vector3, 1.0));
        }
        
        void Unity_Subtract_float(float A, float B, out float Out)
        {
            Out = A - B;
        }
        
        void Unity_Power_float(float A, float B, out float Out)
        {
            Out = pow(A, B);
        }
        
        void Unity_Lerp_float3(float3 A, float3 B, float3 T, out float3 Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Remap_float(float In, float2 InMinMax, float2 OutMinMax, out float Out)
        {
            Out = OutMinMax.x + (In - InMinMax.x) * (OutMinMax.y - OutMinMax.x) / (InMinMax.y - InMinMax.x);
        }
        
        // Custom interpolators pre vertex
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPreVertex' */
        
        // Graph Vertex
        struct VertexDescription
        {
            float3 Position;
            float3 Normal;
            float3 Tangent;
        };
        
        VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
        {
            VertexDescription description = (VertexDescription)0;
            description.Position = IN.ObjectSpacePosition;
            description.Normal = IN.ObjectSpaceNormal;
            description.Tangent = IN.ObjectSpaceTangent;
            return description;
        }
        
        // Custom interpolators, pre surface
        #ifdef FEATURES_GRAPH_VERTEX
        Varyings CustomInterpolatorPassThroughFunc(inout Varyings output, VertexDescription input)
        {
        return output;
        }
        #define CUSTOMINTERPOLATOR_VARYPASSTHROUGH_FUNC
        #endif
        
        // Graph Pixel
        struct SurfaceDescription
        {
            float3 BaseColor;
            float3 Emission;
            float Alpha;
            float AlphaClipThreshold;
        };
        
        SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
        {
            SurfaceDescription surface = (SurfaceDescription)0;
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_05d49814100eb3808cd61a6177622291_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseColorMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_e21be9beec8d858fa2818b2fddc4577c_Out_0_Vector4 = _BaseTilingOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_1b1963c0ccb4d78fa3474b362fd31d15_Out_0_Boolean = _BaseUsePlanarUV;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae;
            _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae.uv0 = IN.uv0;
            _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae.uv2 = IN.uv2;
            float4 _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_05d49814100eb3808cd61a6177622291_Out_0_Texture2D, _Property_e21be9beec8d858fa2818b2fddc4577c_Out_0_Vector4, _Property_1b1963c0ccb4d78fa3474b362fd31d15_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), 1, _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae, _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae_XZ_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_03a155c84233b98dbb11cd710d6e1539_Out_0_Vector4 = _BaseColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Multiply_9cb5181459454189b39d6838c2a6fb85_Out_2_Vector4;
            Unity_Multiply_float4_float4(_PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae_XZ_2_Vector4, _Property_03a155c84233b98dbb11cd710d6e1539_Out_0_Vector4, _Multiply_9cb5181459454189b39d6838c2a6fb85_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_b26f64bfa09eb48584b1dc9133f5b840_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_DetailMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_bb28507cb268918795cf74b32a6b3693_Out_0_Vector4 = _DetailTilingOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_a5f9848f7817b48ca226ca228efcc28e_R_1_Float = _Property_bb28507cb268918795cf74b32a6b3693_Out_0_Vector4[0];
            float _Split_a5f9848f7817b48ca226ca228efcc28e_G_2_Float = _Property_bb28507cb268918795cf74b32a6b3693_Out_0_Vector4[1];
            float _Split_a5f9848f7817b48ca226ca228efcc28e_B_3_Float = _Property_bb28507cb268918795cf74b32a6b3693_Out_0_Vector4[2];
            float _Split_a5f9848f7817b48ca226ca228efcc28e_A_4_Float = _Property_bb28507cb268918795cf74b32a6b3693_Out_0_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_257255e4b3cee8888b124cb1330da379_Out_0_Vector2 = float2(_Split_a5f9848f7817b48ca226ca228efcc28e_R_1_Float, _Split_a5f9848f7817b48ca226ca228efcc28e_G_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_2ba978ab0f3ccc84b3fe592845432576_Out_0_Vector2 = float2(_Split_a5f9848f7817b48ca226ca228efcc28e_B_3_Float, _Split_a5f9848f7817b48ca226ca228efcc28e_A_4_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _TilingAndOffset_9bc6b1e938f4668f9476625fa68aff4e_Out_3_Vector2;
            Unity_TilingAndOffset_float(IN.uv0.xy, _Vector2_257255e4b3cee8888b124cb1330da379_Out_0_Vector2, _Vector2_2ba978ab0f3ccc84b3fe592845432576_Out_0_Vector2, _TilingAndOffset_9bc6b1e938f4668f9476625fa68aff4e_Out_3_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_b26f64bfa09eb48584b1dc9133f5b840_Out_0_Texture2D.tex, _Property_b26f64bfa09eb48584b1dc9133f5b840_Out_0_Texture2D.samplerstate, _Property_b26f64bfa09eb48584b1dc9133f5b840_Out_0_Texture2D.GetTransformedUV(_TilingAndOffset_9bc6b1e938f4668f9476625fa68aff4e_Out_3_Vector2) );
            float _SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_R_4_Float = _SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_RGBA_0_Vector4.r;
            float _SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_G_5_Float = _SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_RGBA_0_Vector4.g;
            float _SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_B_6_Float = _SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_RGBA_0_Vector4.b;
            float _SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_A_7_Float = _SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_99a7a45efebe0588afbd74b8df9b4750_Out_2_Float;
            Unity_Multiply_float_float(_SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_R_4_Float, 2, _Multiply_99a7a45efebe0588afbd74b8df9b4750_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_ddcd7f2c8505e0818230ed34d7ecdf92_Out_2_Float;
            Unity_Add_float(_Multiply_99a7a45efebe0588afbd74b8df9b4750_Out_2_Float, float(-1), _Add_ddcd7f2c8505e0818230ed34d7ecdf92_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_b7367df1085ac580b7d5b9785921d152_Out_0_Float = _DetailAlbedoScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_874d814eeb0e7782842ad64a4d97f43e_Out_2_Float;
            Unity_Multiply_float_float(_Add_ddcd7f2c8505e0818230ed34d7ecdf92_Out_2_Float, _Property_b7367df1085ac580b7d5b9785921d152_Out_0_Float, _Multiply_874d814eeb0e7782842ad64a4d97f43e_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Saturate_40d0c48fa8fb008799c2060b9ccfede9_Out_1_Float;
            Unity_Saturate_float(_Multiply_874d814eeb0e7782842ad64a4d97f43e_Out_2_Float, _Saturate_40d0c48fa8fb008799c2060b9ccfede9_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Absolute_7ea0f8a0aaf24186a357f11eca841a0c_Out_1_Float;
            Unity_Absolute_float(_Saturate_40d0c48fa8fb008799c2060b9ccfede9_Out_1_Float, _Absolute_7ea0f8a0aaf24186a357f11eca841a0c_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_BlendOverlayBaseColor_acdb3dfca72bd6b42bbc35f4613331a2_float _BlendOverlayBaseColor_9ac50a6865d3648181da5f6189b8832d;
            float3 _BlendOverlayBaseColor_9ac50a6865d3648181da5f6189b8832d_OutVector4_1_Vector3;
            SG_BlendOverlayBaseColor_acdb3dfca72bd6b42bbc35f4613331a2_float(_Multiply_9cb5181459454189b39d6838c2a6fb85_Out_2_Vector4, _Add_ddcd7f2c8505e0818230ed34d7ecdf92_Out_2_Float, _Absolute_7ea0f8a0aaf24186a357f11eca841a0c_Out_1_Float, _BlendOverlayBaseColor_9ac50a6865d3648181da5f6189b8832d, _BlendOverlayBaseColor_9ac50a6865d3648181da5f6189b8832d_OutVector4_1_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_5d67b392da5ceb81b51a3bfe5384ad00_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverBaseColorMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_e95f6f4e76cecb87871151040535a080_Out_0_Vector4 = _CoverTilingOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Divide_acbbd9727ffda783aeafe28ccafbde8e_Out_2_Vector4;
            Unity_Divide_float4(float4(1, 1, 0, 0), _Property_e95f6f4e76cecb87871151040535a080_Out_0_Vector4, _Divide_acbbd9727ffda783aeafe28ccafbde8e_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_faa4f436225f4e8eb99135b1d078135e_Out_0_Float = _CoverTriplanarThreshold;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_cd8ee86e67e5fe898c7968f92e11e481;
            _TriplanarNM_cd8ee86e67e5fe898c7968f92e11e481.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_cd8ee86e67e5fe898c7968f92e11e481.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_cd8ee86e67e5fe898c7968f92e11e481_XYZ_1_Vector4;
            float4 _TriplanarNM_cd8ee86e67e5fe898c7968f92e11e481_XZ_2_Vector4;
            float4 _TriplanarNM_cd8ee86e67e5fe898c7968f92e11e481_YZ_3_Vector4;
            float4 _TriplanarNM_cd8ee86e67e5fe898c7968f92e11e481_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_5d67b392da5ceb81b51a3bfe5384ad00_Out_0_Texture2D, (_Divide_acbbd9727ffda783aeafe28ccafbde8e_Out_2_Vector4).x, _Property_faa4f436225f4e8eb99135b1d078135e_Out_0_Float, _TriplanarNM_cd8ee86e67e5fe898c7968f92e11e481, _TriplanarNM_cd8ee86e67e5fe898c7968f92e11e481_XYZ_1_Vector4, _TriplanarNM_cd8ee86e67e5fe898c7968f92e11e481_XZ_2_Vector4, _TriplanarNM_cd8ee86e67e5fe898c7968f92e11e481_YZ_3_Vector4, _TriplanarNM_cd8ee86e67e5fe898c7968f92e11e481_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_65c5d9a1688ae98ba437bc3f4b866f99_Out_0_Vector4 = _CoverBaseColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Multiply_b7294cbf7c9daa85b18c13beaf3dc8bd_Out_2_Vector4;
            Unity_Multiply_float4_float4(_TriplanarNM_cd8ee86e67e5fe898c7968f92e11e481_XYZ_1_Vector4, _Property_65c5d9a1688ae98ba437bc3f4b866f99_Out_0_Vector4, _Multiply_b7294cbf7c9daa85b18c13beaf3dc8bd_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_43c6facd1f553289befba1782fe8ad70_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverMaskA);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _UV_5b74fb710ad3d187a00f16e1d8f8bd63_Out_0_Vector4 = IN.uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _SampleTexture2D_4d4c63c65e48c28ba5f624928f181789_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_43c6facd1f553289befba1782fe8ad70_Out_0_Texture2D.tex, _Property_43c6facd1f553289befba1782fe8ad70_Out_0_Texture2D.samplerstate, _Property_43c6facd1f553289befba1782fe8ad70_Out_0_Texture2D.GetTransformedUV((_UV_5b74fb710ad3d187a00f16e1d8f8bd63_Out_0_Vector4.xy)) );
            float _SampleTexture2D_4d4c63c65e48c28ba5f624928f181789_R_4_Float = _SampleTexture2D_4d4c63c65e48c28ba5f624928f181789_RGBA_0_Vector4.r;
            float _SampleTexture2D_4d4c63c65e48c28ba5f624928f181789_G_5_Float = _SampleTexture2D_4d4c63c65e48c28ba5f624928f181789_RGBA_0_Vector4.g;
            float _SampleTexture2D_4d4c63c65e48c28ba5f624928f181789_B_6_Float = _SampleTexture2D_4d4c63c65e48c28ba5f624928f181789_RGBA_0_Vector4.b;
            float _SampleTexture2D_4d4c63c65e48c28ba5f624928f181789_A_7_Float = _SampleTexture2D_4d4c63c65e48c28ba5f624928f181789_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_4080f51767261687a64910057bc980cb_Out_0_Float = _CoverMaskPower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_2660ad962697408681e2e8c36648ca12_Out_2_Float;
            Unity_Multiply_float_float(_SampleTexture2D_4d4c63c65e48c28ba5f624928f181789_A_7_Float, _Property_4080f51767261687a64910057bc980cb_Out_0_Float, _Multiply_2660ad962697408681e2e8c36648ca12_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_572d83500486058c99890c5d609b30b0_Out_3_Float;
            Unity_Clamp_float(_Multiply_2660ad962697408681e2e8c36648ca12_Out_2_Float, float(0), float(1), _Clamp_572d83500486058c99890c5d609b30b0_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Property_3d047323d7f9778ca2b1b7d7d4d43210_Out_0_Vector3 = _CoverDirection;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_3f76f18aa45a858dab65f5835e23f0b9_Out_0_Vector2 = float2(_SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_A_7_Float, _SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_G_5_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Multiply_a3cb438c86db8a839543847f1fa26666_Out_2_Vector2;
            Unity_Multiply_float2_float2(_Vector2_3f76f18aa45a858dab65f5835e23f0b9_Out_0_Vector2, float2(2, 2), _Multiply_a3cb438c86db8a839543847f1fa26666_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Add_21eb70b8cab75f8a852dd8dd64767430_Out_2_Vector2;
            Unity_Add_float2(_Multiply_a3cb438c86db8a839543847f1fa26666_Out_2_Vector2, float2(-1, -1), _Add_21eb70b8cab75f8a852dd8dd64767430_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_cbbb2e4ef035b58e8c751d96843d987e_Out_0_Float = _DetailNormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Multiply_d4afe7aea32def8ca3c89b2f7e87af44_Out_2_Vector2;
            Unity_Multiply_float2_float2(_Add_21eb70b8cab75f8a852dd8dd64767430_Out_2_Vector2, (_Property_cbbb2e4ef035b58e8c751d96843d987e_Out_0_Float.xx), _Multiply_d4afe7aea32def8ca3c89b2f7e87af44_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_f88dc76333998681a9031ef1324e052a_R_1_Float = _Multiply_d4afe7aea32def8ca3c89b2f7e87af44_Out_2_Vector2[0];
            float _Split_f88dc76333998681a9031ef1324e052a_G_2_Float = _Multiply_d4afe7aea32def8ca3c89b2f7e87af44_Out_2_Vector2[1];
            float _Split_f88dc76333998681a9031ef1324e052a_B_3_Float = 0;
            float _Split_f88dc76333998681a9031ef1324e052a_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _DotProduct_970a707dd71afa80887b08c47998be6e_Out_2_Float;
            Unity_DotProduct_float2(_Multiply_d4afe7aea32def8ca3c89b2f7e87af44_Out_2_Vector2, _Multiply_d4afe7aea32def8ca3c89b2f7e87af44_Out_2_Vector2, _DotProduct_970a707dd71afa80887b08c47998be6e_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Saturate_6a42dc6ad32c63849dbf7844d1081b82_Out_1_Float;
            Unity_Saturate_float(_DotProduct_970a707dd71afa80887b08c47998be6e_Out_2_Float, _Saturate_6a42dc6ad32c63849dbf7844d1081b82_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_a724d53a195cd387a0d6ec2d11ec64e8_Out_1_Float;
            Unity_OneMinus_float(_Saturate_6a42dc6ad32c63849dbf7844d1081b82_Out_1_Float, _OneMinus_a724d53a195cd387a0d6ec2d11ec64e8_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _SquareRoot_6e074ca49330118a958f11e9487fe5c6_Out_1_Float;
            Unity_SquareRoot_float(_OneMinus_a724d53a195cd387a0d6ec2d11ec64e8_Out_1_Float, _SquareRoot_6e074ca49330118a958f11e9487fe5c6_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Vector3_a6a5e3fb326314838a5e436f55de8dcc_Out_0_Vector3 = float3(_Split_f88dc76333998681a9031ef1324e052a_R_1_Float, _Split_f88dc76333998681a9031ef1324e052a_G_2_Float, _SquareRoot_6e074ca49330118a958f11e9487fe5c6_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_2e4a88374e8ffd8db37352d79f10740a_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseNormalMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float _PlanarNMn_126f337c769a878bb33ea56bcab1d637;
            _PlanarNMn_126f337c769a878bb33ea56bcab1d637.WorldSpaceNormal = IN.WorldSpaceNormal;
            _PlanarNMn_126f337c769a878bb33ea56bcab1d637.WorldSpaceTangent = IN.WorldSpaceTangent;
            _PlanarNMn_126f337c769a878bb33ea56bcab1d637.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _PlanarNMn_126f337c769a878bb33ea56bcab1d637.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNMn_126f337c769a878bb33ea56bcab1d637.uv0 = IN.uv0;
            _PlanarNMn_126f337c769a878bb33ea56bcab1d637.uv2 = IN.uv2;
            float4 _PlanarNMn_126f337c769a878bb33ea56bcab1d637_XZ_2_Vector4;
            SG_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float(_Property_2e4a88374e8ffd8db37352d79f10740a_Out_0_Texture2D, _Property_e21be9beec8d858fa2818b2fddc4577c_Out_0_Vector4, _Property_1b1963c0ccb4d78fa3474b362fd31d15_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), 1, _PlanarNMn_126f337c769a878bb33ea56bcab1d637, _PlanarNMn_126f337c769a878bb33ea56bcab1d637_XZ_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_ea100595101f088a94e70278a910a34c_Out_0_Float = _BaseNormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _NormalStrength_70f3e500f60967898e02d8fc8200db59_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_126f337c769a878bb33ea56bcab1d637_XZ_2_Vector4.xyz), _Property_ea100595101f088a94e70278a910a34c_Out_0_Float, _NormalStrength_70f3e500f60967898e02d8fc8200db59_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _NormalBlend_58a0c0d45b55168cbfa43fa9d9da21c6_Out_2_Vector3;
            Unity_NormalBlend_float(_Vector3_a6a5e3fb326314838a5e436f55de8dcc_Out_0_Vector3, _NormalStrength_70f3e500f60967898e02d8fc8200db59_Out_2_Vector3, _NormalBlend_58a0c0d45b55168cbfa43fa9d9da21c6_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_bb2720e978ff4782bb872fb7b877636f_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverNormalMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNMn_059da9746584140498cd018db3c76047_float _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b;
            _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b.WorldSpaceTangent = IN.WorldSpaceTangent;
            _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b.WorldSpacePosition = IN.WorldSpacePosition;
            float4 _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b_XYZ_1_Vector4;
            float4 _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b_XZ_2_Vector4;
            float4 _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b_YZ_3_Vector4;
            float4 _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b_XY_4_Vector4;
            SG_TriplanarNMn_059da9746584140498cd018db3c76047_float(_Property_bb2720e978ff4782bb872fb7b877636f_Out_0_Texture2D, (_Divide_acbbd9727ffda783aeafe28ccafbde8e_Out_2_Vector4).x, _Property_faa4f436225f4e8eb99135b1d078135e_Out_0_Float, _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b, _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b_XYZ_1_Vector4, _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b_XZ_2_Vector4, _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b_YZ_3_Vector4, _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_f6ae16d8d2c85685b4072d78c56e29e9_Out_0_Float = _CoverNormalBlendHardness;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _NormalStrength_11fab77b71140d8ab0735a9615b728ec_Out_2_Vector3;
            Unity_NormalStrength_float((_TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b_XYZ_1_Vector4.xyz), _Property_f6ae16d8d2c85685b4072d78c56e29e9_Out_0_Float, _NormalStrength_11fab77b71140d8ab0735a9615b728ec_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Multiply_fa49280de269898ebbfe89d446d57ecc_Out_2_Vector3;
            Unity_Multiply_float3_float3(_Property_3d047323d7f9778ca2b1b7d7d4d43210_Out_0_Vector3, IN.WorldSpaceNormal, _Multiply_fa49280de269898ebbfe89d446d57ecc_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_91e143818eee6187b799b2a4652eeb95_R_1_Float = _Multiply_fa49280de269898ebbfe89d446d57ecc_Out_2_Vector3[0];
            float _Split_91e143818eee6187b799b2a4652eeb95_G_2_Float = _Multiply_fa49280de269898ebbfe89d446d57ecc_Out_2_Vector3[1];
            float _Split_91e143818eee6187b799b2a4652eeb95_B_3_Float = _Multiply_fa49280de269898ebbfe89d446d57ecc_Out_2_Vector3[2];
            float _Split_91e143818eee6187b799b2a4652eeb95_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_f99764306bf31e8484b14d9a1ba660a3_Out_2_Float;
            Unity_Add_float(_Split_91e143818eee6187b799b2a4652eeb95_R_1_Float, _Split_91e143818eee6187b799b2a4652eeb95_G_2_Float, _Add_f99764306bf31e8484b14d9a1ba660a3_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_25d0cda769439c85a6176b0cf9af06c0_Out_2_Float;
            Unity_Add_float(_Add_f99764306bf31e8484b14d9a1ba660a3_Out_2_Float, _Split_91e143818eee6187b799b2a4652eeb95_B_3_Float, _Add_25d0cda769439c85a6176b0cf9af06c0_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_24df69e5dc52008e891c2b3f99e28991_Out_0_Float = _Cover_Amount;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_7b25e9aea29e888e99e5155562106e70_Out_0_Float = _Cover_Amount_Grow_Speed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Subtract_a31b2e64f122188ea610c77d3f62f810_Out_2_Float;
            Unity_Subtract_float(float(4), _Property_7b25e9aea29e888e99e5155562106e70_Out_0_Float, _Subtract_a31b2e64f122188ea610c77d3f62f810_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_15277685f0785f8a90f4492c80247159_Out_2_Float;
            Unity_Divide_float(_Property_24df69e5dc52008e891c2b3f99e28991_Out_0_Float, _Subtract_a31b2e64f122188ea610c77d3f62f810_Out_2_Float, _Divide_15277685f0785f8a90f4492c80247159_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Absolute_ac1c6e27d47e508e8aed26d3db167120_Out_1_Float;
            Unity_Absolute_float(_Divide_15277685f0785f8a90f4492c80247159_Out_2_Float, _Absolute_ac1c6e27d47e508e8aed26d3db167120_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Power_d5a03bba02ea638f84c50ca9f6a3e112_Out_2_Float;
            Unity_Power_float(_Absolute_ac1c6e27d47e508e8aed26d3db167120_Out_1_Float, _Subtract_a31b2e64f122188ea610c77d3f62f810_Out_2_Float, _Power_d5a03bba02ea638f84c50ca9f6a3e112_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_1be0e9928e2c0489b16295f57a026487_Out_3_Float;
            Unity_Clamp_float(_Power_d5a03bba02ea638f84c50ca9f6a3e112_Out_2_Float, float(0), float(2), _Clamp_1be0e9928e2c0489b16295f57a026487_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_041ba179c4133288bd6ebb7932697351_Out_2_Float;
            Unity_Multiply_float_float(_Add_25d0cda769439c85a6176b0cf9af06c0_Out_2_Float, _Clamp_1be0e9928e2c0489b16295f57a026487_Out_3_Float, _Multiply_041ba179c4133288bd6ebb7932697351_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Saturate_f03610d99dc38b8688cdf6c95924daaf_Out_1_Float;
            Unity_Saturate_float(_Multiply_041ba179c4133288bd6ebb7932697351_Out_2_Float, _Saturate_f03610d99dc38b8688cdf6c95924daaf_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_78437b2d5aa53f829edcee712f066e04_Out_3_Float;
            Unity_Clamp_float(_Add_25d0cda769439c85a6176b0cf9af06c0_Out_2_Float, float(0), float(0.9999), _Clamp_78437b2d5aa53f829edcee712f066e04_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_32c30bd23dc33184849662569cd46759_Out_0_Float = _Cover_Max_Angle;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_9d9e98ea75888d85877f3863930719aa_Out_2_Float;
            Unity_Divide_float(_Property_32c30bd23dc33184849662569cd46759_Out_0_Float, float(45), _Divide_9d9e98ea75888d85877f3863930719aa_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_fa817fbd2ba8aa81bf3977d104f66ffd_Out_1_Float;
            Unity_OneMinus_float(_Divide_9d9e98ea75888d85877f3863930719aa_Out_2_Float, _OneMinus_fa817fbd2ba8aa81bf3977d104f66ffd_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Subtract_66c9a128aff075848cbe14a74ba8d3c5_Out_2_Float;
            Unity_Subtract_float(_Clamp_78437b2d5aa53f829edcee712f066e04_Out_3_Float, _OneMinus_fa817fbd2ba8aa81bf3977d104f66ffd_Out_1_Float, _Subtract_66c9a128aff075848cbe14a74ba8d3c5_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_b81e19ff4b40e889bbc2a0d75a043d55_Out_3_Float;
            Unity_Clamp_float(_Subtract_66c9a128aff075848cbe14a74ba8d3c5_Out_2_Float, float(0), float(2), _Clamp_b81e19ff4b40e889bbc2a0d75a043d55_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_df9b9eb99573a286b66090f1a88825c2_Out_2_Float;
            Unity_Divide_float(float(1), _Divide_9d9e98ea75888d85877f3863930719aa_Out_2_Float, _Divide_df9b9eb99573a286b66090f1a88825c2_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_b1c6bc199993da8e8690b8204063c06f_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_b81e19ff4b40e889bbc2a0d75a043d55_Out_3_Float, _Divide_df9b9eb99573a286b66090f1a88825c2_Out_2_Float, _Multiply_b1c6bc199993da8e8690b8204063c06f_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Absolute_47d15fbc856f1982992c9f6f8cf095df_Out_1_Float;
            Unity_Absolute_float(_Multiply_b1c6bc199993da8e8690b8204063c06f_Out_2_Float, _Absolute_47d15fbc856f1982992c9f6f8cf095df_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_84ecf6d44066108b958a4bbf89eb2bbb_Out_0_Float = _CoverHardness;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Power_e2326e473b1f15869db22e412e3f9fde_Out_2_Float;
            Unity_Power_float(_Absolute_47d15fbc856f1982992c9f6f8cf095df_Out_1_Float, _Property_84ecf6d44066108b958a4bbf89eb2bbb_Out_0_Float, _Power_e2326e473b1f15869db22e412e3f9fde_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_e5173dd322cb9c87a827b3d6d416e8c4_Out_0_Float = _Cover_Min_Height;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_d6102fe1df60cf8f9be5eb4f6774b363_Out_1_Float;
            Unity_OneMinus_float(_Property_e5173dd322cb9c87a827b3d6d416e8c4_Out_0_Float, _OneMinus_d6102fe1df60cf8f9be5eb4f6774b363_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_c2c0822a4c066887bdce2476ce07e03b_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
            float _Split_c2c0822a4c066887bdce2476ce07e03b_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
            float _Split_c2c0822a4c066887bdce2476ce07e03b_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
            float _Split_c2c0822a4c066887bdce2476ce07e03b_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_d67ba628c117b784982b2b0e7335f121_Out_2_Float;
            Unity_Add_float(_OneMinus_d6102fe1df60cf8f9be5eb4f6774b363_Out_1_Float, _Split_c2c0822a4c066887bdce2476ce07e03b_G_2_Float, _Add_d67ba628c117b784982b2b0e7335f121_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_cacc637f6d247382b610fa5e29099efb_Out_2_Float;
            Unity_Add_float(_Add_d67ba628c117b784982b2b0e7335f121_Out_2_Float, float(1), _Add_cacc637f6d247382b610fa5e29099efb_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_305f17dcc5012d81886e7fe415a513d4_Out_3_Float;
            Unity_Clamp_float(_Add_cacc637f6d247382b610fa5e29099efb_Out_2_Float, float(0), float(1), _Clamp_305f17dcc5012d81886e7fe415a513d4_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_6b0e17b7e3d2fd8db358cf2468c498e6_Out_0_Float = _Cover_Min_Height_Blending;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_3a4b967d185bc881b41c30791f6f1e62_Out_2_Float;
            Unity_Add_float(_Add_d67ba628c117b784982b2b0e7335f121_Out_2_Float, _Property_6b0e17b7e3d2fd8db358cf2468c498e6_Out_0_Float, _Add_3a4b967d185bc881b41c30791f6f1e62_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_fd0dcb913f15e88e902812b438aebbc3_Out_2_Float;
            Unity_Divide_float(_Add_3a4b967d185bc881b41c30791f6f1e62_Out_2_Float, _Add_d67ba628c117b784982b2b0e7335f121_Out_2_Float, _Divide_fd0dcb913f15e88e902812b438aebbc3_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_a7b7b5823dc9398d8328371fb23de257_Out_1_Float;
            Unity_OneMinus_float(_Divide_fd0dcb913f15e88e902812b438aebbc3_Out_2_Float, _OneMinus_a7b7b5823dc9398d8328371fb23de257_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_caa2bc8711bde98886b2e04bc3895333_Out_2_Float;
            Unity_Add_float(_OneMinus_a7b7b5823dc9398d8328371fb23de257_Out_1_Float, float(-0.5), _Add_caa2bc8711bde98886b2e04bc3895333_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_9958b4bb870ca78bb4f436357f6e4ed4_Out_3_Float;
            Unity_Clamp_float(_Add_caa2bc8711bde98886b2e04bc3895333_Out_2_Float, float(0), float(1), _Clamp_9958b4bb870ca78bb4f436357f6e4ed4_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_f4c52e99fecae983bba5ca957ceaea70_Out_2_Float;
            Unity_Add_float(_Clamp_305f17dcc5012d81886e7fe415a513d4_Out_3_Float, _Clamp_9958b4bb870ca78bb4f436357f6e4ed4_Out_3_Float, _Add_f4c52e99fecae983bba5ca957ceaea70_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_4b0ba629f5691b8985bcb46fe077634b_Out_3_Float;
            Unity_Clamp_float(_Add_f4c52e99fecae983bba5ca957ceaea70_Out_2_Float, float(0), float(1), _Clamp_4b0ba629f5691b8985bcb46fe077634b_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_dc9146fa086a698db159220c4b551f8d_Out_2_Float;
            Unity_Multiply_float_float(_Power_e2326e473b1f15869db22e412e3f9fde_Out_2_Float, _Clamp_4b0ba629f5691b8985bcb46fe077634b_Out_3_Float, _Multiply_dc9146fa086a698db159220c4b551f8d_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_4a4cdbb11047088c86f3455cd5a51981_Out_2_Float;
            Unity_Multiply_float_float(_Saturate_f03610d99dc38b8688cdf6c95924daaf_Out_1_Float, _Multiply_dc9146fa086a698db159220c4b551f8d_Out_2_Float, _Multiply_4a4cdbb11047088c86f3455cd5a51981_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Lerp_81e093150193e5818ea2e7cdf113600f_Out_3_Vector3;
            Unity_Lerp_float3(_NormalBlend_58a0c0d45b55168cbfa43fa9d9da21c6_Out_2_Vector3, _NormalStrength_11fab77b71140d8ab0735a9615b728ec_Out_2_Vector3, (_Multiply_4a4cdbb11047088c86f3455cd5a51981_Out_2_Float.xxx), _Lerp_81e093150193e5818ea2e7cdf113600f_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Transform_fcfe6aed8d17598ebf576390e09b3662_Out_1_Vector3;
            {
                float3x3 tangentTransform = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
                _Transform_fcfe6aed8d17598ebf576390e09b3662_Out_1_Vector3 = TransformTangentToWorldDir(_Lerp_81e093150193e5818ea2e7cdf113600f_Out_3_Vector3.xyz, tangentTransform, true).xyz;
            }
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Multiply_87cc0f3ed4675989b51b1b58a173bc24_Out_2_Vector3;
            Unity_Multiply_float3_float3(_Property_3d047323d7f9778ca2b1b7d7d4d43210_Out_0_Vector3, _Transform_fcfe6aed8d17598ebf576390e09b3662_Out_1_Vector3, _Multiply_87cc0f3ed4675989b51b1b58a173bc24_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_60ee188afca81787a8e8fac74a174b99_R_1_Float = _Multiply_87cc0f3ed4675989b51b1b58a173bc24_Out_2_Vector3[0];
            float _Split_60ee188afca81787a8e8fac74a174b99_G_2_Float = _Multiply_87cc0f3ed4675989b51b1b58a173bc24_Out_2_Vector3[1];
            float _Split_60ee188afca81787a8e8fac74a174b99_B_3_Float = _Multiply_87cc0f3ed4675989b51b1b58a173bc24_Out_2_Vector3[2];
            float _Split_60ee188afca81787a8e8fac74a174b99_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_dc15dd3b0cae3e89bd698e7f843f7b1a_Out_2_Float;
            Unity_Add_float(_Split_60ee188afca81787a8e8fac74a174b99_R_1_Float, _Split_60ee188afca81787a8e8fac74a174b99_G_2_Float, _Add_dc15dd3b0cae3e89bd698e7f843f7b1a_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_5239bb98d15c0889b20e04a2eb89ee8d_Out_2_Float;
            Unity_Add_float(_Add_dc15dd3b0cae3e89bd698e7f843f7b1a_Out_2_Float, _Split_60ee188afca81787a8e8fac74a174b99_B_3_Float, _Add_5239bb98d15c0889b20e04a2eb89ee8d_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_04ad5b9da8d13d80977bd2661241c39d_Out_2_Float;
            Unity_Multiply_float_float(_Add_5239bb98d15c0889b20e04a2eb89ee8d_Out_2_Float, _Clamp_1be0e9928e2c0489b16295f57a026487_Out_3_Float, _Multiply_04ad5b9da8d13d80977bd2661241c39d_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_ffe9545eefb14c85b9db82fa15044921_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_1be0e9928e2c0489b16295f57a026487_Out_3_Float, _Property_84ecf6d44066108b958a4bbf89eb2bbb_Out_0_Float, _Multiply_ffe9545eefb14c85b9db82fa15044921_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_49be95001b6ff98ea3ddca613a01d693_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_ffe9545eefb14c85b9db82fa15044921_Out_2_Float, _Multiply_dc9146fa086a698db159220c4b551f8d_Out_2_Float, _Multiply_49be95001b6ff98ea3ddca613a01d693_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_821af040af6e558284ae449187584b00_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_04ad5b9da8d13d80977bd2661241c39d_Out_2_Float, _Multiply_49be95001b6ff98ea3ddca613a01d693_Out_2_Float, _Multiply_821af040af6e558284ae449187584b00_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_b98b3357cae0358aae44a13c442bbfcf_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverMaskMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3;
            _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_XYZ_1_Vector4;
            float4 _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_XZ_2_Vector4;
            float4 _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_YZ_3_Vector4;
            float4 _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_b98b3357cae0358aae44a13c442bbfcf_Out_0_Texture2D, (_Divide_acbbd9727ffda783aeafe28ccafbde8e_Out_2_Vector4).x, _Property_faa4f436225f4e8eb99135b1d078135e_Out_0_Float, _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3, _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_XYZ_1_Vector4, _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_XZ_2_Vector4, _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_YZ_3_Vector4, _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_d45fa36c68c6428bb4f8080e2005e0ec_R_1_Float = _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_XYZ_1_Vector4[0];
            float _Split_d45fa36c68c6428bb4f8080e2005e0ec_G_2_Float = _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_XYZ_1_Vector4[1];
            float _Split_d45fa36c68c6428bb4f8080e2005e0ec_B_3_Float = _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_XYZ_1_Vector4[2];
            float _Split_d45fa36c68c6428bb4f8080e2005e0ec_A_4_Float = _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_XYZ_1_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_98ac4ea177a183869352488b4c2d0d34_Out_0_Float = _CoverHeightMapMin;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_5d5eb0a63075b184be1f8ed7f1969793_Out_0_Float = _CoverHeightMapMax;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_068b903f7986bb8da7741fd6f472d4d3_Out_0_Vector2 = float2(_Property_98ac4ea177a183869352488b4c2d0d34_Out_0_Float, _Property_5d5eb0a63075b184be1f8ed7f1969793_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_dbf8fa97bfdf2f819d547b2836d5eb88_Out_0_Float = _CoverHeightMapOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Add_7e64ff79e725df80a9231cb40178da18_Out_2_Vector2;
            Unity_Add_float2(_Vector2_068b903f7986bb8da7741fd6f472d4d3_Out_0_Vector2, (_Property_dbf8fa97bfdf2f819d547b2836d5eb88_Out_0_Float.xx), _Add_7e64ff79e725df80a9231cb40178da18_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_0792f0dacec10e82954597c385120c5f_Out_3_Float;
            Unity_Remap_float(_Split_d45fa36c68c6428bb4f8080e2005e0ec_B_3_Float, float2 (0, 1), _Add_7e64ff79e725df80a9231cb40178da18_Out_2_Vector2, _Remap_0792f0dacec10e82954597c385120c5f_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_fef4ce95d06ced86899c58782dd5e9ac_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_821af040af6e558284ae449187584b00_Out_2_Float, _Remap_0792f0dacec10e82954597c385120c5f_Out_3_Float, _Multiply_fef4ce95d06ced86899c58782dd5e9ac_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_f38ac593c11c408685b4081df7f9a736_R_1_Float = IN.VertexColor[0];
            float _Split_f38ac593c11c408685b4081df7f9a736_G_2_Float = IN.VertexColor[1];
            float _Split_f38ac593c11c408685b4081df7f9a736_B_3_Float = IN.VertexColor[2];
            float _Split_f38ac593c11c408685b4081df7f9a736_A_4_Float = IN.VertexColor[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_26b43e2c517d7982b34d1c541939b6f5_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_fef4ce95d06ced86899c58782dd5e9ac_Out_2_Float, _Split_f38ac593c11c408685b4081df7f9a736_G_2_Float, _Multiply_26b43e2c517d7982b34d1c541939b6f5_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Saturate_3d2efb20d5b29381bfb3003845307b1f_Out_1_Float;
            Unity_Saturate_float(_Multiply_26b43e2c517d7982b34d1c541939b6f5_Out_2_Float, _Saturate_3d2efb20d5b29381bfb3003845307b1f_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_97e8d2e584b4e587a8ffaa3d3b1b30f5_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_572d83500486058c99890c5d609b30b0_Out_3_Float, _Saturate_3d2efb20d5b29381bfb3003845307b1f_Out_1_Float, _Multiply_97e8d2e584b4e587a8ffaa3d3b1b30f5_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            #if defined(_USEDYNAMICCOVERTSTATICMASKF_ON)
            float _UseDynamicCoverTStaticMaskF_ea4efcf79fa41489897aef4bbf5e655f_Out_0_Float = _Multiply_97e8d2e584b4e587a8ffaa3d3b1b30f5_Out_2_Float;
            #else
            float _UseDynamicCoverTStaticMaskF_ea4efcf79fa41489897aef4bbf5e655f_Out_0_Float = _Clamp_572d83500486058c99890c5d609b30b0_Out_3_Float;
            #endif
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Lerp_55b6201a01421f8b87ba535381db6a03_Out_3_Vector3;
            Unity_Lerp_float3(_BlendOverlayBaseColor_9ac50a6865d3648181da5f6189b8832d_OutVector4_1_Vector3, (_Multiply_b7294cbf7c9daa85b18c13beaf3dc8bd_Out_2_Vector4.xyz), (_UseDynamicCoverTStaticMaskF_ea4efcf79fa41489897aef4bbf5e655f_Out_0_Float.xxx), _Lerp_55b6201a01421f8b87ba535381db6a03_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_1c3992584ba29481b2683ce78818f520_Out_0_Vector4 = _WetColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Multiply_25f2ae8d79d4a388a6cbd74c831c0177_Out_2_Vector3;
            Unity_Multiply_float3_float3((_Property_1c3992584ba29481b2683ce78818f520_Out_0_Vector4.xyz), _Lerp_55b6201a01421f8b87ba535381db6a03_Out_3_Vector3, _Multiply_25f2ae8d79d4a388a6cbd74c831c0177_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_93980743aa69fb86bf250c5a7d50ef20_Out_1_Float;
            Unity_OneMinus_float(_Split_f38ac593c11c408685b4081df7f9a736_R_1_Float, _OneMinus_93980743aa69fb86bf250c5a7d50ef20_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Lerp_19abc331acee5482a25ee61d5a1861cf_Out_3_Vector3;
            Unity_Lerp_float3(_Lerp_55b6201a01421f8b87ba535381db6a03_Out_3_Vector3, _Multiply_25f2ae8d79d4a388a6cbd74c831c0177_Out_2_Vector3, (_OneMinus_93980743aa69fb86bf250c5a7d50ef20_Out_1_Float.xxx), _Lerp_19abc331acee5482a25ee61d5a1861cf_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_4bb7737116edbd81bca06201348456ea_R_1_Float = _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae_XZ_2_Vector4[0];
            float _Split_4bb7737116edbd81bca06201348456ea_G_2_Float = _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae_XZ_2_Vector4[1];
            float _Split_4bb7737116edbd81bca06201348456ea_B_3_Float = _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae_XZ_2_Vector4[2];
            float _Split_4bb7737116edbd81bca06201348456ea_A_4_Float = _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae_XZ_2_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_f9637076944eae8abdcc79dc2702814b_Out_0_Float = _AlphaCutoff;
            #endif
            surface.BaseColor = _Lerp_19abc331acee5482a25ee61d5a1861cf_Out_3_Vector3;
            surface.Emission = float3(0, 0, 0);
            surface.Alpha = _Split_4bb7737116edbd81bca06201348456ea_A_4_Float;
            surface.AlphaClipThreshold = _Property_f9637076944eae8abdcc79dc2702814b_Out_0_Float;
            return surface;
        }
        
        // --------------------------------------------------
        // Build Graph Inputs
        #ifdef HAVE_VFX_MODIFICATION
        #define VFX_SRP_ATTRIBUTES Attributes
        #define VFX_SRP_VARYINGS Varyings
        #define VFX_SRP_SURFACE_INPUTS SurfaceDescriptionInputs
        #endif
        VertexDescriptionInputs BuildVertexDescriptionInputs(Attributes input)
        {
            VertexDescriptionInputs output;
            ZERO_INITIALIZE(VertexDescriptionInputs, output);
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.ObjectSpaceNormal =                          input.normalOS;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.ObjectSpaceTangent =                         input.tangentOS.xyz;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.ObjectSpacePosition =                        input.positionOS;
        #endif
        
        #if UNITY_ANY_INSTANCING_ENABLED
        #else // TODO: XR support for procedural instancing because in this case UNITY_ANY_INSTANCING_ENABLED is not defined and instanceID is incorrect.
        #endif
        
            return output;
        }
        SurfaceDescriptionInputs BuildSurfaceDescriptionInputs(Varyings input)
        {
            SurfaceDescriptionInputs output;
            ZERO_INITIALIZE(SurfaceDescriptionInputs, output);
        
        #ifdef HAVE_VFX_MODIFICATION
        #if VFX_USE_GRAPH_VALUES
            uint instanceActiveIndex = asuint(UNITY_ACCESS_INSTANCED_PROP(PerInstance, _InstanceActiveIndex));
            /* WARNING: $splice Could not find named fragment 'VFXLoadGraphValues' */
        #endif
            /* WARNING: $splice Could not find named fragment 'VFXSetFragInputs' */
        
        #endif
        
            
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        // must use interpolated tangent, bitangent and normal before they are normalized in the pixel shader.
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        float3 unnormalizedNormalWS = input.normalWS;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        const float renormFactor = 1.0 / length(unnormalizedNormalWS);
        #endif
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        // use bitangent on the fly like in hdrp
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        // IMPORTANT! If we ever support Flip on double sided materials ensure bitangent and tangent are NOT flipped.
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        float crossSign = (input.tangentWS.w > 0.0 ? 1.0 : -1.0)* GetOddNegativeScale();
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        float3 bitang = crossSign * cross(input.normalWS.xyz, input.tangentWS.xyz);
        #endif
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.WorldSpaceNormal = renormFactor * input.normalWS.xyz;      // we want a unit length Normal Vector node in shader graph
        #endif
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        // to pr               eserve mikktspace compliance we use same scale renormFactor as was used on the normal.
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        // This                is explained in section 2.2 in "surface gradient based bump mapping framework"
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.WorldSpaceTangent = renormFactor * input.tangentWS.xyz;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.WorldSpaceBiTangent = renormFactor * bitang;
        #endif
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.WorldSpacePosition = input.positionWS;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.AbsoluteWorldSpacePosition = GetAbsolutePositionWS(input.positionWS);
        #endif
        
        
            #if UNITY_UV_STARTS_AT_TOP
            #else
            #endif
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.uv0 = input.texCoord0;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.uv2 = input.texCoord2;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.VertexColor = input.color;
        #endif
        
        #if UNITY_ANY_INSTANCING_ENABLED
        #else // TODO: XR support for procedural instancing because in this case UNITY_ANY_INSTANCING_ENABLED is not defined and instanceID is incorrect.
        #endif
        #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN output.FaceSign =                    IS_FRONT_VFACE(input.cullFace, true, false);
        #else
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        #endif
        #undef BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        
                return output;
        }
        
        // --------------------------------------------------
        // Main
        
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/LightingMetaPass.hlsl"
        
        // --------------------------------------------------
        // Visual Effect Vertex Invocations
        #ifdef HAVE_VFX_MODIFICATION
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
        #endif
        
        ENDHLSL
        }
        Pass
        {
            Name "SceneSelectionPass"
            Tags
            {
                "LightMode" = "SceneSelectionPass"
            }
        
        // Render State
        Cull Off
        
        // Debug
        // <None>
        
        // --------------------------------------------------
        // Pass
        
        HLSLPROGRAM
        
        // Pragmas
        #pragma target 2.0
        #pragma vertex vert
        #pragma fragment frag
        
        // Keywords
        #pragma shader_feature_local_fragment _ _ALPHATEST_ON
        #pragma shader_feature_local _ _USEDYNAMICCOVERTSTATICMASKF_ON
        
        #if defined(_USEDYNAMICCOVERTSTATICMASKF_ON)
            #define KEYWORD_PERMUTATION_0
        #else
            #define KEYWORD_PERMUTATION_1
        #endif
        
        
        // Defines
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define _NORMALMAP 1
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define _NORMAL_DROPOFF_TS 1
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_NORMAL
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_TANGENT
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_TEXCOORD0
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_TEXCOORD2
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define FEATURES_GRAPH_VERTEX_NORMAL_OUTPUT
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define FEATURES_GRAPH_VERTEX_TANGENT_OUTPUT
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_POSITION_WS
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_TEXCOORD0
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_TEXCOORD2
        #endif
        
        #define FEATURES_GRAPH_VERTEX
        /* WARNING: $splice Could not find named fragment 'PassInstancing' */
        #define SHADERPASS SHADERPASS_DEPTHONLY
        #define SCENESELECTIONPASS 1
        #define ALPHA_CLIP_THRESHOLD 1
        
        
        // custom interpolator pre-include
        /* WARNING: $splice Could not find named fragment 'sgci_CustomInterpolatorPreInclude' */
        
        // Includes
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
        #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
        #include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
        
        // --------------------------------------------------
        // Structs and Packing
        
        // custom interpolators pre packing
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPrePacking' */
        
        struct Attributes
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 positionOS : POSITION;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 normalOS : NORMAL;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 tangentOS : TANGENT;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv0 : TEXCOORD0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv2 : TEXCOORD2;
            #endif
            #if UNITY_ANY_INSTANCING_ENABLED || defined(ATTRIBUTES_NEED_INSTANCEID)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint instanceID : INSTANCEID_SEMANTIC;
            #endif
            #endif
        };
        struct Varyings
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 positionCS : SV_POSITION;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 positionWS;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord2;
            #endif
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
            #endif
        };
        struct SurfaceDescriptionInputs
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 AbsoluteWorldSpacePosition;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv2;
            #endif
        };
        struct VertexDescriptionInputs
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 ObjectSpaceNormal;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 ObjectSpaceTangent;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 ObjectSpacePosition;
            #endif
        };
        struct PackedVaryings
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 positionCS : SV_POSITION;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord0 : INTERP0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord2 : INTERP1;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 positionWS : INTERP2;
            #endif
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
            #endif
        };
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        PackedVaryings PackVaryings (Varyings input)
        {
            PackedVaryings output;
            ZERO_INITIALIZE(PackedVaryings, output);
            output.positionCS = input.positionCS;
            output.texCoord0.xyzw = input.texCoord0;
            output.texCoord2.xyzw = input.texCoord2;
            output.positionWS.xyz = input.positionWS;
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        
        Varyings UnpackVaryings (PackedVaryings input)
        {
            Varyings output;
            output.positionCS = input.positionCS;
            output.texCoord0 = input.texCoord0.xyzw;
            output.texCoord2 = input.texCoord2.xyzw;
            output.positionWS = input.positionWS.xyz;
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        #endif
        
        // --------------------------------------------------
        // Graph
        
        // Graph Properties
        CBUFFER_START(UnityPerMaterial)
        float _AlphaCutoff;
        float4 _BaseColor;
        float4 _BaseColorMap_TexelSize;
        float _BaseUsePlanarUV;
        float4 _BaseTilingOffset;
        float4 _BaseNormalMap_TexelSize;
        float _BaseNormalScale;
        float4 _BaseMaskMap_TexelSize;
        float _BaseMetallic;
        float _BaseAORemapMin;
        float _BaseAORemapMax;
        float _BaseSmoothnessRemapMin;
        float _BaseSmoothnessRemapMax;
        float4 _CoverMaskA_TexelSize;
        float _CoverMaskPower;
        float _Cover_Amount;
        float _Cover_Amount_Grow_Speed;
        float3 _CoverDirection;
        float _Cover_Max_Angle;
        float _Cover_Min_Height;
        float _Cover_Min_Height_Blending;
        float4 _CoverBaseColor;
        float4 _CoverBaseColorMap_TexelSize;
        float4 _CoverTilingOffset;
        float _CoverTriplanarThreshold;
        float4 _CoverNormalMap_TexelSize;
        float _CoverNormalScale;
        float _CoverNormalBlendHardness;
        float _CoverHardness;
        float _CoverHeightMapMin;
        float _CoverHeightMapMax;
        float _CoverHeightMapOffset;
        float4 _CoverMaskMap_TexelSize;
        float _CoverMetallic;
        float _CoverAORemapMin;
        float _CoverAORemapMax;
        float _CoverSmoothnessRemapMin;
        float _CoverSmoothnessRemapMax;
        float4 _DetailMap_TexelSize;
        float4 _DetailTilingOffset;
        float _DetailAlbedoScale;
        float _DetailNormalScale;
        float _DetailSmoothnessScale;
        float4 _WetColor;
        float _WetSmoothness;
        UNITY_TEXTURE_STREAMING_DEBUG_VARS;
        CBUFFER_END
        
        
        // Object and Global properties
        SAMPLER(SamplerState_Linear_Repeat);
        SAMPLER(SamplerState_Linear_Repeat_Aniso8);
        TEXTURE2D(_BaseColorMap);
        SAMPLER(sampler_BaseColorMap);
        TEXTURE2D(_BaseNormalMap);
        SAMPLER(sampler_BaseNormalMap);
        TEXTURE2D(_BaseMaskMap);
        SAMPLER(sampler_BaseMaskMap);
        TEXTURE2D(_CoverMaskA);
        SAMPLER(sampler_CoverMaskA);
        TEXTURE2D(_CoverBaseColorMap);
        SAMPLER(sampler_CoverBaseColorMap);
        TEXTURE2D(_CoverNormalMap);
        SAMPLER(sampler_CoverNormalMap);
        TEXTURE2D(_CoverMaskMap);
        SAMPLER(sampler_CoverMaskMap);
        TEXTURE2D(_DetailMap);
        SAMPLER(sampler_DetailMap);
        
        // Graph Includes
        // GraphIncludes: <None>
        
        // -- Property used by ScenePickingPass
        #ifdef SCENEPICKINGPASS
        float4 _SelectionID;
        #endif
        
        // -- Properties used by SceneSelectionPass
        #ifdef SCENESELECTIONPASS
        int _ObjectId;
        int _PassValue;
        #endif
        
        // Graph Functions
        
        void Unity_Combine_float(float R, float G, float B, float A, out float4 RGBA, out float3 RGB, out float2 RG)
        {
            RGBA = float4(R, G, B, A);
            RGB = float3(R, G, B);
            RG = float2(R, G);
        }
        
        void Unity_Divide_float(float A, float B, out float Out)
        {
            Out = A / B;
        }
        
        void Unity_Multiply_float4_float4(float4 A, float4 B, out float4 Out)
        {
        Out = A * B;
        }
        
        void Unity_Branch_float4(float Predicate, float4 True, float4 False, out float4 Out)
        {
            Out = Predicate ? True : False;
        }
        
        void Unity_TilingAndOffset_float(float2 UV, float2 Tiling, float2 Offset, out float2 Out)
        {
            Out = UV * Tiling + Offset;
        }
        
        void Unity_Branch_float2(float Predicate, float2 True, float2 False, out float2 Out)
        {
            Out = Predicate ? True : False;
        }
        
        struct Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float
        {
        float3 AbsoluteWorldSpacePosition;
        half4 uv0;
        half4 uv2;
        };
        
        void SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(UnityTexture2D Texture2D_80A3D28F, float4 Vector4_2EBA7A3B, float Boolean_7ABB9909, UnitySamplerState _SamplerState, float Boolean_5ddfe6daabcc4715a44b5f34fc19becb, Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float IN, out float4 XZ_2)
        {
        UnityTexture2D _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D = Texture2D_80A3D28F;
        float _Property_30834f691775a0898a45b1c868520436_Out_0_Boolean = Boolean_7ABB9909;
        float _Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
        float _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
        float _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
        float _Split_89ed63cb625cb3878c183d0b71c03400_A_4_Float = 0;
        float4 _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4;
        float3 _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3;
        float2 _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, float(0), float(0), _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3, _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2);
        float4 _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4 = Vector4_2EBA7A3B;
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_R_1_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[0];
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_G_2_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[1];
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_B_3_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[2];
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_A_4_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[3];
        float _Divide_e64179199923c58289b6aa94ea6c9178_Out_2_Float;
        Unity_Divide_float(float(1), _Split_2f0f52f6ef8c0e81af0da6476402bc1f_R_1_Float, _Divide_e64179199923c58289b6aa94ea6c9178_Out_2_Float);
        float4 _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, (_Divide_e64179199923c58289b6aa94ea6c9178_Out_2_Float.xxxx), _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4);
        float _Property_f17c7bf877e64b6abdd66b1fe9f5accc_Out_0_Boolean = Boolean_5ddfe6daabcc4715a44b5f34fc19becb;
        float4 _UV_029e8e8198564838b9389b902a09fb22_Out_0_Vector4 = IN.uv0;
        float4 _UV_7a6209af1506424fb75c81e87e42035a_Out_0_Vector4 = IN.uv2;
        float4 _Branch_fc37bb4bf641457cbbc6e290603056ff_Out_3_Vector4;
        Unity_Branch_float4(_Property_f17c7bf877e64b6abdd66b1fe9f5accc_Out_0_Boolean, _UV_029e8e8198564838b9389b902a09fb22_Out_0_Vector4, _UV_7a6209af1506424fb75c81e87e42035a_Out_0_Vector4, _Branch_fc37bb4bf641457cbbc6e290603056ff_Out_3_Vector4);
        float2 _Vector2_16c15d3bbdd14b85bd48e3a6cb318af7_Out_0_Vector2 = float2(_Split_2f0f52f6ef8c0e81af0da6476402bc1f_R_1_Float, _Split_2f0f52f6ef8c0e81af0da6476402bc1f_G_2_Float);
        float2 _Vector2_f8d75f54e7705083bbec539a60185577_Out_0_Vector2 = float2(_Split_2f0f52f6ef8c0e81af0da6476402bc1f_B_3_Float, _Split_2f0f52f6ef8c0e81af0da6476402bc1f_A_4_Float);
        float2 _TilingAndOffset_d91e2d25acd34686b562b7fe7e9d1d27_Out_3_Vector2;
        Unity_TilingAndOffset_float((_Branch_fc37bb4bf641457cbbc6e290603056ff_Out_3_Vector4.xy), _Vector2_16c15d3bbdd14b85bd48e3a6cb318af7_Out_0_Vector2, _Vector2_f8d75f54e7705083bbec539a60185577_Out_0_Vector2, _TilingAndOffset_d91e2d25acd34686b562b7fe7e9d1d27_Out_3_Vector2);
        float2 _Branch_8e5a4e8f4d52fc8aadd1f46485afc933_Out_3_Vector2;
        Unity_Branch_float2(_Property_30834f691775a0898a45b1c868520436_Out_0_Boolean, (_Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4.xy), _TilingAndOffset_d91e2d25acd34686b562b7fe7e9d1d27_Out_3_Vector2, _Branch_8e5a4e8f4d52fc8aadd1f46485afc933_Out_3_Vector2);
        UnitySamplerState _Property_e8746b9475c94530ba35ba8019ad2ae0_Out_0_SamplerState = _SamplerState;
        float4 _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, _Property_e8746b9475c94530ba35ba8019ad2ae0_Out_0_SamplerState.samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Branch_8e5a4e8f4d52fc8aadd1f46485afc933_Out_3_Vector2) );
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.r;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.g;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.b;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_A_7_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.a;
        XZ_2 = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4;
        }
        
        // Custom interpolators pre vertex
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPreVertex' */
        
        // Graph Vertex
        struct VertexDescription
        {
            float3 Position;
            float3 Normal;
            float3 Tangent;
        };
        
        VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
        {
            VertexDescription description = (VertexDescription)0;
            description.Position = IN.ObjectSpacePosition;
            description.Normal = IN.ObjectSpaceNormal;
            description.Tangent = IN.ObjectSpaceTangent;
            return description;
        }
        
        // Custom interpolators, pre surface
        #ifdef FEATURES_GRAPH_VERTEX
        Varyings CustomInterpolatorPassThroughFunc(inout Varyings output, VertexDescription input)
        {
        return output;
        }
        #define CUSTOMINTERPOLATOR_VARYPASSTHROUGH_FUNC
        #endif
        
        // Graph Pixel
        struct SurfaceDescription
        {
            float Alpha;
            float AlphaClipThreshold;
        };
        
        SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
        {
            SurfaceDescription surface = (SurfaceDescription)0;
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_05d49814100eb3808cd61a6177622291_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseColorMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_e21be9beec8d858fa2818b2fddc4577c_Out_0_Vector4 = _BaseTilingOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_1b1963c0ccb4d78fa3474b362fd31d15_Out_0_Boolean = _BaseUsePlanarUV;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae;
            _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae.uv0 = IN.uv0;
            _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae.uv2 = IN.uv2;
            float4 _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_05d49814100eb3808cd61a6177622291_Out_0_Texture2D, _Property_e21be9beec8d858fa2818b2fddc4577c_Out_0_Vector4, _Property_1b1963c0ccb4d78fa3474b362fd31d15_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), 1, _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae, _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae_XZ_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_4bb7737116edbd81bca06201348456ea_R_1_Float = _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae_XZ_2_Vector4[0];
            float _Split_4bb7737116edbd81bca06201348456ea_G_2_Float = _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae_XZ_2_Vector4[1];
            float _Split_4bb7737116edbd81bca06201348456ea_B_3_Float = _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae_XZ_2_Vector4[2];
            float _Split_4bb7737116edbd81bca06201348456ea_A_4_Float = _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae_XZ_2_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_f9637076944eae8abdcc79dc2702814b_Out_0_Float = _AlphaCutoff;
            #endif
            surface.Alpha = _Split_4bb7737116edbd81bca06201348456ea_A_4_Float;
            surface.AlphaClipThreshold = _Property_f9637076944eae8abdcc79dc2702814b_Out_0_Float;
            return surface;
        }
        
        // --------------------------------------------------
        // Build Graph Inputs
        #ifdef HAVE_VFX_MODIFICATION
        #define VFX_SRP_ATTRIBUTES Attributes
        #define VFX_SRP_VARYINGS Varyings
        #define VFX_SRP_SURFACE_INPUTS SurfaceDescriptionInputs
        #endif
        VertexDescriptionInputs BuildVertexDescriptionInputs(Attributes input)
        {
            VertexDescriptionInputs output;
            ZERO_INITIALIZE(VertexDescriptionInputs, output);
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.ObjectSpaceNormal =                          input.normalOS;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.ObjectSpaceTangent =                         input.tangentOS.xyz;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.ObjectSpacePosition =                        input.positionOS;
        #endif
        
        #if UNITY_ANY_INSTANCING_ENABLED
        #else // TODO: XR support for procedural instancing because in this case UNITY_ANY_INSTANCING_ENABLED is not defined and instanceID is incorrect.
        #endif
        
            return output;
        }
        SurfaceDescriptionInputs BuildSurfaceDescriptionInputs(Varyings input)
        {
            SurfaceDescriptionInputs output;
            ZERO_INITIALIZE(SurfaceDescriptionInputs, output);
        
        #ifdef HAVE_VFX_MODIFICATION
        #if VFX_USE_GRAPH_VALUES
            uint instanceActiveIndex = asuint(UNITY_ACCESS_INSTANCED_PROP(PerInstance, _InstanceActiveIndex));
            /* WARNING: $splice Could not find named fragment 'VFXLoadGraphValues' */
        #endif
            /* WARNING: $splice Could not find named fragment 'VFXSetFragInputs' */
        
        #endif
        
            
        
        
        
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.AbsoluteWorldSpacePosition = GetAbsolutePositionWS(input.positionWS);
        #endif
        
        
            #if UNITY_UV_STARTS_AT_TOP
            #else
            #endif
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.uv0 = input.texCoord0;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.uv2 = input.texCoord2;
        #endif
        
        #if UNITY_ANY_INSTANCING_ENABLED
        #else // TODO: XR support for procedural instancing because in this case UNITY_ANY_INSTANCING_ENABLED is not defined and instanceID is incorrect.
        #endif
        #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN output.FaceSign =                    IS_FRONT_VFACE(input.cullFace, true, false);
        #else
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        #endif
        #undef BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        
                return output;
        }
        
        // --------------------------------------------------
        // Main
        
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/SelectionPickingPass.hlsl"
        
        // --------------------------------------------------
        // Visual Effect Vertex Invocations
        #ifdef HAVE_VFX_MODIFICATION
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
        #endif
        
        ENDHLSL
        }
        Pass
        {
            Name "ScenePickingPass"
            Tags
            {
                "LightMode" = "Picking"
            }
        
        // Render State
        Cull [_Cull]
        
        // Debug
        // <None>
        
        // --------------------------------------------------
        // Pass
        
        HLSLPROGRAM
        
        // Pragmas
        #pragma target 2.0
        #pragma vertex vert
        #pragma fragment frag
        
        // Keywords
        #pragma shader_feature_local_fragment _ _ALPHATEST_ON
        #pragma shader_feature_local _ _USEDYNAMICCOVERTSTATICMASKF_ON
        
        #if defined(_USEDYNAMICCOVERTSTATICMASKF_ON)
            #define KEYWORD_PERMUTATION_0
        #else
            #define KEYWORD_PERMUTATION_1
        #endif
        
        
        // Defines
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define _NORMALMAP 1
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define _NORMAL_DROPOFF_TS 1
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_NORMAL
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_TANGENT
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_TEXCOORD0
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_TEXCOORD2
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_COLOR
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define FEATURES_GRAPH_VERTEX_NORMAL_OUTPUT
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define FEATURES_GRAPH_VERTEX_TANGENT_OUTPUT
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_POSITION_WS
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_NORMAL_WS
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_TANGENT_WS
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_TEXCOORD0
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_TEXCOORD2
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_COLOR
        #endif
        
        #define FEATURES_GRAPH_VERTEX
        /* WARNING: $splice Could not find named fragment 'PassInstancing' */
        #define SHADERPASS SHADERPASS_DEPTHONLY
        #define SCENEPICKINGPASS 1
        #define ALPHA_CLIP_THRESHOLD 1
        
        
        // custom interpolator pre-include
        /* WARNING: $splice Could not find named fragment 'sgci_CustomInterpolatorPreInclude' */
        
        // Includes
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
        #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
        #include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
        
        // --------------------------------------------------
        // Structs and Packing
        
        // custom interpolators pre packing
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPrePacking' */
        
        struct Attributes
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 positionOS : POSITION;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 normalOS : NORMAL;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 tangentOS : TANGENT;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv0 : TEXCOORD0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv2 : TEXCOORD2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 color : COLOR;
            #endif
            #if UNITY_ANY_INSTANCING_ENABLED || defined(ATTRIBUTES_NEED_INSTANCEID)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint instanceID : INSTANCEID_SEMANTIC;
            #endif
            #endif
        };
        struct Varyings
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 positionCS : SV_POSITION;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 positionWS;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 normalWS;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 tangentWS;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 color;
            #endif
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
            #endif
        };
        struct SurfaceDescriptionInputs
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 WorldSpaceNormal;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 WorldSpaceTangent;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 WorldSpaceBiTangent;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 WorldSpacePosition;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 AbsoluteWorldSpacePosition;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 VertexColor;
            #endif
        };
        struct VertexDescriptionInputs
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 ObjectSpaceNormal;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 ObjectSpaceTangent;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 ObjectSpacePosition;
            #endif
        };
        struct PackedVaryings
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 positionCS : SV_POSITION;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 tangentWS : INTERP0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord0 : INTERP1;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord2 : INTERP2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 color : INTERP3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 positionWS : INTERP4;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 normalWS : INTERP5;
            #endif
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
            #endif
        };
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        PackedVaryings PackVaryings (Varyings input)
        {
            PackedVaryings output;
            ZERO_INITIALIZE(PackedVaryings, output);
            output.positionCS = input.positionCS;
            output.tangentWS.xyzw = input.tangentWS;
            output.texCoord0.xyzw = input.texCoord0;
            output.texCoord2.xyzw = input.texCoord2;
            output.color.xyzw = input.color;
            output.positionWS.xyz = input.positionWS;
            output.normalWS.xyz = input.normalWS;
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        
        Varyings UnpackVaryings (PackedVaryings input)
        {
            Varyings output;
            output.positionCS = input.positionCS;
            output.tangentWS = input.tangentWS.xyzw;
            output.texCoord0 = input.texCoord0.xyzw;
            output.texCoord2 = input.texCoord2.xyzw;
            output.color = input.color.xyzw;
            output.positionWS = input.positionWS.xyz;
            output.normalWS = input.normalWS.xyz;
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        #endif
        
        // --------------------------------------------------
        // Graph
        
        // Graph Properties
        CBUFFER_START(UnityPerMaterial)
        float _AlphaCutoff;
        float4 _BaseColor;
        float4 _BaseColorMap_TexelSize;
        float _BaseUsePlanarUV;
        float4 _BaseTilingOffset;
        float4 _BaseNormalMap_TexelSize;
        float _BaseNormalScale;
        float4 _BaseMaskMap_TexelSize;
        float _BaseMetallic;
        float _BaseAORemapMin;
        float _BaseAORemapMax;
        float _BaseSmoothnessRemapMin;
        float _BaseSmoothnessRemapMax;
        float4 _CoverMaskA_TexelSize;
        float _CoverMaskPower;
        float _Cover_Amount;
        float _Cover_Amount_Grow_Speed;
        float3 _CoverDirection;
        float _Cover_Max_Angle;
        float _Cover_Min_Height;
        float _Cover_Min_Height_Blending;
        float4 _CoverBaseColor;
        float4 _CoverBaseColorMap_TexelSize;
        float4 _CoverTilingOffset;
        float _CoverTriplanarThreshold;
        float4 _CoverNormalMap_TexelSize;
        float _CoverNormalScale;
        float _CoverNormalBlendHardness;
        float _CoverHardness;
        float _CoverHeightMapMin;
        float _CoverHeightMapMax;
        float _CoverHeightMapOffset;
        float4 _CoverMaskMap_TexelSize;
        float _CoverMetallic;
        float _CoverAORemapMin;
        float _CoverAORemapMax;
        float _CoverSmoothnessRemapMin;
        float _CoverSmoothnessRemapMax;
        float4 _DetailMap_TexelSize;
        float4 _DetailTilingOffset;
        float _DetailAlbedoScale;
        float _DetailNormalScale;
        float _DetailSmoothnessScale;
        float4 _WetColor;
        float _WetSmoothness;
        UNITY_TEXTURE_STREAMING_DEBUG_VARS;
        CBUFFER_END
        
        
        // Object and Global properties
        SAMPLER(SamplerState_Linear_Repeat);
        SAMPLER(SamplerState_Linear_Repeat_Aniso8);
        TEXTURE2D(_BaseColorMap);
        SAMPLER(sampler_BaseColorMap);
        TEXTURE2D(_BaseNormalMap);
        SAMPLER(sampler_BaseNormalMap);
        TEXTURE2D(_BaseMaskMap);
        SAMPLER(sampler_BaseMaskMap);
        TEXTURE2D(_CoverMaskA);
        SAMPLER(sampler_CoverMaskA);
        TEXTURE2D(_CoverBaseColorMap);
        SAMPLER(sampler_CoverBaseColorMap);
        TEXTURE2D(_CoverNormalMap);
        SAMPLER(sampler_CoverNormalMap);
        TEXTURE2D(_CoverMaskMap);
        SAMPLER(sampler_CoverMaskMap);
        TEXTURE2D(_DetailMap);
        SAMPLER(sampler_DetailMap);
        
        // Graph Includes
        // GraphIncludes: <None>
        
        // -- Property used by ScenePickingPass
        #ifdef SCENEPICKINGPASS
        float4 _SelectionID;
        #endif
        
        // -- Properties used by SceneSelectionPass
        #ifdef SCENESELECTIONPASS
        int _ObjectId;
        int _PassValue;
        #endif
        
        // Graph Functions
        
        void Unity_Combine_float(float R, float G, float B, float A, out float4 RGBA, out float3 RGB, out float2 RG)
        {
            RGBA = float4(R, G, B, A);
            RGB = float3(R, G, B);
            RG = float2(R, G);
        }
        
        void Unity_Divide_float(float A, float B, out float Out)
        {
            Out = A / B;
        }
        
        void Unity_Multiply_float4_float4(float4 A, float4 B, out float4 Out)
        {
        Out = A * B;
        }
        
        void Unity_Branch_float4(float Predicate, float4 True, float4 False, out float4 Out)
        {
            Out = Predicate ? True : False;
        }
        
        void Unity_TilingAndOffset_float(float2 UV, float2 Tiling, float2 Offset, out float2 Out)
        {
            Out = UV * Tiling + Offset;
        }
        
        void Unity_Branch_float2(float Predicate, float2 True, float2 False, out float2 Out)
        {
            Out = Predicate ? True : False;
        }
        
        struct Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float
        {
        float3 AbsoluteWorldSpacePosition;
        half4 uv0;
        half4 uv2;
        };
        
        void SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(UnityTexture2D Texture2D_80A3D28F, float4 Vector4_2EBA7A3B, float Boolean_7ABB9909, UnitySamplerState _SamplerState, float Boolean_5ddfe6daabcc4715a44b5f34fc19becb, Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float IN, out float4 XZ_2)
        {
        UnityTexture2D _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D = Texture2D_80A3D28F;
        float _Property_30834f691775a0898a45b1c868520436_Out_0_Boolean = Boolean_7ABB9909;
        float _Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
        float _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
        float _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
        float _Split_89ed63cb625cb3878c183d0b71c03400_A_4_Float = 0;
        float4 _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4;
        float3 _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3;
        float2 _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, float(0), float(0), _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3, _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2);
        float4 _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4 = Vector4_2EBA7A3B;
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_R_1_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[0];
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_G_2_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[1];
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_B_3_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[2];
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_A_4_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[3];
        float _Divide_e64179199923c58289b6aa94ea6c9178_Out_2_Float;
        Unity_Divide_float(float(1), _Split_2f0f52f6ef8c0e81af0da6476402bc1f_R_1_Float, _Divide_e64179199923c58289b6aa94ea6c9178_Out_2_Float);
        float4 _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, (_Divide_e64179199923c58289b6aa94ea6c9178_Out_2_Float.xxxx), _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4);
        float _Property_f17c7bf877e64b6abdd66b1fe9f5accc_Out_0_Boolean = Boolean_5ddfe6daabcc4715a44b5f34fc19becb;
        float4 _UV_029e8e8198564838b9389b902a09fb22_Out_0_Vector4 = IN.uv0;
        float4 _UV_7a6209af1506424fb75c81e87e42035a_Out_0_Vector4 = IN.uv2;
        float4 _Branch_fc37bb4bf641457cbbc6e290603056ff_Out_3_Vector4;
        Unity_Branch_float4(_Property_f17c7bf877e64b6abdd66b1fe9f5accc_Out_0_Boolean, _UV_029e8e8198564838b9389b902a09fb22_Out_0_Vector4, _UV_7a6209af1506424fb75c81e87e42035a_Out_0_Vector4, _Branch_fc37bb4bf641457cbbc6e290603056ff_Out_3_Vector4);
        float2 _Vector2_16c15d3bbdd14b85bd48e3a6cb318af7_Out_0_Vector2 = float2(_Split_2f0f52f6ef8c0e81af0da6476402bc1f_R_1_Float, _Split_2f0f52f6ef8c0e81af0da6476402bc1f_G_2_Float);
        float2 _Vector2_f8d75f54e7705083bbec539a60185577_Out_0_Vector2 = float2(_Split_2f0f52f6ef8c0e81af0da6476402bc1f_B_3_Float, _Split_2f0f52f6ef8c0e81af0da6476402bc1f_A_4_Float);
        float2 _TilingAndOffset_d91e2d25acd34686b562b7fe7e9d1d27_Out_3_Vector2;
        Unity_TilingAndOffset_float((_Branch_fc37bb4bf641457cbbc6e290603056ff_Out_3_Vector4.xy), _Vector2_16c15d3bbdd14b85bd48e3a6cb318af7_Out_0_Vector2, _Vector2_f8d75f54e7705083bbec539a60185577_Out_0_Vector2, _TilingAndOffset_d91e2d25acd34686b562b7fe7e9d1d27_Out_3_Vector2);
        float2 _Branch_8e5a4e8f4d52fc8aadd1f46485afc933_Out_3_Vector2;
        Unity_Branch_float2(_Property_30834f691775a0898a45b1c868520436_Out_0_Boolean, (_Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4.xy), _TilingAndOffset_d91e2d25acd34686b562b7fe7e9d1d27_Out_3_Vector2, _Branch_8e5a4e8f4d52fc8aadd1f46485afc933_Out_3_Vector2);
        UnitySamplerState _Property_e8746b9475c94530ba35ba8019ad2ae0_Out_0_SamplerState = _SamplerState;
        float4 _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, _Property_e8746b9475c94530ba35ba8019ad2ae0_Out_0_SamplerState.samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Branch_8e5a4e8f4d52fc8aadd1f46485afc933_Out_3_Vector2) );
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.r;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.g;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.b;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_A_7_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.a;
        XZ_2 = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4;
        }
        
        void Unity_Multiply_float_float(float A, float B, out float Out)
        {
            Out = A * B;
        }
        
        void Unity_Add_float(float A, float B, out float Out)
        {
            Out = A + B;
        }
        
        void Unity_Saturate_float(float In, out float Out)
        {
            Out = saturate(In);
        }
        
        void Unity_Absolute_float(float In, out float Out)
        {
            Out = abs(In);
        }
        
        void Unity_SquareRoot_float4(float4 In, out float4 Out)
        {
            Out = sqrt(In);
        }
        
        void Unity_Sign_float(float In, out float Out)
        {
            Out = sign(In);
        }
        
        void Unity_Ceiling_float(float In, out float Out)
        {
            Out = ceil(In);
        }
        
        void Unity_Lerp_float4(float4 A, float4 B, float4 T, out float4 Out)
        {
            Out = lerp(A, B, T);
        }
        
        struct Bindings_BlendOverlayBaseColor_acdb3dfca72bd6b42bbc35f4613331a2_float
        {
        };
        
        void SG_BlendOverlayBaseColor_acdb3dfca72bd6b42bbc35f4613331a2_float(float4 Color_9AA111D3, float Vector1_FBE622A2, float Vector1_8C15C351, Bindings_BlendOverlayBaseColor_acdb3dfca72bd6b42bbc35f4613331a2_float IN, out float3 OutVector4_1)
        {
        float4 _Property_012510d774fb7f8b860f5270dca4500f_Out_0_Vector4 = Color_9AA111D3;
        float4 _SquareRoot_c2c57d0223a9538aa9240890c3cacb0c_Out_1_Vector4;
        Unity_SquareRoot_float4(_Property_012510d774fb7f8b860f5270dca4500f_Out_0_Vector4, _SquareRoot_c2c57d0223a9538aa9240890c3cacb0c_Out_1_Vector4);
        float _Property_a00e29241d12f983b30177515b367ec9_Out_0_Float = Vector1_FBE622A2;
        float _Sign_343a45ede7349283a681c6bd9998fd8e_Out_1_Float;
        Unity_Sign_float(_Property_a00e29241d12f983b30177515b367ec9_Out_0_Float, _Sign_343a45ede7349283a681c6bd9998fd8e_Out_1_Float);
        float _Add_681019b8f5d3d68bb482d419c9fc61a9_Out_2_Float;
        Unity_Add_float(_Sign_343a45ede7349283a681c6bd9998fd8e_Out_1_Float, float(1), _Add_681019b8f5d3d68bb482d419c9fc61a9_Out_2_Float);
        float _Multiply_e8f4cb722712a880ac0db6c7461427f7_Out_2_Float;
        Unity_Multiply_float_float(_Add_681019b8f5d3d68bb482d419c9fc61a9_Out_2_Float, 0.5, _Multiply_e8f4cb722712a880ac0db6c7461427f7_Out_2_Float);
        float _Ceiling_95ad15988aa9b98184875fa754feae01_Out_1_Float;
        Unity_Ceiling_float(_Multiply_e8f4cb722712a880ac0db6c7461427f7_Out_2_Float, _Ceiling_95ad15988aa9b98184875fa754feae01_Out_1_Float);
        float _Property_2db1c747a05ee284a8b00076062f91a4_Out_0_Float = Vector1_8C15C351;
        float _Multiply_9564ecda5193bc8286d9ff771c9226cd_Out_2_Float;
        Unity_Multiply_float_float(_Property_2db1c747a05ee284a8b00076062f91a4_Out_0_Float, _Property_2db1c747a05ee284a8b00076062f91a4_Out_0_Float, _Multiply_9564ecda5193bc8286d9ff771c9226cd_Out_2_Float);
        float4 _Lerp_b3cdb01fc3c5b988ac9b184943bf7c01_Out_3_Vector4;
        Unity_Lerp_float4(_SquareRoot_c2c57d0223a9538aa9240890c3cacb0c_Out_1_Vector4, (_Ceiling_95ad15988aa9b98184875fa754feae01_Out_1_Float.xxxx), (_Multiply_9564ecda5193bc8286d9ff771c9226cd_Out_2_Float.xxxx), _Lerp_b3cdb01fc3c5b988ac9b184943bf7c01_Out_3_Vector4);
        float4 _Multiply_39d1daff98488f8ea2cd794ad4f20926_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Lerp_b3cdb01fc3c5b988ac9b184943bf7c01_Out_3_Vector4, _Lerp_b3cdb01fc3c5b988ac9b184943bf7c01_Out_3_Vector4, _Multiply_39d1daff98488f8ea2cd794ad4f20926_Out_2_Vector4);
        OutVector4_1 = (_Multiply_39d1daff98488f8ea2cd794ad4f20926_Out_2_Vector4.xyz);
        }
        
        void Unity_Divide_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A / B;
        }
        
        void Unity_Sign_float3(float3 In, out float3 Out)
        {
            Out = sign(In);
        }
        
        void Unity_Multiply_float2_float2(float2 A, float2 B, out float2 Out)
        {
        Out = A * B;
        }
        
        void Unity_Absolute_float3(float3 In, out float3 Out)
        {
            Out = abs(In);
        }
        
        void Unity_Power_float3(float3 A, float3 B, out float3 Out)
        {
            Out = pow(A, B);
        }
        
        void Unity_Multiply_float3_float3(float3 A, float3 B, out float3 Out)
        {
        Out = A * B;
        }
        
        void Unity_Add_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A + B;
        }
        
        struct Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float
        {
        float3 WorldSpaceNormal;
        float3 AbsoluteWorldSpacePosition;
        };
        
        void SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(UnityTexture2D Texture2D_80A3D28F, float Vector1_41461AC9, float Vector1_E4D1C13A, Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float IN, out float4 XYZ_1, out float4 XZ_2, out float4 YZ_3, out float4 XY_4)
        {
        UnityTexture2D _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D = Texture2D_80A3D28F;
        float _Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
        float _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
        float _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
        float _Split_89ed63cb625cb3878c183d0b71c03400_A_4_Float = 0;
        float4 _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4;
        float3 _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3;
        float2 _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, float(0), float(0), _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3, _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2);
        float _Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float = Vector1_41461AC9;
        float4 _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, (_Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float.xxxx), _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4);
        float3 _Sign_b826e0ff2d95ec8cb2b2cbbd7ea2eab6_Out_1_Vector3;
        Unity_Sign_float3(IN.WorldSpaceNormal, _Sign_b826e0ff2d95ec8cb2b2cbbd7ea2eab6_Out_1_Vector3);
        float _Split_742547a7039de986a646d04c157ae549_R_1_Float = _Sign_b826e0ff2d95ec8cb2b2cbbd7ea2eab6_Out_1_Vector3[0];
        float _Split_742547a7039de986a646d04c157ae549_G_2_Float = _Sign_b826e0ff2d95ec8cb2b2cbbd7ea2eab6_Out_1_Vector3[1];
        float _Split_742547a7039de986a646d04c157ae549_B_3_Float = _Sign_b826e0ff2d95ec8cb2b2cbbd7ea2eab6_Out_1_Vector3[2];
        float _Split_742547a7039de986a646d04c157ae549_A_4_Float = 0;
        float2 _Vector2_40a8919e571ec18499de72022c155b38_Out_0_Vector2 = float2(_Split_742547a7039de986a646d04c157ae549_G_2_Float, float(1));
        float2 _Multiply_5fa32af59cdca88389832336b2268bd5_Out_2_Vector2;
        Unity_Multiply_float2_float2((_Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4.xy), _Vector2_40a8919e571ec18499de72022c155b38_Out_0_Vector2, _Multiply_5fa32af59cdca88389832336b2268bd5_Out_2_Vector2);
        float4 _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Multiply_5fa32af59cdca88389832336b2268bd5_Out_2_Vector2) );
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.r;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.g;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.b;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_A_7_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.a;
        float3 _Absolute_644b798714827680b39bf5d34f70385f_Out_1_Vector3;
        Unity_Absolute_float3(IN.WorldSpaceNormal, _Absolute_644b798714827680b39bf5d34f70385f_Out_1_Vector3);
        float _Property_adc4c59482221c8aad681c6558728ac9_Out_0_Float = Vector1_E4D1C13A;
        float3 _Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3;
        Unity_Power_float3(_Absolute_644b798714827680b39bf5d34f70385f_Out_1_Vector3, (_Property_adc4c59482221c8aad681c6558728ac9_Out_0_Float.xxx), _Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3);
        float3 _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3, _Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3, _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3);
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_R_1_Float = _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3[0];
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_G_2_Float = _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3[1];
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_B_3_Float = _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3[2];
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_A_4_Float = 0;
        float4 _Multiply_2e1040ca9c98d085ace76ee93f094039_Out_2_Vector4;
        Unity_Multiply_float4_float4(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4, (_Split_ae83014fcbd9f7879a0b91fa66dc9718_G_2_Float.xxxx), _Multiply_2e1040ca9c98d085ace76ee93f094039_Out_2_Vector4);
        float4 _Combine_192c2c4a69be588b90ca005a32e22552_RGBA_4_Vector4;
        float3 _Combine_192c2c4a69be588b90ca005a32e22552_RGB_5_Vector3;
        float2 _Combine_192c2c4a69be588b90ca005a32e22552_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float, float(0), float(0), _Combine_192c2c4a69be588b90ca005a32e22552_RGBA_4_Vector4, _Combine_192c2c4a69be588b90ca005a32e22552_RGB_5_Vector3, _Combine_192c2c4a69be588b90ca005a32e22552_RG_6_Vector2);
        float4 _Multiply_138240d0d4846e87b0febabec0d6891b_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_192c2c4a69be588b90ca005a32e22552_RGBA_4_Vector4, (_Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float.xxxx), _Multiply_138240d0d4846e87b0febabec0d6891b_Out_2_Vector4);
        float _Multiply_014402ded5a3988a8c18ba07636ea5a7_Out_2_Float;
        Unity_Multiply_float_float(_Split_742547a7039de986a646d04c157ae549_B_3_Float, -1, _Multiply_014402ded5a3988a8c18ba07636ea5a7_Out_2_Float);
        float2 _Vector2_caa25d55d456a58982bdfc39b1b43f3f_Out_0_Vector2 = float2(_Multiply_014402ded5a3988a8c18ba07636ea5a7_Out_2_Float, float(1));
        float2 _Multiply_a67201b6e1a0a28c98cd9d06e8b09543_Out_2_Vector2;
        Unity_Multiply_float2_float2((_Multiply_138240d0d4846e87b0febabec0d6891b_Out_2_Vector4.xy), _Vector2_caa25d55d456a58982bdfc39b1b43f3f_Out_0_Vector2, _Multiply_a67201b6e1a0a28c98cd9d06e8b09543_Out_2_Vector2);
        float4 _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Multiply_a67201b6e1a0a28c98cd9d06e8b09543_Out_2_Vector2) );
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_R_4_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.r;
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_G_5_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.g;
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_B_6_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.b;
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_A_7_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.a;
        float4 _Multiply_7bb4009c92b108849ac6ca92bc1442f2_Out_2_Vector4;
        Unity_Multiply_float4_float4(_SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4, (_Split_ae83014fcbd9f7879a0b91fa66dc9718_B_3_Float.xxxx), _Multiply_7bb4009c92b108849ac6ca92bc1442f2_Out_2_Vector4);
        float4 _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGBA_4_Vector4;
        float3 _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGB_5_Vector3;
        float2 _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float, float(0), float(0), _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGBA_4_Vector4, _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGB_5_Vector3, _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RG_6_Vector2);
        float4 _Multiply_2c0864423b014f8b8af8523f68cbb63c_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGBA_4_Vector4, (_Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float.xxxx), _Multiply_2c0864423b014f8b8af8523f68cbb63c_Out_2_Vector4);
        float2 _Vector2_54dfd40df2fc78809955dd272f2cf0c3_Out_0_Vector2 = float2(_Split_742547a7039de986a646d04c157ae549_R_1_Float, float(1));
        float2 _Multiply_addbd5fcede95f80bbb806c94e49ef63_Out_2_Vector2;
        Unity_Multiply_float2_float2((_Multiply_2c0864423b014f8b8af8523f68cbb63c_Out_2_Vector4.xy), _Vector2_54dfd40df2fc78809955dd272f2cf0c3_Out_0_Vector2, _Multiply_addbd5fcede95f80bbb806c94e49ef63_Out_2_Vector2);
        float4 _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Multiply_addbd5fcede95f80bbb806c94e49ef63_Out_2_Vector2) );
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_R_4_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.r;
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_G_5_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.g;
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_B_6_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.b;
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_A_7_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.a;
        float4 _Multiply_77818c22e359fc8cbb7dd20216a8db72_Out_2_Vector4;
        Unity_Multiply_float4_float4(_SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4, (_Split_ae83014fcbd9f7879a0b91fa66dc9718_R_1_Float.xxxx), _Multiply_77818c22e359fc8cbb7dd20216a8db72_Out_2_Vector4);
        float4 _Add_769d9ee909c9238dbbf72d2800a2f268_Out_2_Vector4;
        Unity_Add_float4(_Multiply_7bb4009c92b108849ac6ca92bc1442f2_Out_2_Vector4, _Multiply_77818c22e359fc8cbb7dd20216a8db72_Out_2_Vector4, _Add_769d9ee909c9238dbbf72d2800a2f268_Out_2_Vector4);
        float4 _Add_14295f72880e4b87a1baf1ced943ac40_Out_2_Vector4;
        Unity_Add_float4(_Multiply_2e1040ca9c98d085ace76ee93f094039_Out_2_Vector4, _Add_769d9ee909c9238dbbf72d2800a2f268_Out_2_Vector4, _Add_14295f72880e4b87a1baf1ced943ac40_Out_2_Vector4);
        float _Add_e59af300bba2498db32eac1412123447_Out_2_Float;
        Unity_Add_float(_Split_ae83014fcbd9f7879a0b91fa66dc9718_R_1_Float, _Split_ae83014fcbd9f7879a0b91fa66dc9718_G_2_Float, _Add_e59af300bba2498db32eac1412123447_Out_2_Float);
        float _Add_e855069f047fae8ea9027d56acb61e56_Out_2_Float;
        Unity_Add_float(_Add_e59af300bba2498db32eac1412123447_Out_2_Float, _Split_ae83014fcbd9f7879a0b91fa66dc9718_B_3_Float, _Add_e855069f047fae8ea9027d56acb61e56_Out_2_Float);
        float4 _Divide_91ae4b94f1d9b78e99d0472293b8098c_Out_2_Vector4;
        Unity_Divide_float4(_Add_14295f72880e4b87a1baf1ced943ac40_Out_2_Vector4, (_Add_e855069f047fae8ea9027d56acb61e56_Out_2_Float.xxxx), _Divide_91ae4b94f1d9b78e99d0472293b8098c_Out_2_Vector4);
        XYZ_1 = _Divide_91ae4b94f1d9b78e99d0472293b8098c_Out_2_Vector4;
        XZ_2 = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4;
        YZ_3 = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4;
        XY_4 = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4;
        }
        
        void Unity_Clamp_float(float In, float Min, float Max, out float Out)
        {
            Out = clamp(In, Min, Max);
        }
        
        void Unity_Add_float2(float2 A, float2 B, out float2 Out)
        {
            Out = A + B;
        }
        
        void Unity_DotProduct_float2(float2 A, float2 B, out float Out)
        {
            Out = dot(A, B);
        }
        
        void Unity_OneMinus_float(float In, out float Out)
        {
            Out = 1 - In;
        }
        
        void Unity_SquareRoot_float(float In, out float Out)
        {
            Out = sqrt(In);
        }
        
        void Unity_Clamp_float3(float3 In, float3 Min, float3 Max, out float3 Out)
        {
            Out = clamp(In, Min, Max);
        }
        
        void Unity_Normalize_float3(float3 In, out float3 Out)
        {
            Out = normalize(In);
        }
        
        void Unity_Branch_float3(float Predicate, float3 True, float3 False, out float3 Out)
        {
            Out = Predicate ? True : False;
        }
        
        struct Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float
        {
        float3 WorldSpaceNormal;
        float3 WorldSpaceTangent;
        float3 WorldSpaceBiTangent;
        float3 AbsoluteWorldSpacePosition;
        half4 uv0;
        half4 uv2;
        };
        
        void SG_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float(UnityTexture2D Texture2D_80A3D28F, float4 Vector4_82674548, float Boolean_9FF42DF6, UnitySamplerState _SamplerState, float Boolean_5ddfe6daabcc4715a44b5f34fc19becb, Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float IN, out float4 XZ_2)
        {
        float _Property_1ef12cf3201a938993fe6a7951b0e754_Out_0_Boolean = Boolean_9FF42DF6;
        UnityTexture2D _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D = Texture2D_80A3D28F;
        float _Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
        float _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
        float _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
        float _Split_89ed63cb625cb3878c183d0b71c03400_A_4_Float = 0;
        float4 _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4;
        float3 _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3;
        float2 _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, float(0), float(0), _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3, _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2);
        float4 _Property_3fa1d6f912feb481ba60f2e55e62e746_Out_0_Vector4 = Vector4_82674548;
        float _Split_a2e12fa5931da084b2949343a539dfd8_R_1_Float = _Property_3fa1d6f912feb481ba60f2e55e62e746_Out_0_Vector4[0];
        float _Split_a2e12fa5931da084b2949343a539dfd8_G_2_Float = _Property_3fa1d6f912feb481ba60f2e55e62e746_Out_0_Vector4[1];
        float _Split_a2e12fa5931da084b2949343a539dfd8_B_3_Float = _Property_3fa1d6f912feb481ba60f2e55e62e746_Out_0_Vector4[2];
        float _Split_a2e12fa5931da084b2949343a539dfd8_A_4_Float = _Property_3fa1d6f912feb481ba60f2e55e62e746_Out_0_Vector4[3];
        float _Divide_c36b770dfaa0bb8f85ab27da5fd794f0_Out_2_Float;
        Unity_Divide_float(float(1), _Split_a2e12fa5931da084b2949343a539dfd8_R_1_Float, _Divide_c36b770dfaa0bb8f85ab27da5fd794f0_Out_2_Float);
        float4 _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, (_Divide_c36b770dfaa0bb8f85ab27da5fd794f0_Out_2_Float.xxxx), _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4);
        float _Property_058f4fba88c3437288219f1929444bf2_Out_0_Boolean = Boolean_5ddfe6daabcc4715a44b5f34fc19becb;
        float4 _UV_43d85b3291324c848dfbeec6adac2a71_Out_0_Vector4 = IN.uv0;
        float4 _UV_36881dcaab9040168fc5215dcd00f352_Out_0_Vector4 = IN.uv2;
        float4 _Branch_8054d58a73be4ce1b22d48a84389ae07_Out_3_Vector4;
        Unity_Branch_float4(_Property_058f4fba88c3437288219f1929444bf2_Out_0_Boolean, _UV_43d85b3291324c848dfbeec6adac2a71_Out_0_Vector4, _UV_36881dcaab9040168fc5215dcd00f352_Out_0_Vector4, _Branch_8054d58a73be4ce1b22d48a84389ae07_Out_3_Vector4);
        float2 _Vector2_6845d21872714d889783b0cb707df3e9_Out_0_Vector2 = float2(_Split_a2e12fa5931da084b2949343a539dfd8_R_1_Float, _Split_a2e12fa5931da084b2949343a539dfd8_G_2_Float);
        float2 _Vector2_e2e2263627c6098e96a5b5d29350ad03_Out_0_Vector2 = float2(_Split_a2e12fa5931da084b2949343a539dfd8_B_3_Float, _Split_a2e12fa5931da084b2949343a539dfd8_A_4_Float);
        float2 _TilingAndOffset_17582d056c0b8a8dab1017d37497fe59_Out_3_Vector2;
        Unity_TilingAndOffset_float((_Branch_8054d58a73be4ce1b22d48a84389ae07_Out_3_Vector4.xy), _Vector2_6845d21872714d889783b0cb707df3e9_Out_0_Vector2, _Vector2_e2e2263627c6098e96a5b5d29350ad03_Out_0_Vector2, _TilingAndOffset_17582d056c0b8a8dab1017d37497fe59_Out_3_Vector2);
        float2 _Branch_1e152f3aac57448f8518bf2852c000c3_Out_3_Vector2;
        Unity_Branch_float2(_Property_1ef12cf3201a938993fe6a7951b0e754_Out_0_Boolean, (_Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4.xy), _TilingAndOffset_17582d056c0b8a8dab1017d37497fe59_Out_3_Vector2, _Branch_1e152f3aac57448f8518bf2852c000c3_Out_3_Vector2);
        UnitySamplerState _Property_69f1ed7efd1b494e91f626b88ab2363c_Out_0_SamplerState = _SamplerState;
        float4 _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, _Property_69f1ed7efd1b494e91f626b88ab2363c_Out_0_SamplerState.samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Branch_1e152f3aac57448f8518bf2852c000c3_Out_3_Vector2) );
        _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4);
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.r;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.g;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.b;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_A_7_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.a;
        float2 _Vector2_ad6bd100e273d78fa409a30a77bfa2cc_Out_0_Vector2 = float2(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float, _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float);
        float3 _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3;
        Unity_Sign_float3(IN.WorldSpaceNormal, _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3);
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_R_1_Float = _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3[0];
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_G_2_Float = _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3[1];
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_B_3_Float = _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3[2];
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_A_4_Float = 0;
        float2 _Vector2_b76cb1842101e58b9e636d49b075c612_Out_0_Vector2 = float2(_Split_6299d4ddcc4c74828aea40a46fdb896e_G_2_Float, float(1));
        float2 _Multiply_31e8db88ee20c985a9850d1a58f3282b_Out_2_Vector2;
        Unity_Multiply_float2_float2(_Vector2_ad6bd100e273d78fa409a30a77bfa2cc_Out_0_Vector2, _Vector2_b76cb1842101e58b9e636d49b075c612_Out_0_Vector2, _Multiply_31e8db88ee20c985a9850d1a58f3282b_Out_2_Vector2);
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_R_1_Float = IN.WorldSpaceNormal[0];
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_G_2_Float = IN.WorldSpaceNormal[1];
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_B_3_Float = IN.WorldSpaceNormal[2];
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_A_4_Float = 0;
        float2 _Vector2_70e5837843f28b8b9d64cada3697bd5a_Out_0_Vector2 = float2(_Split_5ed44bf2eca0868f81eb18100f49d1fa_R_1_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_B_3_Float);
        float2 _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2;
        Unity_Add_float2(_Multiply_31e8db88ee20c985a9850d1a58f3282b_Out_2_Vector2, _Vector2_70e5837843f28b8b9d64cada3697bd5a_Out_0_Vector2, _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2);
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_R_1_Float = _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2[0];
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_G_2_Float = _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2[1];
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_B_3_Float = 0;
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_A_4_Float = 0;
        float _Multiply_ab12aea87465a78eaf7fc66c2598d266_Out_2_Float;
        Unity_Multiply_float_float(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_G_2_Float, _Multiply_ab12aea87465a78eaf7fc66c2598d266_Out_2_Float);
        float3 _Vector3_433840b555db308b97e9b14b6a957195_Out_0_Vector3 = float3(_Split_2bc77ca2d17bd78cb2383770ce50b179_R_1_Float, _Multiply_ab12aea87465a78eaf7fc66c2598d266_Out_2_Float, _Split_2bc77ca2d17bd78cb2383770ce50b179_G_2_Float);
        float3 _Transform_c7914cc45a011c89b3f53c55afb51673_Out_1_Vector3;
        {
        float3x3 tangentTransform = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
        _Transform_c7914cc45a011c89b3f53c55afb51673_Out_1_Vector3 = TransformWorldToTangentDir(_Vector3_433840b555db308b97e9b14b6a957195_Out_0_Vector3.xyz, tangentTransform, true);
        }
        float3 _Clamp_3837949a36b5428a82af01e7bcd29952_Out_3_Vector3;
        Unity_Clamp_float3(_Transform_c7914cc45a011c89b3f53c55afb51673_Out_1_Vector3, float3(-1, -1, -1), float3(1, 1, 1), _Clamp_3837949a36b5428a82af01e7bcd29952_Out_3_Vector3);
        float3 _Normalize_09bf8a2bd0a4d38e8b97d5c674f79b44_Out_1_Vector3;
        Unity_Normalize_float3(_Clamp_3837949a36b5428a82af01e7bcd29952_Out_3_Vector3, _Normalize_09bf8a2bd0a4d38e8b97d5c674f79b44_Out_1_Vector3);
        float3 _Branch_9eadf909a90f2f80880f8c56ecc2a91f_Out_3_Vector3;
        Unity_Branch_float3(_Property_1ef12cf3201a938993fe6a7951b0e754_Out_0_Boolean, _Normalize_09bf8a2bd0a4d38e8b97d5c674f79b44_Out_1_Vector3, (_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.xyz), _Branch_9eadf909a90f2f80880f8c56ecc2a91f_Out_3_Vector3);
        XZ_2 = (float4(_Branch_9eadf909a90f2f80880f8c56ecc2a91f_Out_3_Vector3, 1.0));
        }
        
        void Unity_NormalStrength_float(float3 In, float Strength, out float3 Out)
        {
            Out = float3(In.rg * Strength, lerp(1, In.b, saturate(Strength)));
        }
        
        void Unity_NormalBlend_float(float3 A, float3 B, out float3 Out)
        {
            Out = SafeNormalize(float3(A.rg + B.rg, A.b * B.b));
        }
        
        void Unity_Add_float3(float3 A, float3 B, out float3 Out)
        {
            Out = A + B;
        }
        
        void Unity_Divide_float3(float3 A, float3 B, out float3 Out)
        {
            Out = A / B;
        }
        
        struct Bindings_TriplanarNMn_059da9746584140498cd018db3c76047_float
        {
        float3 WorldSpaceNormal;
        float3 WorldSpaceTangent;
        float3 WorldSpaceBiTangent;
        float3 WorldSpacePosition;
        };
        
        void SG_TriplanarNMn_059da9746584140498cd018db3c76047_float(UnityTexture2D Texture2D_80A3D28F, float Vector1_41461AC9, float Vector1_E4D1C13A, Bindings_TriplanarNMn_059da9746584140498cd018db3c76047_float IN, out float4 XYZ_1, out float4 XZ_2, out float4 YZ_3, out float4 XY_4)
        {
        UnityTexture2D _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D = Texture2D_80A3D28F;
        float _Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float = IN.WorldSpacePosition[0];
        float _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float = IN.WorldSpacePosition[1];
        float _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float = IN.WorldSpacePosition[2];
        float _Split_89ed63cb625cb3878c183d0b71c03400_A_4_Float = 0;
        float4 _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4;
        float3 _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3;
        float2 _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, float(0), float(0), _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3, _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2);
        float _Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float = Vector1_41461AC9;
        float4 _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, (_Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float.xxxx), _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4);
        float3 _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3;
        Unity_Sign_float3(IN.WorldSpaceNormal, _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3);
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_R_1_Float = _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3[0];
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_G_2_Float = _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3[1];
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_B_3_Float = _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3[2];
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_A_4_Float = 0;
        float2 _Vector2_b76cb1842101e58b9e636d49b075c612_Out_0_Vector2 = float2(_Split_6299d4ddcc4c74828aea40a46fdb896e_G_2_Float, float(1));
        float2 _Multiply_a87753ad90594382bf3a3a95abbadbc8_Out_2_Vector2;
        Unity_Multiply_float2_float2((_Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4.xy), _Vector2_b76cb1842101e58b9e636d49b075c612_Out_0_Vector2, _Multiply_a87753ad90594382bf3a3a95abbadbc8_Out_2_Vector2);
        float4 _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Multiply_a87753ad90594382bf3a3a95abbadbc8_Out_2_Vector2) );
        _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4);
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.r;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.g;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.b;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_A_7_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.a;
        float2 _Vector2_ad6bd100e273d78fa409a30a77bfa2cc_Out_0_Vector2 = float2(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float, _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float);
        float2 _Multiply_31e8db88ee20c985a9850d1a58f3282b_Out_2_Vector2;
        Unity_Multiply_float2_float2(_Vector2_ad6bd100e273d78fa409a30a77bfa2cc_Out_0_Vector2, _Vector2_b76cb1842101e58b9e636d49b075c612_Out_0_Vector2, _Multiply_31e8db88ee20c985a9850d1a58f3282b_Out_2_Vector2);
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_R_1_Float = IN.WorldSpaceNormal[0];
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_G_2_Float = IN.WorldSpaceNormal[1];
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_B_3_Float = IN.WorldSpaceNormal[2];
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_A_4_Float = 0;
        float2 _Vector2_70e5837843f28b8b9d64cada3697bd5a_Out_0_Vector2 = float2(_Split_5ed44bf2eca0868f81eb18100f49d1fa_R_1_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_B_3_Float);
        float2 _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2;
        Unity_Add_float2(_Multiply_31e8db88ee20c985a9850d1a58f3282b_Out_2_Vector2, _Vector2_70e5837843f28b8b9d64cada3697bd5a_Out_0_Vector2, _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2);
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_R_1_Float = _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2[0];
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_G_2_Float = _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2[1];
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_B_3_Float = 0;
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_A_4_Float = 0;
        float _Multiply_e4fe778b81456d819c52bb414cd95968_Out_2_Float;
        Unity_Multiply_float_float(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_G_2_Float, _Multiply_e4fe778b81456d819c52bb414cd95968_Out_2_Float);
        float3 _Vector3_08f62c5c01619e849f1a7d85a44531ac_Out_0_Vector3 = float3(_Split_2bc77ca2d17bd78cb2383770ce50b179_R_1_Float, _Multiply_e4fe778b81456d819c52bb414cd95968_Out_2_Float, _Split_2bc77ca2d17bd78cb2383770ce50b179_G_2_Float);
        float3 _Absolute_644b798714827680b39bf5d34f70385f_Out_1_Vector3;
        Unity_Absolute_float3(IN.WorldSpaceNormal, _Absolute_644b798714827680b39bf5d34f70385f_Out_1_Vector3);
        float _Property_adc4c59482221c8aad681c6558728ac9_Out_0_Float = Vector1_E4D1C13A;
        float3 _Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3;
        Unity_Power_float3(_Absolute_644b798714827680b39bf5d34f70385f_Out_1_Vector3, (_Property_adc4c59482221c8aad681c6558728ac9_Out_0_Float.xxx), _Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3);
        float3 _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3, _Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3, _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3);
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_R_1_Float = _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3[0];
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_G_2_Float = _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3[1];
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_B_3_Float = _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3[2];
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_A_4_Float = 0;
        float3 _Multiply_2e1040ca9c98d085ace76ee93f094039_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Vector3_08f62c5c01619e849f1a7d85a44531ac_Out_0_Vector3, (_Split_ae83014fcbd9f7879a0b91fa66dc9718_G_2_Float.xxx), _Multiply_2e1040ca9c98d085ace76ee93f094039_Out_2_Vector3);
        float4 _Combine_192c2c4a69be588b90ca005a32e22552_RGBA_4_Vector4;
        float3 _Combine_192c2c4a69be588b90ca005a32e22552_RGB_5_Vector3;
        float2 _Combine_192c2c4a69be588b90ca005a32e22552_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float, float(0), float(0), _Combine_192c2c4a69be588b90ca005a32e22552_RGBA_4_Vector4, _Combine_192c2c4a69be588b90ca005a32e22552_RGB_5_Vector3, _Combine_192c2c4a69be588b90ca005a32e22552_RG_6_Vector2);
        float4 _Multiply_138240d0d4846e87b0febabec0d6891b_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_192c2c4a69be588b90ca005a32e22552_RGBA_4_Vector4, (_Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float.xxxx), _Multiply_138240d0d4846e87b0febabec0d6891b_Out_2_Vector4);
        float _Multiply_de711f4a4614bd89a463b53374cf4036_Out_2_Float;
        Unity_Multiply_float_float(_Split_6299d4ddcc4c74828aea40a46fdb896e_B_3_Float, -1, _Multiply_de711f4a4614bd89a463b53374cf4036_Out_2_Float);
        float2 _Vector2_4ed33f0c73b2698fa6f3c1b77fe76808_Out_0_Vector2 = float2(_Multiply_de711f4a4614bd89a463b53374cf4036_Out_2_Float, float(1));
        float2 _Multiply_2af6058cc6ccb88caefd2799bb5941e8_Out_2_Vector2;
        Unity_Multiply_float2_float2((_Multiply_138240d0d4846e87b0febabec0d6891b_Out_2_Vector4.xy), _Vector2_4ed33f0c73b2698fa6f3c1b77fe76808_Out_0_Vector2, _Multiply_2af6058cc6ccb88caefd2799bb5941e8_Out_2_Vector2);
        float4 _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Multiply_2af6058cc6ccb88caefd2799bb5941e8_Out_2_Vector2) );
        _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4);
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_R_4_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.r;
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_G_5_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.g;
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_B_6_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.b;
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_A_7_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.a;
        float2 _Vector2_fe9aedd4528c7486ada4abdca0b0944e_Out_0_Vector2 = float2(_SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_R_4_Float, _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_G_5_Float);
        float2 _Multiply_02b9b4665ad9918d8721bcaddc82f06f_Out_2_Vector2;
        Unity_Multiply_float2_float2(_Vector2_fe9aedd4528c7486ada4abdca0b0944e_Out_0_Vector2, _Vector2_4ed33f0c73b2698fa6f3c1b77fe76808_Out_0_Vector2, _Multiply_02b9b4665ad9918d8721bcaddc82f06f_Out_2_Vector2);
        float2 _Vector2_a74a85274da15181abb63cc5e8df0de1_Out_0_Vector2 = float2(_Split_5ed44bf2eca0868f81eb18100f49d1fa_R_1_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_G_2_Float);
        float2 _Add_b227c84042055e8faa1a9fdc69529707_Out_2_Vector2;
        Unity_Add_float2(_Multiply_02b9b4665ad9918d8721bcaddc82f06f_Out_2_Vector2, _Vector2_a74a85274da15181abb63cc5e8df0de1_Out_0_Vector2, _Add_b227c84042055e8faa1a9fdc69529707_Out_2_Vector2);
        float _Split_2cfb9eacd8762483941459cdf28bda97_R_1_Float = _Add_b227c84042055e8faa1a9fdc69529707_Out_2_Vector2[0];
        float _Split_2cfb9eacd8762483941459cdf28bda97_G_2_Float = _Add_b227c84042055e8faa1a9fdc69529707_Out_2_Vector2[1];
        float _Split_2cfb9eacd8762483941459cdf28bda97_B_3_Float = 0;
        float _Split_2cfb9eacd8762483941459cdf28bda97_A_4_Float = 0;
        float _Multiply_1d65ce08ce672087879125f2e13c4004_Out_2_Float;
        Unity_Multiply_float_float(_SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_B_6_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_B_3_Float, _Multiply_1d65ce08ce672087879125f2e13c4004_Out_2_Float);
        float3 _Vector3_ba6cfb4671e8c58f9b41ea1dc23102ca_Out_0_Vector3 = float3(_Split_2cfb9eacd8762483941459cdf28bda97_R_1_Float, _Split_2cfb9eacd8762483941459cdf28bda97_G_2_Float, _Multiply_1d65ce08ce672087879125f2e13c4004_Out_2_Float);
        float3 _Multiply_7bb4009c92b108849ac6ca92bc1442f2_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Vector3_ba6cfb4671e8c58f9b41ea1dc23102ca_Out_0_Vector3, (_Split_ae83014fcbd9f7879a0b91fa66dc9718_B_3_Float.xxx), _Multiply_7bb4009c92b108849ac6ca92bc1442f2_Out_2_Vector3);
        float4 _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGBA_4_Vector4;
        float3 _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGB_5_Vector3;
        float2 _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float, float(0), float(0), _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGBA_4_Vector4, _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGB_5_Vector3, _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RG_6_Vector2);
        float4 _Multiply_2c0864423b014f8b8af8523f68cbb63c_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGBA_4_Vector4, (_Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float.xxxx), _Multiply_2c0864423b014f8b8af8523f68cbb63c_Out_2_Vector4);
        float2 _Vector2_a1e23e0f921b6484818f009a2b12a5ba_Out_0_Vector2 = float2(_Split_6299d4ddcc4c74828aea40a46fdb896e_R_1_Float, float(1));
        float2 _Multiply_862402885a49f18cb87278ab53bc6744_Out_2_Vector2;
        Unity_Multiply_float2_float2((_Multiply_2c0864423b014f8b8af8523f68cbb63c_Out_2_Vector4.xy), _Vector2_a1e23e0f921b6484818f009a2b12a5ba_Out_0_Vector2, _Multiply_862402885a49f18cb87278ab53bc6744_Out_2_Vector2);
        float4 _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Multiply_862402885a49f18cb87278ab53bc6744_Out_2_Vector2) );
        _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4);
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_R_4_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.r;
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_G_5_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.g;
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_B_6_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.b;
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_A_7_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.a;
        float _Multiply_4649b768be76d784a3284bacde795359_Out_2_Float;
        Unity_Multiply_float_float(_SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_B_6_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_R_1_Float, _Multiply_4649b768be76d784a3284bacde795359_Out_2_Float);
        float2 _Vector2_819fcd5eb484438eacad1987576d7d67_Out_0_Vector2 = float2(_SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_R_4_Float, _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_G_5_Float);
        float2 _Multiply_58530ebb3c6d798b93686a76247bf505_Out_2_Vector2;
        Unity_Multiply_float2_float2(_Vector2_819fcd5eb484438eacad1987576d7d67_Out_0_Vector2, _Vector2_a1e23e0f921b6484818f009a2b12a5ba_Out_0_Vector2, _Multiply_58530ebb3c6d798b93686a76247bf505_Out_2_Vector2);
        float2 _Vector2_e293c112b2f49e88a5fe46dfb1fbeb40_Out_0_Vector2 = float2(_Split_5ed44bf2eca0868f81eb18100f49d1fa_B_3_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_G_2_Float);
        float2 _Add_cf00fb232c6e2b8e973ab2f84453f55e_Out_2_Vector2;
        Unity_Add_float2(_Multiply_58530ebb3c6d798b93686a76247bf505_Out_2_Vector2, _Vector2_e293c112b2f49e88a5fe46dfb1fbeb40_Out_0_Vector2, _Add_cf00fb232c6e2b8e973ab2f84453f55e_Out_2_Vector2);
        float _Split_3ea3e61d32bdd78f82c686b75ff3fd9b_R_1_Float = _Add_cf00fb232c6e2b8e973ab2f84453f55e_Out_2_Vector2[0];
        float _Split_3ea3e61d32bdd78f82c686b75ff3fd9b_G_2_Float = _Add_cf00fb232c6e2b8e973ab2f84453f55e_Out_2_Vector2[1];
        float _Split_3ea3e61d32bdd78f82c686b75ff3fd9b_B_3_Float = 0;
        float _Split_3ea3e61d32bdd78f82c686b75ff3fd9b_A_4_Float = 0;
        float3 _Vector3_13a08d5940172a84a78ee3d9b8766833_Out_0_Vector3 = float3(_Multiply_4649b768be76d784a3284bacde795359_Out_2_Float, _Split_3ea3e61d32bdd78f82c686b75ff3fd9b_G_2_Float, _Split_3ea3e61d32bdd78f82c686b75ff3fd9b_R_1_Float);
        float3 _Multiply_77818c22e359fc8cbb7dd20216a8db72_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Vector3_13a08d5940172a84a78ee3d9b8766833_Out_0_Vector3, (_Split_ae83014fcbd9f7879a0b91fa66dc9718_R_1_Float.xxx), _Multiply_77818c22e359fc8cbb7dd20216a8db72_Out_2_Vector3);
        float3 _Add_769d9ee909c9238dbbf72d2800a2f268_Out_2_Vector3;
        Unity_Add_float3(_Multiply_7bb4009c92b108849ac6ca92bc1442f2_Out_2_Vector3, _Multiply_77818c22e359fc8cbb7dd20216a8db72_Out_2_Vector3, _Add_769d9ee909c9238dbbf72d2800a2f268_Out_2_Vector3);
        float3 _Add_14295f72880e4b87a1baf1ced943ac40_Out_2_Vector3;
        Unity_Add_float3(_Multiply_2e1040ca9c98d085ace76ee93f094039_Out_2_Vector3, _Add_769d9ee909c9238dbbf72d2800a2f268_Out_2_Vector3, _Add_14295f72880e4b87a1baf1ced943ac40_Out_2_Vector3);
        float _Add_e59af300bba2498db32eac1412123447_Out_2_Float;
        Unity_Add_float(_Split_ae83014fcbd9f7879a0b91fa66dc9718_R_1_Float, _Split_ae83014fcbd9f7879a0b91fa66dc9718_G_2_Float, _Add_e59af300bba2498db32eac1412123447_Out_2_Float);
        float _Add_e855069f047fae8ea9027d56acb61e56_Out_2_Float;
        Unity_Add_float(_Add_e59af300bba2498db32eac1412123447_Out_2_Float, _Split_ae83014fcbd9f7879a0b91fa66dc9718_B_3_Float, _Add_e855069f047fae8ea9027d56acb61e56_Out_2_Float);
        float3 _Divide_91ae4b94f1d9b78e99d0472293b8098c_Out_2_Vector3;
        Unity_Divide_float3(_Add_14295f72880e4b87a1baf1ced943ac40_Out_2_Vector3, (_Add_e855069f047fae8ea9027d56acb61e56_Out_2_Float.xxx), _Divide_91ae4b94f1d9b78e99d0472293b8098c_Out_2_Vector3);
        float3 _Transform_73eecc0c3689d184a34c8d0f28a58adf_Out_1_Vector3;
        {
        float3x3 tangentTransform = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
        _Transform_73eecc0c3689d184a34c8d0f28a58adf_Out_1_Vector3 = TransformWorldToTangentDir(_Divide_91ae4b94f1d9b78e99d0472293b8098c_Out_2_Vector3.xyz, tangentTransform, true);
        }
        float3 _Normalize_15ef346824db0a8797631ed8b998e673_Out_1_Vector3;
        Unity_Normalize_float3(_Transform_73eecc0c3689d184a34c8d0f28a58adf_Out_1_Vector3, _Normalize_15ef346824db0a8797631ed8b998e673_Out_1_Vector3);
        XYZ_1 = (float4(_Normalize_15ef346824db0a8797631ed8b998e673_Out_1_Vector3, 1.0));
        XZ_2 = (float4(_Vector3_08f62c5c01619e849f1a7d85a44531ac_Out_0_Vector3, 1.0));
        YZ_3 = (float4(_Vector3_ba6cfb4671e8c58f9b41ea1dc23102ca_Out_0_Vector3, 1.0));
        XY_4 = (float4(_Vector3_13a08d5940172a84a78ee3d9b8766833_Out_0_Vector3, 1.0));
        }
        
        void Unity_Subtract_float(float A, float B, out float Out)
        {
            Out = A - B;
        }
        
        void Unity_Power_float(float A, float B, out float Out)
        {
            Out = pow(A, B);
        }
        
        void Unity_Lerp_float3(float3 A, float3 B, float3 T, out float3 Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Remap_float(float In, float2 InMinMax, float2 OutMinMax, out float Out)
        {
            Out = OutMinMax.x + (In - InMinMax.x) * (OutMinMax.y - OutMinMax.x) / (InMinMax.y - InMinMax.x);
        }
        
        // Custom interpolators pre vertex
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPreVertex' */
        
        // Graph Vertex
        struct VertexDescription
        {
            float3 Position;
            float3 Normal;
            float3 Tangent;
        };
        
        VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
        {
            VertexDescription description = (VertexDescription)0;
            description.Position = IN.ObjectSpacePosition;
            description.Normal = IN.ObjectSpaceNormal;
            description.Tangent = IN.ObjectSpaceTangent;
            return description;
        }
        
        // Custom interpolators, pre surface
        #ifdef FEATURES_GRAPH_VERTEX
        Varyings CustomInterpolatorPassThroughFunc(inout Varyings output, VertexDescription input)
        {
        return output;
        }
        #define CUSTOMINTERPOLATOR_VARYPASSTHROUGH_FUNC
        #endif
        
        // Graph Pixel
        struct SurfaceDescription
        {
            float3 BaseColor;
            float Alpha;
            float AlphaClipThreshold;
        };
        
        SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
        {
            SurfaceDescription surface = (SurfaceDescription)0;
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_05d49814100eb3808cd61a6177622291_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseColorMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_e21be9beec8d858fa2818b2fddc4577c_Out_0_Vector4 = _BaseTilingOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_1b1963c0ccb4d78fa3474b362fd31d15_Out_0_Boolean = _BaseUsePlanarUV;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae;
            _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae.uv0 = IN.uv0;
            _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae.uv2 = IN.uv2;
            float4 _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_05d49814100eb3808cd61a6177622291_Out_0_Texture2D, _Property_e21be9beec8d858fa2818b2fddc4577c_Out_0_Vector4, _Property_1b1963c0ccb4d78fa3474b362fd31d15_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), 1, _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae, _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae_XZ_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_03a155c84233b98dbb11cd710d6e1539_Out_0_Vector4 = _BaseColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Multiply_9cb5181459454189b39d6838c2a6fb85_Out_2_Vector4;
            Unity_Multiply_float4_float4(_PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae_XZ_2_Vector4, _Property_03a155c84233b98dbb11cd710d6e1539_Out_0_Vector4, _Multiply_9cb5181459454189b39d6838c2a6fb85_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_b26f64bfa09eb48584b1dc9133f5b840_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_DetailMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_bb28507cb268918795cf74b32a6b3693_Out_0_Vector4 = _DetailTilingOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_a5f9848f7817b48ca226ca228efcc28e_R_1_Float = _Property_bb28507cb268918795cf74b32a6b3693_Out_0_Vector4[0];
            float _Split_a5f9848f7817b48ca226ca228efcc28e_G_2_Float = _Property_bb28507cb268918795cf74b32a6b3693_Out_0_Vector4[1];
            float _Split_a5f9848f7817b48ca226ca228efcc28e_B_3_Float = _Property_bb28507cb268918795cf74b32a6b3693_Out_0_Vector4[2];
            float _Split_a5f9848f7817b48ca226ca228efcc28e_A_4_Float = _Property_bb28507cb268918795cf74b32a6b3693_Out_0_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_257255e4b3cee8888b124cb1330da379_Out_0_Vector2 = float2(_Split_a5f9848f7817b48ca226ca228efcc28e_R_1_Float, _Split_a5f9848f7817b48ca226ca228efcc28e_G_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_2ba978ab0f3ccc84b3fe592845432576_Out_0_Vector2 = float2(_Split_a5f9848f7817b48ca226ca228efcc28e_B_3_Float, _Split_a5f9848f7817b48ca226ca228efcc28e_A_4_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _TilingAndOffset_9bc6b1e938f4668f9476625fa68aff4e_Out_3_Vector2;
            Unity_TilingAndOffset_float(IN.uv0.xy, _Vector2_257255e4b3cee8888b124cb1330da379_Out_0_Vector2, _Vector2_2ba978ab0f3ccc84b3fe592845432576_Out_0_Vector2, _TilingAndOffset_9bc6b1e938f4668f9476625fa68aff4e_Out_3_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_b26f64bfa09eb48584b1dc9133f5b840_Out_0_Texture2D.tex, _Property_b26f64bfa09eb48584b1dc9133f5b840_Out_0_Texture2D.samplerstate, _Property_b26f64bfa09eb48584b1dc9133f5b840_Out_0_Texture2D.GetTransformedUV(_TilingAndOffset_9bc6b1e938f4668f9476625fa68aff4e_Out_3_Vector2) );
            float _SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_R_4_Float = _SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_RGBA_0_Vector4.r;
            float _SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_G_5_Float = _SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_RGBA_0_Vector4.g;
            float _SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_B_6_Float = _SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_RGBA_0_Vector4.b;
            float _SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_A_7_Float = _SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_99a7a45efebe0588afbd74b8df9b4750_Out_2_Float;
            Unity_Multiply_float_float(_SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_R_4_Float, 2, _Multiply_99a7a45efebe0588afbd74b8df9b4750_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_ddcd7f2c8505e0818230ed34d7ecdf92_Out_2_Float;
            Unity_Add_float(_Multiply_99a7a45efebe0588afbd74b8df9b4750_Out_2_Float, float(-1), _Add_ddcd7f2c8505e0818230ed34d7ecdf92_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_b7367df1085ac580b7d5b9785921d152_Out_0_Float = _DetailAlbedoScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_874d814eeb0e7782842ad64a4d97f43e_Out_2_Float;
            Unity_Multiply_float_float(_Add_ddcd7f2c8505e0818230ed34d7ecdf92_Out_2_Float, _Property_b7367df1085ac580b7d5b9785921d152_Out_0_Float, _Multiply_874d814eeb0e7782842ad64a4d97f43e_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Saturate_40d0c48fa8fb008799c2060b9ccfede9_Out_1_Float;
            Unity_Saturate_float(_Multiply_874d814eeb0e7782842ad64a4d97f43e_Out_2_Float, _Saturate_40d0c48fa8fb008799c2060b9ccfede9_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Absolute_7ea0f8a0aaf24186a357f11eca841a0c_Out_1_Float;
            Unity_Absolute_float(_Saturate_40d0c48fa8fb008799c2060b9ccfede9_Out_1_Float, _Absolute_7ea0f8a0aaf24186a357f11eca841a0c_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_BlendOverlayBaseColor_acdb3dfca72bd6b42bbc35f4613331a2_float _BlendOverlayBaseColor_9ac50a6865d3648181da5f6189b8832d;
            float3 _BlendOverlayBaseColor_9ac50a6865d3648181da5f6189b8832d_OutVector4_1_Vector3;
            SG_BlendOverlayBaseColor_acdb3dfca72bd6b42bbc35f4613331a2_float(_Multiply_9cb5181459454189b39d6838c2a6fb85_Out_2_Vector4, _Add_ddcd7f2c8505e0818230ed34d7ecdf92_Out_2_Float, _Absolute_7ea0f8a0aaf24186a357f11eca841a0c_Out_1_Float, _BlendOverlayBaseColor_9ac50a6865d3648181da5f6189b8832d, _BlendOverlayBaseColor_9ac50a6865d3648181da5f6189b8832d_OutVector4_1_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_5d67b392da5ceb81b51a3bfe5384ad00_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverBaseColorMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_e95f6f4e76cecb87871151040535a080_Out_0_Vector4 = _CoverTilingOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Divide_acbbd9727ffda783aeafe28ccafbde8e_Out_2_Vector4;
            Unity_Divide_float4(float4(1, 1, 0, 0), _Property_e95f6f4e76cecb87871151040535a080_Out_0_Vector4, _Divide_acbbd9727ffda783aeafe28ccafbde8e_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_faa4f436225f4e8eb99135b1d078135e_Out_0_Float = _CoverTriplanarThreshold;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_cd8ee86e67e5fe898c7968f92e11e481;
            _TriplanarNM_cd8ee86e67e5fe898c7968f92e11e481.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_cd8ee86e67e5fe898c7968f92e11e481.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_cd8ee86e67e5fe898c7968f92e11e481_XYZ_1_Vector4;
            float4 _TriplanarNM_cd8ee86e67e5fe898c7968f92e11e481_XZ_2_Vector4;
            float4 _TriplanarNM_cd8ee86e67e5fe898c7968f92e11e481_YZ_3_Vector4;
            float4 _TriplanarNM_cd8ee86e67e5fe898c7968f92e11e481_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_5d67b392da5ceb81b51a3bfe5384ad00_Out_0_Texture2D, (_Divide_acbbd9727ffda783aeafe28ccafbde8e_Out_2_Vector4).x, _Property_faa4f436225f4e8eb99135b1d078135e_Out_0_Float, _TriplanarNM_cd8ee86e67e5fe898c7968f92e11e481, _TriplanarNM_cd8ee86e67e5fe898c7968f92e11e481_XYZ_1_Vector4, _TriplanarNM_cd8ee86e67e5fe898c7968f92e11e481_XZ_2_Vector4, _TriplanarNM_cd8ee86e67e5fe898c7968f92e11e481_YZ_3_Vector4, _TriplanarNM_cd8ee86e67e5fe898c7968f92e11e481_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_65c5d9a1688ae98ba437bc3f4b866f99_Out_0_Vector4 = _CoverBaseColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Multiply_b7294cbf7c9daa85b18c13beaf3dc8bd_Out_2_Vector4;
            Unity_Multiply_float4_float4(_TriplanarNM_cd8ee86e67e5fe898c7968f92e11e481_XYZ_1_Vector4, _Property_65c5d9a1688ae98ba437bc3f4b866f99_Out_0_Vector4, _Multiply_b7294cbf7c9daa85b18c13beaf3dc8bd_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_43c6facd1f553289befba1782fe8ad70_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverMaskA);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _UV_5b74fb710ad3d187a00f16e1d8f8bd63_Out_0_Vector4 = IN.uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _SampleTexture2D_4d4c63c65e48c28ba5f624928f181789_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_43c6facd1f553289befba1782fe8ad70_Out_0_Texture2D.tex, _Property_43c6facd1f553289befba1782fe8ad70_Out_0_Texture2D.samplerstate, _Property_43c6facd1f553289befba1782fe8ad70_Out_0_Texture2D.GetTransformedUV((_UV_5b74fb710ad3d187a00f16e1d8f8bd63_Out_0_Vector4.xy)) );
            float _SampleTexture2D_4d4c63c65e48c28ba5f624928f181789_R_4_Float = _SampleTexture2D_4d4c63c65e48c28ba5f624928f181789_RGBA_0_Vector4.r;
            float _SampleTexture2D_4d4c63c65e48c28ba5f624928f181789_G_5_Float = _SampleTexture2D_4d4c63c65e48c28ba5f624928f181789_RGBA_0_Vector4.g;
            float _SampleTexture2D_4d4c63c65e48c28ba5f624928f181789_B_6_Float = _SampleTexture2D_4d4c63c65e48c28ba5f624928f181789_RGBA_0_Vector4.b;
            float _SampleTexture2D_4d4c63c65e48c28ba5f624928f181789_A_7_Float = _SampleTexture2D_4d4c63c65e48c28ba5f624928f181789_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_4080f51767261687a64910057bc980cb_Out_0_Float = _CoverMaskPower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_2660ad962697408681e2e8c36648ca12_Out_2_Float;
            Unity_Multiply_float_float(_SampleTexture2D_4d4c63c65e48c28ba5f624928f181789_A_7_Float, _Property_4080f51767261687a64910057bc980cb_Out_0_Float, _Multiply_2660ad962697408681e2e8c36648ca12_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_572d83500486058c99890c5d609b30b0_Out_3_Float;
            Unity_Clamp_float(_Multiply_2660ad962697408681e2e8c36648ca12_Out_2_Float, float(0), float(1), _Clamp_572d83500486058c99890c5d609b30b0_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Property_3d047323d7f9778ca2b1b7d7d4d43210_Out_0_Vector3 = _CoverDirection;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_3f76f18aa45a858dab65f5835e23f0b9_Out_0_Vector2 = float2(_SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_A_7_Float, _SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_G_5_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Multiply_a3cb438c86db8a839543847f1fa26666_Out_2_Vector2;
            Unity_Multiply_float2_float2(_Vector2_3f76f18aa45a858dab65f5835e23f0b9_Out_0_Vector2, float2(2, 2), _Multiply_a3cb438c86db8a839543847f1fa26666_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Add_21eb70b8cab75f8a852dd8dd64767430_Out_2_Vector2;
            Unity_Add_float2(_Multiply_a3cb438c86db8a839543847f1fa26666_Out_2_Vector2, float2(-1, -1), _Add_21eb70b8cab75f8a852dd8dd64767430_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_cbbb2e4ef035b58e8c751d96843d987e_Out_0_Float = _DetailNormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Multiply_d4afe7aea32def8ca3c89b2f7e87af44_Out_2_Vector2;
            Unity_Multiply_float2_float2(_Add_21eb70b8cab75f8a852dd8dd64767430_Out_2_Vector2, (_Property_cbbb2e4ef035b58e8c751d96843d987e_Out_0_Float.xx), _Multiply_d4afe7aea32def8ca3c89b2f7e87af44_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_f88dc76333998681a9031ef1324e052a_R_1_Float = _Multiply_d4afe7aea32def8ca3c89b2f7e87af44_Out_2_Vector2[0];
            float _Split_f88dc76333998681a9031ef1324e052a_G_2_Float = _Multiply_d4afe7aea32def8ca3c89b2f7e87af44_Out_2_Vector2[1];
            float _Split_f88dc76333998681a9031ef1324e052a_B_3_Float = 0;
            float _Split_f88dc76333998681a9031ef1324e052a_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _DotProduct_970a707dd71afa80887b08c47998be6e_Out_2_Float;
            Unity_DotProduct_float2(_Multiply_d4afe7aea32def8ca3c89b2f7e87af44_Out_2_Vector2, _Multiply_d4afe7aea32def8ca3c89b2f7e87af44_Out_2_Vector2, _DotProduct_970a707dd71afa80887b08c47998be6e_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Saturate_6a42dc6ad32c63849dbf7844d1081b82_Out_1_Float;
            Unity_Saturate_float(_DotProduct_970a707dd71afa80887b08c47998be6e_Out_2_Float, _Saturate_6a42dc6ad32c63849dbf7844d1081b82_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_a724d53a195cd387a0d6ec2d11ec64e8_Out_1_Float;
            Unity_OneMinus_float(_Saturate_6a42dc6ad32c63849dbf7844d1081b82_Out_1_Float, _OneMinus_a724d53a195cd387a0d6ec2d11ec64e8_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _SquareRoot_6e074ca49330118a958f11e9487fe5c6_Out_1_Float;
            Unity_SquareRoot_float(_OneMinus_a724d53a195cd387a0d6ec2d11ec64e8_Out_1_Float, _SquareRoot_6e074ca49330118a958f11e9487fe5c6_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Vector3_a6a5e3fb326314838a5e436f55de8dcc_Out_0_Vector3 = float3(_Split_f88dc76333998681a9031ef1324e052a_R_1_Float, _Split_f88dc76333998681a9031ef1324e052a_G_2_Float, _SquareRoot_6e074ca49330118a958f11e9487fe5c6_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_2e4a88374e8ffd8db37352d79f10740a_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseNormalMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float _PlanarNMn_126f337c769a878bb33ea56bcab1d637;
            _PlanarNMn_126f337c769a878bb33ea56bcab1d637.WorldSpaceNormal = IN.WorldSpaceNormal;
            _PlanarNMn_126f337c769a878bb33ea56bcab1d637.WorldSpaceTangent = IN.WorldSpaceTangent;
            _PlanarNMn_126f337c769a878bb33ea56bcab1d637.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _PlanarNMn_126f337c769a878bb33ea56bcab1d637.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNMn_126f337c769a878bb33ea56bcab1d637.uv0 = IN.uv0;
            _PlanarNMn_126f337c769a878bb33ea56bcab1d637.uv2 = IN.uv2;
            float4 _PlanarNMn_126f337c769a878bb33ea56bcab1d637_XZ_2_Vector4;
            SG_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float(_Property_2e4a88374e8ffd8db37352d79f10740a_Out_0_Texture2D, _Property_e21be9beec8d858fa2818b2fddc4577c_Out_0_Vector4, _Property_1b1963c0ccb4d78fa3474b362fd31d15_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), 1, _PlanarNMn_126f337c769a878bb33ea56bcab1d637, _PlanarNMn_126f337c769a878bb33ea56bcab1d637_XZ_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_ea100595101f088a94e70278a910a34c_Out_0_Float = _BaseNormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _NormalStrength_70f3e500f60967898e02d8fc8200db59_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_126f337c769a878bb33ea56bcab1d637_XZ_2_Vector4.xyz), _Property_ea100595101f088a94e70278a910a34c_Out_0_Float, _NormalStrength_70f3e500f60967898e02d8fc8200db59_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _NormalBlend_58a0c0d45b55168cbfa43fa9d9da21c6_Out_2_Vector3;
            Unity_NormalBlend_float(_Vector3_a6a5e3fb326314838a5e436f55de8dcc_Out_0_Vector3, _NormalStrength_70f3e500f60967898e02d8fc8200db59_Out_2_Vector3, _NormalBlend_58a0c0d45b55168cbfa43fa9d9da21c6_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_bb2720e978ff4782bb872fb7b877636f_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverNormalMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNMn_059da9746584140498cd018db3c76047_float _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b;
            _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b.WorldSpaceTangent = IN.WorldSpaceTangent;
            _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b.WorldSpacePosition = IN.WorldSpacePosition;
            float4 _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b_XYZ_1_Vector4;
            float4 _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b_XZ_2_Vector4;
            float4 _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b_YZ_3_Vector4;
            float4 _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b_XY_4_Vector4;
            SG_TriplanarNMn_059da9746584140498cd018db3c76047_float(_Property_bb2720e978ff4782bb872fb7b877636f_Out_0_Texture2D, (_Divide_acbbd9727ffda783aeafe28ccafbde8e_Out_2_Vector4).x, _Property_faa4f436225f4e8eb99135b1d078135e_Out_0_Float, _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b, _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b_XYZ_1_Vector4, _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b_XZ_2_Vector4, _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b_YZ_3_Vector4, _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_f6ae16d8d2c85685b4072d78c56e29e9_Out_0_Float = _CoverNormalBlendHardness;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _NormalStrength_11fab77b71140d8ab0735a9615b728ec_Out_2_Vector3;
            Unity_NormalStrength_float((_TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b_XYZ_1_Vector4.xyz), _Property_f6ae16d8d2c85685b4072d78c56e29e9_Out_0_Float, _NormalStrength_11fab77b71140d8ab0735a9615b728ec_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Multiply_fa49280de269898ebbfe89d446d57ecc_Out_2_Vector3;
            Unity_Multiply_float3_float3(_Property_3d047323d7f9778ca2b1b7d7d4d43210_Out_0_Vector3, IN.WorldSpaceNormal, _Multiply_fa49280de269898ebbfe89d446d57ecc_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_91e143818eee6187b799b2a4652eeb95_R_1_Float = _Multiply_fa49280de269898ebbfe89d446d57ecc_Out_2_Vector3[0];
            float _Split_91e143818eee6187b799b2a4652eeb95_G_2_Float = _Multiply_fa49280de269898ebbfe89d446d57ecc_Out_2_Vector3[1];
            float _Split_91e143818eee6187b799b2a4652eeb95_B_3_Float = _Multiply_fa49280de269898ebbfe89d446d57ecc_Out_2_Vector3[2];
            float _Split_91e143818eee6187b799b2a4652eeb95_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_f99764306bf31e8484b14d9a1ba660a3_Out_2_Float;
            Unity_Add_float(_Split_91e143818eee6187b799b2a4652eeb95_R_1_Float, _Split_91e143818eee6187b799b2a4652eeb95_G_2_Float, _Add_f99764306bf31e8484b14d9a1ba660a3_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_25d0cda769439c85a6176b0cf9af06c0_Out_2_Float;
            Unity_Add_float(_Add_f99764306bf31e8484b14d9a1ba660a3_Out_2_Float, _Split_91e143818eee6187b799b2a4652eeb95_B_3_Float, _Add_25d0cda769439c85a6176b0cf9af06c0_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_24df69e5dc52008e891c2b3f99e28991_Out_0_Float = _Cover_Amount;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_7b25e9aea29e888e99e5155562106e70_Out_0_Float = _Cover_Amount_Grow_Speed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Subtract_a31b2e64f122188ea610c77d3f62f810_Out_2_Float;
            Unity_Subtract_float(float(4), _Property_7b25e9aea29e888e99e5155562106e70_Out_0_Float, _Subtract_a31b2e64f122188ea610c77d3f62f810_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_15277685f0785f8a90f4492c80247159_Out_2_Float;
            Unity_Divide_float(_Property_24df69e5dc52008e891c2b3f99e28991_Out_0_Float, _Subtract_a31b2e64f122188ea610c77d3f62f810_Out_2_Float, _Divide_15277685f0785f8a90f4492c80247159_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Absolute_ac1c6e27d47e508e8aed26d3db167120_Out_1_Float;
            Unity_Absolute_float(_Divide_15277685f0785f8a90f4492c80247159_Out_2_Float, _Absolute_ac1c6e27d47e508e8aed26d3db167120_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Power_d5a03bba02ea638f84c50ca9f6a3e112_Out_2_Float;
            Unity_Power_float(_Absolute_ac1c6e27d47e508e8aed26d3db167120_Out_1_Float, _Subtract_a31b2e64f122188ea610c77d3f62f810_Out_2_Float, _Power_d5a03bba02ea638f84c50ca9f6a3e112_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_1be0e9928e2c0489b16295f57a026487_Out_3_Float;
            Unity_Clamp_float(_Power_d5a03bba02ea638f84c50ca9f6a3e112_Out_2_Float, float(0), float(2), _Clamp_1be0e9928e2c0489b16295f57a026487_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_041ba179c4133288bd6ebb7932697351_Out_2_Float;
            Unity_Multiply_float_float(_Add_25d0cda769439c85a6176b0cf9af06c0_Out_2_Float, _Clamp_1be0e9928e2c0489b16295f57a026487_Out_3_Float, _Multiply_041ba179c4133288bd6ebb7932697351_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Saturate_f03610d99dc38b8688cdf6c95924daaf_Out_1_Float;
            Unity_Saturate_float(_Multiply_041ba179c4133288bd6ebb7932697351_Out_2_Float, _Saturate_f03610d99dc38b8688cdf6c95924daaf_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_78437b2d5aa53f829edcee712f066e04_Out_3_Float;
            Unity_Clamp_float(_Add_25d0cda769439c85a6176b0cf9af06c0_Out_2_Float, float(0), float(0.9999), _Clamp_78437b2d5aa53f829edcee712f066e04_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_32c30bd23dc33184849662569cd46759_Out_0_Float = _Cover_Max_Angle;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_9d9e98ea75888d85877f3863930719aa_Out_2_Float;
            Unity_Divide_float(_Property_32c30bd23dc33184849662569cd46759_Out_0_Float, float(45), _Divide_9d9e98ea75888d85877f3863930719aa_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_fa817fbd2ba8aa81bf3977d104f66ffd_Out_1_Float;
            Unity_OneMinus_float(_Divide_9d9e98ea75888d85877f3863930719aa_Out_2_Float, _OneMinus_fa817fbd2ba8aa81bf3977d104f66ffd_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Subtract_66c9a128aff075848cbe14a74ba8d3c5_Out_2_Float;
            Unity_Subtract_float(_Clamp_78437b2d5aa53f829edcee712f066e04_Out_3_Float, _OneMinus_fa817fbd2ba8aa81bf3977d104f66ffd_Out_1_Float, _Subtract_66c9a128aff075848cbe14a74ba8d3c5_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_b81e19ff4b40e889bbc2a0d75a043d55_Out_3_Float;
            Unity_Clamp_float(_Subtract_66c9a128aff075848cbe14a74ba8d3c5_Out_2_Float, float(0), float(2), _Clamp_b81e19ff4b40e889bbc2a0d75a043d55_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_df9b9eb99573a286b66090f1a88825c2_Out_2_Float;
            Unity_Divide_float(float(1), _Divide_9d9e98ea75888d85877f3863930719aa_Out_2_Float, _Divide_df9b9eb99573a286b66090f1a88825c2_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_b1c6bc199993da8e8690b8204063c06f_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_b81e19ff4b40e889bbc2a0d75a043d55_Out_3_Float, _Divide_df9b9eb99573a286b66090f1a88825c2_Out_2_Float, _Multiply_b1c6bc199993da8e8690b8204063c06f_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Absolute_47d15fbc856f1982992c9f6f8cf095df_Out_1_Float;
            Unity_Absolute_float(_Multiply_b1c6bc199993da8e8690b8204063c06f_Out_2_Float, _Absolute_47d15fbc856f1982992c9f6f8cf095df_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_84ecf6d44066108b958a4bbf89eb2bbb_Out_0_Float = _CoverHardness;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Power_e2326e473b1f15869db22e412e3f9fde_Out_2_Float;
            Unity_Power_float(_Absolute_47d15fbc856f1982992c9f6f8cf095df_Out_1_Float, _Property_84ecf6d44066108b958a4bbf89eb2bbb_Out_0_Float, _Power_e2326e473b1f15869db22e412e3f9fde_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_e5173dd322cb9c87a827b3d6d416e8c4_Out_0_Float = _Cover_Min_Height;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_d6102fe1df60cf8f9be5eb4f6774b363_Out_1_Float;
            Unity_OneMinus_float(_Property_e5173dd322cb9c87a827b3d6d416e8c4_Out_0_Float, _OneMinus_d6102fe1df60cf8f9be5eb4f6774b363_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_c2c0822a4c066887bdce2476ce07e03b_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
            float _Split_c2c0822a4c066887bdce2476ce07e03b_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
            float _Split_c2c0822a4c066887bdce2476ce07e03b_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
            float _Split_c2c0822a4c066887bdce2476ce07e03b_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_d67ba628c117b784982b2b0e7335f121_Out_2_Float;
            Unity_Add_float(_OneMinus_d6102fe1df60cf8f9be5eb4f6774b363_Out_1_Float, _Split_c2c0822a4c066887bdce2476ce07e03b_G_2_Float, _Add_d67ba628c117b784982b2b0e7335f121_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_cacc637f6d247382b610fa5e29099efb_Out_2_Float;
            Unity_Add_float(_Add_d67ba628c117b784982b2b0e7335f121_Out_2_Float, float(1), _Add_cacc637f6d247382b610fa5e29099efb_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_305f17dcc5012d81886e7fe415a513d4_Out_3_Float;
            Unity_Clamp_float(_Add_cacc637f6d247382b610fa5e29099efb_Out_2_Float, float(0), float(1), _Clamp_305f17dcc5012d81886e7fe415a513d4_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_6b0e17b7e3d2fd8db358cf2468c498e6_Out_0_Float = _Cover_Min_Height_Blending;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_3a4b967d185bc881b41c30791f6f1e62_Out_2_Float;
            Unity_Add_float(_Add_d67ba628c117b784982b2b0e7335f121_Out_2_Float, _Property_6b0e17b7e3d2fd8db358cf2468c498e6_Out_0_Float, _Add_3a4b967d185bc881b41c30791f6f1e62_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_fd0dcb913f15e88e902812b438aebbc3_Out_2_Float;
            Unity_Divide_float(_Add_3a4b967d185bc881b41c30791f6f1e62_Out_2_Float, _Add_d67ba628c117b784982b2b0e7335f121_Out_2_Float, _Divide_fd0dcb913f15e88e902812b438aebbc3_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_a7b7b5823dc9398d8328371fb23de257_Out_1_Float;
            Unity_OneMinus_float(_Divide_fd0dcb913f15e88e902812b438aebbc3_Out_2_Float, _OneMinus_a7b7b5823dc9398d8328371fb23de257_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_caa2bc8711bde98886b2e04bc3895333_Out_2_Float;
            Unity_Add_float(_OneMinus_a7b7b5823dc9398d8328371fb23de257_Out_1_Float, float(-0.5), _Add_caa2bc8711bde98886b2e04bc3895333_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_9958b4bb870ca78bb4f436357f6e4ed4_Out_3_Float;
            Unity_Clamp_float(_Add_caa2bc8711bde98886b2e04bc3895333_Out_2_Float, float(0), float(1), _Clamp_9958b4bb870ca78bb4f436357f6e4ed4_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_f4c52e99fecae983bba5ca957ceaea70_Out_2_Float;
            Unity_Add_float(_Clamp_305f17dcc5012d81886e7fe415a513d4_Out_3_Float, _Clamp_9958b4bb870ca78bb4f436357f6e4ed4_Out_3_Float, _Add_f4c52e99fecae983bba5ca957ceaea70_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_4b0ba629f5691b8985bcb46fe077634b_Out_3_Float;
            Unity_Clamp_float(_Add_f4c52e99fecae983bba5ca957ceaea70_Out_2_Float, float(0), float(1), _Clamp_4b0ba629f5691b8985bcb46fe077634b_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_dc9146fa086a698db159220c4b551f8d_Out_2_Float;
            Unity_Multiply_float_float(_Power_e2326e473b1f15869db22e412e3f9fde_Out_2_Float, _Clamp_4b0ba629f5691b8985bcb46fe077634b_Out_3_Float, _Multiply_dc9146fa086a698db159220c4b551f8d_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_4a4cdbb11047088c86f3455cd5a51981_Out_2_Float;
            Unity_Multiply_float_float(_Saturate_f03610d99dc38b8688cdf6c95924daaf_Out_1_Float, _Multiply_dc9146fa086a698db159220c4b551f8d_Out_2_Float, _Multiply_4a4cdbb11047088c86f3455cd5a51981_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Lerp_81e093150193e5818ea2e7cdf113600f_Out_3_Vector3;
            Unity_Lerp_float3(_NormalBlend_58a0c0d45b55168cbfa43fa9d9da21c6_Out_2_Vector3, _NormalStrength_11fab77b71140d8ab0735a9615b728ec_Out_2_Vector3, (_Multiply_4a4cdbb11047088c86f3455cd5a51981_Out_2_Float.xxx), _Lerp_81e093150193e5818ea2e7cdf113600f_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Transform_fcfe6aed8d17598ebf576390e09b3662_Out_1_Vector3;
            {
                float3x3 tangentTransform = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
                _Transform_fcfe6aed8d17598ebf576390e09b3662_Out_1_Vector3 = TransformTangentToWorldDir(_Lerp_81e093150193e5818ea2e7cdf113600f_Out_3_Vector3.xyz, tangentTransform, true).xyz;
            }
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Multiply_87cc0f3ed4675989b51b1b58a173bc24_Out_2_Vector3;
            Unity_Multiply_float3_float3(_Property_3d047323d7f9778ca2b1b7d7d4d43210_Out_0_Vector3, _Transform_fcfe6aed8d17598ebf576390e09b3662_Out_1_Vector3, _Multiply_87cc0f3ed4675989b51b1b58a173bc24_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_60ee188afca81787a8e8fac74a174b99_R_1_Float = _Multiply_87cc0f3ed4675989b51b1b58a173bc24_Out_2_Vector3[0];
            float _Split_60ee188afca81787a8e8fac74a174b99_G_2_Float = _Multiply_87cc0f3ed4675989b51b1b58a173bc24_Out_2_Vector3[1];
            float _Split_60ee188afca81787a8e8fac74a174b99_B_3_Float = _Multiply_87cc0f3ed4675989b51b1b58a173bc24_Out_2_Vector3[2];
            float _Split_60ee188afca81787a8e8fac74a174b99_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_dc15dd3b0cae3e89bd698e7f843f7b1a_Out_2_Float;
            Unity_Add_float(_Split_60ee188afca81787a8e8fac74a174b99_R_1_Float, _Split_60ee188afca81787a8e8fac74a174b99_G_2_Float, _Add_dc15dd3b0cae3e89bd698e7f843f7b1a_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_5239bb98d15c0889b20e04a2eb89ee8d_Out_2_Float;
            Unity_Add_float(_Add_dc15dd3b0cae3e89bd698e7f843f7b1a_Out_2_Float, _Split_60ee188afca81787a8e8fac74a174b99_B_3_Float, _Add_5239bb98d15c0889b20e04a2eb89ee8d_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_04ad5b9da8d13d80977bd2661241c39d_Out_2_Float;
            Unity_Multiply_float_float(_Add_5239bb98d15c0889b20e04a2eb89ee8d_Out_2_Float, _Clamp_1be0e9928e2c0489b16295f57a026487_Out_3_Float, _Multiply_04ad5b9da8d13d80977bd2661241c39d_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_ffe9545eefb14c85b9db82fa15044921_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_1be0e9928e2c0489b16295f57a026487_Out_3_Float, _Property_84ecf6d44066108b958a4bbf89eb2bbb_Out_0_Float, _Multiply_ffe9545eefb14c85b9db82fa15044921_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_49be95001b6ff98ea3ddca613a01d693_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_ffe9545eefb14c85b9db82fa15044921_Out_2_Float, _Multiply_dc9146fa086a698db159220c4b551f8d_Out_2_Float, _Multiply_49be95001b6ff98ea3ddca613a01d693_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_821af040af6e558284ae449187584b00_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_04ad5b9da8d13d80977bd2661241c39d_Out_2_Float, _Multiply_49be95001b6ff98ea3ddca613a01d693_Out_2_Float, _Multiply_821af040af6e558284ae449187584b00_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_b98b3357cae0358aae44a13c442bbfcf_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverMaskMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3;
            _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_XYZ_1_Vector4;
            float4 _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_XZ_2_Vector4;
            float4 _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_YZ_3_Vector4;
            float4 _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_b98b3357cae0358aae44a13c442bbfcf_Out_0_Texture2D, (_Divide_acbbd9727ffda783aeafe28ccafbde8e_Out_2_Vector4).x, _Property_faa4f436225f4e8eb99135b1d078135e_Out_0_Float, _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3, _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_XYZ_1_Vector4, _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_XZ_2_Vector4, _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_YZ_3_Vector4, _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_d45fa36c68c6428bb4f8080e2005e0ec_R_1_Float = _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_XYZ_1_Vector4[0];
            float _Split_d45fa36c68c6428bb4f8080e2005e0ec_G_2_Float = _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_XYZ_1_Vector4[1];
            float _Split_d45fa36c68c6428bb4f8080e2005e0ec_B_3_Float = _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_XYZ_1_Vector4[2];
            float _Split_d45fa36c68c6428bb4f8080e2005e0ec_A_4_Float = _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_XYZ_1_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_98ac4ea177a183869352488b4c2d0d34_Out_0_Float = _CoverHeightMapMin;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_5d5eb0a63075b184be1f8ed7f1969793_Out_0_Float = _CoverHeightMapMax;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_068b903f7986bb8da7741fd6f472d4d3_Out_0_Vector2 = float2(_Property_98ac4ea177a183869352488b4c2d0d34_Out_0_Float, _Property_5d5eb0a63075b184be1f8ed7f1969793_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_dbf8fa97bfdf2f819d547b2836d5eb88_Out_0_Float = _CoverHeightMapOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Add_7e64ff79e725df80a9231cb40178da18_Out_2_Vector2;
            Unity_Add_float2(_Vector2_068b903f7986bb8da7741fd6f472d4d3_Out_0_Vector2, (_Property_dbf8fa97bfdf2f819d547b2836d5eb88_Out_0_Float.xx), _Add_7e64ff79e725df80a9231cb40178da18_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_0792f0dacec10e82954597c385120c5f_Out_3_Float;
            Unity_Remap_float(_Split_d45fa36c68c6428bb4f8080e2005e0ec_B_3_Float, float2 (0, 1), _Add_7e64ff79e725df80a9231cb40178da18_Out_2_Vector2, _Remap_0792f0dacec10e82954597c385120c5f_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_fef4ce95d06ced86899c58782dd5e9ac_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_821af040af6e558284ae449187584b00_Out_2_Float, _Remap_0792f0dacec10e82954597c385120c5f_Out_3_Float, _Multiply_fef4ce95d06ced86899c58782dd5e9ac_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_f38ac593c11c408685b4081df7f9a736_R_1_Float = IN.VertexColor[0];
            float _Split_f38ac593c11c408685b4081df7f9a736_G_2_Float = IN.VertexColor[1];
            float _Split_f38ac593c11c408685b4081df7f9a736_B_3_Float = IN.VertexColor[2];
            float _Split_f38ac593c11c408685b4081df7f9a736_A_4_Float = IN.VertexColor[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_26b43e2c517d7982b34d1c541939b6f5_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_fef4ce95d06ced86899c58782dd5e9ac_Out_2_Float, _Split_f38ac593c11c408685b4081df7f9a736_G_2_Float, _Multiply_26b43e2c517d7982b34d1c541939b6f5_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Saturate_3d2efb20d5b29381bfb3003845307b1f_Out_1_Float;
            Unity_Saturate_float(_Multiply_26b43e2c517d7982b34d1c541939b6f5_Out_2_Float, _Saturate_3d2efb20d5b29381bfb3003845307b1f_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_97e8d2e584b4e587a8ffaa3d3b1b30f5_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_572d83500486058c99890c5d609b30b0_Out_3_Float, _Saturate_3d2efb20d5b29381bfb3003845307b1f_Out_1_Float, _Multiply_97e8d2e584b4e587a8ffaa3d3b1b30f5_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            #if defined(_USEDYNAMICCOVERTSTATICMASKF_ON)
            float _UseDynamicCoverTStaticMaskF_ea4efcf79fa41489897aef4bbf5e655f_Out_0_Float = _Multiply_97e8d2e584b4e587a8ffaa3d3b1b30f5_Out_2_Float;
            #else
            float _UseDynamicCoverTStaticMaskF_ea4efcf79fa41489897aef4bbf5e655f_Out_0_Float = _Clamp_572d83500486058c99890c5d609b30b0_Out_3_Float;
            #endif
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Lerp_55b6201a01421f8b87ba535381db6a03_Out_3_Vector3;
            Unity_Lerp_float3(_BlendOverlayBaseColor_9ac50a6865d3648181da5f6189b8832d_OutVector4_1_Vector3, (_Multiply_b7294cbf7c9daa85b18c13beaf3dc8bd_Out_2_Vector4.xyz), (_UseDynamicCoverTStaticMaskF_ea4efcf79fa41489897aef4bbf5e655f_Out_0_Float.xxx), _Lerp_55b6201a01421f8b87ba535381db6a03_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_1c3992584ba29481b2683ce78818f520_Out_0_Vector4 = _WetColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Multiply_25f2ae8d79d4a388a6cbd74c831c0177_Out_2_Vector3;
            Unity_Multiply_float3_float3((_Property_1c3992584ba29481b2683ce78818f520_Out_0_Vector4.xyz), _Lerp_55b6201a01421f8b87ba535381db6a03_Out_3_Vector3, _Multiply_25f2ae8d79d4a388a6cbd74c831c0177_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_93980743aa69fb86bf250c5a7d50ef20_Out_1_Float;
            Unity_OneMinus_float(_Split_f38ac593c11c408685b4081df7f9a736_R_1_Float, _OneMinus_93980743aa69fb86bf250c5a7d50ef20_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Lerp_19abc331acee5482a25ee61d5a1861cf_Out_3_Vector3;
            Unity_Lerp_float3(_Lerp_55b6201a01421f8b87ba535381db6a03_Out_3_Vector3, _Multiply_25f2ae8d79d4a388a6cbd74c831c0177_Out_2_Vector3, (_OneMinus_93980743aa69fb86bf250c5a7d50ef20_Out_1_Float.xxx), _Lerp_19abc331acee5482a25ee61d5a1861cf_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_4bb7737116edbd81bca06201348456ea_R_1_Float = _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae_XZ_2_Vector4[0];
            float _Split_4bb7737116edbd81bca06201348456ea_G_2_Float = _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae_XZ_2_Vector4[1];
            float _Split_4bb7737116edbd81bca06201348456ea_B_3_Float = _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae_XZ_2_Vector4[2];
            float _Split_4bb7737116edbd81bca06201348456ea_A_4_Float = _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae_XZ_2_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_f9637076944eae8abdcc79dc2702814b_Out_0_Float = _AlphaCutoff;
            #endif
            surface.BaseColor = _Lerp_19abc331acee5482a25ee61d5a1861cf_Out_3_Vector3;
            surface.Alpha = _Split_4bb7737116edbd81bca06201348456ea_A_4_Float;
            surface.AlphaClipThreshold = _Property_f9637076944eae8abdcc79dc2702814b_Out_0_Float;
            return surface;
        }
        
        // --------------------------------------------------
        // Build Graph Inputs
        #ifdef HAVE_VFX_MODIFICATION
        #define VFX_SRP_ATTRIBUTES Attributes
        #define VFX_SRP_VARYINGS Varyings
        #define VFX_SRP_SURFACE_INPUTS SurfaceDescriptionInputs
        #endif
        VertexDescriptionInputs BuildVertexDescriptionInputs(Attributes input)
        {
            VertexDescriptionInputs output;
            ZERO_INITIALIZE(VertexDescriptionInputs, output);
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.ObjectSpaceNormal =                          input.normalOS;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.ObjectSpaceTangent =                         input.tangentOS.xyz;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.ObjectSpacePosition =                        input.positionOS;
        #endif
        
        #if UNITY_ANY_INSTANCING_ENABLED
        #else // TODO: XR support for procedural instancing because in this case UNITY_ANY_INSTANCING_ENABLED is not defined and instanceID is incorrect.
        #endif
        
            return output;
        }
        SurfaceDescriptionInputs BuildSurfaceDescriptionInputs(Varyings input)
        {
            SurfaceDescriptionInputs output;
            ZERO_INITIALIZE(SurfaceDescriptionInputs, output);
        
        #ifdef HAVE_VFX_MODIFICATION
        #if VFX_USE_GRAPH_VALUES
            uint instanceActiveIndex = asuint(UNITY_ACCESS_INSTANCED_PROP(PerInstance, _InstanceActiveIndex));
            /* WARNING: $splice Could not find named fragment 'VFXLoadGraphValues' */
        #endif
            /* WARNING: $splice Could not find named fragment 'VFXSetFragInputs' */
        
        #endif
        
            
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        // must use interpolated tangent, bitangent and normal before they are normalized in the pixel shader.
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        float3 unnormalizedNormalWS = input.normalWS;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        const float renormFactor = 1.0 / length(unnormalizedNormalWS);
        #endif
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        // use bitangent on the fly like in hdrp
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        // IMPORTANT! If we ever support Flip on double sided materials ensure bitangent and tangent are NOT flipped.
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        float crossSign = (input.tangentWS.w > 0.0 ? 1.0 : -1.0)* GetOddNegativeScale();
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        float3 bitang = crossSign * cross(input.normalWS.xyz, input.tangentWS.xyz);
        #endif
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.WorldSpaceNormal = renormFactor * input.normalWS.xyz;      // we want a unit length Normal Vector node in shader graph
        #endif
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        // to pr               eserve mikktspace compliance we use same scale renormFactor as was used on the normal.
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        // This                is explained in section 2.2 in "surface gradient based bump mapping framework"
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.WorldSpaceTangent = renormFactor * input.tangentWS.xyz;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.WorldSpaceBiTangent = renormFactor * bitang;
        #endif
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.WorldSpacePosition = input.positionWS;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.AbsoluteWorldSpacePosition = GetAbsolutePositionWS(input.positionWS);
        #endif
        
        
            #if UNITY_UV_STARTS_AT_TOP
            #else
            #endif
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.uv0 = input.texCoord0;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.uv2 = input.texCoord2;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.VertexColor = input.color;
        #endif
        
        #if UNITY_ANY_INSTANCING_ENABLED
        #else // TODO: XR support for procedural instancing because in this case UNITY_ANY_INSTANCING_ENABLED is not defined and instanceID is incorrect.
        #endif
        #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN output.FaceSign =                    IS_FRONT_VFACE(input.cullFace, true, false);
        #else
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        #endif
        #undef BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        
                return output;
        }
        
        // --------------------------------------------------
        // Main
        
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/SelectionPickingPass.hlsl"
        
        // --------------------------------------------------
        // Visual Effect Vertex Invocations
        #ifdef HAVE_VFX_MODIFICATION
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
        #endif
        
        ENDHLSL
        }
        Pass
        {
            Name "Universal 2D"
            Tags
            {
                "LightMode" = "Universal2D"
            }
        
        // Render State
        Cull [_Cull]
        Blend [_SrcBlend] [_DstBlend]
        ZTest [_ZTest]
        ZWrite [_ZWrite]
        
        // Debug
        // <None>
        
        // --------------------------------------------------
        // Pass
        
        HLSLPROGRAM
        
        // Pragmas
        #pragma target 2.0
        #pragma vertex vert
        #pragma fragment frag
        
        // Keywords
        #pragma shader_feature_local_fragment _ _ALPHATEST_ON
        #pragma shader_feature_local _ _USEDYNAMICCOVERTSTATICMASKF_ON
        
        #if defined(_USEDYNAMICCOVERTSTATICMASKF_ON)
            #define KEYWORD_PERMUTATION_0
        #else
            #define KEYWORD_PERMUTATION_1
        #endif
        
        
        // Defines
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define _NORMALMAP 1
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define _NORMAL_DROPOFF_TS 1
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_NORMAL
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_TANGENT
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_TEXCOORD0
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_TEXCOORD2
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define ATTRIBUTES_NEED_COLOR
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define FEATURES_GRAPH_VERTEX_NORMAL_OUTPUT
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define FEATURES_GRAPH_VERTEX_TANGENT_OUTPUT
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_POSITION_WS
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_NORMAL_WS
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_TANGENT_WS
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_TEXCOORD0
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_TEXCOORD2
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_COLOR
        #endif
        
        #define FEATURES_GRAPH_VERTEX
        /* WARNING: $splice Could not find named fragment 'PassInstancing' */
        #define SHADERPASS SHADERPASS_2D
        
        
        // custom interpolator pre-include
        /* WARNING: $splice Could not find named fragment 'sgci_CustomInterpolatorPreInclude' */
        
        // Includes
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
        #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
        
        // --------------------------------------------------
        // Structs and Packing
        
        // custom interpolators pre packing
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPrePacking' */
        
        struct Attributes
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 positionOS : POSITION;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 normalOS : NORMAL;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 tangentOS : TANGENT;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv0 : TEXCOORD0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv2 : TEXCOORD2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 color : COLOR;
            #endif
            #if UNITY_ANY_INSTANCING_ENABLED || defined(ATTRIBUTES_NEED_INSTANCEID)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint instanceID : INSTANCEID_SEMANTIC;
            #endif
            #endif
        };
        struct Varyings
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 positionCS : SV_POSITION;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 positionWS;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 normalWS;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 tangentWS;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 color;
            #endif
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
            #endif
        };
        struct SurfaceDescriptionInputs
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 WorldSpaceNormal;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 WorldSpaceTangent;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 WorldSpaceBiTangent;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 WorldSpacePosition;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 AbsoluteWorldSpacePosition;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 uv2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 VertexColor;
            #endif
        };
        struct VertexDescriptionInputs
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 ObjectSpaceNormal;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 ObjectSpaceTangent;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 ObjectSpacePosition;
            #endif
        };
        struct PackedVaryings
        {
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 positionCS : SV_POSITION;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 tangentWS : INTERP0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord0 : INTERP1;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 texCoord2 : INTERP2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 color : INTERP3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 positionWS : INTERP4;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 normalWS : INTERP5;
            #endif
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
            #endif
        };
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        PackedVaryings PackVaryings (Varyings input)
        {
            PackedVaryings output;
            ZERO_INITIALIZE(PackedVaryings, output);
            output.positionCS = input.positionCS;
            output.tangentWS.xyzw = input.tangentWS;
            output.texCoord0.xyzw = input.texCoord0;
            output.texCoord2.xyzw = input.texCoord2;
            output.color.xyzw = input.color;
            output.positionWS.xyz = input.positionWS;
            output.normalWS.xyz = input.normalWS;
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        
        Varyings UnpackVaryings (PackedVaryings input)
        {
            Varyings output;
            output.positionCS = input.positionCS;
            output.tangentWS = input.tangentWS.xyzw;
            output.texCoord0 = input.texCoord0.xyzw;
            output.texCoord2 = input.texCoord2.xyzw;
            output.color = input.color.xyzw;
            output.positionWS = input.positionWS.xyz;
            output.normalWS = input.normalWS.xyz;
            #if UNITY_ANY_INSTANCING_ENABLED || defined(VARYINGS_NEED_INSTANCEID)
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        #endif
        
        // --------------------------------------------------
        // Graph
        
        // Graph Properties
        CBUFFER_START(UnityPerMaterial)
        float _AlphaCutoff;
        float4 _BaseColor;
        float4 _BaseColorMap_TexelSize;
        float _BaseUsePlanarUV;
        float4 _BaseTilingOffset;
        float4 _BaseNormalMap_TexelSize;
        float _BaseNormalScale;
        float4 _BaseMaskMap_TexelSize;
        float _BaseMetallic;
        float _BaseAORemapMin;
        float _BaseAORemapMax;
        float _BaseSmoothnessRemapMin;
        float _BaseSmoothnessRemapMax;
        float4 _CoverMaskA_TexelSize;
        float _CoverMaskPower;
        float _Cover_Amount;
        float _Cover_Amount_Grow_Speed;
        float3 _CoverDirection;
        float _Cover_Max_Angle;
        float _Cover_Min_Height;
        float _Cover_Min_Height_Blending;
        float4 _CoverBaseColor;
        float4 _CoverBaseColorMap_TexelSize;
        float4 _CoverTilingOffset;
        float _CoverTriplanarThreshold;
        float4 _CoverNormalMap_TexelSize;
        float _CoverNormalScale;
        float _CoverNormalBlendHardness;
        float _CoverHardness;
        float _CoverHeightMapMin;
        float _CoverHeightMapMax;
        float _CoverHeightMapOffset;
        float4 _CoverMaskMap_TexelSize;
        float _CoverMetallic;
        float _CoverAORemapMin;
        float _CoverAORemapMax;
        float _CoverSmoothnessRemapMin;
        float _CoverSmoothnessRemapMax;
        float4 _DetailMap_TexelSize;
        float4 _DetailTilingOffset;
        float _DetailAlbedoScale;
        float _DetailNormalScale;
        float _DetailSmoothnessScale;
        float4 _WetColor;
        float _WetSmoothness;
        UNITY_TEXTURE_STREAMING_DEBUG_VARS;
        CBUFFER_END
        
        
        // Object and Global properties
        SAMPLER(SamplerState_Linear_Repeat);
        SAMPLER(SamplerState_Linear_Repeat_Aniso8);
        TEXTURE2D(_BaseColorMap);
        SAMPLER(sampler_BaseColorMap);
        TEXTURE2D(_BaseNormalMap);
        SAMPLER(sampler_BaseNormalMap);
        TEXTURE2D(_BaseMaskMap);
        SAMPLER(sampler_BaseMaskMap);
        TEXTURE2D(_CoverMaskA);
        SAMPLER(sampler_CoverMaskA);
        TEXTURE2D(_CoverBaseColorMap);
        SAMPLER(sampler_CoverBaseColorMap);
        TEXTURE2D(_CoverNormalMap);
        SAMPLER(sampler_CoverNormalMap);
        TEXTURE2D(_CoverMaskMap);
        SAMPLER(sampler_CoverMaskMap);
        TEXTURE2D(_DetailMap);
        SAMPLER(sampler_DetailMap);
        
        // Graph Includes
        // GraphIncludes: <None>
        
        // -- Property used by ScenePickingPass
        #ifdef SCENEPICKINGPASS
        float4 _SelectionID;
        #endif
        
        // -- Properties used by SceneSelectionPass
        #ifdef SCENESELECTIONPASS
        int _ObjectId;
        int _PassValue;
        #endif
        
        // Graph Functions
        
        void Unity_Combine_float(float R, float G, float B, float A, out float4 RGBA, out float3 RGB, out float2 RG)
        {
            RGBA = float4(R, G, B, A);
            RGB = float3(R, G, B);
            RG = float2(R, G);
        }
        
        void Unity_Divide_float(float A, float B, out float Out)
        {
            Out = A / B;
        }
        
        void Unity_Multiply_float4_float4(float4 A, float4 B, out float4 Out)
        {
        Out = A * B;
        }
        
        void Unity_Branch_float4(float Predicate, float4 True, float4 False, out float4 Out)
        {
            Out = Predicate ? True : False;
        }
        
        void Unity_TilingAndOffset_float(float2 UV, float2 Tiling, float2 Offset, out float2 Out)
        {
            Out = UV * Tiling + Offset;
        }
        
        void Unity_Branch_float2(float Predicate, float2 True, float2 False, out float2 Out)
        {
            Out = Predicate ? True : False;
        }
        
        struct Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float
        {
        float3 AbsoluteWorldSpacePosition;
        half4 uv0;
        half4 uv2;
        };
        
        void SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(UnityTexture2D Texture2D_80A3D28F, float4 Vector4_2EBA7A3B, float Boolean_7ABB9909, UnitySamplerState _SamplerState, float Boolean_5ddfe6daabcc4715a44b5f34fc19becb, Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float IN, out float4 XZ_2)
        {
        UnityTexture2D _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D = Texture2D_80A3D28F;
        float _Property_30834f691775a0898a45b1c868520436_Out_0_Boolean = Boolean_7ABB9909;
        float _Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
        float _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
        float _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
        float _Split_89ed63cb625cb3878c183d0b71c03400_A_4_Float = 0;
        float4 _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4;
        float3 _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3;
        float2 _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, float(0), float(0), _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3, _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2);
        float4 _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4 = Vector4_2EBA7A3B;
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_R_1_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[0];
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_G_2_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[1];
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_B_3_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[2];
        float _Split_2f0f52f6ef8c0e81af0da6476402bc1f_A_4_Float = _Property_8a66888ec47d0687ab1cb2f8abdc9da8_Out_0_Vector4[3];
        float _Divide_e64179199923c58289b6aa94ea6c9178_Out_2_Float;
        Unity_Divide_float(float(1), _Split_2f0f52f6ef8c0e81af0da6476402bc1f_R_1_Float, _Divide_e64179199923c58289b6aa94ea6c9178_Out_2_Float);
        float4 _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, (_Divide_e64179199923c58289b6aa94ea6c9178_Out_2_Float.xxxx), _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4);
        float _Property_f17c7bf877e64b6abdd66b1fe9f5accc_Out_0_Boolean = Boolean_5ddfe6daabcc4715a44b5f34fc19becb;
        float4 _UV_029e8e8198564838b9389b902a09fb22_Out_0_Vector4 = IN.uv0;
        float4 _UV_7a6209af1506424fb75c81e87e42035a_Out_0_Vector4 = IN.uv2;
        float4 _Branch_fc37bb4bf641457cbbc6e290603056ff_Out_3_Vector4;
        Unity_Branch_float4(_Property_f17c7bf877e64b6abdd66b1fe9f5accc_Out_0_Boolean, _UV_029e8e8198564838b9389b902a09fb22_Out_0_Vector4, _UV_7a6209af1506424fb75c81e87e42035a_Out_0_Vector4, _Branch_fc37bb4bf641457cbbc6e290603056ff_Out_3_Vector4);
        float2 _Vector2_16c15d3bbdd14b85bd48e3a6cb318af7_Out_0_Vector2 = float2(_Split_2f0f52f6ef8c0e81af0da6476402bc1f_R_1_Float, _Split_2f0f52f6ef8c0e81af0da6476402bc1f_G_2_Float);
        float2 _Vector2_f8d75f54e7705083bbec539a60185577_Out_0_Vector2 = float2(_Split_2f0f52f6ef8c0e81af0da6476402bc1f_B_3_Float, _Split_2f0f52f6ef8c0e81af0da6476402bc1f_A_4_Float);
        float2 _TilingAndOffset_d91e2d25acd34686b562b7fe7e9d1d27_Out_3_Vector2;
        Unity_TilingAndOffset_float((_Branch_fc37bb4bf641457cbbc6e290603056ff_Out_3_Vector4.xy), _Vector2_16c15d3bbdd14b85bd48e3a6cb318af7_Out_0_Vector2, _Vector2_f8d75f54e7705083bbec539a60185577_Out_0_Vector2, _TilingAndOffset_d91e2d25acd34686b562b7fe7e9d1d27_Out_3_Vector2);
        float2 _Branch_8e5a4e8f4d52fc8aadd1f46485afc933_Out_3_Vector2;
        Unity_Branch_float2(_Property_30834f691775a0898a45b1c868520436_Out_0_Boolean, (_Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4.xy), _TilingAndOffset_d91e2d25acd34686b562b7fe7e9d1d27_Out_3_Vector2, _Branch_8e5a4e8f4d52fc8aadd1f46485afc933_Out_3_Vector2);
        UnitySamplerState _Property_e8746b9475c94530ba35ba8019ad2ae0_Out_0_SamplerState = _SamplerState;
        float4 _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, _Property_e8746b9475c94530ba35ba8019ad2ae0_Out_0_SamplerState.samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Branch_8e5a4e8f4d52fc8aadd1f46485afc933_Out_3_Vector2) );
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.r;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.g;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.b;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_A_7_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.a;
        XZ_2 = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4;
        }
        
        void Unity_Multiply_float_float(float A, float B, out float Out)
        {
            Out = A * B;
        }
        
        void Unity_Add_float(float A, float B, out float Out)
        {
            Out = A + B;
        }
        
        void Unity_Saturate_float(float In, out float Out)
        {
            Out = saturate(In);
        }
        
        void Unity_Absolute_float(float In, out float Out)
        {
            Out = abs(In);
        }
        
        void Unity_SquareRoot_float4(float4 In, out float4 Out)
        {
            Out = sqrt(In);
        }
        
        void Unity_Sign_float(float In, out float Out)
        {
            Out = sign(In);
        }
        
        void Unity_Ceiling_float(float In, out float Out)
        {
            Out = ceil(In);
        }
        
        void Unity_Lerp_float4(float4 A, float4 B, float4 T, out float4 Out)
        {
            Out = lerp(A, B, T);
        }
        
        struct Bindings_BlendOverlayBaseColor_acdb3dfca72bd6b42bbc35f4613331a2_float
        {
        };
        
        void SG_BlendOverlayBaseColor_acdb3dfca72bd6b42bbc35f4613331a2_float(float4 Color_9AA111D3, float Vector1_FBE622A2, float Vector1_8C15C351, Bindings_BlendOverlayBaseColor_acdb3dfca72bd6b42bbc35f4613331a2_float IN, out float3 OutVector4_1)
        {
        float4 _Property_012510d774fb7f8b860f5270dca4500f_Out_0_Vector4 = Color_9AA111D3;
        float4 _SquareRoot_c2c57d0223a9538aa9240890c3cacb0c_Out_1_Vector4;
        Unity_SquareRoot_float4(_Property_012510d774fb7f8b860f5270dca4500f_Out_0_Vector4, _SquareRoot_c2c57d0223a9538aa9240890c3cacb0c_Out_1_Vector4);
        float _Property_a00e29241d12f983b30177515b367ec9_Out_0_Float = Vector1_FBE622A2;
        float _Sign_343a45ede7349283a681c6bd9998fd8e_Out_1_Float;
        Unity_Sign_float(_Property_a00e29241d12f983b30177515b367ec9_Out_0_Float, _Sign_343a45ede7349283a681c6bd9998fd8e_Out_1_Float);
        float _Add_681019b8f5d3d68bb482d419c9fc61a9_Out_2_Float;
        Unity_Add_float(_Sign_343a45ede7349283a681c6bd9998fd8e_Out_1_Float, float(1), _Add_681019b8f5d3d68bb482d419c9fc61a9_Out_2_Float);
        float _Multiply_e8f4cb722712a880ac0db6c7461427f7_Out_2_Float;
        Unity_Multiply_float_float(_Add_681019b8f5d3d68bb482d419c9fc61a9_Out_2_Float, 0.5, _Multiply_e8f4cb722712a880ac0db6c7461427f7_Out_2_Float);
        float _Ceiling_95ad15988aa9b98184875fa754feae01_Out_1_Float;
        Unity_Ceiling_float(_Multiply_e8f4cb722712a880ac0db6c7461427f7_Out_2_Float, _Ceiling_95ad15988aa9b98184875fa754feae01_Out_1_Float);
        float _Property_2db1c747a05ee284a8b00076062f91a4_Out_0_Float = Vector1_8C15C351;
        float _Multiply_9564ecda5193bc8286d9ff771c9226cd_Out_2_Float;
        Unity_Multiply_float_float(_Property_2db1c747a05ee284a8b00076062f91a4_Out_0_Float, _Property_2db1c747a05ee284a8b00076062f91a4_Out_0_Float, _Multiply_9564ecda5193bc8286d9ff771c9226cd_Out_2_Float);
        float4 _Lerp_b3cdb01fc3c5b988ac9b184943bf7c01_Out_3_Vector4;
        Unity_Lerp_float4(_SquareRoot_c2c57d0223a9538aa9240890c3cacb0c_Out_1_Vector4, (_Ceiling_95ad15988aa9b98184875fa754feae01_Out_1_Float.xxxx), (_Multiply_9564ecda5193bc8286d9ff771c9226cd_Out_2_Float.xxxx), _Lerp_b3cdb01fc3c5b988ac9b184943bf7c01_Out_3_Vector4);
        float4 _Multiply_39d1daff98488f8ea2cd794ad4f20926_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Lerp_b3cdb01fc3c5b988ac9b184943bf7c01_Out_3_Vector4, _Lerp_b3cdb01fc3c5b988ac9b184943bf7c01_Out_3_Vector4, _Multiply_39d1daff98488f8ea2cd794ad4f20926_Out_2_Vector4);
        OutVector4_1 = (_Multiply_39d1daff98488f8ea2cd794ad4f20926_Out_2_Vector4.xyz);
        }
        
        void Unity_Divide_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A / B;
        }
        
        void Unity_Sign_float3(float3 In, out float3 Out)
        {
            Out = sign(In);
        }
        
        void Unity_Multiply_float2_float2(float2 A, float2 B, out float2 Out)
        {
        Out = A * B;
        }
        
        void Unity_Absolute_float3(float3 In, out float3 Out)
        {
            Out = abs(In);
        }
        
        void Unity_Power_float3(float3 A, float3 B, out float3 Out)
        {
            Out = pow(A, B);
        }
        
        void Unity_Multiply_float3_float3(float3 A, float3 B, out float3 Out)
        {
        Out = A * B;
        }
        
        void Unity_Add_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A + B;
        }
        
        struct Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float
        {
        float3 WorldSpaceNormal;
        float3 AbsoluteWorldSpacePosition;
        };
        
        void SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(UnityTexture2D Texture2D_80A3D28F, float Vector1_41461AC9, float Vector1_E4D1C13A, Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float IN, out float4 XYZ_1, out float4 XZ_2, out float4 YZ_3, out float4 XY_4)
        {
        UnityTexture2D _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D = Texture2D_80A3D28F;
        float _Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
        float _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
        float _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
        float _Split_89ed63cb625cb3878c183d0b71c03400_A_4_Float = 0;
        float4 _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4;
        float3 _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3;
        float2 _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, float(0), float(0), _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3, _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2);
        float _Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float = Vector1_41461AC9;
        float4 _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, (_Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float.xxxx), _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4);
        float3 _Sign_b826e0ff2d95ec8cb2b2cbbd7ea2eab6_Out_1_Vector3;
        Unity_Sign_float3(IN.WorldSpaceNormal, _Sign_b826e0ff2d95ec8cb2b2cbbd7ea2eab6_Out_1_Vector3);
        float _Split_742547a7039de986a646d04c157ae549_R_1_Float = _Sign_b826e0ff2d95ec8cb2b2cbbd7ea2eab6_Out_1_Vector3[0];
        float _Split_742547a7039de986a646d04c157ae549_G_2_Float = _Sign_b826e0ff2d95ec8cb2b2cbbd7ea2eab6_Out_1_Vector3[1];
        float _Split_742547a7039de986a646d04c157ae549_B_3_Float = _Sign_b826e0ff2d95ec8cb2b2cbbd7ea2eab6_Out_1_Vector3[2];
        float _Split_742547a7039de986a646d04c157ae549_A_4_Float = 0;
        float2 _Vector2_40a8919e571ec18499de72022c155b38_Out_0_Vector2 = float2(_Split_742547a7039de986a646d04c157ae549_G_2_Float, float(1));
        float2 _Multiply_5fa32af59cdca88389832336b2268bd5_Out_2_Vector2;
        Unity_Multiply_float2_float2((_Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4.xy), _Vector2_40a8919e571ec18499de72022c155b38_Out_0_Vector2, _Multiply_5fa32af59cdca88389832336b2268bd5_Out_2_Vector2);
        float4 _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Multiply_5fa32af59cdca88389832336b2268bd5_Out_2_Vector2) );
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.r;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.g;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.b;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_A_7_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.a;
        float3 _Absolute_644b798714827680b39bf5d34f70385f_Out_1_Vector3;
        Unity_Absolute_float3(IN.WorldSpaceNormal, _Absolute_644b798714827680b39bf5d34f70385f_Out_1_Vector3);
        float _Property_adc4c59482221c8aad681c6558728ac9_Out_0_Float = Vector1_E4D1C13A;
        float3 _Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3;
        Unity_Power_float3(_Absolute_644b798714827680b39bf5d34f70385f_Out_1_Vector3, (_Property_adc4c59482221c8aad681c6558728ac9_Out_0_Float.xxx), _Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3);
        float3 _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3, _Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3, _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3);
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_R_1_Float = _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3[0];
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_G_2_Float = _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3[1];
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_B_3_Float = _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3[2];
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_A_4_Float = 0;
        float4 _Multiply_2e1040ca9c98d085ace76ee93f094039_Out_2_Vector4;
        Unity_Multiply_float4_float4(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4, (_Split_ae83014fcbd9f7879a0b91fa66dc9718_G_2_Float.xxxx), _Multiply_2e1040ca9c98d085ace76ee93f094039_Out_2_Vector4);
        float4 _Combine_192c2c4a69be588b90ca005a32e22552_RGBA_4_Vector4;
        float3 _Combine_192c2c4a69be588b90ca005a32e22552_RGB_5_Vector3;
        float2 _Combine_192c2c4a69be588b90ca005a32e22552_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float, float(0), float(0), _Combine_192c2c4a69be588b90ca005a32e22552_RGBA_4_Vector4, _Combine_192c2c4a69be588b90ca005a32e22552_RGB_5_Vector3, _Combine_192c2c4a69be588b90ca005a32e22552_RG_6_Vector2);
        float4 _Multiply_138240d0d4846e87b0febabec0d6891b_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_192c2c4a69be588b90ca005a32e22552_RGBA_4_Vector4, (_Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float.xxxx), _Multiply_138240d0d4846e87b0febabec0d6891b_Out_2_Vector4);
        float _Multiply_014402ded5a3988a8c18ba07636ea5a7_Out_2_Float;
        Unity_Multiply_float_float(_Split_742547a7039de986a646d04c157ae549_B_3_Float, -1, _Multiply_014402ded5a3988a8c18ba07636ea5a7_Out_2_Float);
        float2 _Vector2_caa25d55d456a58982bdfc39b1b43f3f_Out_0_Vector2 = float2(_Multiply_014402ded5a3988a8c18ba07636ea5a7_Out_2_Float, float(1));
        float2 _Multiply_a67201b6e1a0a28c98cd9d06e8b09543_Out_2_Vector2;
        Unity_Multiply_float2_float2((_Multiply_138240d0d4846e87b0febabec0d6891b_Out_2_Vector4.xy), _Vector2_caa25d55d456a58982bdfc39b1b43f3f_Out_0_Vector2, _Multiply_a67201b6e1a0a28c98cd9d06e8b09543_Out_2_Vector2);
        float4 _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Multiply_a67201b6e1a0a28c98cd9d06e8b09543_Out_2_Vector2) );
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_R_4_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.r;
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_G_5_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.g;
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_B_6_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.b;
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_A_7_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.a;
        float4 _Multiply_7bb4009c92b108849ac6ca92bc1442f2_Out_2_Vector4;
        Unity_Multiply_float4_float4(_SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4, (_Split_ae83014fcbd9f7879a0b91fa66dc9718_B_3_Float.xxxx), _Multiply_7bb4009c92b108849ac6ca92bc1442f2_Out_2_Vector4);
        float4 _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGBA_4_Vector4;
        float3 _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGB_5_Vector3;
        float2 _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float, float(0), float(0), _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGBA_4_Vector4, _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGB_5_Vector3, _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RG_6_Vector2);
        float4 _Multiply_2c0864423b014f8b8af8523f68cbb63c_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGBA_4_Vector4, (_Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float.xxxx), _Multiply_2c0864423b014f8b8af8523f68cbb63c_Out_2_Vector4);
        float2 _Vector2_54dfd40df2fc78809955dd272f2cf0c3_Out_0_Vector2 = float2(_Split_742547a7039de986a646d04c157ae549_R_1_Float, float(1));
        float2 _Multiply_addbd5fcede95f80bbb806c94e49ef63_Out_2_Vector2;
        Unity_Multiply_float2_float2((_Multiply_2c0864423b014f8b8af8523f68cbb63c_Out_2_Vector4.xy), _Vector2_54dfd40df2fc78809955dd272f2cf0c3_Out_0_Vector2, _Multiply_addbd5fcede95f80bbb806c94e49ef63_Out_2_Vector2);
        float4 _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Multiply_addbd5fcede95f80bbb806c94e49ef63_Out_2_Vector2) );
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_R_4_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.r;
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_G_5_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.g;
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_B_6_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.b;
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_A_7_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.a;
        float4 _Multiply_77818c22e359fc8cbb7dd20216a8db72_Out_2_Vector4;
        Unity_Multiply_float4_float4(_SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4, (_Split_ae83014fcbd9f7879a0b91fa66dc9718_R_1_Float.xxxx), _Multiply_77818c22e359fc8cbb7dd20216a8db72_Out_2_Vector4);
        float4 _Add_769d9ee909c9238dbbf72d2800a2f268_Out_2_Vector4;
        Unity_Add_float4(_Multiply_7bb4009c92b108849ac6ca92bc1442f2_Out_2_Vector4, _Multiply_77818c22e359fc8cbb7dd20216a8db72_Out_2_Vector4, _Add_769d9ee909c9238dbbf72d2800a2f268_Out_2_Vector4);
        float4 _Add_14295f72880e4b87a1baf1ced943ac40_Out_2_Vector4;
        Unity_Add_float4(_Multiply_2e1040ca9c98d085ace76ee93f094039_Out_2_Vector4, _Add_769d9ee909c9238dbbf72d2800a2f268_Out_2_Vector4, _Add_14295f72880e4b87a1baf1ced943ac40_Out_2_Vector4);
        float _Add_e59af300bba2498db32eac1412123447_Out_2_Float;
        Unity_Add_float(_Split_ae83014fcbd9f7879a0b91fa66dc9718_R_1_Float, _Split_ae83014fcbd9f7879a0b91fa66dc9718_G_2_Float, _Add_e59af300bba2498db32eac1412123447_Out_2_Float);
        float _Add_e855069f047fae8ea9027d56acb61e56_Out_2_Float;
        Unity_Add_float(_Add_e59af300bba2498db32eac1412123447_Out_2_Float, _Split_ae83014fcbd9f7879a0b91fa66dc9718_B_3_Float, _Add_e855069f047fae8ea9027d56acb61e56_Out_2_Float);
        float4 _Divide_91ae4b94f1d9b78e99d0472293b8098c_Out_2_Vector4;
        Unity_Divide_float4(_Add_14295f72880e4b87a1baf1ced943ac40_Out_2_Vector4, (_Add_e855069f047fae8ea9027d56acb61e56_Out_2_Float.xxxx), _Divide_91ae4b94f1d9b78e99d0472293b8098c_Out_2_Vector4);
        XYZ_1 = _Divide_91ae4b94f1d9b78e99d0472293b8098c_Out_2_Vector4;
        XZ_2 = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4;
        YZ_3 = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4;
        XY_4 = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4;
        }
        
        void Unity_Clamp_float(float In, float Min, float Max, out float Out)
        {
            Out = clamp(In, Min, Max);
        }
        
        void Unity_Add_float2(float2 A, float2 B, out float2 Out)
        {
            Out = A + B;
        }
        
        void Unity_DotProduct_float2(float2 A, float2 B, out float Out)
        {
            Out = dot(A, B);
        }
        
        void Unity_OneMinus_float(float In, out float Out)
        {
            Out = 1 - In;
        }
        
        void Unity_SquareRoot_float(float In, out float Out)
        {
            Out = sqrt(In);
        }
        
        void Unity_Clamp_float3(float3 In, float3 Min, float3 Max, out float3 Out)
        {
            Out = clamp(In, Min, Max);
        }
        
        void Unity_Normalize_float3(float3 In, out float3 Out)
        {
            Out = normalize(In);
        }
        
        void Unity_Branch_float3(float Predicate, float3 True, float3 False, out float3 Out)
        {
            Out = Predicate ? True : False;
        }
        
        struct Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float
        {
        float3 WorldSpaceNormal;
        float3 WorldSpaceTangent;
        float3 WorldSpaceBiTangent;
        float3 AbsoluteWorldSpacePosition;
        half4 uv0;
        half4 uv2;
        };
        
        void SG_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float(UnityTexture2D Texture2D_80A3D28F, float4 Vector4_82674548, float Boolean_9FF42DF6, UnitySamplerState _SamplerState, float Boolean_5ddfe6daabcc4715a44b5f34fc19becb, Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float IN, out float4 XZ_2)
        {
        float _Property_1ef12cf3201a938993fe6a7951b0e754_Out_0_Boolean = Boolean_9FF42DF6;
        UnityTexture2D _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D = Texture2D_80A3D28F;
        float _Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
        float _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
        float _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
        float _Split_89ed63cb625cb3878c183d0b71c03400_A_4_Float = 0;
        float4 _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4;
        float3 _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3;
        float2 _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, float(0), float(0), _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3, _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2);
        float4 _Property_3fa1d6f912feb481ba60f2e55e62e746_Out_0_Vector4 = Vector4_82674548;
        float _Split_a2e12fa5931da084b2949343a539dfd8_R_1_Float = _Property_3fa1d6f912feb481ba60f2e55e62e746_Out_0_Vector4[0];
        float _Split_a2e12fa5931da084b2949343a539dfd8_G_2_Float = _Property_3fa1d6f912feb481ba60f2e55e62e746_Out_0_Vector4[1];
        float _Split_a2e12fa5931da084b2949343a539dfd8_B_3_Float = _Property_3fa1d6f912feb481ba60f2e55e62e746_Out_0_Vector4[2];
        float _Split_a2e12fa5931da084b2949343a539dfd8_A_4_Float = _Property_3fa1d6f912feb481ba60f2e55e62e746_Out_0_Vector4[3];
        float _Divide_c36b770dfaa0bb8f85ab27da5fd794f0_Out_2_Float;
        Unity_Divide_float(float(1), _Split_a2e12fa5931da084b2949343a539dfd8_R_1_Float, _Divide_c36b770dfaa0bb8f85ab27da5fd794f0_Out_2_Float);
        float4 _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, (_Divide_c36b770dfaa0bb8f85ab27da5fd794f0_Out_2_Float.xxxx), _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4);
        float _Property_058f4fba88c3437288219f1929444bf2_Out_0_Boolean = Boolean_5ddfe6daabcc4715a44b5f34fc19becb;
        float4 _UV_43d85b3291324c848dfbeec6adac2a71_Out_0_Vector4 = IN.uv0;
        float4 _UV_36881dcaab9040168fc5215dcd00f352_Out_0_Vector4 = IN.uv2;
        float4 _Branch_8054d58a73be4ce1b22d48a84389ae07_Out_3_Vector4;
        Unity_Branch_float4(_Property_058f4fba88c3437288219f1929444bf2_Out_0_Boolean, _UV_43d85b3291324c848dfbeec6adac2a71_Out_0_Vector4, _UV_36881dcaab9040168fc5215dcd00f352_Out_0_Vector4, _Branch_8054d58a73be4ce1b22d48a84389ae07_Out_3_Vector4);
        float2 _Vector2_6845d21872714d889783b0cb707df3e9_Out_0_Vector2 = float2(_Split_a2e12fa5931da084b2949343a539dfd8_R_1_Float, _Split_a2e12fa5931da084b2949343a539dfd8_G_2_Float);
        float2 _Vector2_e2e2263627c6098e96a5b5d29350ad03_Out_0_Vector2 = float2(_Split_a2e12fa5931da084b2949343a539dfd8_B_3_Float, _Split_a2e12fa5931da084b2949343a539dfd8_A_4_Float);
        float2 _TilingAndOffset_17582d056c0b8a8dab1017d37497fe59_Out_3_Vector2;
        Unity_TilingAndOffset_float((_Branch_8054d58a73be4ce1b22d48a84389ae07_Out_3_Vector4.xy), _Vector2_6845d21872714d889783b0cb707df3e9_Out_0_Vector2, _Vector2_e2e2263627c6098e96a5b5d29350ad03_Out_0_Vector2, _TilingAndOffset_17582d056c0b8a8dab1017d37497fe59_Out_3_Vector2);
        float2 _Branch_1e152f3aac57448f8518bf2852c000c3_Out_3_Vector2;
        Unity_Branch_float2(_Property_1ef12cf3201a938993fe6a7951b0e754_Out_0_Boolean, (_Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4.xy), _TilingAndOffset_17582d056c0b8a8dab1017d37497fe59_Out_3_Vector2, _Branch_1e152f3aac57448f8518bf2852c000c3_Out_3_Vector2);
        UnitySamplerState _Property_69f1ed7efd1b494e91f626b88ab2363c_Out_0_SamplerState = _SamplerState;
        float4 _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, _Property_69f1ed7efd1b494e91f626b88ab2363c_Out_0_SamplerState.samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Branch_1e152f3aac57448f8518bf2852c000c3_Out_3_Vector2) );
        _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4);
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.r;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.g;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.b;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_A_7_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.a;
        float2 _Vector2_ad6bd100e273d78fa409a30a77bfa2cc_Out_0_Vector2 = float2(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float, _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float);
        float3 _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3;
        Unity_Sign_float3(IN.WorldSpaceNormal, _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3);
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_R_1_Float = _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3[0];
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_G_2_Float = _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3[1];
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_B_3_Float = _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3[2];
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_A_4_Float = 0;
        float2 _Vector2_b76cb1842101e58b9e636d49b075c612_Out_0_Vector2 = float2(_Split_6299d4ddcc4c74828aea40a46fdb896e_G_2_Float, float(1));
        float2 _Multiply_31e8db88ee20c985a9850d1a58f3282b_Out_2_Vector2;
        Unity_Multiply_float2_float2(_Vector2_ad6bd100e273d78fa409a30a77bfa2cc_Out_0_Vector2, _Vector2_b76cb1842101e58b9e636d49b075c612_Out_0_Vector2, _Multiply_31e8db88ee20c985a9850d1a58f3282b_Out_2_Vector2);
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_R_1_Float = IN.WorldSpaceNormal[0];
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_G_2_Float = IN.WorldSpaceNormal[1];
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_B_3_Float = IN.WorldSpaceNormal[2];
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_A_4_Float = 0;
        float2 _Vector2_70e5837843f28b8b9d64cada3697bd5a_Out_0_Vector2 = float2(_Split_5ed44bf2eca0868f81eb18100f49d1fa_R_1_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_B_3_Float);
        float2 _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2;
        Unity_Add_float2(_Multiply_31e8db88ee20c985a9850d1a58f3282b_Out_2_Vector2, _Vector2_70e5837843f28b8b9d64cada3697bd5a_Out_0_Vector2, _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2);
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_R_1_Float = _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2[0];
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_G_2_Float = _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2[1];
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_B_3_Float = 0;
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_A_4_Float = 0;
        float _Multiply_ab12aea87465a78eaf7fc66c2598d266_Out_2_Float;
        Unity_Multiply_float_float(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_G_2_Float, _Multiply_ab12aea87465a78eaf7fc66c2598d266_Out_2_Float);
        float3 _Vector3_433840b555db308b97e9b14b6a957195_Out_0_Vector3 = float3(_Split_2bc77ca2d17bd78cb2383770ce50b179_R_1_Float, _Multiply_ab12aea87465a78eaf7fc66c2598d266_Out_2_Float, _Split_2bc77ca2d17bd78cb2383770ce50b179_G_2_Float);
        float3 _Transform_c7914cc45a011c89b3f53c55afb51673_Out_1_Vector3;
        {
        float3x3 tangentTransform = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
        _Transform_c7914cc45a011c89b3f53c55afb51673_Out_1_Vector3 = TransformWorldToTangentDir(_Vector3_433840b555db308b97e9b14b6a957195_Out_0_Vector3.xyz, tangentTransform, true);
        }
        float3 _Clamp_3837949a36b5428a82af01e7bcd29952_Out_3_Vector3;
        Unity_Clamp_float3(_Transform_c7914cc45a011c89b3f53c55afb51673_Out_1_Vector3, float3(-1, -1, -1), float3(1, 1, 1), _Clamp_3837949a36b5428a82af01e7bcd29952_Out_3_Vector3);
        float3 _Normalize_09bf8a2bd0a4d38e8b97d5c674f79b44_Out_1_Vector3;
        Unity_Normalize_float3(_Clamp_3837949a36b5428a82af01e7bcd29952_Out_3_Vector3, _Normalize_09bf8a2bd0a4d38e8b97d5c674f79b44_Out_1_Vector3);
        float3 _Branch_9eadf909a90f2f80880f8c56ecc2a91f_Out_3_Vector3;
        Unity_Branch_float3(_Property_1ef12cf3201a938993fe6a7951b0e754_Out_0_Boolean, _Normalize_09bf8a2bd0a4d38e8b97d5c674f79b44_Out_1_Vector3, (_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.xyz), _Branch_9eadf909a90f2f80880f8c56ecc2a91f_Out_3_Vector3);
        XZ_2 = (float4(_Branch_9eadf909a90f2f80880f8c56ecc2a91f_Out_3_Vector3, 1.0));
        }
        
        void Unity_NormalStrength_float(float3 In, float Strength, out float3 Out)
        {
            Out = float3(In.rg * Strength, lerp(1, In.b, saturate(Strength)));
        }
        
        void Unity_NormalBlend_float(float3 A, float3 B, out float3 Out)
        {
            Out = SafeNormalize(float3(A.rg + B.rg, A.b * B.b));
        }
        
        void Unity_Add_float3(float3 A, float3 B, out float3 Out)
        {
            Out = A + B;
        }
        
        void Unity_Divide_float3(float3 A, float3 B, out float3 Out)
        {
            Out = A / B;
        }
        
        struct Bindings_TriplanarNMn_059da9746584140498cd018db3c76047_float
        {
        float3 WorldSpaceNormal;
        float3 WorldSpaceTangent;
        float3 WorldSpaceBiTangent;
        float3 WorldSpacePosition;
        };
        
        void SG_TriplanarNMn_059da9746584140498cd018db3c76047_float(UnityTexture2D Texture2D_80A3D28F, float Vector1_41461AC9, float Vector1_E4D1C13A, Bindings_TriplanarNMn_059da9746584140498cd018db3c76047_float IN, out float4 XYZ_1, out float4 XZ_2, out float4 YZ_3, out float4 XY_4)
        {
        UnityTexture2D _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D = Texture2D_80A3D28F;
        float _Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float = IN.WorldSpacePosition[0];
        float _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float = IN.WorldSpacePosition[1];
        float _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float = IN.WorldSpacePosition[2];
        float _Split_89ed63cb625cb3878c183d0b71c03400_A_4_Float = 0;
        float4 _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4;
        float3 _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3;
        float2 _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, float(0), float(0), _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3, _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2);
        float _Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float = Vector1_41461AC9;
        float4 _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, (_Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float.xxxx), _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4);
        float3 _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3;
        Unity_Sign_float3(IN.WorldSpaceNormal, _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3);
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_R_1_Float = _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3[0];
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_G_2_Float = _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3[1];
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_B_3_Float = _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3[2];
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_A_4_Float = 0;
        float2 _Vector2_b76cb1842101e58b9e636d49b075c612_Out_0_Vector2 = float2(_Split_6299d4ddcc4c74828aea40a46fdb896e_G_2_Float, float(1));
        float2 _Multiply_a87753ad90594382bf3a3a95abbadbc8_Out_2_Vector2;
        Unity_Multiply_float2_float2((_Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4.xy), _Vector2_b76cb1842101e58b9e636d49b075c612_Out_0_Vector2, _Multiply_a87753ad90594382bf3a3a95abbadbc8_Out_2_Vector2);
        float4 _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Multiply_a87753ad90594382bf3a3a95abbadbc8_Out_2_Vector2) );
        _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4);
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.r;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.g;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.b;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_A_7_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.a;
        float2 _Vector2_ad6bd100e273d78fa409a30a77bfa2cc_Out_0_Vector2 = float2(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float, _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float);
        float2 _Multiply_31e8db88ee20c985a9850d1a58f3282b_Out_2_Vector2;
        Unity_Multiply_float2_float2(_Vector2_ad6bd100e273d78fa409a30a77bfa2cc_Out_0_Vector2, _Vector2_b76cb1842101e58b9e636d49b075c612_Out_0_Vector2, _Multiply_31e8db88ee20c985a9850d1a58f3282b_Out_2_Vector2);
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_R_1_Float = IN.WorldSpaceNormal[0];
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_G_2_Float = IN.WorldSpaceNormal[1];
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_B_3_Float = IN.WorldSpaceNormal[2];
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_A_4_Float = 0;
        float2 _Vector2_70e5837843f28b8b9d64cada3697bd5a_Out_0_Vector2 = float2(_Split_5ed44bf2eca0868f81eb18100f49d1fa_R_1_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_B_3_Float);
        float2 _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2;
        Unity_Add_float2(_Multiply_31e8db88ee20c985a9850d1a58f3282b_Out_2_Vector2, _Vector2_70e5837843f28b8b9d64cada3697bd5a_Out_0_Vector2, _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2);
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_R_1_Float = _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2[0];
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_G_2_Float = _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2[1];
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_B_3_Float = 0;
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_A_4_Float = 0;
        float _Multiply_e4fe778b81456d819c52bb414cd95968_Out_2_Float;
        Unity_Multiply_float_float(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_G_2_Float, _Multiply_e4fe778b81456d819c52bb414cd95968_Out_2_Float);
        float3 _Vector3_08f62c5c01619e849f1a7d85a44531ac_Out_0_Vector3 = float3(_Split_2bc77ca2d17bd78cb2383770ce50b179_R_1_Float, _Multiply_e4fe778b81456d819c52bb414cd95968_Out_2_Float, _Split_2bc77ca2d17bd78cb2383770ce50b179_G_2_Float);
        float3 _Absolute_644b798714827680b39bf5d34f70385f_Out_1_Vector3;
        Unity_Absolute_float3(IN.WorldSpaceNormal, _Absolute_644b798714827680b39bf5d34f70385f_Out_1_Vector3);
        float _Property_adc4c59482221c8aad681c6558728ac9_Out_0_Float = Vector1_E4D1C13A;
        float3 _Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3;
        Unity_Power_float3(_Absolute_644b798714827680b39bf5d34f70385f_Out_1_Vector3, (_Property_adc4c59482221c8aad681c6558728ac9_Out_0_Float.xxx), _Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3);
        float3 _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3, _Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3, _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3);
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_R_1_Float = _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3[0];
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_G_2_Float = _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3[1];
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_B_3_Float = _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3[2];
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_A_4_Float = 0;
        float3 _Multiply_2e1040ca9c98d085ace76ee93f094039_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Vector3_08f62c5c01619e849f1a7d85a44531ac_Out_0_Vector3, (_Split_ae83014fcbd9f7879a0b91fa66dc9718_G_2_Float.xxx), _Multiply_2e1040ca9c98d085ace76ee93f094039_Out_2_Vector3);
        float4 _Combine_192c2c4a69be588b90ca005a32e22552_RGBA_4_Vector4;
        float3 _Combine_192c2c4a69be588b90ca005a32e22552_RGB_5_Vector3;
        float2 _Combine_192c2c4a69be588b90ca005a32e22552_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float, float(0), float(0), _Combine_192c2c4a69be588b90ca005a32e22552_RGBA_4_Vector4, _Combine_192c2c4a69be588b90ca005a32e22552_RGB_5_Vector3, _Combine_192c2c4a69be588b90ca005a32e22552_RG_6_Vector2);
        float4 _Multiply_138240d0d4846e87b0febabec0d6891b_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_192c2c4a69be588b90ca005a32e22552_RGBA_4_Vector4, (_Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float.xxxx), _Multiply_138240d0d4846e87b0febabec0d6891b_Out_2_Vector4);
        float _Multiply_de711f4a4614bd89a463b53374cf4036_Out_2_Float;
        Unity_Multiply_float_float(_Split_6299d4ddcc4c74828aea40a46fdb896e_B_3_Float, -1, _Multiply_de711f4a4614bd89a463b53374cf4036_Out_2_Float);
        float2 _Vector2_4ed33f0c73b2698fa6f3c1b77fe76808_Out_0_Vector2 = float2(_Multiply_de711f4a4614bd89a463b53374cf4036_Out_2_Float, float(1));
        float2 _Multiply_2af6058cc6ccb88caefd2799bb5941e8_Out_2_Vector2;
        Unity_Multiply_float2_float2((_Multiply_138240d0d4846e87b0febabec0d6891b_Out_2_Vector4.xy), _Vector2_4ed33f0c73b2698fa6f3c1b77fe76808_Out_0_Vector2, _Multiply_2af6058cc6ccb88caefd2799bb5941e8_Out_2_Vector2);
        float4 _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Multiply_2af6058cc6ccb88caefd2799bb5941e8_Out_2_Vector2) );
        _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4);
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_R_4_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.r;
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_G_5_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.g;
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_B_6_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.b;
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_A_7_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.a;
        float2 _Vector2_fe9aedd4528c7486ada4abdca0b0944e_Out_0_Vector2 = float2(_SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_R_4_Float, _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_G_5_Float);
        float2 _Multiply_02b9b4665ad9918d8721bcaddc82f06f_Out_2_Vector2;
        Unity_Multiply_float2_float2(_Vector2_fe9aedd4528c7486ada4abdca0b0944e_Out_0_Vector2, _Vector2_4ed33f0c73b2698fa6f3c1b77fe76808_Out_0_Vector2, _Multiply_02b9b4665ad9918d8721bcaddc82f06f_Out_2_Vector2);
        float2 _Vector2_a74a85274da15181abb63cc5e8df0de1_Out_0_Vector2 = float2(_Split_5ed44bf2eca0868f81eb18100f49d1fa_R_1_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_G_2_Float);
        float2 _Add_b227c84042055e8faa1a9fdc69529707_Out_2_Vector2;
        Unity_Add_float2(_Multiply_02b9b4665ad9918d8721bcaddc82f06f_Out_2_Vector2, _Vector2_a74a85274da15181abb63cc5e8df0de1_Out_0_Vector2, _Add_b227c84042055e8faa1a9fdc69529707_Out_2_Vector2);
        float _Split_2cfb9eacd8762483941459cdf28bda97_R_1_Float = _Add_b227c84042055e8faa1a9fdc69529707_Out_2_Vector2[0];
        float _Split_2cfb9eacd8762483941459cdf28bda97_G_2_Float = _Add_b227c84042055e8faa1a9fdc69529707_Out_2_Vector2[1];
        float _Split_2cfb9eacd8762483941459cdf28bda97_B_3_Float = 0;
        float _Split_2cfb9eacd8762483941459cdf28bda97_A_4_Float = 0;
        float _Multiply_1d65ce08ce672087879125f2e13c4004_Out_2_Float;
        Unity_Multiply_float_float(_SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_B_6_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_B_3_Float, _Multiply_1d65ce08ce672087879125f2e13c4004_Out_2_Float);
        float3 _Vector3_ba6cfb4671e8c58f9b41ea1dc23102ca_Out_0_Vector3 = float3(_Split_2cfb9eacd8762483941459cdf28bda97_R_1_Float, _Split_2cfb9eacd8762483941459cdf28bda97_G_2_Float, _Multiply_1d65ce08ce672087879125f2e13c4004_Out_2_Float);
        float3 _Multiply_7bb4009c92b108849ac6ca92bc1442f2_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Vector3_ba6cfb4671e8c58f9b41ea1dc23102ca_Out_0_Vector3, (_Split_ae83014fcbd9f7879a0b91fa66dc9718_B_3_Float.xxx), _Multiply_7bb4009c92b108849ac6ca92bc1442f2_Out_2_Vector3);
        float4 _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGBA_4_Vector4;
        float3 _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGB_5_Vector3;
        float2 _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float, float(0), float(0), _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGBA_4_Vector4, _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGB_5_Vector3, _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RG_6_Vector2);
        float4 _Multiply_2c0864423b014f8b8af8523f68cbb63c_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGBA_4_Vector4, (_Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float.xxxx), _Multiply_2c0864423b014f8b8af8523f68cbb63c_Out_2_Vector4);
        float2 _Vector2_a1e23e0f921b6484818f009a2b12a5ba_Out_0_Vector2 = float2(_Split_6299d4ddcc4c74828aea40a46fdb896e_R_1_Float, float(1));
        float2 _Multiply_862402885a49f18cb87278ab53bc6744_Out_2_Vector2;
        Unity_Multiply_float2_float2((_Multiply_2c0864423b014f8b8af8523f68cbb63c_Out_2_Vector4.xy), _Vector2_a1e23e0f921b6484818f009a2b12a5ba_Out_0_Vector2, _Multiply_862402885a49f18cb87278ab53bc6744_Out_2_Vector2);
        float4 _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Multiply_862402885a49f18cb87278ab53bc6744_Out_2_Vector2) );
        _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4);
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_R_4_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.r;
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_G_5_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.g;
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_B_6_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.b;
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_A_7_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.a;
        float _Multiply_4649b768be76d784a3284bacde795359_Out_2_Float;
        Unity_Multiply_float_float(_SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_B_6_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_R_1_Float, _Multiply_4649b768be76d784a3284bacde795359_Out_2_Float);
        float2 _Vector2_819fcd5eb484438eacad1987576d7d67_Out_0_Vector2 = float2(_SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_R_4_Float, _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_G_5_Float);
        float2 _Multiply_58530ebb3c6d798b93686a76247bf505_Out_2_Vector2;
        Unity_Multiply_float2_float2(_Vector2_819fcd5eb484438eacad1987576d7d67_Out_0_Vector2, _Vector2_a1e23e0f921b6484818f009a2b12a5ba_Out_0_Vector2, _Multiply_58530ebb3c6d798b93686a76247bf505_Out_2_Vector2);
        float2 _Vector2_e293c112b2f49e88a5fe46dfb1fbeb40_Out_0_Vector2 = float2(_Split_5ed44bf2eca0868f81eb18100f49d1fa_B_3_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_G_2_Float);
        float2 _Add_cf00fb232c6e2b8e973ab2f84453f55e_Out_2_Vector2;
        Unity_Add_float2(_Multiply_58530ebb3c6d798b93686a76247bf505_Out_2_Vector2, _Vector2_e293c112b2f49e88a5fe46dfb1fbeb40_Out_0_Vector2, _Add_cf00fb232c6e2b8e973ab2f84453f55e_Out_2_Vector2);
        float _Split_3ea3e61d32bdd78f82c686b75ff3fd9b_R_1_Float = _Add_cf00fb232c6e2b8e973ab2f84453f55e_Out_2_Vector2[0];
        float _Split_3ea3e61d32bdd78f82c686b75ff3fd9b_G_2_Float = _Add_cf00fb232c6e2b8e973ab2f84453f55e_Out_2_Vector2[1];
        float _Split_3ea3e61d32bdd78f82c686b75ff3fd9b_B_3_Float = 0;
        float _Split_3ea3e61d32bdd78f82c686b75ff3fd9b_A_4_Float = 0;
        float3 _Vector3_13a08d5940172a84a78ee3d9b8766833_Out_0_Vector3 = float3(_Multiply_4649b768be76d784a3284bacde795359_Out_2_Float, _Split_3ea3e61d32bdd78f82c686b75ff3fd9b_G_2_Float, _Split_3ea3e61d32bdd78f82c686b75ff3fd9b_R_1_Float);
        float3 _Multiply_77818c22e359fc8cbb7dd20216a8db72_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Vector3_13a08d5940172a84a78ee3d9b8766833_Out_0_Vector3, (_Split_ae83014fcbd9f7879a0b91fa66dc9718_R_1_Float.xxx), _Multiply_77818c22e359fc8cbb7dd20216a8db72_Out_2_Vector3);
        float3 _Add_769d9ee909c9238dbbf72d2800a2f268_Out_2_Vector3;
        Unity_Add_float3(_Multiply_7bb4009c92b108849ac6ca92bc1442f2_Out_2_Vector3, _Multiply_77818c22e359fc8cbb7dd20216a8db72_Out_2_Vector3, _Add_769d9ee909c9238dbbf72d2800a2f268_Out_2_Vector3);
        float3 _Add_14295f72880e4b87a1baf1ced943ac40_Out_2_Vector3;
        Unity_Add_float3(_Multiply_2e1040ca9c98d085ace76ee93f094039_Out_2_Vector3, _Add_769d9ee909c9238dbbf72d2800a2f268_Out_2_Vector3, _Add_14295f72880e4b87a1baf1ced943ac40_Out_2_Vector3);
        float _Add_e59af300bba2498db32eac1412123447_Out_2_Float;
        Unity_Add_float(_Split_ae83014fcbd9f7879a0b91fa66dc9718_R_1_Float, _Split_ae83014fcbd9f7879a0b91fa66dc9718_G_2_Float, _Add_e59af300bba2498db32eac1412123447_Out_2_Float);
        float _Add_e855069f047fae8ea9027d56acb61e56_Out_2_Float;
        Unity_Add_float(_Add_e59af300bba2498db32eac1412123447_Out_2_Float, _Split_ae83014fcbd9f7879a0b91fa66dc9718_B_3_Float, _Add_e855069f047fae8ea9027d56acb61e56_Out_2_Float);
        float3 _Divide_91ae4b94f1d9b78e99d0472293b8098c_Out_2_Vector3;
        Unity_Divide_float3(_Add_14295f72880e4b87a1baf1ced943ac40_Out_2_Vector3, (_Add_e855069f047fae8ea9027d56acb61e56_Out_2_Float.xxx), _Divide_91ae4b94f1d9b78e99d0472293b8098c_Out_2_Vector3);
        float3 _Transform_73eecc0c3689d184a34c8d0f28a58adf_Out_1_Vector3;
        {
        float3x3 tangentTransform = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
        _Transform_73eecc0c3689d184a34c8d0f28a58adf_Out_1_Vector3 = TransformWorldToTangentDir(_Divide_91ae4b94f1d9b78e99d0472293b8098c_Out_2_Vector3.xyz, tangentTransform, true);
        }
        float3 _Normalize_15ef346824db0a8797631ed8b998e673_Out_1_Vector3;
        Unity_Normalize_float3(_Transform_73eecc0c3689d184a34c8d0f28a58adf_Out_1_Vector3, _Normalize_15ef346824db0a8797631ed8b998e673_Out_1_Vector3);
        XYZ_1 = (float4(_Normalize_15ef346824db0a8797631ed8b998e673_Out_1_Vector3, 1.0));
        XZ_2 = (float4(_Vector3_08f62c5c01619e849f1a7d85a44531ac_Out_0_Vector3, 1.0));
        YZ_3 = (float4(_Vector3_ba6cfb4671e8c58f9b41ea1dc23102ca_Out_0_Vector3, 1.0));
        XY_4 = (float4(_Vector3_13a08d5940172a84a78ee3d9b8766833_Out_0_Vector3, 1.0));
        }
        
        void Unity_Subtract_float(float A, float B, out float Out)
        {
            Out = A - B;
        }
        
        void Unity_Power_float(float A, float B, out float Out)
        {
            Out = pow(A, B);
        }
        
        void Unity_Lerp_float3(float3 A, float3 B, float3 T, out float3 Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Remap_float(float In, float2 InMinMax, float2 OutMinMax, out float Out)
        {
            Out = OutMinMax.x + (In - InMinMax.x) * (OutMinMax.y - OutMinMax.x) / (InMinMax.y - InMinMax.x);
        }
        
        // Custom interpolators pre vertex
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPreVertex' */
        
        // Graph Vertex
        struct VertexDescription
        {
            float3 Position;
            float3 Normal;
            float3 Tangent;
        };
        
        VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
        {
            VertexDescription description = (VertexDescription)0;
            description.Position = IN.ObjectSpacePosition;
            description.Normal = IN.ObjectSpaceNormal;
            description.Tangent = IN.ObjectSpaceTangent;
            return description;
        }
        
        // Custom interpolators, pre surface
        #ifdef FEATURES_GRAPH_VERTEX
        Varyings CustomInterpolatorPassThroughFunc(inout Varyings output, VertexDescription input)
        {
        return output;
        }
        #define CUSTOMINTERPOLATOR_VARYPASSTHROUGH_FUNC
        #endif
        
        // Graph Pixel
        struct SurfaceDescription
        {
            float3 BaseColor;
            float Alpha;
            float AlphaClipThreshold;
        };
        
        SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
        {
            SurfaceDescription surface = (SurfaceDescription)0;
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_05d49814100eb3808cd61a6177622291_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseColorMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_e21be9beec8d858fa2818b2fddc4577c_Out_0_Vector4 = _BaseTilingOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_1b1963c0ccb4d78fa3474b362fd31d15_Out_0_Boolean = _BaseUsePlanarUV;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae;
            _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae.uv0 = IN.uv0;
            _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae.uv2 = IN.uv2;
            float4 _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_05d49814100eb3808cd61a6177622291_Out_0_Texture2D, _Property_e21be9beec8d858fa2818b2fddc4577c_Out_0_Vector4, _Property_1b1963c0ccb4d78fa3474b362fd31d15_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), 1, _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae, _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae_XZ_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_03a155c84233b98dbb11cd710d6e1539_Out_0_Vector4 = _BaseColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Multiply_9cb5181459454189b39d6838c2a6fb85_Out_2_Vector4;
            Unity_Multiply_float4_float4(_PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae_XZ_2_Vector4, _Property_03a155c84233b98dbb11cd710d6e1539_Out_0_Vector4, _Multiply_9cb5181459454189b39d6838c2a6fb85_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_b26f64bfa09eb48584b1dc9133f5b840_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_DetailMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_bb28507cb268918795cf74b32a6b3693_Out_0_Vector4 = _DetailTilingOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_a5f9848f7817b48ca226ca228efcc28e_R_1_Float = _Property_bb28507cb268918795cf74b32a6b3693_Out_0_Vector4[0];
            float _Split_a5f9848f7817b48ca226ca228efcc28e_G_2_Float = _Property_bb28507cb268918795cf74b32a6b3693_Out_0_Vector4[1];
            float _Split_a5f9848f7817b48ca226ca228efcc28e_B_3_Float = _Property_bb28507cb268918795cf74b32a6b3693_Out_0_Vector4[2];
            float _Split_a5f9848f7817b48ca226ca228efcc28e_A_4_Float = _Property_bb28507cb268918795cf74b32a6b3693_Out_0_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_257255e4b3cee8888b124cb1330da379_Out_0_Vector2 = float2(_Split_a5f9848f7817b48ca226ca228efcc28e_R_1_Float, _Split_a5f9848f7817b48ca226ca228efcc28e_G_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_2ba978ab0f3ccc84b3fe592845432576_Out_0_Vector2 = float2(_Split_a5f9848f7817b48ca226ca228efcc28e_B_3_Float, _Split_a5f9848f7817b48ca226ca228efcc28e_A_4_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _TilingAndOffset_9bc6b1e938f4668f9476625fa68aff4e_Out_3_Vector2;
            Unity_TilingAndOffset_float(IN.uv0.xy, _Vector2_257255e4b3cee8888b124cb1330da379_Out_0_Vector2, _Vector2_2ba978ab0f3ccc84b3fe592845432576_Out_0_Vector2, _TilingAndOffset_9bc6b1e938f4668f9476625fa68aff4e_Out_3_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_b26f64bfa09eb48584b1dc9133f5b840_Out_0_Texture2D.tex, _Property_b26f64bfa09eb48584b1dc9133f5b840_Out_0_Texture2D.samplerstate, _Property_b26f64bfa09eb48584b1dc9133f5b840_Out_0_Texture2D.GetTransformedUV(_TilingAndOffset_9bc6b1e938f4668f9476625fa68aff4e_Out_3_Vector2) );
            float _SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_R_4_Float = _SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_RGBA_0_Vector4.r;
            float _SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_G_5_Float = _SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_RGBA_0_Vector4.g;
            float _SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_B_6_Float = _SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_RGBA_0_Vector4.b;
            float _SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_A_7_Float = _SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_99a7a45efebe0588afbd74b8df9b4750_Out_2_Float;
            Unity_Multiply_float_float(_SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_R_4_Float, 2, _Multiply_99a7a45efebe0588afbd74b8df9b4750_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_ddcd7f2c8505e0818230ed34d7ecdf92_Out_2_Float;
            Unity_Add_float(_Multiply_99a7a45efebe0588afbd74b8df9b4750_Out_2_Float, float(-1), _Add_ddcd7f2c8505e0818230ed34d7ecdf92_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_b7367df1085ac580b7d5b9785921d152_Out_0_Float = _DetailAlbedoScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_874d814eeb0e7782842ad64a4d97f43e_Out_2_Float;
            Unity_Multiply_float_float(_Add_ddcd7f2c8505e0818230ed34d7ecdf92_Out_2_Float, _Property_b7367df1085ac580b7d5b9785921d152_Out_0_Float, _Multiply_874d814eeb0e7782842ad64a4d97f43e_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Saturate_40d0c48fa8fb008799c2060b9ccfede9_Out_1_Float;
            Unity_Saturate_float(_Multiply_874d814eeb0e7782842ad64a4d97f43e_Out_2_Float, _Saturate_40d0c48fa8fb008799c2060b9ccfede9_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Absolute_7ea0f8a0aaf24186a357f11eca841a0c_Out_1_Float;
            Unity_Absolute_float(_Saturate_40d0c48fa8fb008799c2060b9ccfede9_Out_1_Float, _Absolute_7ea0f8a0aaf24186a357f11eca841a0c_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_BlendOverlayBaseColor_acdb3dfca72bd6b42bbc35f4613331a2_float _BlendOverlayBaseColor_9ac50a6865d3648181da5f6189b8832d;
            float3 _BlendOverlayBaseColor_9ac50a6865d3648181da5f6189b8832d_OutVector4_1_Vector3;
            SG_BlendOverlayBaseColor_acdb3dfca72bd6b42bbc35f4613331a2_float(_Multiply_9cb5181459454189b39d6838c2a6fb85_Out_2_Vector4, _Add_ddcd7f2c8505e0818230ed34d7ecdf92_Out_2_Float, _Absolute_7ea0f8a0aaf24186a357f11eca841a0c_Out_1_Float, _BlendOverlayBaseColor_9ac50a6865d3648181da5f6189b8832d, _BlendOverlayBaseColor_9ac50a6865d3648181da5f6189b8832d_OutVector4_1_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_5d67b392da5ceb81b51a3bfe5384ad00_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverBaseColorMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_e95f6f4e76cecb87871151040535a080_Out_0_Vector4 = _CoverTilingOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Divide_acbbd9727ffda783aeafe28ccafbde8e_Out_2_Vector4;
            Unity_Divide_float4(float4(1, 1, 0, 0), _Property_e95f6f4e76cecb87871151040535a080_Out_0_Vector4, _Divide_acbbd9727ffda783aeafe28ccafbde8e_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_faa4f436225f4e8eb99135b1d078135e_Out_0_Float = _CoverTriplanarThreshold;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_cd8ee86e67e5fe898c7968f92e11e481;
            _TriplanarNM_cd8ee86e67e5fe898c7968f92e11e481.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_cd8ee86e67e5fe898c7968f92e11e481.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_cd8ee86e67e5fe898c7968f92e11e481_XYZ_1_Vector4;
            float4 _TriplanarNM_cd8ee86e67e5fe898c7968f92e11e481_XZ_2_Vector4;
            float4 _TriplanarNM_cd8ee86e67e5fe898c7968f92e11e481_YZ_3_Vector4;
            float4 _TriplanarNM_cd8ee86e67e5fe898c7968f92e11e481_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_5d67b392da5ceb81b51a3bfe5384ad00_Out_0_Texture2D, (_Divide_acbbd9727ffda783aeafe28ccafbde8e_Out_2_Vector4).x, _Property_faa4f436225f4e8eb99135b1d078135e_Out_0_Float, _TriplanarNM_cd8ee86e67e5fe898c7968f92e11e481, _TriplanarNM_cd8ee86e67e5fe898c7968f92e11e481_XYZ_1_Vector4, _TriplanarNM_cd8ee86e67e5fe898c7968f92e11e481_XZ_2_Vector4, _TriplanarNM_cd8ee86e67e5fe898c7968f92e11e481_YZ_3_Vector4, _TriplanarNM_cd8ee86e67e5fe898c7968f92e11e481_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_65c5d9a1688ae98ba437bc3f4b866f99_Out_0_Vector4 = _CoverBaseColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Multiply_b7294cbf7c9daa85b18c13beaf3dc8bd_Out_2_Vector4;
            Unity_Multiply_float4_float4(_TriplanarNM_cd8ee86e67e5fe898c7968f92e11e481_XYZ_1_Vector4, _Property_65c5d9a1688ae98ba437bc3f4b866f99_Out_0_Vector4, _Multiply_b7294cbf7c9daa85b18c13beaf3dc8bd_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_43c6facd1f553289befba1782fe8ad70_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverMaskA);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _UV_5b74fb710ad3d187a00f16e1d8f8bd63_Out_0_Vector4 = IN.uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _SampleTexture2D_4d4c63c65e48c28ba5f624928f181789_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_43c6facd1f553289befba1782fe8ad70_Out_0_Texture2D.tex, _Property_43c6facd1f553289befba1782fe8ad70_Out_0_Texture2D.samplerstate, _Property_43c6facd1f553289befba1782fe8ad70_Out_0_Texture2D.GetTransformedUV((_UV_5b74fb710ad3d187a00f16e1d8f8bd63_Out_0_Vector4.xy)) );
            float _SampleTexture2D_4d4c63c65e48c28ba5f624928f181789_R_4_Float = _SampleTexture2D_4d4c63c65e48c28ba5f624928f181789_RGBA_0_Vector4.r;
            float _SampleTexture2D_4d4c63c65e48c28ba5f624928f181789_G_5_Float = _SampleTexture2D_4d4c63c65e48c28ba5f624928f181789_RGBA_0_Vector4.g;
            float _SampleTexture2D_4d4c63c65e48c28ba5f624928f181789_B_6_Float = _SampleTexture2D_4d4c63c65e48c28ba5f624928f181789_RGBA_0_Vector4.b;
            float _SampleTexture2D_4d4c63c65e48c28ba5f624928f181789_A_7_Float = _SampleTexture2D_4d4c63c65e48c28ba5f624928f181789_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_4080f51767261687a64910057bc980cb_Out_0_Float = _CoverMaskPower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_2660ad962697408681e2e8c36648ca12_Out_2_Float;
            Unity_Multiply_float_float(_SampleTexture2D_4d4c63c65e48c28ba5f624928f181789_A_7_Float, _Property_4080f51767261687a64910057bc980cb_Out_0_Float, _Multiply_2660ad962697408681e2e8c36648ca12_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_572d83500486058c99890c5d609b30b0_Out_3_Float;
            Unity_Clamp_float(_Multiply_2660ad962697408681e2e8c36648ca12_Out_2_Float, float(0), float(1), _Clamp_572d83500486058c99890c5d609b30b0_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Property_3d047323d7f9778ca2b1b7d7d4d43210_Out_0_Vector3 = _CoverDirection;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_3f76f18aa45a858dab65f5835e23f0b9_Out_0_Vector2 = float2(_SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_A_7_Float, _SampleTexture2D_2fd59f973da4b58ebfcd7374218d1640_G_5_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Multiply_a3cb438c86db8a839543847f1fa26666_Out_2_Vector2;
            Unity_Multiply_float2_float2(_Vector2_3f76f18aa45a858dab65f5835e23f0b9_Out_0_Vector2, float2(2, 2), _Multiply_a3cb438c86db8a839543847f1fa26666_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Add_21eb70b8cab75f8a852dd8dd64767430_Out_2_Vector2;
            Unity_Add_float2(_Multiply_a3cb438c86db8a839543847f1fa26666_Out_2_Vector2, float2(-1, -1), _Add_21eb70b8cab75f8a852dd8dd64767430_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_cbbb2e4ef035b58e8c751d96843d987e_Out_0_Float = _DetailNormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Multiply_d4afe7aea32def8ca3c89b2f7e87af44_Out_2_Vector2;
            Unity_Multiply_float2_float2(_Add_21eb70b8cab75f8a852dd8dd64767430_Out_2_Vector2, (_Property_cbbb2e4ef035b58e8c751d96843d987e_Out_0_Float.xx), _Multiply_d4afe7aea32def8ca3c89b2f7e87af44_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_f88dc76333998681a9031ef1324e052a_R_1_Float = _Multiply_d4afe7aea32def8ca3c89b2f7e87af44_Out_2_Vector2[0];
            float _Split_f88dc76333998681a9031ef1324e052a_G_2_Float = _Multiply_d4afe7aea32def8ca3c89b2f7e87af44_Out_2_Vector2[1];
            float _Split_f88dc76333998681a9031ef1324e052a_B_3_Float = 0;
            float _Split_f88dc76333998681a9031ef1324e052a_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _DotProduct_970a707dd71afa80887b08c47998be6e_Out_2_Float;
            Unity_DotProduct_float2(_Multiply_d4afe7aea32def8ca3c89b2f7e87af44_Out_2_Vector2, _Multiply_d4afe7aea32def8ca3c89b2f7e87af44_Out_2_Vector2, _DotProduct_970a707dd71afa80887b08c47998be6e_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Saturate_6a42dc6ad32c63849dbf7844d1081b82_Out_1_Float;
            Unity_Saturate_float(_DotProduct_970a707dd71afa80887b08c47998be6e_Out_2_Float, _Saturate_6a42dc6ad32c63849dbf7844d1081b82_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_a724d53a195cd387a0d6ec2d11ec64e8_Out_1_Float;
            Unity_OneMinus_float(_Saturate_6a42dc6ad32c63849dbf7844d1081b82_Out_1_Float, _OneMinus_a724d53a195cd387a0d6ec2d11ec64e8_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _SquareRoot_6e074ca49330118a958f11e9487fe5c6_Out_1_Float;
            Unity_SquareRoot_float(_OneMinus_a724d53a195cd387a0d6ec2d11ec64e8_Out_1_Float, _SquareRoot_6e074ca49330118a958f11e9487fe5c6_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Vector3_a6a5e3fb326314838a5e436f55de8dcc_Out_0_Vector3 = float3(_Split_f88dc76333998681a9031ef1324e052a_R_1_Float, _Split_f88dc76333998681a9031ef1324e052a_G_2_Float, _SquareRoot_6e074ca49330118a958f11e9487fe5c6_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_2e4a88374e8ffd8db37352d79f10740a_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseNormalMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float _PlanarNMn_126f337c769a878bb33ea56bcab1d637;
            _PlanarNMn_126f337c769a878bb33ea56bcab1d637.WorldSpaceNormal = IN.WorldSpaceNormal;
            _PlanarNMn_126f337c769a878bb33ea56bcab1d637.WorldSpaceTangent = IN.WorldSpaceTangent;
            _PlanarNMn_126f337c769a878bb33ea56bcab1d637.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _PlanarNMn_126f337c769a878bb33ea56bcab1d637.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNMn_126f337c769a878bb33ea56bcab1d637.uv0 = IN.uv0;
            _PlanarNMn_126f337c769a878bb33ea56bcab1d637.uv2 = IN.uv2;
            float4 _PlanarNMn_126f337c769a878bb33ea56bcab1d637_XZ_2_Vector4;
            SG_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float(_Property_2e4a88374e8ffd8db37352d79f10740a_Out_0_Texture2D, _Property_e21be9beec8d858fa2818b2fddc4577c_Out_0_Vector4, _Property_1b1963c0ccb4d78fa3474b362fd31d15_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), 1, _PlanarNMn_126f337c769a878bb33ea56bcab1d637, _PlanarNMn_126f337c769a878bb33ea56bcab1d637_XZ_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_ea100595101f088a94e70278a910a34c_Out_0_Float = _BaseNormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _NormalStrength_70f3e500f60967898e02d8fc8200db59_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_126f337c769a878bb33ea56bcab1d637_XZ_2_Vector4.xyz), _Property_ea100595101f088a94e70278a910a34c_Out_0_Float, _NormalStrength_70f3e500f60967898e02d8fc8200db59_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _NormalBlend_58a0c0d45b55168cbfa43fa9d9da21c6_Out_2_Vector3;
            Unity_NormalBlend_float(_Vector3_a6a5e3fb326314838a5e436f55de8dcc_Out_0_Vector3, _NormalStrength_70f3e500f60967898e02d8fc8200db59_Out_2_Vector3, _NormalBlend_58a0c0d45b55168cbfa43fa9d9da21c6_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_bb2720e978ff4782bb872fb7b877636f_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverNormalMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNMn_059da9746584140498cd018db3c76047_float _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b;
            _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b.WorldSpaceTangent = IN.WorldSpaceTangent;
            _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b.WorldSpacePosition = IN.WorldSpacePosition;
            float4 _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b_XYZ_1_Vector4;
            float4 _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b_XZ_2_Vector4;
            float4 _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b_YZ_3_Vector4;
            float4 _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b_XY_4_Vector4;
            SG_TriplanarNMn_059da9746584140498cd018db3c76047_float(_Property_bb2720e978ff4782bb872fb7b877636f_Out_0_Texture2D, (_Divide_acbbd9727ffda783aeafe28ccafbde8e_Out_2_Vector4).x, _Property_faa4f436225f4e8eb99135b1d078135e_Out_0_Float, _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b, _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b_XYZ_1_Vector4, _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b_XZ_2_Vector4, _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b_YZ_3_Vector4, _TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_f6ae16d8d2c85685b4072d78c56e29e9_Out_0_Float = _CoverNormalBlendHardness;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _NormalStrength_11fab77b71140d8ab0735a9615b728ec_Out_2_Vector3;
            Unity_NormalStrength_float((_TriplanarNMn_82ed151a6b99b681b9a62a8103a7661b_XYZ_1_Vector4.xyz), _Property_f6ae16d8d2c85685b4072d78c56e29e9_Out_0_Float, _NormalStrength_11fab77b71140d8ab0735a9615b728ec_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Multiply_fa49280de269898ebbfe89d446d57ecc_Out_2_Vector3;
            Unity_Multiply_float3_float3(_Property_3d047323d7f9778ca2b1b7d7d4d43210_Out_0_Vector3, IN.WorldSpaceNormal, _Multiply_fa49280de269898ebbfe89d446d57ecc_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_91e143818eee6187b799b2a4652eeb95_R_1_Float = _Multiply_fa49280de269898ebbfe89d446d57ecc_Out_2_Vector3[0];
            float _Split_91e143818eee6187b799b2a4652eeb95_G_2_Float = _Multiply_fa49280de269898ebbfe89d446d57ecc_Out_2_Vector3[1];
            float _Split_91e143818eee6187b799b2a4652eeb95_B_3_Float = _Multiply_fa49280de269898ebbfe89d446d57ecc_Out_2_Vector3[2];
            float _Split_91e143818eee6187b799b2a4652eeb95_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_f99764306bf31e8484b14d9a1ba660a3_Out_2_Float;
            Unity_Add_float(_Split_91e143818eee6187b799b2a4652eeb95_R_1_Float, _Split_91e143818eee6187b799b2a4652eeb95_G_2_Float, _Add_f99764306bf31e8484b14d9a1ba660a3_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_25d0cda769439c85a6176b0cf9af06c0_Out_2_Float;
            Unity_Add_float(_Add_f99764306bf31e8484b14d9a1ba660a3_Out_2_Float, _Split_91e143818eee6187b799b2a4652eeb95_B_3_Float, _Add_25d0cda769439c85a6176b0cf9af06c0_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_24df69e5dc52008e891c2b3f99e28991_Out_0_Float = _Cover_Amount;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_7b25e9aea29e888e99e5155562106e70_Out_0_Float = _Cover_Amount_Grow_Speed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Subtract_a31b2e64f122188ea610c77d3f62f810_Out_2_Float;
            Unity_Subtract_float(float(4), _Property_7b25e9aea29e888e99e5155562106e70_Out_0_Float, _Subtract_a31b2e64f122188ea610c77d3f62f810_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_15277685f0785f8a90f4492c80247159_Out_2_Float;
            Unity_Divide_float(_Property_24df69e5dc52008e891c2b3f99e28991_Out_0_Float, _Subtract_a31b2e64f122188ea610c77d3f62f810_Out_2_Float, _Divide_15277685f0785f8a90f4492c80247159_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Absolute_ac1c6e27d47e508e8aed26d3db167120_Out_1_Float;
            Unity_Absolute_float(_Divide_15277685f0785f8a90f4492c80247159_Out_2_Float, _Absolute_ac1c6e27d47e508e8aed26d3db167120_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Power_d5a03bba02ea638f84c50ca9f6a3e112_Out_2_Float;
            Unity_Power_float(_Absolute_ac1c6e27d47e508e8aed26d3db167120_Out_1_Float, _Subtract_a31b2e64f122188ea610c77d3f62f810_Out_2_Float, _Power_d5a03bba02ea638f84c50ca9f6a3e112_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_1be0e9928e2c0489b16295f57a026487_Out_3_Float;
            Unity_Clamp_float(_Power_d5a03bba02ea638f84c50ca9f6a3e112_Out_2_Float, float(0), float(2), _Clamp_1be0e9928e2c0489b16295f57a026487_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_041ba179c4133288bd6ebb7932697351_Out_2_Float;
            Unity_Multiply_float_float(_Add_25d0cda769439c85a6176b0cf9af06c0_Out_2_Float, _Clamp_1be0e9928e2c0489b16295f57a026487_Out_3_Float, _Multiply_041ba179c4133288bd6ebb7932697351_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Saturate_f03610d99dc38b8688cdf6c95924daaf_Out_1_Float;
            Unity_Saturate_float(_Multiply_041ba179c4133288bd6ebb7932697351_Out_2_Float, _Saturate_f03610d99dc38b8688cdf6c95924daaf_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_78437b2d5aa53f829edcee712f066e04_Out_3_Float;
            Unity_Clamp_float(_Add_25d0cda769439c85a6176b0cf9af06c0_Out_2_Float, float(0), float(0.9999), _Clamp_78437b2d5aa53f829edcee712f066e04_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_32c30bd23dc33184849662569cd46759_Out_0_Float = _Cover_Max_Angle;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_9d9e98ea75888d85877f3863930719aa_Out_2_Float;
            Unity_Divide_float(_Property_32c30bd23dc33184849662569cd46759_Out_0_Float, float(45), _Divide_9d9e98ea75888d85877f3863930719aa_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_fa817fbd2ba8aa81bf3977d104f66ffd_Out_1_Float;
            Unity_OneMinus_float(_Divide_9d9e98ea75888d85877f3863930719aa_Out_2_Float, _OneMinus_fa817fbd2ba8aa81bf3977d104f66ffd_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Subtract_66c9a128aff075848cbe14a74ba8d3c5_Out_2_Float;
            Unity_Subtract_float(_Clamp_78437b2d5aa53f829edcee712f066e04_Out_3_Float, _OneMinus_fa817fbd2ba8aa81bf3977d104f66ffd_Out_1_Float, _Subtract_66c9a128aff075848cbe14a74ba8d3c5_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_b81e19ff4b40e889bbc2a0d75a043d55_Out_3_Float;
            Unity_Clamp_float(_Subtract_66c9a128aff075848cbe14a74ba8d3c5_Out_2_Float, float(0), float(2), _Clamp_b81e19ff4b40e889bbc2a0d75a043d55_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_df9b9eb99573a286b66090f1a88825c2_Out_2_Float;
            Unity_Divide_float(float(1), _Divide_9d9e98ea75888d85877f3863930719aa_Out_2_Float, _Divide_df9b9eb99573a286b66090f1a88825c2_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_b1c6bc199993da8e8690b8204063c06f_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_b81e19ff4b40e889bbc2a0d75a043d55_Out_3_Float, _Divide_df9b9eb99573a286b66090f1a88825c2_Out_2_Float, _Multiply_b1c6bc199993da8e8690b8204063c06f_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Absolute_47d15fbc856f1982992c9f6f8cf095df_Out_1_Float;
            Unity_Absolute_float(_Multiply_b1c6bc199993da8e8690b8204063c06f_Out_2_Float, _Absolute_47d15fbc856f1982992c9f6f8cf095df_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_84ecf6d44066108b958a4bbf89eb2bbb_Out_0_Float = _CoverHardness;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Power_e2326e473b1f15869db22e412e3f9fde_Out_2_Float;
            Unity_Power_float(_Absolute_47d15fbc856f1982992c9f6f8cf095df_Out_1_Float, _Property_84ecf6d44066108b958a4bbf89eb2bbb_Out_0_Float, _Power_e2326e473b1f15869db22e412e3f9fde_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_e5173dd322cb9c87a827b3d6d416e8c4_Out_0_Float = _Cover_Min_Height;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_d6102fe1df60cf8f9be5eb4f6774b363_Out_1_Float;
            Unity_OneMinus_float(_Property_e5173dd322cb9c87a827b3d6d416e8c4_Out_0_Float, _OneMinus_d6102fe1df60cf8f9be5eb4f6774b363_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_c2c0822a4c066887bdce2476ce07e03b_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
            float _Split_c2c0822a4c066887bdce2476ce07e03b_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
            float _Split_c2c0822a4c066887bdce2476ce07e03b_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
            float _Split_c2c0822a4c066887bdce2476ce07e03b_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_d67ba628c117b784982b2b0e7335f121_Out_2_Float;
            Unity_Add_float(_OneMinus_d6102fe1df60cf8f9be5eb4f6774b363_Out_1_Float, _Split_c2c0822a4c066887bdce2476ce07e03b_G_2_Float, _Add_d67ba628c117b784982b2b0e7335f121_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_cacc637f6d247382b610fa5e29099efb_Out_2_Float;
            Unity_Add_float(_Add_d67ba628c117b784982b2b0e7335f121_Out_2_Float, float(1), _Add_cacc637f6d247382b610fa5e29099efb_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_305f17dcc5012d81886e7fe415a513d4_Out_3_Float;
            Unity_Clamp_float(_Add_cacc637f6d247382b610fa5e29099efb_Out_2_Float, float(0), float(1), _Clamp_305f17dcc5012d81886e7fe415a513d4_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_6b0e17b7e3d2fd8db358cf2468c498e6_Out_0_Float = _Cover_Min_Height_Blending;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_3a4b967d185bc881b41c30791f6f1e62_Out_2_Float;
            Unity_Add_float(_Add_d67ba628c117b784982b2b0e7335f121_Out_2_Float, _Property_6b0e17b7e3d2fd8db358cf2468c498e6_Out_0_Float, _Add_3a4b967d185bc881b41c30791f6f1e62_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_fd0dcb913f15e88e902812b438aebbc3_Out_2_Float;
            Unity_Divide_float(_Add_3a4b967d185bc881b41c30791f6f1e62_Out_2_Float, _Add_d67ba628c117b784982b2b0e7335f121_Out_2_Float, _Divide_fd0dcb913f15e88e902812b438aebbc3_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_a7b7b5823dc9398d8328371fb23de257_Out_1_Float;
            Unity_OneMinus_float(_Divide_fd0dcb913f15e88e902812b438aebbc3_Out_2_Float, _OneMinus_a7b7b5823dc9398d8328371fb23de257_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_caa2bc8711bde98886b2e04bc3895333_Out_2_Float;
            Unity_Add_float(_OneMinus_a7b7b5823dc9398d8328371fb23de257_Out_1_Float, float(-0.5), _Add_caa2bc8711bde98886b2e04bc3895333_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_9958b4bb870ca78bb4f436357f6e4ed4_Out_3_Float;
            Unity_Clamp_float(_Add_caa2bc8711bde98886b2e04bc3895333_Out_2_Float, float(0), float(1), _Clamp_9958b4bb870ca78bb4f436357f6e4ed4_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_f4c52e99fecae983bba5ca957ceaea70_Out_2_Float;
            Unity_Add_float(_Clamp_305f17dcc5012d81886e7fe415a513d4_Out_3_Float, _Clamp_9958b4bb870ca78bb4f436357f6e4ed4_Out_3_Float, _Add_f4c52e99fecae983bba5ca957ceaea70_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_4b0ba629f5691b8985bcb46fe077634b_Out_3_Float;
            Unity_Clamp_float(_Add_f4c52e99fecae983bba5ca957ceaea70_Out_2_Float, float(0), float(1), _Clamp_4b0ba629f5691b8985bcb46fe077634b_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_dc9146fa086a698db159220c4b551f8d_Out_2_Float;
            Unity_Multiply_float_float(_Power_e2326e473b1f15869db22e412e3f9fde_Out_2_Float, _Clamp_4b0ba629f5691b8985bcb46fe077634b_Out_3_Float, _Multiply_dc9146fa086a698db159220c4b551f8d_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_4a4cdbb11047088c86f3455cd5a51981_Out_2_Float;
            Unity_Multiply_float_float(_Saturate_f03610d99dc38b8688cdf6c95924daaf_Out_1_Float, _Multiply_dc9146fa086a698db159220c4b551f8d_Out_2_Float, _Multiply_4a4cdbb11047088c86f3455cd5a51981_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Lerp_81e093150193e5818ea2e7cdf113600f_Out_3_Vector3;
            Unity_Lerp_float3(_NormalBlend_58a0c0d45b55168cbfa43fa9d9da21c6_Out_2_Vector3, _NormalStrength_11fab77b71140d8ab0735a9615b728ec_Out_2_Vector3, (_Multiply_4a4cdbb11047088c86f3455cd5a51981_Out_2_Float.xxx), _Lerp_81e093150193e5818ea2e7cdf113600f_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Transform_fcfe6aed8d17598ebf576390e09b3662_Out_1_Vector3;
            {
                float3x3 tangentTransform = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
                _Transform_fcfe6aed8d17598ebf576390e09b3662_Out_1_Vector3 = TransformTangentToWorldDir(_Lerp_81e093150193e5818ea2e7cdf113600f_Out_3_Vector3.xyz, tangentTransform, true).xyz;
            }
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Multiply_87cc0f3ed4675989b51b1b58a173bc24_Out_2_Vector3;
            Unity_Multiply_float3_float3(_Property_3d047323d7f9778ca2b1b7d7d4d43210_Out_0_Vector3, _Transform_fcfe6aed8d17598ebf576390e09b3662_Out_1_Vector3, _Multiply_87cc0f3ed4675989b51b1b58a173bc24_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_60ee188afca81787a8e8fac74a174b99_R_1_Float = _Multiply_87cc0f3ed4675989b51b1b58a173bc24_Out_2_Vector3[0];
            float _Split_60ee188afca81787a8e8fac74a174b99_G_2_Float = _Multiply_87cc0f3ed4675989b51b1b58a173bc24_Out_2_Vector3[1];
            float _Split_60ee188afca81787a8e8fac74a174b99_B_3_Float = _Multiply_87cc0f3ed4675989b51b1b58a173bc24_Out_2_Vector3[2];
            float _Split_60ee188afca81787a8e8fac74a174b99_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_dc15dd3b0cae3e89bd698e7f843f7b1a_Out_2_Float;
            Unity_Add_float(_Split_60ee188afca81787a8e8fac74a174b99_R_1_Float, _Split_60ee188afca81787a8e8fac74a174b99_G_2_Float, _Add_dc15dd3b0cae3e89bd698e7f843f7b1a_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_5239bb98d15c0889b20e04a2eb89ee8d_Out_2_Float;
            Unity_Add_float(_Add_dc15dd3b0cae3e89bd698e7f843f7b1a_Out_2_Float, _Split_60ee188afca81787a8e8fac74a174b99_B_3_Float, _Add_5239bb98d15c0889b20e04a2eb89ee8d_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_04ad5b9da8d13d80977bd2661241c39d_Out_2_Float;
            Unity_Multiply_float_float(_Add_5239bb98d15c0889b20e04a2eb89ee8d_Out_2_Float, _Clamp_1be0e9928e2c0489b16295f57a026487_Out_3_Float, _Multiply_04ad5b9da8d13d80977bd2661241c39d_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_ffe9545eefb14c85b9db82fa15044921_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_1be0e9928e2c0489b16295f57a026487_Out_3_Float, _Property_84ecf6d44066108b958a4bbf89eb2bbb_Out_0_Float, _Multiply_ffe9545eefb14c85b9db82fa15044921_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_49be95001b6ff98ea3ddca613a01d693_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_ffe9545eefb14c85b9db82fa15044921_Out_2_Float, _Multiply_dc9146fa086a698db159220c4b551f8d_Out_2_Float, _Multiply_49be95001b6ff98ea3ddca613a01d693_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_821af040af6e558284ae449187584b00_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_04ad5b9da8d13d80977bd2661241c39d_Out_2_Float, _Multiply_49be95001b6ff98ea3ddca613a01d693_Out_2_Float, _Multiply_821af040af6e558284ae449187584b00_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_b98b3357cae0358aae44a13c442bbfcf_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverMaskMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3;
            _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_XYZ_1_Vector4;
            float4 _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_XZ_2_Vector4;
            float4 _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_YZ_3_Vector4;
            float4 _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_b98b3357cae0358aae44a13c442bbfcf_Out_0_Texture2D, (_Divide_acbbd9727ffda783aeafe28ccafbde8e_Out_2_Vector4).x, _Property_faa4f436225f4e8eb99135b1d078135e_Out_0_Float, _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3, _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_XYZ_1_Vector4, _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_XZ_2_Vector4, _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_YZ_3_Vector4, _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_d45fa36c68c6428bb4f8080e2005e0ec_R_1_Float = _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_XYZ_1_Vector4[0];
            float _Split_d45fa36c68c6428bb4f8080e2005e0ec_G_2_Float = _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_XYZ_1_Vector4[1];
            float _Split_d45fa36c68c6428bb4f8080e2005e0ec_B_3_Float = _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_XYZ_1_Vector4[2];
            float _Split_d45fa36c68c6428bb4f8080e2005e0ec_A_4_Float = _TriplanarNM_2bbdc0a50726b18f8224b019fe9e4ef3_XYZ_1_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_98ac4ea177a183869352488b4c2d0d34_Out_0_Float = _CoverHeightMapMin;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_5d5eb0a63075b184be1f8ed7f1969793_Out_0_Float = _CoverHeightMapMax;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_068b903f7986bb8da7741fd6f472d4d3_Out_0_Vector2 = float2(_Property_98ac4ea177a183869352488b4c2d0d34_Out_0_Float, _Property_5d5eb0a63075b184be1f8ed7f1969793_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_dbf8fa97bfdf2f819d547b2836d5eb88_Out_0_Float = _CoverHeightMapOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Add_7e64ff79e725df80a9231cb40178da18_Out_2_Vector2;
            Unity_Add_float2(_Vector2_068b903f7986bb8da7741fd6f472d4d3_Out_0_Vector2, (_Property_dbf8fa97bfdf2f819d547b2836d5eb88_Out_0_Float.xx), _Add_7e64ff79e725df80a9231cb40178da18_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_0792f0dacec10e82954597c385120c5f_Out_3_Float;
            Unity_Remap_float(_Split_d45fa36c68c6428bb4f8080e2005e0ec_B_3_Float, float2 (0, 1), _Add_7e64ff79e725df80a9231cb40178da18_Out_2_Vector2, _Remap_0792f0dacec10e82954597c385120c5f_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_fef4ce95d06ced86899c58782dd5e9ac_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_821af040af6e558284ae449187584b00_Out_2_Float, _Remap_0792f0dacec10e82954597c385120c5f_Out_3_Float, _Multiply_fef4ce95d06ced86899c58782dd5e9ac_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_f38ac593c11c408685b4081df7f9a736_R_1_Float = IN.VertexColor[0];
            float _Split_f38ac593c11c408685b4081df7f9a736_G_2_Float = IN.VertexColor[1];
            float _Split_f38ac593c11c408685b4081df7f9a736_B_3_Float = IN.VertexColor[2];
            float _Split_f38ac593c11c408685b4081df7f9a736_A_4_Float = IN.VertexColor[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_26b43e2c517d7982b34d1c541939b6f5_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_fef4ce95d06ced86899c58782dd5e9ac_Out_2_Float, _Split_f38ac593c11c408685b4081df7f9a736_G_2_Float, _Multiply_26b43e2c517d7982b34d1c541939b6f5_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Saturate_3d2efb20d5b29381bfb3003845307b1f_Out_1_Float;
            Unity_Saturate_float(_Multiply_26b43e2c517d7982b34d1c541939b6f5_Out_2_Float, _Saturate_3d2efb20d5b29381bfb3003845307b1f_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_97e8d2e584b4e587a8ffaa3d3b1b30f5_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_572d83500486058c99890c5d609b30b0_Out_3_Float, _Saturate_3d2efb20d5b29381bfb3003845307b1f_Out_1_Float, _Multiply_97e8d2e584b4e587a8ffaa3d3b1b30f5_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            #if defined(_USEDYNAMICCOVERTSTATICMASKF_ON)
            float _UseDynamicCoverTStaticMaskF_ea4efcf79fa41489897aef4bbf5e655f_Out_0_Float = _Multiply_97e8d2e584b4e587a8ffaa3d3b1b30f5_Out_2_Float;
            #else
            float _UseDynamicCoverTStaticMaskF_ea4efcf79fa41489897aef4bbf5e655f_Out_0_Float = _Clamp_572d83500486058c99890c5d609b30b0_Out_3_Float;
            #endif
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Lerp_55b6201a01421f8b87ba535381db6a03_Out_3_Vector3;
            Unity_Lerp_float3(_BlendOverlayBaseColor_9ac50a6865d3648181da5f6189b8832d_OutVector4_1_Vector3, (_Multiply_b7294cbf7c9daa85b18c13beaf3dc8bd_Out_2_Vector4.xyz), (_UseDynamicCoverTStaticMaskF_ea4efcf79fa41489897aef4bbf5e655f_Out_0_Float.xxx), _Lerp_55b6201a01421f8b87ba535381db6a03_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_1c3992584ba29481b2683ce78818f520_Out_0_Vector4 = _WetColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Multiply_25f2ae8d79d4a388a6cbd74c831c0177_Out_2_Vector3;
            Unity_Multiply_float3_float3((_Property_1c3992584ba29481b2683ce78818f520_Out_0_Vector4.xyz), _Lerp_55b6201a01421f8b87ba535381db6a03_Out_3_Vector3, _Multiply_25f2ae8d79d4a388a6cbd74c831c0177_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_93980743aa69fb86bf250c5a7d50ef20_Out_1_Float;
            Unity_OneMinus_float(_Split_f38ac593c11c408685b4081df7f9a736_R_1_Float, _OneMinus_93980743aa69fb86bf250c5a7d50ef20_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Lerp_19abc331acee5482a25ee61d5a1861cf_Out_3_Vector3;
            Unity_Lerp_float3(_Lerp_55b6201a01421f8b87ba535381db6a03_Out_3_Vector3, _Multiply_25f2ae8d79d4a388a6cbd74c831c0177_Out_2_Vector3, (_OneMinus_93980743aa69fb86bf250c5a7d50ef20_Out_1_Float.xxx), _Lerp_19abc331acee5482a25ee61d5a1861cf_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_4bb7737116edbd81bca06201348456ea_R_1_Float = _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae_XZ_2_Vector4[0];
            float _Split_4bb7737116edbd81bca06201348456ea_G_2_Float = _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae_XZ_2_Vector4[1];
            float _Split_4bb7737116edbd81bca06201348456ea_B_3_Float = _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae_XZ_2_Vector4[2];
            float _Split_4bb7737116edbd81bca06201348456ea_A_4_Float = _PlanarNM_0403eed8a6bea082a4e8fd2d11ab36ae_XZ_2_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_f9637076944eae8abdcc79dc2702814b_Out_0_Float = _AlphaCutoff;
            #endif
            surface.BaseColor = _Lerp_19abc331acee5482a25ee61d5a1861cf_Out_3_Vector3;
            surface.Alpha = _Split_4bb7737116edbd81bca06201348456ea_A_4_Float;
            surface.AlphaClipThreshold = _Property_f9637076944eae8abdcc79dc2702814b_Out_0_Float;
            return surface;
        }
        
        // --------------------------------------------------
        // Build Graph Inputs
        #ifdef HAVE_VFX_MODIFICATION
        #define VFX_SRP_ATTRIBUTES Attributes
        #define VFX_SRP_VARYINGS Varyings
        #define VFX_SRP_SURFACE_INPUTS SurfaceDescriptionInputs
        #endif
        VertexDescriptionInputs BuildVertexDescriptionInputs(Attributes input)
        {
            VertexDescriptionInputs output;
            ZERO_INITIALIZE(VertexDescriptionInputs, output);
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.ObjectSpaceNormal =                          input.normalOS;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.ObjectSpaceTangent =                         input.tangentOS.xyz;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.ObjectSpacePosition =                        input.positionOS;
        #endif
        
        #if UNITY_ANY_INSTANCING_ENABLED
        #else // TODO: XR support for procedural instancing because in this case UNITY_ANY_INSTANCING_ENABLED is not defined and instanceID is incorrect.
        #endif
        
            return output;
        }
        SurfaceDescriptionInputs BuildSurfaceDescriptionInputs(Varyings input)
        {
            SurfaceDescriptionInputs output;
            ZERO_INITIALIZE(SurfaceDescriptionInputs, output);
        
        #ifdef HAVE_VFX_MODIFICATION
        #if VFX_USE_GRAPH_VALUES
            uint instanceActiveIndex = asuint(UNITY_ACCESS_INSTANCED_PROP(PerInstance, _InstanceActiveIndex));
            /* WARNING: $splice Could not find named fragment 'VFXLoadGraphValues' */
        #endif
            /* WARNING: $splice Could not find named fragment 'VFXSetFragInputs' */
        
        #endif
        
            
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        // must use interpolated tangent, bitangent and normal before they are normalized in the pixel shader.
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        float3 unnormalizedNormalWS = input.normalWS;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        const float renormFactor = 1.0 / length(unnormalizedNormalWS);
        #endif
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        // use bitangent on the fly like in hdrp
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        // IMPORTANT! If we ever support Flip on double sided materials ensure bitangent and tangent are NOT flipped.
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        float crossSign = (input.tangentWS.w > 0.0 ? 1.0 : -1.0)* GetOddNegativeScale();
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        float3 bitang = crossSign * cross(input.normalWS.xyz, input.tangentWS.xyz);
        #endif
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.WorldSpaceNormal = renormFactor * input.normalWS.xyz;      // we want a unit length Normal Vector node in shader graph
        #endif
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        // to pr               eserve mikktspace compliance we use same scale renormFactor as was used on the normal.
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        // This                is explained in section 2.2 in "surface gradient based bump mapping framework"
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.WorldSpaceTangent = renormFactor * input.tangentWS.xyz;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.WorldSpaceBiTangent = renormFactor * bitang;
        #endif
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.WorldSpacePosition = input.positionWS;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.AbsoluteWorldSpacePosition = GetAbsolutePositionWS(input.positionWS);
        #endif
        
        
            #if UNITY_UV_STARTS_AT_TOP
            #else
            #endif
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.uv0 = input.texCoord0;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.uv2 = input.texCoord2;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.VertexColor = input.color;
        #endif
        
        #if UNITY_ANY_INSTANCING_ENABLED
        #else // TODO: XR support for procedural instancing because in this case UNITY_ANY_INSTANCING_ENABLED is not defined and instanceID is incorrect.
        #endif
        #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN output.FaceSign =                    IS_FRONT_VFACE(input.cullFace, true, false);
        #else
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        #endif
        #undef BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        
                return output;
        }
        
        // --------------------------------------------------
        // Main
        
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/PBR2DPass.hlsl"
        
        // --------------------------------------------------
        // Visual Effect Vertex Invocations
        #ifdef HAVE_VFX_MODIFICATION
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
        #endif
        
        ENDHLSL
        }
    }
    CustomEditor "UnityEditor.ShaderGraph.GenericShaderGraphMaterialGUI"
    CustomEditorForRenderPipeline "UnityEditor.ShaderGraphLitGUI" "UnityEngine.Rendering.Universal.UniversalRenderPipelineAsset"
    FallBack "Hidden/Shader Graph/FallbackError"
}