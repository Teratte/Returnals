﻿Shader "NatureManufacture/URP/Layered/Full Triplanar Cover"
{
    Properties
    {
        _AlphaCutoff("Alpha Cutoff", Range(0, 1)) = 0
        _BaseColor("Base Color", Color) = (1, 1, 1, 0)
        [NoScaleOffset]_BaseColorMap("Base Map(RGB) Alpha(A)", 2D) = "white" {}
        _BaseTilingOffset("Base Tiling and Offset", Vector) = (1, 1, 0, 0)
        _BaseTriplanarThreshold("Base Triplanar Threshold", Range(1, 8)) = 5
        [Normal][NoScaleOffset]_BaseNormalMap("Base Normal Map", 2D) = "bump" {}
        _BaseNormalScale("Base Normal Scale", Range(0, 8)) = 1
        [NoScaleOffset]_BaseMaskMap("Base Mask Map MT(R) AO(G) H(B) SM(A)", 2D) = "white" {}
        _BaseMetallic("Base Metallic", Range(0, 1)) = 1
        _BaseAORemapMin("Base AO Remap Min", Range(0, 1)) = 0
        _BaseAORemapMax("Base AO Remap Max", Range(0, 1)) = 1
        _BaseSmoothnessRemapMin("Base Smoothness Remap Min", Range(0, 1)) = 0
        _BaseSmoothnessRemapMax("Base Smoothness Remap Max", Range(0, 1)) = 1
        [NoScaleOffset]_LayerMask("Layer Mask (R)", 2D) = "black" {}
        [ToggleUI]_Invert_Layer_Mask("Invert Layer Mask", Float) = 0
        _Height_Transition("Height Blend Transition", Range(0.001, 1)) = 1
        _HeightMin("Height Min", Float) = 0
        _HeightMax("Height Max", Float) = 1
        _HeightOffset("Height Offset", Float) = 0
        _HeightMin2("Height 2 Min", Float) = 0
        _HeightMax2("Height 2 Max", Float) = 1
        _HeightOffset2("Height 2 Offset", Float) = 0
        _Base2Color("Base 2 Color", Color) = (1, 1, 1, 0)
        [NoScaleOffset]_Base2ColorMap("Base 2 Map", 2D) = "white" {}
        _Base2TilingOffset("Base 2 Tiling and Offset", Vector) = (1, 1, 0, 0)
        _Base2TriplanarThreshold("Base 2 Triplanar Threshold", Range(1, 8)) = 5
        [Normal][NoScaleOffset]_Base2NormalMap("Base 2 Normal Map", 2D) = "bump" {}
        _Base2NormalScale("Base 2 Normal Scale", Range(0, 8)) = 1
        [NoScaleOffset]_Base2MaskMap("Base 2 Mask Map MT(R) AO(G) H(B) SM(A)", 2D) = "white" {}
        _Base2Metallic("Base 2 Metallic", Range(0, 1)) = 1
        _Base2SmoothnessRemapMin("Base 2 Smoothness Remap Min", Range(0, 1)) = 0
        _Base2SmoothnessRemapMax("Base 2 Smoothness Remap Max", Range(0, 1)) = 1
        _Base2AORemapMin("Base 2 AO Remap Min", Range(0, 1)) = 0
        _Base2AORemapMax("Base 2 AO Remap Max", Range(0, 1)) = 1
        _CoverMaskPower("Cover Mask Power", Range(0, 10)) = 1
        [NoScaleOffset]_CoverBaseColorMap("Cover Base Map (RGB) Mask (A)", 2D) = "white" {}
        _Cover_Amount("Cover Amount", Range(0, 2)) = 0
        _Cover_Amount_Grow_Speed("Cover Amount Grow Speed", Range(0, 3)) = 3
        _CoverDirection("Cover Direction", Vector) = (0, 1, 0, 0)
        _Cover_Max_Angle("Cover Max Angle", Range(0.001, 90)) = 35
        _Cover_Min_Height("Cover Min Height", Float) = -10000
        _Cover_Min_Height_Blending("Cover Min Height Blending", Range(0, 500)) = 1
        _CoverBaseColor("Cover Base Color", Color) = (1, 1, 1, 0)
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
             float4 color : INTERP6;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 fogFactorAndVertexLight : INTERP7;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 positionWS : INTERP8;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 normalWS : INTERP9;
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
        float4 _BaseTilingOffset;
        float _BaseTriplanarThreshold;
        float4 _BaseNormalMap_TexelSize;
        float _BaseNormalScale;
        float4 _BaseMaskMap_TexelSize;
        float _BaseMetallic;
        float _BaseAORemapMin;
        float _BaseAORemapMax;
        float _BaseSmoothnessRemapMin;
        float _BaseSmoothnessRemapMax;
        float4 _LayerMask_TexelSize;
        float _Invert_Layer_Mask;
        float _Height_Transition;
        float _HeightMin;
        float _HeightMax;
        float _HeightOffset;
        float _HeightMin2;
        float _HeightMax2;
        float _HeightOffset2;
        float4 _Base2Color;
        float4 _Base2ColorMap_TexelSize;
        float4 _Base2TilingOffset;
        float _Base2TriplanarThreshold;
        float4 _Base2NormalMap_TexelSize;
        float _Base2NormalScale;
        float4 _Base2MaskMap_TexelSize;
        float _Base2Metallic;
        float _Base2SmoothnessRemapMin;
        float _Base2SmoothnessRemapMax;
        float _Base2AORemapMin;
        float _Base2AORemapMax;
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
        TEXTURE2D(_LayerMask);
        SAMPLER(sampler_LayerMask);
        TEXTURE2D(_Base2ColorMap);
        SAMPLER(sampler_Base2ColorMap);
        TEXTURE2D(_Base2NormalMap);
        SAMPLER(sampler_Base2NormalMap);
        TEXTURE2D(_Base2MaskMap);
        SAMPLER(sampler_Base2MaskMap);
        TEXTURE2D(_CoverBaseColorMap);
        SAMPLER(sampler_CoverBaseColorMap);
        TEXTURE2D(_CoverNormalMap);
        SAMPLER(sampler_CoverNormalMap);
        TEXTURE2D(_CoverMaskMap);
        SAMPLER(sampler_CoverMaskMap);
        
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
        
        void Unity_Divide_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A / B;
        }
        
        void Unity_Combine_float(float R, float G, float B, float A, out float4 RGBA, out float3 RGB, out float2 RG)
        {
            RGBA = float4(R, G, B, A);
            RGB = float3(R, G, B);
            RG = float2(R, G);
        }
        
        void Unity_Multiply_float4_float4(float4 A, float4 B, out float4 Out)
        {
        Out = A * B;
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
        
        void Unity_Multiply_float_float(float A, float B, out float Out)
        {
        Out = A * B;
        }
        
        void Unity_Add_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A + B;
        }
        
        void Unity_Add_float(float A, float B, out float Out)
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
        
        void Unity_Add_float2(float2 A, float2 B, out float2 Out)
        {
            Out = A + B;
        }
        
        void Unity_Remap_float(float In, float2 InMinMax, float2 OutMinMax, out float Out)
        {
            Out = OutMinMax.x + (In - InMinMax.x) * (OutMinMax.y - OutMinMax.x) / (InMinMax.y - InMinMax.x);
        }
        
        void Unity_OneMinus_float(float In, out float Out)
        {
            Out = 1 - In;
        }
        
        void Unity_Branch_float(float Predicate, float True, float False, out float Out)
        {
            Out = Predicate ? True : False;
        }
        
        void Unity_Maximum_float(float A, float B, out float Out)
        {
            Out = max(A, B);
        }
        
        void Unity_Subtract_float(float A, float B, out float Out)
        {
            Out = A - B;
        }
        
        void Unity_Add_float3(float3 A, float3 B, out float3 Out)
        {
            Out = A + B;
        }
        
        void Unity_Divide_float3(float3 A, float3 B, out float3 Out)
        {
            Out = A / B;
        }
        
        struct Bindings_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float
        {
        };
        
        void SG_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float(float3 Vector3_88EEBB5E, float Vector1_DA0A37FA, float3 Vector3_79AA92F, float Vector1_F7E83F1E, float Vector1_1C9222A6, Bindings_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float IN, out float3 OutVector4_1)
        {
        float3 _Property_dd1c841a04c03f8c85e7b00eb025ecda_Out_0_Vector3 = Vector3_88EEBB5E;
        float _Property_14119cc7eaf4128f991283d47cf72d85_Out_0_Float = Vector1_DA0A37FA;
        float _Property_48af0ad45e3f7f82932b938695d21391_Out_0_Float = Vector1_DA0A37FA;
        float _Property_8a30b3ca12ff518fa473ccd686c7d503_Out_0_Float = Vector1_F7E83F1E;
        float _Maximum_c196e4a61637ea8381a3437c93f89ce2_Out_2_Float;
        Unity_Maximum_float(_Property_48af0ad45e3f7f82932b938695d21391_Out_0_Float, _Property_8a30b3ca12ff518fa473ccd686c7d503_Out_0_Float, _Maximum_c196e4a61637ea8381a3437c93f89ce2_Out_2_Float);
        float _Property_ee8d5fc69475d181be60c57e04ea8708_Out_0_Float = Vector1_1C9222A6;
        float _Subtract_61ca880c04c1758eb128f25c9faabd63_Out_2_Float;
        Unity_Subtract_float(_Maximum_c196e4a61637ea8381a3437c93f89ce2_Out_2_Float, _Property_ee8d5fc69475d181be60c57e04ea8708_Out_0_Float, _Subtract_61ca880c04c1758eb128f25c9faabd63_Out_2_Float);
        float _Subtract_e3a7713b556a1b8cb40aad97fc58d619_Out_2_Float;
        Unity_Subtract_float(_Property_14119cc7eaf4128f991283d47cf72d85_Out_0_Float, _Subtract_61ca880c04c1758eb128f25c9faabd63_Out_2_Float, _Subtract_e3a7713b556a1b8cb40aad97fc58d619_Out_2_Float);
        float _Maximum_d02e48d92038448cb0345e5cf3779071_Out_2_Float;
        Unity_Maximum_float(_Subtract_e3a7713b556a1b8cb40aad97fc58d619_Out_2_Float, float(0), _Maximum_d02e48d92038448cb0345e5cf3779071_Out_2_Float);
        float3 _Multiply_79b0b5d7d3528b8395e1135339a090f2_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Property_dd1c841a04c03f8c85e7b00eb025ecda_Out_0_Vector3, (_Maximum_d02e48d92038448cb0345e5cf3779071_Out_2_Float.xxx), _Multiply_79b0b5d7d3528b8395e1135339a090f2_Out_2_Vector3);
        float3 _Property_c7292b3b08585f8c8670172b9a220bf0_Out_0_Vector3 = Vector3_79AA92F;
        float _Property_5e920479576fad83ba1947728dcceab4_Out_0_Float = Vector1_F7E83F1E;
        float _Subtract_b7368f21be9e048aae7f90c8a2bfaae1_Out_2_Float;
        Unity_Subtract_float(_Property_5e920479576fad83ba1947728dcceab4_Out_0_Float, _Subtract_61ca880c04c1758eb128f25c9faabd63_Out_2_Float, _Subtract_b7368f21be9e048aae7f90c8a2bfaae1_Out_2_Float);
        float _Maximum_216777d30802328eab607c8fe68ba3a1_Out_2_Float;
        Unity_Maximum_float(_Subtract_b7368f21be9e048aae7f90c8a2bfaae1_Out_2_Float, float(0), _Maximum_216777d30802328eab607c8fe68ba3a1_Out_2_Float);
        float3 _Multiply_a856b52cd0848f86a6ae1af9b175935c_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Property_c7292b3b08585f8c8670172b9a220bf0_Out_0_Vector3, (_Maximum_216777d30802328eab607c8fe68ba3a1_Out_2_Float.xxx), _Multiply_a856b52cd0848f86a6ae1af9b175935c_Out_2_Vector3);
        float3 _Add_86c6109dc4530b8c9763ef62b056ad4c_Out_2_Vector3;
        Unity_Add_float3(_Multiply_79b0b5d7d3528b8395e1135339a090f2_Out_2_Vector3, _Multiply_a856b52cd0848f86a6ae1af9b175935c_Out_2_Vector3, _Add_86c6109dc4530b8c9763ef62b056ad4c_Out_2_Vector3);
        float _Add_356384b52728f583bd6e694bc1fc3738_Out_2_Float;
        Unity_Add_float(_Maximum_d02e48d92038448cb0345e5cf3779071_Out_2_Float, _Maximum_216777d30802328eab607c8fe68ba3a1_Out_2_Float, _Add_356384b52728f583bd6e694bc1fc3738_Out_2_Float);
        float _Maximum_94a22f5ceb706e88bc16350a5d5d2a82_Out_2_Float;
        Unity_Maximum_float(_Add_356384b52728f583bd6e694bc1fc3738_Out_2_Float, float(1E-05), _Maximum_94a22f5ceb706e88bc16350a5d5d2a82_Out_2_Float);
        float3 _Divide_d7291d1701d7058dbb5263194c1bed22_Out_2_Vector3;
        Unity_Divide_float3(_Add_86c6109dc4530b8c9763ef62b056ad4c_Out_2_Vector3, (_Maximum_94a22f5ceb706e88bc16350a5d5d2a82_Out_2_Float.xxx), _Divide_d7291d1701d7058dbb5263194c1bed22_Out_2_Vector3);
        OutVector4_1 = _Divide_d7291d1701d7058dbb5263194c1bed22_Out_2_Vector3;
        }
        
        void Unity_Clamp_float(float In, float Min, float Max, out float Out)
        {
            Out = clamp(In, Min, Max);
        }
        
        void Unity_Normalize_float3(float3 In, out float3 Out)
        {
            Out = normalize(In);
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
        
        void Unity_NormalStrength_float(float3 In, float Strength, out float3 Out)
        {
            Out = float3(In.rg * Strength, lerp(1, In.b, saturate(Strength)));
        }
        
        void Unity_Divide_float(float A, float B, out float Out)
        {
            Out = A / B;
        }
        
        void Unity_Absolute_float(float In, out float Out)
        {
            Out = abs(In);
        }
        
        void Unity_Power_float(float A, float B, out float Out)
        {
            Out = pow(A, B);
        }
        
        void Unity_Saturate_float(float In, out float Out)
        {
            Out = saturate(In);
        }
        
        void Unity_Lerp_float3(float3 A, float3 B, float3 T, out float3 Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Lerp_float(float A, float B, float T, out float Out)
        {
            Out = lerp(A, B, T);
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
            UnityTexture2D _Property_d92b1410e1d6bc81a86076b09e35f302_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseColorMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_d4a357b2daff5587ae46468726a33797_Out_0_Vector4 = _BaseTilingOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Divide_c703c79d4bf76e8c9848ea2ecd29211f_Out_2_Vector4;
            Unity_Divide_float4(float4(1, 1, 0, 0), _Property_d4a357b2daff5587ae46468726a33797_Out_0_Vector4, _Divide_c703c79d4bf76e8c9848ea2ecd29211f_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_b168be530d5b4082a2816fc835b55e19_Out_0_Float = _BaseTriplanarThreshold;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579;
            _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4;
            float4 _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XZ_2_Vector4;
            float4 _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_YZ_3_Vector4;
            float4 _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_d92b1410e1d6bc81a86076b09e35f302_Out_0_Texture2D, (_Divide_c703c79d4bf76e8c9848ea2ecd29211f_Out_2_Vector4).x, _Property_b168be530d5b4082a2816fc835b55e19_Out_0_Float, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XZ_2_Vector4, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_YZ_3_Vector4, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_17f0f1bec4ec6485881127275660d4f1_Out_0_Vector4 = _BaseColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Multiply_6434c1e27d77608fb8dcec94697eb8d3_Out_2_Vector4;
            Unity_Multiply_float4_float4(_TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4, _Property_17f0f1bec4ec6485881127275660d4f1_Out_0_Vector4, _Multiply_6434c1e27d77608fb8dcec94697eb8d3_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_080b6cb46abb00848263c964726eac36_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseMaskMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c;
            _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XYZ_1_Vector4;
            float4 _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XZ_2_Vector4;
            float4 _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_YZ_3_Vector4;
            float4 _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_080b6cb46abb00848263c964726eac36_Out_0_Texture2D, (_Divide_c703c79d4bf76e8c9848ea2ecd29211f_Out_2_Vector4).x, _Property_b168be530d5b4082a2816fc835b55e19_Out_0_Float, _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c, _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XYZ_1_Vector4, _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XZ_2_Vector4, _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_YZ_3_Vector4, _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_866a663ed067f988862843fe32765ff8_R_1_Float = _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XYZ_1_Vector4[0];
            float _Split_866a663ed067f988862843fe32765ff8_G_2_Float = _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XYZ_1_Vector4[1];
            float _Split_866a663ed067f988862843fe32765ff8_B_3_Float = _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XYZ_1_Vector4[2];
            float _Split_866a663ed067f988862843fe32765ff8_A_4_Float = _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XYZ_1_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_3b9891099f2f3e84b765eb453f6f6810_Out_0_Float = _HeightMin;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_bde21360babd9089a90a45cd2843925b_Out_0_Float = _HeightMax;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_9f8e90f51ffcfe8bb3d495766c0cabca_Out_0_Vector2 = float2(_Property_3b9891099f2f3e84b765eb453f6f6810_Out_0_Float, _Property_bde21360babd9089a90a45cd2843925b_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_6ff6d72f7b1d0083b4e4ce61e7e7c8d3_Out_0_Float = _HeightOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Add_39687f6bf7045086bc2d1ccf5f94c9de_Out_2_Vector2;
            Unity_Add_float2(_Vector2_9f8e90f51ffcfe8bb3d495766c0cabca_Out_0_Vector2, (_Property_6ff6d72f7b1d0083b4e4ce61e7e7c8d3_Out_0_Float.xx), _Add_39687f6bf7045086bc2d1ccf5f94c9de_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_ddc02d039a9d5388b8add0d2d673d4ac_Out_3_Float;
            Unity_Remap_float(_Split_866a663ed067f988862843fe32765ff8_B_3_Float, float2 (0, 1), _Add_39687f6bf7045086bc2d1ccf5f94c9de_Out_2_Vector2, _Remap_ddc02d039a9d5388b8add0d2d673d4ac_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_11586ef261ce8e87953046ff84ce22ab_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_Base2ColorMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_221c724b2137d58c8c387fee5b48be14_Out_0_Vector4 = _Base2TilingOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Divide_9f3f46254d5f7a8e87f60c4aa6f5522c_Out_2_Vector4;
            Unity_Divide_float4(float4(1, 1, 0, 0), _Property_221c724b2137d58c8c387fee5b48be14_Out_0_Vector4, _Divide_9f3f46254d5f7a8e87f60c4aa6f5522c_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_20f6a96f64098d87b850c83bc45ddcee_Out_0_Float = _Base2TriplanarThreshold;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_ca3aaaec266f85859b75e37163da7cba;
            _TriplanarNM_ca3aaaec266f85859b75e37163da7cba.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_ca3aaaec266f85859b75e37163da7cba.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_ca3aaaec266f85859b75e37163da7cba_XYZ_1_Vector4;
            float4 _TriplanarNM_ca3aaaec266f85859b75e37163da7cba_XZ_2_Vector4;
            float4 _TriplanarNM_ca3aaaec266f85859b75e37163da7cba_YZ_3_Vector4;
            float4 _TriplanarNM_ca3aaaec266f85859b75e37163da7cba_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_11586ef261ce8e87953046ff84ce22ab_Out_0_Texture2D, (_Divide_9f3f46254d5f7a8e87f60c4aa6f5522c_Out_2_Vector4).x, _Property_20f6a96f64098d87b850c83bc45ddcee_Out_0_Float, _TriplanarNM_ca3aaaec266f85859b75e37163da7cba, _TriplanarNM_ca3aaaec266f85859b75e37163da7cba_XYZ_1_Vector4, _TriplanarNM_ca3aaaec266f85859b75e37163da7cba_XZ_2_Vector4, _TriplanarNM_ca3aaaec266f85859b75e37163da7cba_YZ_3_Vector4, _TriplanarNM_ca3aaaec266f85859b75e37163da7cba_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_60dff9cc4310ea89874789591a78d84b_Out_0_Vector4 = _Base2Color;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Multiply_4d8e3ca1454e2d85963c9d240239a171_Out_2_Vector4;
            Unity_Multiply_float4_float4(_TriplanarNM_ca3aaaec266f85859b75e37163da7cba_XYZ_1_Vector4, _Property_60dff9cc4310ea89874789591a78d84b_Out_0_Vector4, _Multiply_4d8e3ca1454e2d85963c9d240239a171_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_312b653a29ccc087849b1493611fb73c_Out_0_Boolean = _Invert_Layer_Mask;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_1004d4c014377e8c8fa291ed748b9f84_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_LayerMask);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _SampleTexture2D_c910b4b42510578d81c16169d3cb5727_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_1004d4c014377e8c8fa291ed748b9f84_Out_0_Texture2D.tex, _Property_1004d4c014377e8c8fa291ed748b9f84_Out_0_Texture2D.samplerstate, _Property_1004d4c014377e8c8fa291ed748b9f84_Out_0_Texture2D.GetTransformedUV(IN.uv0.xy) );
            float _SampleTexture2D_c910b4b42510578d81c16169d3cb5727_R_4_Float = _SampleTexture2D_c910b4b42510578d81c16169d3cb5727_RGBA_0_Vector4.r;
            float _SampleTexture2D_c910b4b42510578d81c16169d3cb5727_G_5_Float = _SampleTexture2D_c910b4b42510578d81c16169d3cb5727_RGBA_0_Vector4.g;
            float _SampleTexture2D_c910b4b42510578d81c16169d3cb5727_B_6_Float = _SampleTexture2D_c910b4b42510578d81c16169d3cb5727_RGBA_0_Vector4.b;
            float _SampleTexture2D_c910b4b42510578d81c16169d3cb5727_A_7_Float = _SampleTexture2D_c910b4b42510578d81c16169d3cb5727_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_bc0b8885b596648d9b594130faa6585c_Out_1_Float;
            Unity_OneMinus_float(_SampleTexture2D_c910b4b42510578d81c16169d3cb5727_R_4_Float, _OneMinus_bc0b8885b596648d9b594130faa6585c_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Branch_6b7615e16629338ba87d3570a0096f66_Out_3_Float;
            Unity_Branch_float(_Property_312b653a29ccc087849b1493611fb73c_Out_0_Boolean, _OneMinus_bc0b8885b596648d9b594130faa6585c_Out_1_Float, _SampleTexture2D_c910b4b42510578d81c16169d3cb5727_R_4_Float, _Branch_6b7615e16629338ba87d3570a0096f66_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_b4749c77856157858fffde0aed55fc74_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_Base2MaskMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b;
            _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_XYZ_1_Vector4;
            float4 _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_XZ_2_Vector4;
            float4 _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_YZ_3_Vector4;
            float4 _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_b4749c77856157858fffde0aed55fc74_Out_0_Texture2D, (_Divide_9f3f46254d5f7a8e87f60c4aa6f5522c_Out_2_Vector4).x, _Property_20f6a96f64098d87b850c83bc45ddcee_Out_0_Float, _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b, _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_XYZ_1_Vector4, _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_XZ_2_Vector4, _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_YZ_3_Vector4, _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_0b441b86fba0ea80bc060dae9d7ed0d7_R_1_Float = _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_XYZ_1_Vector4[0];
            float _Split_0b441b86fba0ea80bc060dae9d7ed0d7_G_2_Float = _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_XYZ_1_Vector4[1];
            float _Split_0b441b86fba0ea80bc060dae9d7ed0d7_B_3_Float = _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_XYZ_1_Vector4[2];
            float _Split_0b441b86fba0ea80bc060dae9d7ed0d7_A_4_Float = _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_XYZ_1_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_c1de6a6321562383bfac4b318fc7b0d3_Out_0_Float = _HeightMin2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_145222f375008a879315637be0f172c5_Out_0_Float = _HeightMax2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_416c3ee3a60cc686b2d2360a073acfad_Out_0_Vector2 = float2(_Property_c1de6a6321562383bfac4b318fc7b0d3_Out_0_Float, _Property_145222f375008a879315637be0f172c5_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_8be924d801daee88b294af592a560e75_Out_0_Float = _HeightOffset2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Add_37703f1eb9ce078daaedca833705f5dd_Out_2_Vector2;
            Unity_Add_float2(_Vector2_416c3ee3a60cc686b2d2360a073acfad_Out_0_Vector2, (_Property_8be924d801daee88b294af592a560e75_Out_0_Float.xx), _Add_37703f1eb9ce078daaedca833705f5dd_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_5a8467f2416dc98699682a4cf64a69aa_Out_3_Float;
            Unity_Remap_float(_Split_0b441b86fba0ea80bc060dae9d7ed0d7_B_3_Float, float2 (0, 1), _Add_37703f1eb9ce078daaedca833705f5dd_Out_2_Vector2, _Remap_5a8467f2416dc98699682a4cf64a69aa_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_d9f42ca072d9188ab2566400157a199f_Out_2_Float;
            Unity_Multiply_float_float(_Branch_6b7615e16629338ba87d3570a0096f66_Out_3_Float, _Remap_5a8467f2416dc98699682a4cf64a69aa_Out_3_Float, _Multiply_d9f42ca072d9188ab2566400157a199f_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_b4d08e724ec3df88ab7743c5b7a3f081_R_1_Float = IN.VertexColor[0];
            float _Split_b4d08e724ec3df88ab7743c5b7a3f081_G_2_Float = IN.VertexColor[1];
            float _Split_b4d08e724ec3df88ab7743c5b7a3f081_B_3_Float = IN.VertexColor[2];
            float _Split_b4d08e724ec3df88ab7743c5b7a3f081_A_4_Float = IN.VertexColor[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_55cb55224306dc818a87a2dbf82d5af0_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_d9f42ca072d9188ab2566400157a199f_Out_2_Float, _Split_b4d08e724ec3df88ab7743c5b7a3f081_B_3_Float, _Multiply_55cb55224306dc818a87a2dbf82d5af0_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_c0dc9341fd635288a1c2869945617704_Out_0_Float = _Height_Transition;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float _HeightBlend_d30f443b26dc0d8087616105058c020a;
            float3 _HeightBlend_d30f443b26dc0d8087616105058c020a_OutVector4_1_Vector3;
            SG_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float((_Multiply_6434c1e27d77608fb8dcec94697eb8d3_Out_2_Vector4.xyz), _Remap_ddc02d039a9d5388b8add0d2d673d4ac_Out_3_Float, (_Multiply_4d8e3ca1454e2d85963c9d240239a171_Out_2_Vector4.xyz), _Multiply_55cb55224306dc818a87a2dbf82d5af0_Out_2_Float, _Property_c0dc9341fd635288a1c2869945617704_Out_0_Float, _HeightBlend_d30f443b26dc0d8087616105058c020a, _HeightBlend_d30f443b26dc0d8087616105058c020a_OutVector4_1_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_0b7ec0ec463cd88c8269ef0d2c98eb85_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverBaseColorMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_9bedb34aba10fa89a5f5b18919971491_Out_0_Vector4 = _CoverTilingOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Divide_ddaec3b56c9fc58ca3314b828c03b1c8_Out_2_Vector4;
            Unity_Divide_float4(float4(1, 1, 0, 0), _Property_9bedb34aba10fa89a5f5b18919971491_Out_0_Vector4, _Divide_ddaec3b56c9fc58ca3314b828c03b1c8_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_bf361924f27f848994241bda91fc2005_Out_0_Float = _CoverTriplanarThreshold;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793;
            _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XYZ_1_Vector4;
            float4 _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XZ_2_Vector4;
            float4 _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_YZ_3_Vector4;
            float4 _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_0b7ec0ec463cd88c8269ef0d2c98eb85_Out_0_Texture2D, (_Divide_ddaec3b56c9fc58ca3314b828c03b1c8_Out_2_Vector4).x, _Property_bf361924f27f848994241bda91fc2005_Out_0_Float, _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793, _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XYZ_1_Vector4, _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XZ_2_Vector4, _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_YZ_3_Vector4, _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_19547f2fe562798683b730e775cbfb39_Out_0_Vector4 = _CoverBaseColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Multiply_0652b80f60f8ed84beea389318719c9a_Out_2_Vector4;
            Unity_Multiply_float4_float4(_TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XYZ_1_Vector4, _Property_19547f2fe562798683b730e775cbfb39_Out_0_Vector4, _Multiply_0652b80f60f8ed84beea389318719c9a_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_ed6385cfee8242c58d906f36e90cb607_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverBaseColorMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _UV_13d53a8c036ded8490c69d17b7a3bb72_Out_0_Vector4 = IN.uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _SampleTexture2D_b8be215db546638398ea07060feb5224_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_ed6385cfee8242c58d906f36e90cb607_Out_0_Texture2D.tex, _Property_ed6385cfee8242c58d906f36e90cb607_Out_0_Texture2D.samplerstate, _Property_ed6385cfee8242c58d906f36e90cb607_Out_0_Texture2D.GetTransformedUV((_UV_13d53a8c036ded8490c69d17b7a3bb72_Out_0_Vector4.xy)) );
            float _SampleTexture2D_b8be215db546638398ea07060feb5224_R_4_Float = _SampleTexture2D_b8be215db546638398ea07060feb5224_RGBA_0_Vector4.r;
            float _SampleTexture2D_b8be215db546638398ea07060feb5224_G_5_Float = _SampleTexture2D_b8be215db546638398ea07060feb5224_RGBA_0_Vector4.g;
            float _SampleTexture2D_b8be215db546638398ea07060feb5224_B_6_Float = _SampleTexture2D_b8be215db546638398ea07060feb5224_RGBA_0_Vector4.b;
            float _SampleTexture2D_b8be215db546638398ea07060feb5224_A_7_Float = _SampleTexture2D_b8be215db546638398ea07060feb5224_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_b3ce556358f99f80ae9037fb175f4c5f_Out_0_Float = _CoverMaskPower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_ea35dd8ed2523f8b9a4c52fc52ecff0e_Out_2_Float;
            Unity_Multiply_float_float(_SampleTexture2D_b8be215db546638398ea07060feb5224_A_7_Float, _Property_b3ce556358f99f80ae9037fb175f4c5f_Out_0_Float, _Multiply_ea35dd8ed2523f8b9a4c52fc52ecff0e_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_7c0c867aaa1f5b8683768528b130a408_Out_3_Float;
            Unity_Clamp_float(_Multiply_ea35dd8ed2523f8b9a4c52fc52ecff0e_Out_2_Float, float(0), float(1), _Clamp_7c0c867aaa1f5b8683768528b130a408_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Property_509761afcb3aad8f9a29405c122dbf08_Out_0_Vector3 = _CoverDirection;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_72c615246e955087b85288c29905f048_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseNormalMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNMn_059da9746584140498cd018db3c76047_float _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0;
            _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0.WorldSpaceTangent = IN.WorldSpaceTangent;
            _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0.WorldSpacePosition = IN.WorldSpacePosition;
            float4 _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XYZ_1_Vector4;
            float4 _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XZ_2_Vector4;
            float4 _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_YZ_3_Vector4;
            float4 _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XY_4_Vector4;
            SG_TriplanarNMn_059da9746584140498cd018db3c76047_float(_Property_72c615246e955087b85288c29905f048_Out_0_Texture2D, (_Divide_c703c79d4bf76e8c9848ea2ecd29211f_Out_2_Vector4).x, _Property_b168be530d5b4082a2816fc835b55e19_Out_0_Float, _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0, _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XYZ_1_Vector4, _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XZ_2_Vector4, _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_YZ_3_Vector4, _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_7edd97bda70eb38a8c4253094700be37_Out_0_Float = _BaseNormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _NormalStrength_8bafa3d69de37c818a39fccf03db9518_Out_2_Vector3;
            Unity_NormalStrength_float((_TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XYZ_1_Vector4.xyz), _Property_7edd97bda70eb38a8c4253094700be37_Out_0_Float, _NormalStrength_8bafa3d69de37c818a39fccf03db9518_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_6809577d1aa24984aa957e13d0574602_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_Base2NormalMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNMn_059da9746584140498cd018db3c76047_float _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc;
            _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc.WorldSpaceTangent = IN.WorldSpaceTangent;
            _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc.WorldSpacePosition = IN.WorldSpacePosition;
            float4 _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc_XYZ_1_Vector4;
            float4 _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc_XZ_2_Vector4;
            float4 _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc_YZ_3_Vector4;
            float4 _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc_XY_4_Vector4;
            SG_TriplanarNMn_059da9746584140498cd018db3c76047_float(_Property_6809577d1aa24984aa957e13d0574602_Out_0_Texture2D, (_Divide_9f3f46254d5f7a8e87f60c4aa6f5522c_Out_2_Vector4).x, _Property_20f6a96f64098d87b850c83bc45ddcee_Out_0_Float, _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc, _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc_XYZ_1_Vector4, _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc_XZ_2_Vector4, _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc_YZ_3_Vector4, _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_c3260886a9a91b82a3d14c25e6fd0d2c_Out_0_Float = _Base2NormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _NormalStrength_d049a259d0377180a2e5959b925a78bc_Out_2_Vector3;
            Unity_NormalStrength_float((_TriplanarNMn_8890d23c68a4598d85a048422a8f36fc_XYZ_1_Vector4.xyz), _Property_c3260886a9a91b82a3d14c25e6fd0d2c_Out_0_Float, _NormalStrength_d049a259d0377180a2e5959b925a78bc_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float _HeightBlend_a6bf16c3496e828984e7277239132d42;
            float3 _HeightBlend_a6bf16c3496e828984e7277239132d42_OutVector4_1_Vector3;
            SG_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float(_NormalStrength_8bafa3d69de37c818a39fccf03db9518_Out_2_Vector3, _Remap_ddc02d039a9d5388b8add0d2d673d4ac_Out_3_Float, _NormalStrength_d049a259d0377180a2e5959b925a78bc_Out_2_Vector3, _Multiply_55cb55224306dc818a87a2dbf82d5af0_Out_2_Float, _Property_c0dc9341fd635288a1c2869945617704_Out_0_Float, _HeightBlend_a6bf16c3496e828984e7277239132d42, _HeightBlend_a6bf16c3496e828984e7277239132d42_OutVector4_1_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_1dcbde2a42b87e81bb254fd87a4816a5_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverNormalMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNMn_059da9746584140498cd018db3c76047_float _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58;
            _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58.WorldSpaceTangent = IN.WorldSpaceTangent;
            _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58.WorldSpacePosition = IN.WorldSpacePosition;
            float4 _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XYZ_1_Vector4;
            float4 _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XZ_2_Vector4;
            float4 _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_YZ_3_Vector4;
            float4 _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XY_4_Vector4;
            SG_TriplanarNMn_059da9746584140498cd018db3c76047_float(_Property_1dcbde2a42b87e81bb254fd87a4816a5_Out_0_Texture2D, (_Divide_ddaec3b56c9fc58ca3314b828c03b1c8_Out_2_Vector4).x, _Property_bf361924f27f848994241bda91fc2005_Out_0_Float, _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58, _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XYZ_1_Vector4, _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XZ_2_Vector4, _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_YZ_3_Vector4, _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_9176e0d3ea9ff88a9b888a200800b92d_Out_0_Float = _CoverNormalBlendHardness;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _NormalStrength_51679ed1e0a0ef8aa01b53b035a4da51_Out_2_Vector3;
            Unity_NormalStrength_float((_TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XYZ_1_Vector4.xyz), _Property_9176e0d3ea9ff88a9b888a200800b92d_Out_0_Float, _NormalStrength_51679ed1e0a0ef8aa01b53b035a4da51_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Multiply_ea6008eef104198ca40a18608c76d5a4_Out_2_Vector3;
            Unity_Multiply_float3_float3(_Property_509761afcb3aad8f9a29405c122dbf08_Out_0_Vector3, IN.WorldSpaceNormal, _Multiply_ea6008eef104198ca40a18608c76d5a4_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_e74c8f300b486e86a5700118b60b7885_R_1_Float = _Multiply_ea6008eef104198ca40a18608c76d5a4_Out_2_Vector3[0];
            float _Split_e74c8f300b486e86a5700118b60b7885_G_2_Float = _Multiply_ea6008eef104198ca40a18608c76d5a4_Out_2_Vector3[1];
            float _Split_e74c8f300b486e86a5700118b60b7885_B_3_Float = _Multiply_ea6008eef104198ca40a18608c76d5a4_Out_2_Vector3[2];
            float _Split_e74c8f300b486e86a5700118b60b7885_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_57be4f2ffc62ef89a9b736e6f1a99790_Out_2_Float;
            Unity_Add_float(_Split_e74c8f300b486e86a5700118b60b7885_R_1_Float, _Split_e74c8f300b486e86a5700118b60b7885_G_2_Float, _Add_57be4f2ffc62ef89a9b736e6f1a99790_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_abe82f22f31b958eaf9f12f8db5f150d_Out_2_Float;
            Unity_Add_float(_Add_57be4f2ffc62ef89a9b736e6f1a99790_Out_2_Float, _Split_e74c8f300b486e86a5700118b60b7885_B_3_Float, _Add_abe82f22f31b958eaf9f12f8db5f150d_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_ca7cc2d889a56683904c7546a72cedbf_Out_0_Float = _Cover_Amount;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_398a4ebc3d0302828e04c782fb4f49be_Out_0_Float = _Cover_Amount_Grow_Speed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Subtract_9340fe9ac4518a8aa343888dc6143619_Out_2_Float;
            Unity_Subtract_float(float(4), _Property_398a4ebc3d0302828e04c782fb4f49be_Out_0_Float, _Subtract_9340fe9ac4518a8aa343888dc6143619_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_58b01578ab8c8b858bb5e3a720366e16_Out_2_Float;
            Unity_Divide_float(_Property_ca7cc2d889a56683904c7546a72cedbf_Out_0_Float, _Subtract_9340fe9ac4518a8aa343888dc6143619_Out_2_Float, _Divide_58b01578ab8c8b858bb5e3a720366e16_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Absolute_a4d057707c029a85947bcf9de8128ee5_Out_1_Float;
            Unity_Absolute_float(_Divide_58b01578ab8c8b858bb5e3a720366e16_Out_2_Float, _Absolute_a4d057707c029a85947bcf9de8128ee5_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Power_681b2745dbae62839624b98240ca04f7_Out_2_Float;
            Unity_Power_float(_Absolute_a4d057707c029a85947bcf9de8128ee5_Out_1_Float, _Subtract_9340fe9ac4518a8aa343888dc6143619_Out_2_Float, _Power_681b2745dbae62839624b98240ca04f7_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_7340c193c2d92c81ba9dd931235ba17f_Out_3_Float;
            Unity_Clamp_float(_Power_681b2745dbae62839624b98240ca04f7_Out_2_Float, float(0), float(2), _Clamp_7340c193c2d92c81ba9dd931235ba17f_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_7632a3e8aed6d38e88c7f4b8e72f85dc_Out_2_Float;
            Unity_Multiply_float_float(_Add_abe82f22f31b958eaf9f12f8db5f150d_Out_2_Float, _Clamp_7340c193c2d92c81ba9dd931235ba17f_Out_3_Float, _Multiply_7632a3e8aed6d38e88c7f4b8e72f85dc_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Saturate_0541c8e45c0d1e84acab0ae3a59218fa_Out_1_Float;
            Unity_Saturate_float(_Multiply_7632a3e8aed6d38e88c7f4b8e72f85dc_Out_2_Float, _Saturate_0541c8e45c0d1e84acab0ae3a59218fa_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_3b62dfdf4a729d8a9b33398bfdcff203_Out_3_Float;
            Unity_Clamp_float(_Add_abe82f22f31b958eaf9f12f8db5f150d_Out_2_Float, float(0), float(0.9999), _Clamp_3b62dfdf4a729d8a9b33398bfdcff203_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_2df9fd6ca8ecaa828f0edb7582ef5616_Out_0_Float = _Cover_Max_Angle;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_1e9d5df33719338ca266a822ae3e1c73_Out_2_Float;
            Unity_Divide_float(_Property_2df9fd6ca8ecaa828f0edb7582ef5616_Out_0_Float, float(45), _Divide_1e9d5df33719338ca266a822ae3e1c73_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_2d91255cf28d138db7f5edc0eed1ea86_Out_1_Float;
            Unity_OneMinus_float(_Divide_1e9d5df33719338ca266a822ae3e1c73_Out_2_Float, _OneMinus_2d91255cf28d138db7f5edc0eed1ea86_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Subtract_2ae31a316a35bf8882b8de8d71b44b9f_Out_2_Float;
            Unity_Subtract_float(_Clamp_3b62dfdf4a729d8a9b33398bfdcff203_Out_3_Float, _OneMinus_2d91255cf28d138db7f5edc0eed1ea86_Out_1_Float, _Subtract_2ae31a316a35bf8882b8de8d71b44b9f_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_a3af3696fa69dc8cb04a65e84a3c6c98_Out_3_Float;
            Unity_Clamp_float(_Subtract_2ae31a316a35bf8882b8de8d71b44b9f_Out_2_Float, float(0), float(2), _Clamp_a3af3696fa69dc8cb04a65e84a3c6c98_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_467a4be5b52daa80b2d4bf46d2f429c9_Out_2_Float;
            Unity_Divide_float(float(1), _Divide_1e9d5df33719338ca266a822ae3e1c73_Out_2_Float, _Divide_467a4be5b52daa80b2d4bf46d2f429c9_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_749d76436ed5e58abec68ae130db866b_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_a3af3696fa69dc8cb04a65e84a3c6c98_Out_3_Float, _Divide_467a4be5b52daa80b2d4bf46d2f429c9_Out_2_Float, _Multiply_749d76436ed5e58abec68ae130db866b_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Absolute_043a189b52847189ad0575955b41f403_Out_1_Float;
            Unity_Absolute_float(_Multiply_749d76436ed5e58abec68ae130db866b_Out_2_Float, _Absolute_043a189b52847189ad0575955b41f403_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_d4f4330ee4eced8d88fb074732401835_Out_0_Float = _CoverHardness;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Power_39a2971fc28ddc8e9f6d1423e692613d_Out_2_Float;
            Unity_Power_float(_Absolute_043a189b52847189ad0575955b41f403_Out_1_Float, _Property_d4f4330ee4eced8d88fb074732401835_Out_0_Float, _Power_39a2971fc28ddc8e9f6d1423e692613d_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_ecc3c7fdca2e938aa029cd0ff4fb9db6_Out_0_Float = _Cover_Min_Height;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_6fb68ea250dfc28b97bc87b4872d90b2_Out_1_Float;
            Unity_OneMinus_float(_Property_ecc3c7fdca2e938aa029cd0ff4fb9db6_Out_0_Float, _OneMinus_6fb68ea250dfc28b97bc87b4872d90b2_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_815418660959f184b10470e678ebae30_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
            float _Split_815418660959f184b10470e678ebae30_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
            float _Split_815418660959f184b10470e678ebae30_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
            float _Split_815418660959f184b10470e678ebae30_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_9c527d082534a687b4f0de2b26f2d04d_Out_2_Float;
            Unity_Add_float(_OneMinus_6fb68ea250dfc28b97bc87b4872d90b2_Out_1_Float, _Split_815418660959f184b10470e678ebae30_G_2_Float, _Add_9c527d082534a687b4f0de2b26f2d04d_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_9e2bffcd3cb38a83b04f8e67c5c96a06_Out_2_Float;
            Unity_Add_float(_Add_9c527d082534a687b4f0de2b26f2d04d_Out_2_Float, float(1), _Add_9e2bffcd3cb38a83b04f8e67c5c96a06_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_0d06020cc00e3887b95a3ebd8edd196f_Out_3_Float;
            Unity_Clamp_float(_Add_9e2bffcd3cb38a83b04f8e67c5c96a06_Out_2_Float, float(0), float(1), _Clamp_0d06020cc00e3887b95a3ebd8edd196f_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_6ec32fc8c4434e8b84cf41dd6b52dd34_Out_0_Float = _Cover_Min_Height_Blending;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_e57f70c02382b28397642f05af76cfb0_Out_2_Float;
            Unity_Add_float(_Add_9c527d082534a687b4f0de2b26f2d04d_Out_2_Float, _Property_6ec32fc8c4434e8b84cf41dd6b52dd34_Out_0_Float, _Add_e57f70c02382b28397642f05af76cfb0_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_94bc0a8d86daee888d2cd450fbf0d53e_Out_2_Float;
            Unity_Divide_float(_Add_e57f70c02382b28397642f05af76cfb0_Out_2_Float, _Add_9c527d082534a687b4f0de2b26f2d04d_Out_2_Float, _Divide_94bc0a8d86daee888d2cd450fbf0d53e_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_5447f70dbea44185b79c1ac1bb5ea4fa_Out_1_Float;
            Unity_OneMinus_float(_Divide_94bc0a8d86daee888d2cd450fbf0d53e_Out_2_Float, _OneMinus_5447f70dbea44185b79c1ac1bb5ea4fa_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_de674a5c5a1a348688c87f45d79cf9a1_Out_2_Float;
            Unity_Add_float(_OneMinus_5447f70dbea44185b79c1ac1bb5ea4fa_Out_1_Float, float(-0.5), _Add_de674a5c5a1a348688c87f45d79cf9a1_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_3244d6500fdd2c8a92b20a9929d61642_Out_3_Float;
            Unity_Clamp_float(_Add_de674a5c5a1a348688c87f45d79cf9a1_Out_2_Float, float(0), float(1), _Clamp_3244d6500fdd2c8a92b20a9929d61642_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_ea368e3c8a99368d917c930eb07b8e9f_Out_2_Float;
            Unity_Add_float(_Clamp_0d06020cc00e3887b95a3ebd8edd196f_Out_3_Float, _Clamp_3244d6500fdd2c8a92b20a9929d61642_Out_3_Float, _Add_ea368e3c8a99368d917c930eb07b8e9f_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_ce483c505aaa1f83b698a43bb22bf259_Out_3_Float;
            Unity_Clamp_float(_Add_ea368e3c8a99368d917c930eb07b8e9f_Out_2_Float, float(0), float(1), _Clamp_ce483c505aaa1f83b698a43bb22bf259_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_d1b58293be2e9982898e4a432bd61149_Out_2_Float;
            Unity_Multiply_float_float(_Power_39a2971fc28ddc8e9f6d1423e692613d_Out_2_Float, _Clamp_ce483c505aaa1f83b698a43bb22bf259_Out_3_Float, _Multiply_d1b58293be2e9982898e4a432bd61149_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_5336a32115eb29849650688fd99ee185_Out_2_Float;
            Unity_Multiply_float_float(_Saturate_0541c8e45c0d1e84acab0ae3a59218fa_Out_1_Float, _Multiply_d1b58293be2e9982898e4a432bd61149_Out_2_Float, _Multiply_5336a32115eb29849650688fd99ee185_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Lerp_f5ea06dcb1a8c58bac1ae497649cf333_Out_3_Vector3;
            Unity_Lerp_float3(_HeightBlend_a6bf16c3496e828984e7277239132d42_OutVector4_1_Vector3, _NormalStrength_51679ed1e0a0ef8aa01b53b035a4da51_Out_2_Vector3, (_Multiply_5336a32115eb29849650688fd99ee185_Out_2_Float.xxx), _Lerp_f5ea06dcb1a8c58bac1ae497649cf333_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Transform_9ae402175cd2148a9da0916d2d189ef9_Out_1_Vector3;
            {
                float3x3 tangentTransform = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
                _Transform_9ae402175cd2148a9da0916d2d189ef9_Out_1_Vector3 = TransformTangentToWorldDir(_Lerp_f5ea06dcb1a8c58bac1ae497649cf333_Out_3_Vector3.xyz, tangentTransform, true).xyz;
            }
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Multiply_d902e15376a26b8eac35506e85f63b36_Out_2_Vector3;
            Unity_Multiply_float3_float3(_Property_509761afcb3aad8f9a29405c122dbf08_Out_0_Vector3, _Transform_9ae402175cd2148a9da0916d2d189ef9_Out_1_Vector3, _Multiply_d902e15376a26b8eac35506e85f63b36_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_b821124768adb688becbc5d63b26adb4_R_1_Float = _Multiply_d902e15376a26b8eac35506e85f63b36_Out_2_Vector3[0];
            float _Split_b821124768adb688becbc5d63b26adb4_G_2_Float = _Multiply_d902e15376a26b8eac35506e85f63b36_Out_2_Vector3[1];
            float _Split_b821124768adb688becbc5d63b26adb4_B_3_Float = _Multiply_d902e15376a26b8eac35506e85f63b36_Out_2_Vector3[2];
            float _Split_b821124768adb688becbc5d63b26adb4_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_fd43b427bfe3748cb0ced35df3b22159_Out_2_Float;
            Unity_Add_float(_Split_b821124768adb688becbc5d63b26adb4_R_1_Float, _Split_b821124768adb688becbc5d63b26adb4_G_2_Float, _Add_fd43b427bfe3748cb0ced35df3b22159_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_508b788633abc0829f0843d1b1f942c2_Out_2_Float;
            Unity_Add_float(_Add_fd43b427bfe3748cb0ced35df3b22159_Out_2_Float, _Split_b821124768adb688becbc5d63b26adb4_B_3_Float, _Add_508b788633abc0829f0843d1b1f942c2_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_ad921fb726e47688a4d134f6fb3c2273_Out_2_Float;
            Unity_Multiply_float_float(_Add_508b788633abc0829f0843d1b1f942c2_Out_2_Float, _Clamp_7340c193c2d92c81ba9dd931235ba17f_Out_3_Float, _Multiply_ad921fb726e47688a4d134f6fb3c2273_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_90d91831d95dfc83b55e42e5746bd269_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_7340c193c2d92c81ba9dd931235ba17f_Out_3_Float, _Property_d4f4330ee4eced8d88fb074732401835_Out_0_Float, _Multiply_90d91831d95dfc83b55e42e5746bd269_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_b907f38702eabd80a6c67777243459de_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_90d91831d95dfc83b55e42e5746bd269_Out_2_Float, _Multiply_d1b58293be2e9982898e4a432bd61149_Out_2_Float, _Multiply_b907f38702eabd80a6c67777243459de_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_81bdd2734ef6c68fbc23ffe7409191b9_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_ad921fb726e47688a4d134f6fb3c2273_Out_2_Float, _Multiply_b907f38702eabd80a6c67777243459de_Out_2_Float, _Multiply_81bdd2734ef6c68fbc23ffe7409191b9_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_a0e97293ba0dfb83a0d87d28ef311bc7_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverMaskMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_9b6d5da081e434808a5840cbd915bb28;
            _TriplanarNM_9b6d5da081e434808a5840cbd915bb28.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_9b6d5da081e434808a5840cbd915bb28.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XYZ_1_Vector4;
            float4 _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XZ_2_Vector4;
            float4 _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_YZ_3_Vector4;
            float4 _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_a0e97293ba0dfb83a0d87d28ef311bc7_Out_0_Texture2D, (_Divide_ddaec3b56c9fc58ca3314b828c03b1c8_Out_2_Vector4).x, _Property_bf361924f27f848994241bda91fc2005_Out_0_Float, _TriplanarNM_9b6d5da081e434808a5840cbd915bb28, _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XYZ_1_Vector4, _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XZ_2_Vector4, _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_YZ_3_Vector4, _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_b20618c84cffd183aae7f27c2d0772cb_R_1_Float = _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XYZ_1_Vector4[0];
            float _Split_b20618c84cffd183aae7f27c2d0772cb_G_2_Float = _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XYZ_1_Vector4[1];
            float _Split_b20618c84cffd183aae7f27c2d0772cb_B_3_Float = _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XYZ_1_Vector4[2];
            float _Split_b20618c84cffd183aae7f27c2d0772cb_A_4_Float = _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XYZ_1_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_987a8037965fff81a4930627358fc6e3_Out_0_Float = _CoverHeightMapMin;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_89aeacdce0000086a98e45df79358a56_Out_0_Float = _CoverHeightMapMax;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_d18b9686bb8af48c85d99d319830c000_Out_0_Vector2 = float2(_Property_987a8037965fff81a4930627358fc6e3_Out_0_Float, _Property_89aeacdce0000086a98e45df79358a56_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_856fd4da5f3d1b8c9bdd6966daada2b2_Out_0_Float = _CoverHeightMapOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Add_935266d0fc26dc87a5909ea1bd8aa423_Out_2_Vector2;
            Unity_Add_float2(_Vector2_d18b9686bb8af48c85d99d319830c000_Out_0_Vector2, (_Property_856fd4da5f3d1b8c9bdd6966daada2b2_Out_0_Float.xx), _Add_935266d0fc26dc87a5909ea1bd8aa423_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_f85aa52613b0108d876fab409ea80b8c_Out_3_Float;
            Unity_Remap_float(_Split_b20618c84cffd183aae7f27c2d0772cb_B_3_Float, float2 (0, 1), _Add_935266d0fc26dc87a5909ea1bd8aa423_Out_2_Vector2, _Remap_f85aa52613b0108d876fab409ea80b8c_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_65b9c8cf3a459284a298aa84443140a2_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_81bdd2734ef6c68fbc23ffe7409191b9_Out_2_Float, _Remap_f85aa52613b0108d876fab409ea80b8c_Out_3_Float, _Multiply_65b9c8cf3a459284a298aa84443140a2_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_100e6799ca65308ca7cca7a0e52252db_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_65b9c8cf3a459284a298aa84443140a2_Out_2_Float, _Split_b4d08e724ec3df88ab7743c5b7a3f081_G_2_Float, _Multiply_100e6799ca65308ca7cca7a0e52252db_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Saturate_a340e45e54317a81ae145a84c72daa75_Out_1_Float;
            Unity_Saturate_float(_Multiply_100e6799ca65308ca7cca7a0e52252db_Out_2_Float, _Saturate_a340e45e54317a81ae145a84c72daa75_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_d8ca79d07c3bbe85b09000ed0e769324_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_7c0c867aaa1f5b8683768528b130a408_Out_3_Float, _Saturate_a340e45e54317a81ae145a84c72daa75_Out_1_Float, _Multiply_d8ca79d07c3bbe85b09000ed0e769324_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            #if defined(_USEDYNAMICCOVERTSTATICMASKF_ON)
            float _UseDynamicCoverTStaticMaskF_a32a3630501f778faf03be9cfccfec64_Out_0_Float = _Multiply_d8ca79d07c3bbe85b09000ed0e769324_Out_2_Float;
            #else
            float _UseDynamicCoverTStaticMaskF_a32a3630501f778faf03be9cfccfec64_Out_0_Float = _Clamp_7c0c867aaa1f5b8683768528b130a408_Out_3_Float;
            #endif
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Lerp_7b425abcb4dfd0859d63f71a714fbb7d_Out_3_Vector3;
            Unity_Lerp_float3(_HeightBlend_d30f443b26dc0d8087616105058c020a_OutVector4_1_Vector3, (_Multiply_0652b80f60f8ed84beea389318719c9a_Out_2_Vector4.xyz), (_UseDynamicCoverTStaticMaskF_a32a3630501f778faf03be9cfccfec64_Out_0_Float.xxx), _Lerp_7b425abcb4dfd0859d63f71a714fbb7d_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_2ff5681ef4527d809ef09fdc5f8ef937_Out_0_Vector4 = _WetColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Multiply_85d9904c4b12ce85939f7948252c76b2_Out_2_Vector3;
            Unity_Multiply_float3_float3((_Property_2ff5681ef4527d809ef09fdc5f8ef937_Out_0_Vector4.xyz), _Lerp_7b425abcb4dfd0859d63f71a714fbb7d_Out_3_Vector3, _Multiply_85d9904c4b12ce85939f7948252c76b2_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_f1784d825dacdb8785770d3eca446428_Out_1_Float;
            Unity_OneMinus_float(_Split_b4d08e724ec3df88ab7743c5b7a3f081_R_1_Float, _OneMinus_f1784d825dacdb8785770d3eca446428_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Lerp_f330c9b8f318a885ac2822e63f9269e8_Out_3_Vector3;
            Unity_Lerp_float3(_Lerp_7b425abcb4dfd0859d63f71a714fbb7d_Out_3_Vector3, _Multiply_85d9904c4b12ce85939f7948252c76b2_Out_2_Vector3, (_OneMinus_f1784d825dacdb8785770d3eca446428_Out_1_Float.xxx), _Lerp_f330c9b8f318a885ac2822e63f9269e8_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_0709d20641a7668b85ded82df467d4f4_Out_0_Float = _CoverNormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _NormalStrength_d90a27c667bbb48e9e15ec520c3e2ff3_Out_2_Vector3;
            Unity_NormalStrength_float((_TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XYZ_1_Vector4.xyz), _Property_0709d20641a7668b85ded82df467d4f4_Out_0_Float, _NormalStrength_d90a27c667bbb48e9e15ec520c3e2ff3_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Lerp_1ef9d67a29ba1b85a5434194628b76ad_Out_3_Vector3;
            Unity_Lerp_float3(_HeightBlend_a6bf16c3496e828984e7277239132d42_OutVector4_1_Vector3, _NormalStrength_d90a27c667bbb48e9e15ec520c3e2ff3_Out_2_Vector3, (_UseDynamicCoverTStaticMaskF_a32a3630501f778faf03be9cfccfec64_Out_0_Float.xxx), _Lerp_1ef9d67a29ba1b85a5434194628b76ad_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_57dab79b7e7fc28c99642ba557430a27_Out_0_Float = _BaseMetallic;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_aa5299d5bb4d2080af3ab6b593e1aa2c_Out_2_Float;
            Unity_Multiply_float_float(_Split_866a663ed067f988862843fe32765ff8_R_1_Float, _Property_57dab79b7e7fc28c99642ba557430a27_Out_0_Float, _Multiply_aa5299d5bb4d2080af3ab6b593e1aa2c_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_27a0c97d2207ca89af0ef30bd5d6c062_Out_0_Float = _BaseAORemapMin;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_5a040fb62cd8888895d4f920c4036587_Out_0_Float = _BaseAORemapMax;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_6f9956f2c0302f8382a2f5c741da0609_Out_0_Vector2 = float2(_Property_27a0c97d2207ca89af0ef30bd5d6c062_Out_0_Float, _Property_5a040fb62cd8888895d4f920c4036587_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_de2674403349aa85b1136d42692d26f9_Out_3_Float;
            Unity_Remap_float(_Split_866a663ed067f988862843fe32765ff8_G_2_Float, float2 (0, 1), _Vector2_6f9956f2c0302f8382a2f5c741da0609_Out_0_Vector2, _Remap_de2674403349aa85b1136d42692d26f9_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_a1b1d767544de781a39d6415872f7285_Out_0_Float = _BaseSmoothnessRemapMin;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_a0fd73b9dac07285b1d70b54ca659a15_Out_0_Float = _BaseSmoothnessRemapMax;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_fc66e35bdc72f589a802edd7bfb7555b_Out_0_Vector2 = float2(_Property_a1b1d767544de781a39d6415872f7285_Out_0_Float, _Property_a0fd73b9dac07285b1d70b54ca659a15_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_0c05c4433df8c8898decaf8c2ca17cb2_Out_3_Float;
            Unity_Remap_float(_Split_866a663ed067f988862843fe32765ff8_A_4_Float, float2 (0, 1), _Vector2_fc66e35bdc72f589a802edd7bfb7555b_Out_0_Vector2, _Remap_0c05c4433df8c8898decaf8c2ca17cb2_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Vector3_4c4100faab122d8da757a32364182844_Out_0_Vector3 = float3(_Multiply_aa5299d5bb4d2080af3ab6b593e1aa2c_Out_2_Float, _Remap_de2674403349aa85b1136d42692d26f9_Out_3_Float, _Remap_0c05c4433df8c8898decaf8c2ca17cb2_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_7cdf7bda907cf087942cd072e635a869_Out_0_Float = _Base2Metallic;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_befa03f2838946858f28ac63a284b0f8_Out_2_Float;
            Unity_Multiply_float_float(_Split_0b441b86fba0ea80bc060dae9d7ed0d7_R_1_Float, _Property_7cdf7bda907cf087942cd072e635a869_Out_0_Float, _Multiply_befa03f2838946858f28ac63a284b0f8_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_b334f6ce40e54186b9864b004fbe88d2_Out_0_Float = _Base2AORemapMin;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_0ee0b6f693d6ed8c830707e558e38b7b_Out_0_Float = _Base2AORemapMax;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_ec982e7ec425d587a82289de9dcba701_Out_0_Vector2 = float2(_Property_b334f6ce40e54186b9864b004fbe88d2_Out_0_Float, _Property_0ee0b6f693d6ed8c830707e558e38b7b_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_e36fdc5121ad638e8112d325bff9b6c2_Out_3_Float;
            Unity_Remap_float(_Split_0b441b86fba0ea80bc060dae9d7ed0d7_G_2_Float, float2 (0, 1), _Vector2_ec982e7ec425d587a82289de9dcba701_Out_0_Vector2, _Remap_e36fdc5121ad638e8112d325bff9b6c2_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_a9807e270c8ae68db2a00b23b4aceb82_Out_0_Float = _Base2SmoothnessRemapMin;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_0106a1baaa017b8d93c6d416dda17e61_Out_0_Float = _Base2SmoothnessRemapMax;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_92da7adc0ff49f8cba8bafca74304dbd_Out_0_Vector2 = float2(_Property_a9807e270c8ae68db2a00b23b4aceb82_Out_0_Float, _Property_0106a1baaa017b8d93c6d416dda17e61_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_697b96439d3a0983800a051b2b4edd90_Out_3_Float;
            Unity_Remap_float(_Split_0b441b86fba0ea80bc060dae9d7ed0d7_A_4_Float, float2 (0, 1), _Vector2_92da7adc0ff49f8cba8bafca74304dbd_Out_0_Vector2, _Remap_697b96439d3a0983800a051b2b4edd90_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Vector3_d5775a771fd8c48e8c9af11a4af046aa_Out_0_Vector3 = float3(_Multiply_befa03f2838946858f28ac63a284b0f8_Out_2_Float, _Remap_e36fdc5121ad638e8112d325bff9b6c2_Out_3_Float, _Remap_697b96439d3a0983800a051b2b4edd90_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float _HeightBlend_05358f196f0ec3849124c9bfd64e3003;
            float3 _HeightBlend_05358f196f0ec3849124c9bfd64e3003_OutVector4_1_Vector3;
            SG_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float(_Vector3_4c4100faab122d8da757a32364182844_Out_0_Vector3, _Remap_ddc02d039a9d5388b8add0d2d673d4ac_Out_3_Float, _Vector3_d5775a771fd8c48e8c9af11a4af046aa_Out_0_Vector3, _Multiply_55cb55224306dc818a87a2dbf82d5af0_Out_2_Float, _Property_c0dc9341fd635288a1c2869945617704_Out_0_Float, _HeightBlend_05358f196f0ec3849124c9bfd64e3003, _HeightBlend_05358f196f0ec3849124c9bfd64e3003_OutVector4_1_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_7cf1f37cb0f052868aefa9c1514a9a20_Out_0_Float = _CoverMetallic;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_daff314f0b716c86b0dec03fe9225b8b_Out_2_Float;
            Unity_Multiply_float_float(_Split_b20618c84cffd183aae7f27c2d0772cb_R_1_Float, _Property_7cf1f37cb0f052868aefa9c1514a9a20_Out_0_Float, _Multiply_daff314f0b716c86b0dec03fe9225b8b_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_e52744d22eaee787aba665b5a103092d_Out_0_Float = _CoverAORemapMin;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_f5216b23a41a0b888854c3e04c30f9fb_Out_0_Float = _CoverAORemapMax;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_2d4e0b2bd57a668bb5e1d3f75180a968_Out_0_Vector2 = float2(_Property_e52744d22eaee787aba665b5a103092d_Out_0_Float, _Property_f5216b23a41a0b888854c3e04c30f9fb_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_d545ba99e5a8678cbf5b23383fafd8fb_Out_3_Float;
            Unity_Remap_float(_Split_b20618c84cffd183aae7f27c2d0772cb_G_2_Float, float2 (0, 1), _Vector2_2d4e0b2bd57a668bb5e1d3f75180a968_Out_0_Vector2, _Remap_d545ba99e5a8678cbf5b23383fafd8fb_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_007771e9e06cc78b9844d01f8129c541_Out_0_Float = _CoverSmoothnessRemapMin;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_ce1117115fad1e85bdf2bbb84bd185cb_Out_0_Float = _CoverSmoothnessRemapMax;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_6ed3170e6a5acd8a8f702cd7a2af7737_Out_0_Vector2 = float2(_Property_007771e9e06cc78b9844d01f8129c541_Out_0_Float, _Property_ce1117115fad1e85bdf2bbb84bd185cb_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_690ea2a75496a283a66513f691c4f9db_Out_3_Float;
            Unity_Remap_float(_Split_b20618c84cffd183aae7f27c2d0772cb_A_4_Float, float2 (0, 1), _Vector2_6ed3170e6a5acd8a8f702cd7a2af7737_Out_0_Vector2, _Remap_690ea2a75496a283a66513f691c4f9db_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Vector3_88cb732fef09b78495ad84577275ab8b_Out_0_Vector3 = float3(_Multiply_daff314f0b716c86b0dec03fe9225b8b_Out_2_Float, _Remap_d545ba99e5a8678cbf5b23383fafd8fb_Out_3_Float, _Remap_690ea2a75496a283a66513f691c4f9db_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Lerp_5d687668f4856180be26ec62834c6113_Out_3_Vector3;
            Unity_Lerp_float3(_HeightBlend_05358f196f0ec3849124c9bfd64e3003_OutVector4_1_Vector3, _Vector3_88cb732fef09b78495ad84577275ab8b_Out_0_Vector3, (_UseDynamicCoverTStaticMaskF_a32a3630501f778faf03be9cfccfec64_Out_0_Float.xxx), _Lerp_5d687668f4856180be26ec62834c6113_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_22fc6cf606e48f8fa771c4e8cab49553_R_1_Float = _Lerp_5d687668f4856180be26ec62834c6113_Out_3_Vector3[0];
            float _Split_22fc6cf606e48f8fa771c4e8cab49553_G_2_Float = _Lerp_5d687668f4856180be26ec62834c6113_Out_3_Vector3[1];
            float _Split_22fc6cf606e48f8fa771c4e8cab49553_B_3_Float = _Lerp_5d687668f4856180be26ec62834c6113_Out_3_Vector3[2];
            float _Split_22fc6cf606e48f8fa771c4e8cab49553_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_e82022180c38e18e958213dc27e38977_Out_0_Float = _WetSmoothness;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Lerp_2247e6fe06a85b8098ccf90406a20ab1_Out_3_Float;
            Unity_Lerp_float(_Split_22fc6cf606e48f8fa771c4e8cab49553_B_3_Float, _Property_e82022180c38e18e958213dc27e38977_Out_0_Float, _OneMinus_f1784d825dacdb8785770d3eca446428_Out_1_Float, _Lerp_2247e6fe06a85b8098ccf90406a20ab1_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_2f38c4b6e08da48093bd9896985f29eb_R_1_Float = _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4[0];
            float _Split_2f38c4b6e08da48093bd9896985f29eb_G_2_Float = _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4[1];
            float _Split_2f38c4b6e08da48093bd9896985f29eb_B_3_Float = _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4[2];
            float _Split_2f38c4b6e08da48093bd9896985f29eb_A_4_Float = _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_a55cb5b55044058c90b91c360cd49672_Out_0_Float = _AlphaCutoff;
            #endif
            surface.BaseColor = _Lerp_f330c9b8f318a885ac2822e63f9269e8_Out_3_Vector3;
            surface.NormalTS = _Lerp_1ef9d67a29ba1b85a5434194628b76ad_Out_3_Vector3;
            surface.Emission = float3(0, 0, 0);
            surface.Metallic = _Split_22fc6cf606e48f8fa771c4e8cab49553_R_1_Float;
            surface.Specular = IsGammaSpace() ? float3(0.5, 0.5, 0.5) : SRGBToLinear(float3(0.5, 0.5, 0.5));
            surface.Smoothness = _Lerp_2247e6fe06a85b8098ccf90406a20ab1_Out_3_Float;
            surface.Occlusion = _Split_22fc6cf606e48f8fa771c4e8cab49553_G_2_Float;
            surface.Alpha = _Split_2f38c4b6e08da48093bd9896985f29eb_A_4_Float;
            surface.AlphaClipThreshold = _Property_a55cb5b55044058c90b91c360cd49672_Out_0_Float;
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
             float4 color : INTERP6;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float4 fogFactorAndVertexLight : INTERP7;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 positionWS : INTERP8;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 normalWS : INTERP9;
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
        float4 _BaseTilingOffset;
        float _BaseTriplanarThreshold;
        float4 _BaseNormalMap_TexelSize;
        float _BaseNormalScale;
        float4 _BaseMaskMap_TexelSize;
        float _BaseMetallic;
        float _BaseAORemapMin;
        float _BaseAORemapMax;
        float _BaseSmoothnessRemapMin;
        float _BaseSmoothnessRemapMax;
        float4 _LayerMask_TexelSize;
        float _Invert_Layer_Mask;
        float _Height_Transition;
        float _HeightMin;
        float _HeightMax;
        float _HeightOffset;
        float _HeightMin2;
        float _HeightMax2;
        float _HeightOffset2;
        float4 _Base2Color;
        float4 _Base2ColorMap_TexelSize;
        float4 _Base2TilingOffset;
        float _Base2TriplanarThreshold;
        float4 _Base2NormalMap_TexelSize;
        float _Base2NormalScale;
        float4 _Base2MaskMap_TexelSize;
        float _Base2Metallic;
        float _Base2SmoothnessRemapMin;
        float _Base2SmoothnessRemapMax;
        float _Base2AORemapMin;
        float _Base2AORemapMax;
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
        TEXTURE2D(_LayerMask);
        SAMPLER(sampler_LayerMask);
        TEXTURE2D(_Base2ColorMap);
        SAMPLER(sampler_Base2ColorMap);
        TEXTURE2D(_Base2NormalMap);
        SAMPLER(sampler_Base2NormalMap);
        TEXTURE2D(_Base2MaskMap);
        SAMPLER(sampler_Base2MaskMap);
        TEXTURE2D(_CoverBaseColorMap);
        SAMPLER(sampler_CoverBaseColorMap);
        TEXTURE2D(_CoverNormalMap);
        SAMPLER(sampler_CoverNormalMap);
        TEXTURE2D(_CoverMaskMap);
        SAMPLER(sampler_CoverMaskMap);
        
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
        
        void Unity_Divide_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A / B;
        }
        
        void Unity_Combine_float(float R, float G, float B, float A, out float4 RGBA, out float3 RGB, out float2 RG)
        {
            RGBA = float4(R, G, B, A);
            RGB = float3(R, G, B);
            RG = float2(R, G);
        }
        
        void Unity_Multiply_float4_float4(float4 A, float4 B, out float4 Out)
        {
        Out = A * B;
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
        
        void Unity_Multiply_float_float(float A, float B, out float Out)
        {
        Out = A * B;
        }
        
        void Unity_Add_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A + B;
        }
        
        void Unity_Add_float(float A, float B, out float Out)
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
        
        void Unity_Add_float2(float2 A, float2 B, out float2 Out)
        {
            Out = A + B;
        }
        
        void Unity_Remap_float(float In, float2 InMinMax, float2 OutMinMax, out float Out)
        {
            Out = OutMinMax.x + (In - InMinMax.x) * (OutMinMax.y - OutMinMax.x) / (InMinMax.y - InMinMax.x);
        }
        
        void Unity_OneMinus_float(float In, out float Out)
        {
            Out = 1 - In;
        }
        
        void Unity_Branch_float(float Predicate, float True, float False, out float Out)
        {
            Out = Predicate ? True : False;
        }
        
        void Unity_Maximum_float(float A, float B, out float Out)
        {
            Out = max(A, B);
        }
        
        void Unity_Subtract_float(float A, float B, out float Out)
        {
            Out = A - B;
        }
        
        void Unity_Add_float3(float3 A, float3 B, out float3 Out)
        {
            Out = A + B;
        }
        
        void Unity_Divide_float3(float3 A, float3 B, out float3 Out)
        {
            Out = A / B;
        }
        
        struct Bindings_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float
        {
        };
        
        void SG_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float(float3 Vector3_88EEBB5E, float Vector1_DA0A37FA, float3 Vector3_79AA92F, float Vector1_F7E83F1E, float Vector1_1C9222A6, Bindings_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float IN, out float3 OutVector4_1)
        {
        float3 _Property_dd1c841a04c03f8c85e7b00eb025ecda_Out_0_Vector3 = Vector3_88EEBB5E;
        float _Property_14119cc7eaf4128f991283d47cf72d85_Out_0_Float = Vector1_DA0A37FA;
        float _Property_48af0ad45e3f7f82932b938695d21391_Out_0_Float = Vector1_DA0A37FA;
        float _Property_8a30b3ca12ff518fa473ccd686c7d503_Out_0_Float = Vector1_F7E83F1E;
        float _Maximum_c196e4a61637ea8381a3437c93f89ce2_Out_2_Float;
        Unity_Maximum_float(_Property_48af0ad45e3f7f82932b938695d21391_Out_0_Float, _Property_8a30b3ca12ff518fa473ccd686c7d503_Out_0_Float, _Maximum_c196e4a61637ea8381a3437c93f89ce2_Out_2_Float);
        float _Property_ee8d5fc69475d181be60c57e04ea8708_Out_0_Float = Vector1_1C9222A6;
        float _Subtract_61ca880c04c1758eb128f25c9faabd63_Out_2_Float;
        Unity_Subtract_float(_Maximum_c196e4a61637ea8381a3437c93f89ce2_Out_2_Float, _Property_ee8d5fc69475d181be60c57e04ea8708_Out_0_Float, _Subtract_61ca880c04c1758eb128f25c9faabd63_Out_2_Float);
        float _Subtract_e3a7713b556a1b8cb40aad97fc58d619_Out_2_Float;
        Unity_Subtract_float(_Property_14119cc7eaf4128f991283d47cf72d85_Out_0_Float, _Subtract_61ca880c04c1758eb128f25c9faabd63_Out_2_Float, _Subtract_e3a7713b556a1b8cb40aad97fc58d619_Out_2_Float);
        float _Maximum_d02e48d92038448cb0345e5cf3779071_Out_2_Float;
        Unity_Maximum_float(_Subtract_e3a7713b556a1b8cb40aad97fc58d619_Out_2_Float, float(0), _Maximum_d02e48d92038448cb0345e5cf3779071_Out_2_Float);
        float3 _Multiply_79b0b5d7d3528b8395e1135339a090f2_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Property_dd1c841a04c03f8c85e7b00eb025ecda_Out_0_Vector3, (_Maximum_d02e48d92038448cb0345e5cf3779071_Out_2_Float.xxx), _Multiply_79b0b5d7d3528b8395e1135339a090f2_Out_2_Vector3);
        float3 _Property_c7292b3b08585f8c8670172b9a220bf0_Out_0_Vector3 = Vector3_79AA92F;
        float _Property_5e920479576fad83ba1947728dcceab4_Out_0_Float = Vector1_F7E83F1E;
        float _Subtract_b7368f21be9e048aae7f90c8a2bfaae1_Out_2_Float;
        Unity_Subtract_float(_Property_5e920479576fad83ba1947728dcceab4_Out_0_Float, _Subtract_61ca880c04c1758eb128f25c9faabd63_Out_2_Float, _Subtract_b7368f21be9e048aae7f90c8a2bfaae1_Out_2_Float);
        float _Maximum_216777d30802328eab607c8fe68ba3a1_Out_2_Float;
        Unity_Maximum_float(_Subtract_b7368f21be9e048aae7f90c8a2bfaae1_Out_2_Float, float(0), _Maximum_216777d30802328eab607c8fe68ba3a1_Out_2_Float);
        float3 _Multiply_a856b52cd0848f86a6ae1af9b175935c_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Property_c7292b3b08585f8c8670172b9a220bf0_Out_0_Vector3, (_Maximum_216777d30802328eab607c8fe68ba3a1_Out_2_Float.xxx), _Multiply_a856b52cd0848f86a6ae1af9b175935c_Out_2_Vector3);
        float3 _Add_86c6109dc4530b8c9763ef62b056ad4c_Out_2_Vector3;
        Unity_Add_float3(_Multiply_79b0b5d7d3528b8395e1135339a090f2_Out_2_Vector3, _Multiply_a856b52cd0848f86a6ae1af9b175935c_Out_2_Vector3, _Add_86c6109dc4530b8c9763ef62b056ad4c_Out_2_Vector3);
        float _Add_356384b52728f583bd6e694bc1fc3738_Out_2_Float;
        Unity_Add_float(_Maximum_d02e48d92038448cb0345e5cf3779071_Out_2_Float, _Maximum_216777d30802328eab607c8fe68ba3a1_Out_2_Float, _Add_356384b52728f583bd6e694bc1fc3738_Out_2_Float);
        float _Maximum_94a22f5ceb706e88bc16350a5d5d2a82_Out_2_Float;
        Unity_Maximum_float(_Add_356384b52728f583bd6e694bc1fc3738_Out_2_Float, float(1E-05), _Maximum_94a22f5ceb706e88bc16350a5d5d2a82_Out_2_Float);
        float3 _Divide_d7291d1701d7058dbb5263194c1bed22_Out_2_Vector3;
        Unity_Divide_float3(_Add_86c6109dc4530b8c9763ef62b056ad4c_Out_2_Vector3, (_Maximum_94a22f5ceb706e88bc16350a5d5d2a82_Out_2_Float.xxx), _Divide_d7291d1701d7058dbb5263194c1bed22_Out_2_Vector3);
        OutVector4_1 = _Divide_d7291d1701d7058dbb5263194c1bed22_Out_2_Vector3;
        }
        
        void Unity_Clamp_float(float In, float Min, float Max, out float Out)
        {
            Out = clamp(In, Min, Max);
        }
        
        void Unity_Normalize_float3(float3 In, out float3 Out)
        {
            Out = normalize(In);
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
        
        void Unity_NormalStrength_float(float3 In, float Strength, out float3 Out)
        {
            Out = float3(In.rg * Strength, lerp(1, In.b, saturate(Strength)));
        }
        
        void Unity_Divide_float(float A, float B, out float Out)
        {
            Out = A / B;
        }
        
        void Unity_Absolute_float(float In, out float Out)
        {
            Out = abs(In);
        }
        
        void Unity_Power_float(float A, float B, out float Out)
        {
            Out = pow(A, B);
        }
        
        void Unity_Saturate_float(float In, out float Out)
        {
            Out = saturate(In);
        }
        
        void Unity_Lerp_float3(float3 A, float3 B, float3 T, out float3 Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Lerp_float(float A, float B, float T, out float Out)
        {
            Out = lerp(A, B, T);
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
            UnityTexture2D _Property_d92b1410e1d6bc81a86076b09e35f302_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseColorMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_d4a357b2daff5587ae46468726a33797_Out_0_Vector4 = _BaseTilingOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Divide_c703c79d4bf76e8c9848ea2ecd29211f_Out_2_Vector4;
            Unity_Divide_float4(float4(1, 1, 0, 0), _Property_d4a357b2daff5587ae46468726a33797_Out_0_Vector4, _Divide_c703c79d4bf76e8c9848ea2ecd29211f_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_b168be530d5b4082a2816fc835b55e19_Out_0_Float = _BaseTriplanarThreshold;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579;
            _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4;
            float4 _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XZ_2_Vector4;
            float4 _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_YZ_3_Vector4;
            float4 _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_d92b1410e1d6bc81a86076b09e35f302_Out_0_Texture2D, (_Divide_c703c79d4bf76e8c9848ea2ecd29211f_Out_2_Vector4).x, _Property_b168be530d5b4082a2816fc835b55e19_Out_0_Float, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XZ_2_Vector4, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_YZ_3_Vector4, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_17f0f1bec4ec6485881127275660d4f1_Out_0_Vector4 = _BaseColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Multiply_6434c1e27d77608fb8dcec94697eb8d3_Out_2_Vector4;
            Unity_Multiply_float4_float4(_TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4, _Property_17f0f1bec4ec6485881127275660d4f1_Out_0_Vector4, _Multiply_6434c1e27d77608fb8dcec94697eb8d3_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_080b6cb46abb00848263c964726eac36_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseMaskMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c;
            _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XYZ_1_Vector4;
            float4 _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XZ_2_Vector4;
            float4 _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_YZ_3_Vector4;
            float4 _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_080b6cb46abb00848263c964726eac36_Out_0_Texture2D, (_Divide_c703c79d4bf76e8c9848ea2ecd29211f_Out_2_Vector4).x, _Property_b168be530d5b4082a2816fc835b55e19_Out_0_Float, _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c, _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XYZ_1_Vector4, _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XZ_2_Vector4, _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_YZ_3_Vector4, _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_866a663ed067f988862843fe32765ff8_R_1_Float = _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XYZ_1_Vector4[0];
            float _Split_866a663ed067f988862843fe32765ff8_G_2_Float = _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XYZ_1_Vector4[1];
            float _Split_866a663ed067f988862843fe32765ff8_B_3_Float = _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XYZ_1_Vector4[2];
            float _Split_866a663ed067f988862843fe32765ff8_A_4_Float = _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XYZ_1_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_3b9891099f2f3e84b765eb453f6f6810_Out_0_Float = _HeightMin;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_bde21360babd9089a90a45cd2843925b_Out_0_Float = _HeightMax;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_9f8e90f51ffcfe8bb3d495766c0cabca_Out_0_Vector2 = float2(_Property_3b9891099f2f3e84b765eb453f6f6810_Out_0_Float, _Property_bde21360babd9089a90a45cd2843925b_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_6ff6d72f7b1d0083b4e4ce61e7e7c8d3_Out_0_Float = _HeightOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Add_39687f6bf7045086bc2d1ccf5f94c9de_Out_2_Vector2;
            Unity_Add_float2(_Vector2_9f8e90f51ffcfe8bb3d495766c0cabca_Out_0_Vector2, (_Property_6ff6d72f7b1d0083b4e4ce61e7e7c8d3_Out_0_Float.xx), _Add_39687f6bf7045086bc2d1ccf5f94c9de_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_ddc02d039a9d5388b8add0d2d673d4ac_Out_3_Float;
            Unity_Remap_float(_Split_866a663ed067f988862843fe32765ff8_B_3_Float, float2 (0, 1), _Add_39687f6bf7045086bc2d1ccf5f94c9de_Out_2_Vector2, _Remap_ddc02d039a9d5388b8add0d2d673d4ac_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_11586ef261ce8e87953046ff84ce22ab_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_Base2ColorMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_221c724b2137d58c8c387fee5b48be14_Out_0_Vector4 = _Base2TilingOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Divide_9f3f46254d5f7a8e87f60c4aa6f5522c_Out_2_Vector4;
            Unity_Divide_float4(float4(1, 1, 0, 0), _Property_221c724b2137d58c8c387fee5b48be14_Out_0_Vector4, _Divide_9f3f46254d5f7a8e87f60c4aa6f5522c_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_20f6a96f64098d87b850c83bc45ddcee_Out_0_Float = _Base2TriplanarThreshold;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_ca3aaaec266f85859b75e37163da7cba;
            _TriplanarNM_ca3aaaec266f85859b75e37163da7cba.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_ca3aaaec266f85859b75e37163da7cba.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_ca3aaaec266f85859b75e37163da7cba_XYZ_1_Vector4;
            float4 _TriplanarNM_ca3aaaec266f85859b75e37163da7cba_XZ_2_Vector4;
            float4 _TriplanarNM_ca3aaaec266f85859b75e37163da7cba_YZ_3_Vector4;
            float4 _TriplanarNM_ca3aaaec266f85859b75e37163da7cba_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_11586ef261ce8e87953046ff84ce22ab_Out_0_Texture2D, (_Divide_9f3f46254d5f7a8e87f60c4aa6f5522c_Out_2_Vector4).x, _Property_20f6a96f64098d87b850c83bc45ddcee_Out_0_Float, _TriplanarNM_ca3aaaec266f85859b75e37163da7cba, _TriplanarNM_ca3aaaec266f85859b75e37163da7cba_XYZ_1_Vector4, _TriplanarNM_ca3aaaec266f85859b75e37163da7cba_XZ_2_Vector4, _TriplanarNM_ca3aaaec266f85859b75e37163da7cba_YZ_3_Vector4, _TriplanarNM_ca3aaaec266f85859b75e37163da7cba_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_60dff9cc4310ea89874789591a78d84b_Out_0_Vector4 = _Base2Color;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Multiply_4d8e3ca1454e2d85963c9d240239a171_Out_2_Vector4;
            Unity_Multiply_float4_float4(_TriplanarNM_ca3aaaec266f85859b75e37163da7cba_XYZ_1_Vector4, _Property_60dff9cc4310ea89874789591a78d84b_Out_0_Vector4, _Multiply_4d8e3ca1454e2d85963c9d240239a171_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_312b653a29ccc087849b1493611fb73c_Out_0_Boolean = _Invert_Layer_Mask;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_1004d4c014377e8c8fa291ed748b9f84_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_LayerMask);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _SampleTexture2D_c910b4b42510578d81c16169d3cb5727_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_1004d4c014377e8c8fa291ed748b9f84_Out_0_Texture2D.tex, _Property_1004d4c014377e8c8fa291ed748b9f84_Out_0_Texture2D.samplerstate, _Property_1004d4c014377e8c8fa291ed748b9f84_Out_0_Texture2D.GetTransformedUV(IN.uv0.xy) );
            float _SampleTexture2D_c910b4b42510578d81c16169d3cb5727_R_4_Float = _SampleTexture2D_c910b4b42510578d81c16169d3cb5727_RGBA_0_Vector4.r;
            float _SampleTexture2D_c910b4b42510578d81c16169d3cb5727_G_5_Float = _SampleTexture2D_c910b4b42510578d81c16169d3cb5727_RGBA_0_Vector4.g;
            float _SampleTexture2D_c910b4b42510578d81c16169d3cb5727_B_6_Float = _SampleTexture2D_c910b4b42510578d81c16169d3cb5727_RGBA_0_Vector4.b;
            float _SampleTexture2D_c910b4b42510578d81c16169d3cb5727_A_7_Float = _SampleTexture2D_c910b4b42510578d81c16169d3cb5727_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_bc0b8885b596648d9b594130faa6585c_Out_1_Float;
            Unity_OneMinus_float(_SampleTexture2D_c910b4b42510578d81c16169d3cb5727_R_4_Float, _OneMinus_bc0b8885b596648d9b594130faa6585c_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Branch_6b7615e16629338ba87d3570a0096f66_Out_3_Float;
            Unity_Branch_float(_Property_312b653a29ccc087849b1493611fb73c_Out_0_Boolean, _OneMinus_bc0b8885b596648d9b594130faa6585c_Out_1_Float, _SampleTexture2D_c910b4b42510578d81c16169d3cb5727_R_4_Float, _Branch_6b7615e16629338ba87d3570a0096f66_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_b4749c77856157858fffde0aed55fc74_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_Base2MaskMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b;
            _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_XYZ_1_Vector4;
            float4 _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_XZ_2_Vector4;
            float4 _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_YZ_3_Vector4;
            float4 _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_b4749c77856157858fffde0aed55fc74_Out_0_Texture2D, (_Divide_9f3f46254d5f7a8e87f60c4aa6f5522c_Out_2_Vector4).x, _Property_20f6a96f64098d87b850c83bc45ddcee_Out_0_Float, _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b, _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_XYZ_1_Vector4, _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_XZ_2_Vector4, _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_YZ_3_Vector4, _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_0b441b86fba0ea80bc060dae9d7ed0d7_R_1_Float = _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_XYZ_1_Vector4[0];
            float _Split_0b441b86fba0ea80bc060dae9d7ed0d7_G_2_Float = _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_XYZ_1_Vector4[1];
            float _Split_0b441b86fba0ea80bc060dae9d7ed0d7_B_3_Float = _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_XYZ_1_Vector4[2];
            float _Split_0b441b86fba0ea80bc060dae9d7ed0d7_A_4_Float = _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_XYZ_1_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_c1de6a6321562383bfac4b318fc7b0d3_Out_0_Float = _HeightMin2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_145222f375008a879315637be0f172c5_Out_0_Float = _HeightMax2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_416c3ee3a60cc686b2d2360a073acfad_Out_0_Vector2 = float2(_Property_c1de6a6321562383bfac4b318fc7b0d3_Out_0_Float, _Property_145222f375008a879315637be0f172c5_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_8be924d801daee88b294af592a560e75_Out_0_Float = _HeightOffset2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Add_37703f1eb9ce078daaedca833705f5dd_Out_2_Vector2;
            Unity_Add_float2(_Vector2_416c3ee3a60cc686b2d2360a073acfad_Out_0_Vector2, (_Property_8be924d801daee88b294af592a560e75_Out_0_Float.xx), _Add_37703f1eb9ce078daaedca833705f5dd_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_5a8467f2416dc98699682a4cf64a69aa_Out_3_Float;
            Unity_Remap_float(_Split_0b441b86fba0ea80bc060dae9d7ed0d7_B_3_Float, float2 (0, 1), _Add_37703f1eb9ce078daaedca833705f5dd_Out_2_Vector2, _Remap_5a8467f2416dc98699682a4cf64a69aa_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_d9f42ca072d9188ab2566400157a199f_Out_2_Float;
            Unity_Multiply_float_float(_Branch_6b7615e16629338ba87d3570a0096f66_Out_3_Float, _Remap_5a8467f2416dc98699682a4cf64a69aa_Out_3_Float, _Multiply_d9f42ca072d9188ab2566400157a199f_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_b4d08e724ec3df88ab7743c5b7a3f081_R_1_Float = IN.VertexColor[0];
            float _Split_b4d08e724ec3df88ab7743c5b7a3f081_G_2_Float = IN.VertexColor[1];
            float _Split_b4d08e724ec3df88ab7743c5b7a3f081_B_3_Float = IN.VertexColor[2];
            float _Split_b4d08e724ec3df88ab7743c5b7a3f081_A_4_Float = IN.VertexColor[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_55cb55224306dc818a87a2dbf82d5af0_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_d9f42ca072d9188ab2566400157a199f_Out_2_Float, _Split_b4d08e724ec3df88ab7743c5b7a3f081_B_3_Float, _Multiply_55cb55224306dc818a87a2dbf82d5af0_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_c0dc9341fd635288a1c2869945617704_Out_0_Float = _Height_Transition;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float _HeightBlend_d30f443b26dc0d8087616105058c020a;
            float3 _HeightBlend_d30f443b26dc0d8087616105058c020a_OutVector4_1_Vector3;
            SG_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float((_Multiply_6434c1e27d77608fb8dcec94697eb8d3_Out_2_Vector4.xyz), _Remap_ddc02d039a9d5388b8add0d2d673d4ac_Out_3_Float, (_Multiply_4d8e3ca1454e2d85963c9d240239a171_Out_2_Vector4.xyz), _Multiply_55cb55224306dc818a87a2dbf82d5af0_Out_2_Float, _Property_c0dc9341fd635288a1c2869945617704_Out_0_Float, _HeightBlend_d30f443b26dc0d8087616105058c020a, _HeightBlend_d30f443b26dc0d8087616105058c020a_OutVector4_1_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_0b7ec0ec463cd88c8269ef0d2c98eb85_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverBaseColorMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_9bedb34aba10fa89a5f5b18919971491_Out_0_Vector4 = _CoverTilingOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Divide_ddaec3b56c9fc58ca3314b828c03b1c8_Out_2_Vector4;
            Unity_Divide_float4(float4(1, 1, 0, 0), _Property_9bedb34aba10fa89a5f5b18919971491_Out_0_Vector4, _Divide_ddaec3b56c9fc58ca3314b828c03b1c8_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_bf361924f27f848994241bda91fc2005_Out_0_Float = _CoverTriplanarThreshold;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793;
            _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XYZ_1_Vector4;
            float4 _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XZ_2_Vector4;
            float4 _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_YZ_3_Vector4;
            float4 _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_0b7ec0ec463cd88c8269ef0d2c98eb85_Out_0_Texture2D, (_Divide_ddaec3b56c9fc58ca3314b828c03b1c8_Out_2_Vector4).x, _Property_bf361924f27f848994241bda91fc2005_Out_0_Float, _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793, _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XYZ_1_Vector4, _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XZ_2_Vector4, _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_YZ_3_Vector4, _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_19547f2fe562798683b730e775cbfb39_Out_0_Vector4 = _CoverBaseColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Multiply_0652b80f60f8ed84beea389318719c9a_Out_2_Vector4;
            Unity_Multiply_float4_float4(_TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XYZ_1_Vector4, _Property_19547f2fe562798683b730e775cbfb39_Out_0_Vector4, _Multiply_0652b80f60f8ed84beea389318719c9a_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_ed6385cfee8242c58d906f36e90cb607_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverBaseColorMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _UV_13d53a8c036ded8490c69d17b7a3bb72_Out_0_Vector4 = IN.uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _SampleTexture2D_b8be215db546638398ea07060feb5224_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_ed6385cfee8242c58d906f36e90cb607_Out_0_Texture2D.tex, _Property_ed6385cfee8242c58d906f36e90cb607_Out_0_Texture2D.samplerstate, _Property_ed6385cfee8242c58d906f36e90cb607_Out_0_Texture2D.GetTransformedUV((_UV_13d53a8c036ded8490c69d17b7a3bb72_Out_0_Vector4.xy)) );
            float _SampleTexture2D_b8be215db546638398ea07060feb5224_R_4_Float = _SampleTexture2D_b8be215db546638398ea07060feb5224_RGBA_0_Vector4.r;
            float _SampleTexture2D_b8be215db546638398ea07060feb5224_G_5_Float = _SampleTexture2D_b8be215db546638398ea07060feb5224_RGBA_0_Vector4.g;
            float _SampleTexture2D_b8be215db546638398ea07060feb5224_B_6_Float = _SampleTexture2D_b8be215db546638398ea07060feb5224_RGBA_0_Vector4.b;
            float _SampleTexture2D_b8be215db546638398ea07060feb5224_A_7_Float = _SampleTexture2D_b8be215db546638398ea07060feb5224_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_b3ce556358f99f80ae9037fb175f4c5f_Out_0_Float = _CoverMaskPower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_ea35dd8ed2523f8b9a4c52fc52ecff0e_Out_2_Float;
            Unity_Multiply_float_float(_SampleTexture2D_b8be215db546638398ea07060feb5224_A_7_Float, _Property_b3ce556358f99f80ae9037fb175f4c5f_Out_0_Float, _Multiply_ea35dd8ed2523f8b9a4c52fc52ecff0e_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_7c0c867aaa1f5b8683768528b130a408_Out_3_Float;
            Unity_Clamp_float(_Multiply_ea35dd8ed2523f8b9a4c52fc52ecff0e_Out_2_Float, float(0), float(1), _Clamp_7c0c867aaa1f5b8683768528b130a408_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Property_509761afcb3aad8f9a29405c122dbf08_Out_0_Vector3 = _CoverDirection;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_72c615246e955087b85288c29905f048_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseNormalMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNMn_059da9746584140498cd018db3c76047_float _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0;
            _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0.WorldSpaceTangent = IN.WorldSpaceTangent;
            _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0.WorldSpacePosition = IN.WorldSpacePosition;
            float4 _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XYZ_1_Vector4;
            float4 _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XZ_2_Vector4;
            float4 _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_YZ_3_Vector4;
            float4 _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XY_4_Vector4;
            SG_TriplanarNMn_059da9746584140498cd018db3c76047_float(_Property_72c615246e955087b85288c29905f048_Out_0_Texture2D, (_Divide_c703c79d4bf76e8c9848ea2ecd29211f_Out_2_Vector4).x, _Property_b168be530d5b4082a2816fc835b55e19_Out_0_Float, _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0, _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XYZ_1_Vector4, _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XZ_2_Vector4, _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_YZ_3_Vector4, _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_7edd97bda70eb38a8c4253094700be37_Out_0_Float = _BaseNormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _NormalStrength_8bafa3d69de37c818a39fccf03db9518_Out_2_Vector3;
            Unity_NormalStrength_float((_TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XYZ_1_Vector4.xyz), _Property_7edd97bda70eb38a8c4253094700be37_Out_0_Float, _NormalStrength_8bafa3d69de37c818a39fccf03db9518_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_6809577d1aa24984aa957e13d0574602_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_Base2NormalMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNMn_059da9746584140498cd018db3c76047_float _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc;
            _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc.WorldSpaceTangent = IN.WorldSpaceTangent;
            _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc.WorldSpacePosition = IN.WorldSpacePosition;
            float4 _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc_XYZ_1_Vector4;
            float4 _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc_XZ_2_Vector4;
            float4 _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc_YZ_3_Vector4;
            float4 _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc_XY_4_Vector4;
            SG_TriplanarNMn_059da9746584140498cd018db3c76047_float(_Property_6809577d1aa24984aa957e13d0574602_Out_0_Texture2D, (_Divide_9f3f46254d5f7a8e87f60c4aa6f5522c_Out_2_Vector4).x, _Property_20f6a96f64098d87b850c83bc45ddcee_Out_0_Float, _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc, _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc_XYZ_1_Vector4, _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc_XZ_2_Vector4, _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc_YZ_3_Vector4, _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_c3260886a9a91b82a3d14c25e6fd0d2c_Out_0_Float = _Base2NormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _NormalStrength_d049a259d0377180a2e5959b925a78bc_Out_2_Vector3;
            Unity_NormalStrength_float((_TriplanarNMn_8890d23c68a4598d85a048422a8f36fc_XYZ_1_Vector4.xyz), _Property_c3260886a9a91b82a3d14c25e6fd0d2c_Out_0_Float, _NormalStrength_d049a259d0377180a2e5959b925a78bc_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float _HeightBlend_a6bf16c3496e828984e7277239132d42;
            float3 _HeightBlend_a6bf16c3496e828984e7277239132d42_OutVector4_1_Vector3;
            SG_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float(_NormalStrength_8bafa3d69de37c818a39fccf03db9518_Out_2_Vector3, _Remap_ddc02d039a9d5388b8add0d2d673d4ac_Out_3_Float, _NormalStrength_d049a259d0377180a2e5959b925a78bc_Out_2_Vector3, _Multiply_55cb55224306dc818a87a2dbf82d5af0_Out_2_Float, _Property_c0dc9341fd635288a1c2869945617704_Out_0_Float, _HeightBlend_a6bf16c3496e828984e7277239132d42, _HeightBlend_a6bf16c3496e828984e7277239132d42_OutVector4_1_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_1dcbde2a42b87e81bb254fd87a4816a5_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverNormalMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNMn_059da9746584140498cd018db3c76047_float _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58;
            _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58.WorldSpaceTangent = IN.WorldSpaceTangent;
            _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58.WorldSpacePosition = IN.WorldSpacePosition;
            float4 _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XYZ_1_Vector4;
            float4 _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XZ_2_Vector4;
            float4 _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_YZ_3_Vector4;
            float4 _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XY_4_Vector4;
            SG_TriplanarNMn_059da9746584140498cd018db3c76047_float(_Property_1dcbde2a42b87e81bb254fd87a4816a5_Out_0_Texture2D, (_Divide_ddaec3b56c9fc58ca3314b828c03b1c8_Out_2_Vector4).x, _Property_bf361924f27f848994241bda91fc2005_Out_0_Float, _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58, _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XYZ_1_Vector4, _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XZ_2_Vector4, _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_YZ_3_Vector4, _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_9176e0d3ea9ff88a9b888a200800b92d_Out_0_Float = _CoverNormalBlendHardness;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _NormalStrength_51679ed1e0a0ef8aa01b53b035a4da51_Out_2_Vector3;
            Unity_NormalStrength_float((_TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XYZ_1_Vector4.xyz), _Property_9176e0d3ea9ff88a9b888a200800b92d_Out_0_Float, _NormalStrength_51679ed1e0a0ef8aa01b53b035a4da51_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Multiply_ea6008eef104198ca40a18608c76d5a4_Out_2_Vector3;
            Unity_Multiply_float3_float3(_Property_509761afcb3aad8f9a29405c122dbf08_Out_0_Vector3, IN.WorldSpaceNormal, _Multiply_ea6008eef104198ca40a18608c76d5a4_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_e74c8f300b486e86a5700118b60b7885_R_1_Float = _Multiply_ea6008eef104198ca40a18608c76d5a4_Out_2_Vector3[0];
            float _Split_e74c8f300b486e86a5700118b60b7885_G_2_Float = _Multiply_ea6008eef104198ca40a18608c76d5a4_Out_2_Vector3[1];
            float _Split_e74c8f300b486e86a5700118b60b7885_B_3_Float = _Multiply_ea6008eef104198ca40a18608c76d5a4_Out_2_Vector3[2];
            float _Split_e74c8f300b486e86a5700118b60b7885_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_57be4f2ffc62ef89a9b736e6f1a99790_Out_2_Float;
            Unity_Add_float(_Split_e74c8f300b486e86a5700118b60b7885_R_1_Float, _Split_e74c8f300b486e86a5700118b60b7885_G_2_Float, _Add_57be4f2ffc62ef89a9b736e6f1a99790_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_abe82f22f31b958eaf9f12f8db5f150d_Out_2_Float;
            Unity_Add_float(_Add_57be4f2ffc62ef89a9b736e6f1a99790_Out_2_Float, _Split_e74c8f300b486e86a5700118b60b7885_B_3_Float, _Add_abe82f22f31b958eaf9f12f8db5f150d_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_ca7cc2d889a56683904c7546a72cedbf_Out_0_Float = _Cover_Amount;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_398a4ebc3d0302828e04c782fb4f49be_Out_0_Float = _Cover_Amount_Grow_Speed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Subtract_9340fe9ac4518a8aa343888dc6143619_Out_2_Float;
            Unity_Subtract_float(float(4), _Property_398a4ebc3d0302828e04c782fb4f49be_Out_0_Float, _Subtract_9340fe9ac4518a8aa343888dc6143619_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_58b01578ab8c8b858bb5e3a720366e16_Out_2_Float;
            Unity_Divide_float(_Property_ca7cc2d889a56683904c7546a72cedbf_Out_0_Float, _Subtract_9340fe9ac4518a8aa343888dc6143619_Out_2_Float, _Divide_58b01578ab8c8b858bb5e3a720366e16_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Absolute_a4d057707c029a85947bcf9de8128ee5_Out_1_Float;
            Unity_Absolute_float(_Divide_58b01578ab8c8b858bb5e3a720366e16_Out_2_Float, _Absolute_a4d057707c029a85947bcf9de8128ee5_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Power_681b2745dbae62839624b98240ca04f7_Out_2_Float;
            Unity_Power_float(_Absolute_a4d057707c029a85947bcf9de8128ee5_Out_1_Float, _Subtract_9340fe9ac4518a8aa343888dc6143619_Out_2_Float, _Power_681b2745dbae62839624b98240ca04f7_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_7340c193c2d92c81ba9dd931235ba17f_Out_3_Float;
            Unity_Clamp_float(_Power_681b2745dbae62839624b98240ca04f7_Out_2_Float, float(0), float(2), _Clamp_7340c193c2d92c81ba9dd931235ba17f_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_7632a3e8aed6d38e88c7f4b8e72f85dc_Out_2_Float;
            Unity_Multiply_float_float(_Add_abe82f22f31b958eaf9f12f8db5f150d_Out_2_Float, _Clamp_7340c193c2d92c81ba9dd931235ba17f_Out_3_Float, _Multiply_7632a3e8aed6d38e88c7f4b8e72f85dc_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Saturate_0541c8e45c0d1e84acab0ae3a59218fa_Out_1_Float;
            Unity_Saturate_float(_Multiply_7632a3e8aed6d38e88c7f4b8e72f85dc_Out_2_Float, _Saturate_0541c8e45c0d1e84acab0ae3a59218fa_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_3b62dfdf4a729d8a9b33398bfdcff203_Out_3_Float;
            Unity_Clamp_float(_Add_abe82f22f31b958eaf9f12f8db5f150d_Out_2_Float, float(0), float(0.9999), _Clamp_3b62dfdf4a729d8a9b33398bfdcff203_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_2df9fd6ca8ecaa828f0edb7582ef5616_Out_0_Float = _Cover_Max_Angle;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_1e9d5df33719338ca266a822ae3e1c73_Out_2_Float;
            Unity_Divide_float(_Property_2df9fd6ca8ecaa828f0edb7582ef5616_Out_0_Float, float(45), _Divide_1e9d5df33719338ca266a822ae3e1c73_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_2d91255cf28d138db7f5edc0eed1ea86_Out_1_Float;
            Unity_OneMinus_float(_Divide_1e9d5df33719338ca266a822ae3e1c73_Out_2_Float, _OneMinus_2d91255cf28d138db7f5edc0eed1ea86_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Subtract_2ae31a316a35bf8882b8de8d71b44b9f_Out_2_Float;
            Unity_Subtract_float(_Clamp_3b62dfdf4a729d8a9b33398bfdcff203_Out_3_Float, _OneMinus_2d91255cf28d138db7f5edc0eed1ea86_Out_1_Float, _Subtract_2ae31a316a35bf8882b8de8d71b44b9f_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_a3af3696fa69dc8cb04a65e84a3c6c98_Out_3_Float;
            Unity_Clamp_float(_Subtract_2ae31a316a35bf8882b8de8d71b44b9f_Out_2_Float, float(0), float(2), _Clamp_a3af3696fa69dc8cb04a65e84a3c6c98_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_467a4be5b52daa80b2d4bf46d2f429c9_Out_2_Float;
            Unity_Divide_float(float(1), _Divide_1e9d5df33719338ca266a822ae3e1c73_Out_2_Float, _Divide_467a4be5b52daa80b2d4bf46d2f429c9_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_749d76436ed5e58abec68ae130db866b_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_a3af3696fa69dc8cb04a65e84a3c6c98_Out_3_Float, _Divide_467a4be5b52daa80b2d4bf46d2f429c9_Out_2_Float, _Multiply_749d76436ed5e58abec68ae130db866b_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Absolute_043a189b52847189ad0575955b41f403_Out_1_Float;
            Unity_Absolute_float(_Multiply_749d76436ed5e58abec68ae130db866b_Out_2_Float, _Absolute_043a189b52847189ad0575955b41f403_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_d4f4330ee4eced8d88fb074732401835_Out_0_Float = _CoverHardness;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Power_39a2971fc28ddc8e9f6d1423e692613d_Out_2_Float;
            Unity_Power_float(_Absolute_043a189b52847189ad0575955b41f403_Out_1_Float, _Property_d4f4330ee4eced8d88fb074732401835_Out_0_Float, _Power_39a2971fc28ddc8e9f6d1423e692613d_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_ecc3c7fdca2e938aa029cd0ff4fb9db6_Out_0_Float = _Cover_Min_Height;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_6fb68ea250dfc28b97bc87b4872d90b2_Out_1_Float;
            Unity_OneMinus_float(_Property_ecc3c7fdca2e938aa029cd0ff4fb9db6_Out_0_Float, _OneMinus_6fb68ea250dfc28b97bc87b4872d90b2_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_815418660959f184b10470e678ebae30_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
            float _Split_815418660959f184b10470e678ebae30_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
            float _Split_815418660959f184b10470e678ebae30_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
            float _Split_815418660959f184b10470e678ebae30_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_9c527d082534a687b4f0de2b26f2d04d_Out_2_Float;
            Unity_Add_float(_OneMinus_6fb68ea250dfc28b97bc87b4872d90b2_Out_1_Float, _Split_815418660959f184b10470e678ebae30_G_2_Float, _Add_9c527d082534a687b4f0de2b26f2d04d_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_9e2bffcd3cb38a83b04f8e67c5c96a06_Out_2_Float;
            Unity_Add_float(_Add_9c527d082534a687b4f0de2b26f2d04d_Out_2_Float, float(1), _Add_9e2bffcd3cb38a83b04f8e67c5c96a06_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_0d06020cc00e3887b95a3ebd8edd196f_Out_3_Float;
            Unity_Clamp_float(_Add_9e2bffcd3cb38a83b04f8e67c5c96a06_Out_2_Float, float(0), float(1), _Clamp_0d06020cc00e3887b95a3ebd8edd196f_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_6ec32fc8c4434e8b84cf41dd6b52dd34_Out_0_Float = _Cover_Min_Height_Blending;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_e57f70c02382b28397642f05af76cfb0_Out_2_Float;
            Unity_Add_float(_Add_9c527d082534a687b4f0de2b26f2d04d_Out_2_Float, _Property_6ec32fc8c4434e8b84cf41dd6b52dd34_Out_0_Float, _Add_e57f70c02382b28397642f05af76cfb0_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_94bc0a8d86daee888d2cd450fbf0d53e_Out_2_Float;
            Unity_Divide_float(_Add_e57f70c02382b28397642f05af76cfb0_Out_2_Float, _Add_9c527d082534a687b4f0de2b26f2d04d_Out_2_Float, _Divide_94bc0a8d86daee888d2cd450fbf0d53e_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_5447f70dbea44185b79c1ac1bb5ea4fa_Out_1_Float;
            Unity_OneMinus_float(_Divide_94bc0a8d86daee888d2cd450fbf0d53e_Out_2_Float, _OneMinus_5447f70dbea44185b79c1ac1bb5ea4fa_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_de674a5c5a1a348688c87f45d79cf9a1_Out_2_Float;
            Unity_Add_float(_OneMinus_5447f70dbea44185b79c1ac1bb5ea4fa_Out_1_Float, float(-0.5), _Add_de674a5c5a1a348688c87f45d79cf9a1_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_3244d6500fdd2c8a92b20a9929d61642_Out_3_Float;
            Unity_Clamp_float(_Add_de674a5c5a1a348688c87f45d79cf9a1_Out_2_Float, float(0), float(1), _Clamp_3244d6500fdd2c8a92b20a9929d61642_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_ea368e3c8a99368d917c930eb07b8e9f_Out_2_Float;
            Unity_Add_float(_Clamp_0d06020cc00e3887b95a3ebd8edd196f_Out_3_Float, _Clamp_3244d6500fdd2c8a92b20a9929d61642_Out_3_Float, _Add_ea368e3c8a99368d917c930eb07b8e9f_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_ce483c505aaa1f83b698a43bb22bf259_Out_3_Float;
            Unity_Clamp_float(_Add_ea368e3c8a99368d917c930eb07b8e9f_Out_2_Float, float(0), float(1), _Clamp_ce483c505aaa1f83b698a43bb22bf259_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_d1b58293be2e9982898e4a432bd61149_Out_2_Float;
            Unity_Multiply_float_float(_Power_39a2971fc28ddc8e9f6d1423e692613d_Out_2_Float, _Clamp_ce483c505aaa1f83b698a43bb22bf259_Out_3_Float, _Multiply_d1b58293be2e9982898e4a432bd61149_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_5336a32115eb29849650688fd99ee185_Out_2_Float;
            Unity_Multiply_float_float(_Saturate_0541c8e45c0d1e84acab0ae3a59218fa_Out_1_Float, _Multiply_d1b58293be2e9982898e4a432bd61149_Out_2_Float, _Multiply_5336a32115eb29849650688fd99ee185_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Lerp_f5ea06dcb1a8c58bac1ae497649cf333_Out_3_Vector3;
            Unity_Lerp_float3(_HeightBlend_a6bf16c3496e828984e7277239132d42_OutVector4_1_Vector3, _NormalStrength_51679ed1e0a0ef8aa01b53b035a4da51_Out_2_Vector3, (_Multiply_5336a32115eb29849650688fd99ee185_Out_2_Float.xxx), _Lerp_f5ea06dcb1a8c58bac1ae497649cf333_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Transform_9ae402175cd2148a9da0916d2d189ef9_Out_1_Vector3;
            {
                float3x3 tangentTransform = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
                _Transform_9ae402175cd2148a9da0916d2d189ef9_Out_1_Vector3 = TransformTangentToWorldDir(_Lerp_f5ea06dcb1a8c58bac1ae497649cf333_Out_3_Vector3.xyz, tangentTransform, true).xyz;
            }
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Multiply_d902e15376a26b8eac35506e85f63b36_Out_2_Vector3;
            Unity_Multiply_float3_float3(_Property_509761afcb3aad8f9a29405c122dbf08_Out_0_Vector3, _Transform_9ae402175cd2148a9da0916d2d189ef9_Out_1_Vector3, _Multiply_d902e15376a26b8eac35506e85f63b36_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_b821124768adb688becbc5d63b26adb4_R_1_Float = _Multiply_d902e15376a26b8eac35506e85f63b36_Out_2_Vector3[0];
            float _Split_b821124768adb688becbc5d63b26adb4_G_2_Float = _Multiply_d902e15376a26b8eac35506e85f63b36_Out_2_Vector3[1];
            float _Split_b821124768adb688becbc5d63b26adb4_B_3_Float = _Multiply_d902e15376a26b8eac35506e85f63b36_Out_2_Vector3[2];
            float _Split_b821124768adb688becbc5d63b26adb4_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_fd43b427bfe3748cb0ced35df3b22159_Out_2_Float;
            Unity_Add_float(_Split_b821124768adb688becbc5d63b26adb4_R_1_Float, _Split_b821124768adb688becbc5d63b26adb4_G_2_Float, _Add_fd43b427bfe3748cb0ced35df3b22159_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_508b788633abc0829f0843d1b1f942c2_Out_2_Float;
            Unity_Add_float(_Add_fd43b427bfe3748cb0ced35df3b22159_Out_2_Float, _Split_b821124768adb688becbc5d63b26adb4_B_3_Float, _Add_508b788633abc0829f0843d1b1f942c2_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_ad921fb726e47688a4d134f6fb3c2273_Out_2_Float;
            Unity_Multiply_float_float(_Add_508b788633abc0829f0843d1b1f942c2_Out_2_Float, _Clamp_7340c193c2d92c81ba9dd931235ba17f_Out_3_Float, _Multiply_ad921fb726e47688a4d134f6fb3c2273_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_90d91831d95dfc83b55e42e5746bd269_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_7340c193c2d92c81ba9dd931235ba17f_Out_3_Float, _Property_d4f4330ee4eced8d88fb074732401835_Out_0_Float, _Multiply_90d91831d95dfc83b55e42e5746bd269_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_b907f38702eabd80a6c67777243459de_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_90d91831d95dfc83b55e42e5746bd269_Out_2_Float, _Multiply_d1b58293be2e9982898e4a432bd61149_Out_2_Float, _Multiply_b907f38702eabd80a6c67777243459de_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_81bdd2734ef6c68fbc23ffe7409191b9_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_ad921fb726e47688a4d134f6fb3c2273_Out_2_Float, _Multiply_b907f38702eabd80a6c67777243459de_Out_2_Float, _Multiply_81bdd2734ef6c68fbc23ffe7409191b9_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_a0e97293ba0dfb83a0d87d28ef311bc7_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverMaskMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_9b6d5da081e434808a5840cbd915bb28;
            _TriplanarNM_9b6d5da081e434808a5840cbd915bb28.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_9b6d5da081e434808a5840cbd915bb28.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XYZ_1_Vector4;
            float4 _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XZ_2_Vector4;
            float4 _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_YZ_3_Vector4;
            float4 _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_a0e97293ba0dfb83a0d87d28ef311bc7_Out_0_Texture2D, (_Divide_ddaec3b56c9fc58ca3314b828c03b1c8_Out_2_Vector4).x, _Property_bf361924f27f848994241bda91fc2005_Out_0_Float, _TriplanarNM_9b6d5da081e434808a5840cbd915bb28, _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XYZ_1_Vector4, _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XZ_2_Vector4, _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_YZ_3_Vector4, _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_b20618c84cffd183aae7f27c2d0772cb_R_1_Float = _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XYZ_1_Vector4[0];
            float _Split_b20618c84cffd183aae7f27c2d0772cb_G_2_Float = _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XYZ_1_Vector4[1];
            float _Split_b20618c84cffd183aae7f27c2d0772cb_B_3_Float = _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XYZ_1_Vector4[2];
            float _Split_b20618c84cffd183aae7f27c2d0772cb_A_4_Float = _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XYZ_1_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_987a8037965fff81a4930627358fc6e3_Out_0_Float = _CoverHeightMapMin;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_89aeacdce0000086a98e45df79358a56_Out_0_Float = _CoverHeightMapMax;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_d18b9686bb8af48c85d99d319830c000_Out_0_Vector2 = float2(_Property_987a8037965fff81a4930627358fc6e3_Out_0_Float, _Property_89aeacdce0000086a98e45df79358a56_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_856fd4da5f3d1b8c9bdd6966daada2b2_Out_0_Float = _CoverHeightMapOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Add_935266d0fc26dc87a5909ea1bd8aa423_Out_2_Vector2;
            Unity_Add_float2(_Vector2_d18b9686bb8af48c85d99d319830c000_Out_0_Vector2, (_Property_856fd4da5f3d1b8c9bdd6966daada2b2_Out_0_Float.xx), _Add_935266d0fc26dc87a5909ea1bd8aa423_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_f85aa52613b0108d876fab409ea80b8c_Out_3_Float;
            Unity_Remap_float(_Split_b20618c84cffd183aae7f27c2d0772cb_B_3_Float, float2 (0, 1), _Add_935266d0fc26dc87a5909ea1bd8aa423_Out_2_Vector2, _Remap_f85aa52613b0108d876fab409ea80b8c_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_65b9c8cf3a459284a298aa84443140a2_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_81bdd2734ef6c68fbc23ffe7409191b9_Out_2_Float, _Remap_f85aa52613b0108d876fab409ea80b8c_Out_3_Float, _Multiply_65b9c8cf3a459284a298aa84443140a2_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_100e6799ca65308ca7cca7a0e52252db_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_65b9c8cf3a459284a298aa84443140a2_Out_2_Float, _Split_b4d08e724ec3df88ab7743c5b7a3f081_G_2_Float, _Multiply_100e6799ca65308ca7cca7a0e52252db_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Saturate_a340e45e54317a81ae145a84c72daa75_Out_1_Float;
            Unity_Saturate_float(_Multiply_100e6799ca65308ca7cca7a0e52252db_Out_2_Float, _Saturate_a340e45e54317a81ae145a84c72daa75_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_d8ca79d07c3bbe85b09000ed0e769324_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_7c0c867aaa1f5b8683768528b130a408_Out_3_Float, _Saturate_a340e45e54317a81ae145a84c72daa75_Out_1_Float, _Multiply_d8ca79d07c3bbe85b09000ed0e769324_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            #if defined(_USEDYNAMICCOVERTSTATICMASKF_ON)
            float _UseDynamicCoverTStaticMaskF_a32a3630501f778faf03be9cfccfec64_Out_0_Float = _Multiply_d8ca79d07c3bbe85b09000ed0e769324_Out_2_Float;
            #else
            float _UseDynamicCoverTStaticMaskF_a32a3630501f778faf03be9cfccfec64_Out_0_Float = _Clamp_7c0c867aaa1f5b8683768528b130a408_Out_3_Float;
            #endif
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Lerp_7b425abcb4dfd0859d63f71a714fbb7d_Out_3_Vector3;
            Unity_Lerp_float3(_HeightBlend_d30f443b26dc0d8087616105058c020a_OutVector4_1_Vector3, (_Multiply_0652b80f60f8ed84beea389318719c9a_Out_2_Vector4.xyz), (_UseDynamicCoverTStaticMaskF_a32a3630501f778faf03be9cfccfec64_Out_0_Float.xxx), _Lerp_7b425abcb4dfd0859d63f71a714fbb7d_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_2ff5681ef4527d809ef09fdc5f8ef937_Out_0_Vector4 = _WetColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Multiply_85d9904c4b12ce85939f7948252c76b2_Out_2_Vector3;
            Unity_Multiply_float3_float3((_Property_2ff5681ef4527d809ef09fdc5f8ef937_Out_0_Vector4.xyz), _Lerp_7b425abcb4dfd0859d63f71a714fbb7d_Out_3_Vector3, _Multiply_85d9904c4b12ce85939f7948252c76b2_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_f1784d825dacdb8785770d3eca446428_Out_1_Float;
            Unity_OneMinus_float(_Split_b4d08e724ec3df88ab7743c5b7a3f081_R_1_Float, _OneMinus_f1784d825dacdb8785770d3eca446428_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Lerp_f330c9b8f318a885ac2822e63f9269e8_Out_3_Vector3;
            Unity_Lerp_float3(_Lerp_7b425abcb4dfd0859d63f71a714fbb7d_Out_3_Vector3, _Multiply_85d9904c4b12ce85939f7948252c76b2_Out_2_Vector3, (_OneMinus_f1784d825dacdb8785770d3eca446428_Out_1_Float.xxx), _Lerp_f330c9b8f318a885ac2822e63f9269e8_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_0709d20641a7668b85ded82df467d4f4_Out_0_Float = _CoverNormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _NormalStrength_d90a27c667bbb48e9e15ec520c3e2ff3_Out_2_Vector3;
            Unity_NormalStrength_float((_TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XYZ_1_Vector4.xyz), _Property_0709d20641a7668b85ded82df467d4f4_Out_0_Float, _NormalStrength_d90a27c667bbb48e9e15ec520c3e2ff3_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Lerp_1ef9d67a29ba1b85a5434194628b76ad_Out_3_Vector3;
            Unity_Lerp_float3(_HeightBlend_a6bf16c3496e828984e7277239132d42_OutVector4_1_Vector3, _NormalStrength_d90a27c667bbb48e9e15ec520c3e2ff3_Out_2_Vector3, (_UseDynamicCoverTStaticMaskF_a32a3630501f778faf03be9cfccfec64_Out_0_Float.xxx), _Lerp_1ef9d67a29ba1b85a5434194628b76ad_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_57dab79b7e7fc28c99642ba557430a27_Out_0_Float = _BaseMetallic;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_aa5299d5bb4d2080af3ab6b593e1aa2c_Out_2_Float;
            Unity_Multiply_float_float(_Split_866a663ed067f988862843fe32765ff8_R_1_Float, _Property_57dab79b7e7fc28c99642ba557430a27_Out_0_Float, _Multiply_aa5299d5bb4d2080af3ab6b593e1aa2c_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_27a0c97d2207ca89af0ef30bd5d6c062_Out_0_Float = _BaseAORemapMin;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_5a040fb62cd8888895d4f920c4036587_Out_0_Float = _BaseAORemapMax;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_6f9956f2c0302f8382a2f5c741da0609_Out_0_Vector2 = float2(_Property_27a0c97d2207ca89af0ef30bd5d6c062_Out_0_Float, _Property_5a040fb62cd8888895d4f920c4036587_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_de2674403349aa85b1136d42692d26f9_Out_3_Float;
            Unity_Remap_float(_Split_866a663ed067f988862843fe32765ff8_G_2_Float, float2 (0, 1), _Vector2_6f9956f2c0302f8382a2f5c741da0609_Out_0_Vector2, _Remap_de2674403349aa85b1136d42692d26f9_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_a1b1d767544de781a39d6415872f7285_Out_0_Float = _BaseSmoothnessRemapMin;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_a0fd73b9dac07285b1d70b54ca659a15_Out_0_Float = _BaseSmoothnessRemapMax;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_fc66e35bdc72f589a802edd7bfb7555b_Out_0_Vector2 = float2(_Property_a1b1d767544de781a39d6415872f7285_Out_0_Float, _Property_a0fd73b9dac07285b1d70b54ca659a15_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_0c05c4433df8c8898decaf8c2ca17cb2_Out_3_Float;
            Unity_Remap_float(_Split_866a663ed067f988862843fe32765ff8_A_4_Float, float2 (0, 1), _Vector2_fc66e35bdc72f589a802edd7bfb7555b_Out_0_Vector2, _Remap_0c05c4433df8c8898decaf8c2ca17cb2_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Vector3_4c4100faab122d8da757a32364182844_Out_0_Vector3 = float3(_Multiply_aa5299d5bb4d2080af3ab6b593e1aa2c_Out_2_Float, _Remap_de2674403349aa85b1136d42692d26f9_Out_3_Float, _Remap_0c05c4433df8c8898decaf8c2ca17cb2_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_7cdf7bda907cf087942cd072e635a869_Out_0_Float = _Base2Metallic;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_befa03f2838946858f28ac63a284b0f8_Out_2_Float;
            Unity_Multiply_float_float(_Split_0b441b86fba0ea80bc060dae9d7ed0d7_R_1_Float, _Property_7cdf7bda907cf087942cd072e635a869_Out_0_Float, _Multiply_befa03f2838946858f28ac63a284b0f8_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_b334f6ce40e54186b9864b004fbe88d2_Out_0_Float = _Base2AORemapMin;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_0ee0b6f693d6ed8c830707e558e38b7b_Out_0_Float = _Base2AORemapMax;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_ec982e7ec425d587a82289de9dcba701_Out_0_Vector2 = float2(_Property_b334f6ce40e54186b9864b004fbe88d2_Out_0_Float, _Property_0ee0b6f693d6ed8c830707e558e38b7b_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_e36fdc5121ad638e8112d325bff9b6c2_Out_3_Float;
            Unity_Remap_float(_Split_0b441b86fba0ea80bc060dae9d7ed0d7_G_2_Float, float2 (0, 1), _Vector2_ec982e7ec425d587a82289de9dcba701_Out_0_Vector2, _Remap_e36fdc5121ad638e8112d325bff9b6c2_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_a9807e270c8ae68db2a00b23b4aceb82_Out_0_Float = _Base2SmoothnessRemapMin;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_0106a1baaa017b8d93c6d416dda17e61_Out_0_Float = _Base2SmoothnessRemapMax;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_92da7adc0ff49f8cba8bafca74304dbd_Out_0_Vector2 = float2(_Property_a9807e270c8ae68db2a00b23b4aceb82_Out_0_Float, _Property_0106a1baaa017b8d93c6d416dda17e61_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_697b96439d3a0983800a051b2b4edd90_Out_3_Float;
            Unity_Remap_float(_Split_0b441b86fba0ea80bc060dae9d7ed0d7_A_4_Float, float2 (0, 1), _Vector2_92da7adc0ff49f8cba8bafca74304dbd_Out_0_Vector2, _Remap_697b96439d3a0983800a051b2b4edd90_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Vector3_d5775a771fd8c48e8c9af11a4af046aa_Out_0_Vector3 = float3(_Multiply_befa03f2838946858f28ac63a284b0f8_Out_2_Float, _Remap_e36fdc5121ad638e8112d325bff9b6c2_Out_3_Float, _Remap_697b96439d3a0983800a051b2b4edd90_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float _HeightBlend_05358f196f0ec3849124c9bfd64e3003;
            float3 _HeightBlend_05358f196f0ec3849124c9bfd64e3003_OutVector4_1_Vector3;
            SG_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float(_Vector3_4c4100faab122d8da757a32364182844_Out_0_Vector3, _Remap_ddc02d039a9d5388b8add0d2d673d4ac_Out_3_Float, _Vector3_d5775a771fd8c48e8c9af11a4af046aa_Out_0_Vector3, _Multiply_55cb55224306dc818a87a2dbf82d5af0_Out_2_Float, _Property_c0dc9341fd635288a1c2869945617704_Out_0_Float, _HeightBlend_05358f196f0ec3849124c9bfd64e3003, _HeightBlend_05358f196f0ec3849124c9bfd64e3003_OutVector4_1_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_7cf1f37cb0f052868aefa9c1514a9a20_Out_0_Float = _CoverMetallic;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_daff314f0b716c86b0dec03fe9225b8b_Out_2_Float;
            Unity_Multiply_float_float(_Split_b20618c84cffd183aae7f27c2d0772cb_R_1_Float, _Property_7cf1f37cb0f052868aefa9c1514a9a20_Out_0_Float, _Multiply_daff314f0b716c86b0dec03fe9225b8b_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_e52744d22eaee787aba665b5a103092d_Out_0_Float = _CoverAORemapMin;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_f5216b23a41a0b888854c3e04c30f9fb_Out_0_Float = _CoverAORemapMax;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_2d4e0b2bd57a668bb5e1d3f75180a968_Out_0_Vector2 = float2(_Property_e52744d22eaee787aba665b5a103092d_Out_0_Float, _Property_f5216b23a41a0b888854c3e04c30f9fb_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_d545ba99e5a8678cbf5b23383fafd8fb_Out_3_Float;
            Unity_Remap_float(_Split_b20618c84cffd183aae7f27c2d0772cb_G_2_Float, float2 (0, 1), _Vector2_2d4e0b2bd57a668bb5e1d3f75180a968_Out_0_Vector2, _Remap_d545ba99e5a8678cbf5b23383fafd8fb_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_007771e9e06cc78b9844d01f8129c541_Out_0_Float = _CoverSmoothnessRemapMin;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_ce1117115fad1e85bdf2bbb84bd185cb_Out_0_Float = _CoverSmoothnessRemapMax;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_6ed3170e6a5acd8a8f702cd7a2af7737_Out_0_Vector2 = float2(_Property_007771e9e06cc78b9844d01f8129c541_Out_0_Float, _Property_ce1117115fad1e85bdf2bbb84bd185cb_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_690ea2a75496a283a66513f691c4f9db_Out_3_Float;
            Unity_Remap_float(_Split_b20618c84cffd183aae7f27c2d0772cb_A_4_Float, float2 (0, 1), _Vector2_6ed3170e6a5acd8a8f702cd7a2af7737_Out_0_Vector2, _Remap_690ea2a75496a283a66513f691c4f9db_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Vector3_88cb732fef09b78495ad84577275ab8b_Out_0_Vector3 = float3(_Multiply_daff314f0b716c86b0dec03fe9225b8b_Out_2_Float, _Remap_d545ba99e5a8678cbf5b23383fafd8fb_Out_3_Float, _Remap_690ea2a75496a283a66513f691c4f9db_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Lerp_5d687668f4856180be26ec62834c6113_Out_3_Vector3;
            Unity_Lerp_float3(_HeightBlend_05358f196f0ec3849124c9bfd64e3003_OutVector4_1_Vector3, _Vector3_88cb732fef09b78495ad84577275ab8b_Out_0_Vector3, (_UseDynamicCoverTStaticMaskF_a32a3630501f778faf03be9cfccfec64_Out_0_Float.xxx), _Lerp_5d687668f4856180be26ec62834c6113_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_22fc6cf606e48f8fa771c4e8cab49553_R_1_Float = _Lerp_5d687668f4856180be26ec62834c6113_Out_3_Vector3[0];
            float _Split_22fc6cf606e48f8fa771c4e8cab49553_G_2_Float = _Lerp_5d687668f4856180be26ec62834c6113_Out_3_Vector3[1];
            float _Split_22fc6cf606e48f8fa771c4e8cab49553_B_3_Float = _Lerp_5d687668f4856180be26ec62834c6113_Out_3_Vector3[2];
            float _Split_22fc6cf606e48f8fa771c4e8cab49553_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_e82022180c38e18e958213dc27e38977_Out_0_Float = _WetSmoothness;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Lerp_2247e6fe06a85b8098ccf90406a20ab1_Out_3_Float;
            Unity_Lerp_float(_Split_22fc6cf606e48f8fa771c4e8cab49553_B_3_Float, _Property_e82022180c38e18e958213dc27e38977_Out_0_Float, _OneMinus_f1784d825dacdb8785770d3eca446428_Out_1_Float, _Lerp_2247e6fe06a85b8098ccf90406a20ab1_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_2f38c4b6e08da48093bd9896985f29eb_R_1_Float = _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4[0];
            float _Split_2f38c4b6e08da48093bd9896985f29eb_G_2_Float = _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4[1];
            float _Split_2f38c4b6e08da48093bd9896985f29eb_B_3_Float = _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4[2];
            float _Split_2f38c4b6e08da48093bd9896985f29eb_A_4_Float = _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_a55cb5b55044058c90b91c360cd49672_Out_0_Float = _AlphaCutoff;
            #endif
            surface.BaseColor = _Lerp_f330c9b8f318a885ac2822e63f9269e8_Out_3_Vector3;
            surface.NormalTS = _Lerp_1ef9d67a29ba1b85a5434194628b76ad_Out_3_Vector3;
            surface.Emission = float3(0, 0, 0);
            surface.Metallic = _Split_22fc6cf606e48f8fa771c4e8cab49553_R_1_Float;
            surface.Specular = IsGammaSpace() ? float3(0.5, 0.5, 0.5) : SRGBToLinear(float3(0.5, 0.5, 0.5));
            surface.Smoothness = _Lerp_2247e6fe06a85b8098ccf90406a20ab1_Out_3_Float;
            surface.Occlusion = _Split_22fc6cf606e48f8fa771c4e8cab49553_G_2_Float;
            surface.Alpha = _Split_2f38c4b6e08da48093bd9896985f29eb_A_4_Float;
            surface.AlphaClipThreshold = _Property_a55cb5b55044058c90b91c360cd49672_Out_0_Float;
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
             float3 AbsoluteWorldSpacePosition;
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
             float3 positionWS : INTERP0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 normalWS : INTERP1;
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
        float4 _BaseTilingOffset;
        float _BaseTriplanarThreshold;
        float4 _BaseNormalMap_TexelSize;
        float _BaseNormalScale;
        float4 _BaseMaskMap_TexelSize;
        float _BaseMetallic;
        float _BaseAORemapMin;
        float _BaseAORemapMax;
        float _BaseSmoothnessRemapMin;
        float _BaseSmoothnessRemapMax;
        float4 _LayerMask_TexelSize;
        float _Invert_Layer_Mask;
        float _Height_Transition;
        float _HeightMin;
        float _HeightMax;
        float _HeightOffset;
        float _HeightMin2;
        float _HeightMax2;
        float _HeightOffset2;
        float4 _Base2Color;
        float4 _Base2ColorMap_TexelSize;
        float4 _Base2TilingOffset;
        float _Base2TriplanarThreshold;
        float4 _Base2NormalMap_TexelSize;
        float _Base2NormalScale;
        float4 _Base2MaskMap_TexelSize;
        float _Base2Metallic;
        float _Base2SmoothnessRemapMin;
        float _Base2SmoothnessRemapMax;
        float _Base2AORemapMin;
        float _Base2AORemapMax;
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
        TEXTURE2D(_LayerMask);
        SAMPLER(sampler_LayerMask);
        TEXTURE2D(_Base2ColorMap);
        SAMPLER(sampler_Base2ColorMap);
        TEXTURE2D(_Base2NormalMap);
        SAMPLER(sampler_Base2NormalMap);
        TEXTURE2D(_Base2MaskMap);
        SAMPLER(sampler_Base2MaskMap);
        TEXTURE2D(_CoverBaseColorMap);
        SAMPLER(sampler_CoverBaseColorMap);
        TEXTURE2D(_CoverNormalMap);
        SAMPLER(sampler_CoverNormalMap);
        TEXTURE2D(_CoverMaskMap);
        SAMPLER(sampler_CoverMaskMap);
        
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
        
        void Unity_Divide_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A / B;
        }
        
        void Unity_Combine_float(float R, float G, float B, float A, out float4 RGBA, out float3 RGB, out float2 RG)
        {
            RGBA = float4(R, G, B, A);
            RGB = float3(R, G, B);
            RG = float2(R, G);
        }
        
        void Unity_Multiply_float4_float4(float4 A, float4 B, out float4 Out)
        {
        Out = A * B;
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
        
        void Unity_Multiply_float_float(float A, float B, out float Out)
        {
        Out = A * B;
        }
        
        void Unity_Add_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A + B;
        }
        
        void Unity_Add_float(float A, float B, out float Out)
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
            UnityTexture2D _Property_d92b1410e1d6bc81a86076b09e35f302_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseColorMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_d4a357b2daff5587ae46468726a33797_Out_0_Vector4 = _BaseTilingOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Divide_c703c79d4bf76e8c9848ea2ecd29211f_Out_2_Vector4;
            Unity_Divide_float4(float4(1, 1, 0, 0), _Property_d4a357b2daff5587ae46468726a33797_Out_0_Vector4, _Divide_c703c79d4bf76e8c9848ea2ecd29211f_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_b168be530d5b4082a2816fc835b55e19_Out_0_Float = _BaseTriplanarThreshold;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579;
            _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4;
            float4 _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XZ_2_Vector4;
            float4 _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_YZ_3_Vector4;
            float4 _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_d92b1410e1d6bc81a86076b09e35f302_Out_0_Texture2D, (_Divide_c703c79d4bf76e8c9848ea2ecd29211f_Out_2_Vector4).x, _Property_b168be530d5b4082a2816fc835b55e19_Out_0_Float, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XZ_2_Vector4, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_YZ_3_Vector4, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_2f38c4b6e08da48093bd9896985f29eb_R_1_Float = _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4[0];
            float _Split_2f38c4b6e08da48093bd9896985f29eb_G_2_Float = _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4[1];
            float _Split_2f38c4b6e08da48093bd9896985f29eb_B_3_Float = _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4[2];
            float _Split_2f38c4b6e08da48093bd9896985f29eb_A_4_Float = _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_a55cb5b55044058c90b91c360cd49672_Out_0_Float = _AlphaCutoff;
            #endif
            surface.Alpha = _Split_2f38c4b6e08da48093bd9896985f29eb_A_4_Float;
            surface.AlphaClipThreshold = _Property_a55cb5b55044058c90b91c360cd49672_Out_0_Float;
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
        output.WorldSpaceNormal = renormFactor * input.normalWS.xyz;      // we want a unit length Normal Vector node in shader graph
        #endif
        
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.AbsoluteWorldSpacePosition = GetAbsolutePositionWS(input.positionWS);
        #endif
        
        
            #if UNITY_UV_STARTS_AT_TOP
            #else
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
        #define ATTRIBUTES_NEED_NORMAL
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_POSITION_WS
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        #define VARYINGS_NEED_NORMAL_WS
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
             float3 normalOS : NORMAL;
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
             float3 AbsoluteWorldSpacePosition;
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
             float3 positionWS : INTERP0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 normalWS : INTERP1;
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
        float4 _BaseTilingOffset;
        float _BaseTriplanarThreshold;
        float4 _BaseNormalMap_TexelSize;
        float _BaseNormalScale;
        float4 _BaseMaskMap_TexelSize;
        float _BaseMetallic;
        float _BaseAORemapMin;
        float _BaseAORemapMax;
        float _BaseSmoothnessRemapMin;
        float _BaseSmoothnessRemapMax;
        float4 _LayerMask_TexelSize;
        float _Invert_Layer_Mask;
        float _Height_Transition;
        float _HeightMin;
        float _HeightMax;
        float _HeightOffset;
        float _HeightMin2;
        float _HeightMax2;
        float _HeightOffset2;
        float4 _Base2Color;
        float4 _Base2ColorMap_TexelSize;
        float4 _Base2TilingOffset;
        float _Base2TriplanarThreshold;
        float4 _Base2NormalMap_TexelSize;
        float _Base2NormalScale;
        float4 _Base2MaskMap_TexelSize;
        float _Base2Metallic;
        float _Base2SmoothnessRemapMin;
        float _Base2SmoothnessRemapMax;
        float _Base2AORemapMin;
        float _Base2AORemapMax;
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
        TEXTURE2D(_LayerMask);
        SAMPLER(sampler_LayerMask);
        TEXTURE2D(_Base2ColorMap);
        SAMPLER(sampler_Base2ColorMap);
        TEXTURE2D(_Base2NormalMap);
        SAMPLER(sampler_Base2NormalMap);
        TEXTURE2D(_Base2MaskMap);
        SAMPLER(sampler_Base2MaskMap);
        TEXTURE2D(_CoverBaseColorMap);
        SAMPLER(sampler_CoverBaseColorMap);
        TEXTURE2D(_CoverNormalMap);
        SAMPLER(sampler_CoverNormalMap);
        TEXTURE2D(_CoverMaskMap);
        SAMPLER(sampler_CoverMaskMap);
        
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
        
        void Unity_Divide_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A / B;
        }
        
        void Unity_Combine_float(float R, float G, float B, float A, out float4 RGBA, out float3 RGB, out float2 RG)
        {
            RGBA = float4(R, G, B, A);
            RGB = float3(R, G, B);
            RG = float2(R, G);
        }
        
        void Unity_Multiply_float4_float4(float4 A, float4 B, out float4 Out)
        {
        Out = A * B;
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
        
        void Unity_Multiply_float_float(float A, float B, out float Out)
        {
        Out = A * B;
        }
        
        void Unity_Add_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A + B;
        }
        
        void Unity_Add_float(float A, float B, out float Out)
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
            UnityTexture2D _Property_d92b1410e1d6bc81a86076b09e35f302_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseColorMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_d4a357b2daff5587ae46468726a33797_Out_0_Vector4 = _BaseTilingOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Divide_c703c79d4bf76e8c9848ea2ecd29211f_Out_2_Vector4;
            Unity_Divide_float4(float4(1, 1, 0, 0), _Property_d4a357b2daff5587ae46468726a33797_Out_0_Vector4, _Divide_c703c79d4bf76e8c9848ea2ecd29211f_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_b168be530d5b4082a2816fc835b55e19_Out_0_Float = _BaseTriplanarThreshold;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579;
            _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4;
            float4 _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XZ_2_Vector4;
            float4 _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_YZ_3_Vector4;
            float4 _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_d92b1410e1d6bc81a86076b09e35f302_Out_0_Texture2D, (_Divide_c703c79d4bf76e8c9848ea2ecd29211f_Out_2_Vector4).x, _Property_b168be530d5b4082a2816fc835b55e19_Out_0_Float, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XZ_2_Vector4, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_YZ_3_Vector4, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_2f38c4b6e08da48093bd9896985f29eb_R_1_Float = _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4[0];
            float _Split_2f38c4b6e08da48093bd9896985f29eb_G_2_Float = _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4[1];
            float _Split_2f38c4b6e08da48093bd9896985f29eb_B_3_Float = _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4[2];
            float _Split_2f38c4b6e08da48093bd9896985f29eb_A_4_Float = _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_a55cb5b55044058c90b91c360cd49672_Out_0_Float = _AlphaCutoff;
            #endif
            surface.Alpha = _Split_2f38c4b6e08da48093bd9896985f29eb_A_4_Float;
            surface.AlphaClipThreshold = _Property_a55cb5b55044058c90b91c360cd49672_Out_0_Float;
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
        // must use interpolated tangent, bitangent and normal before they are normalized in the pixel shader.
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        float3 unnormalizedNormalWS = input.normalWS;
        #endif
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        const float renormFactor = 1.0 / length(unnormalizedNormalWS);
        #endif
        
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.WorldSpaceNormal = renormFactor * input.normalWS.xyz;      // we want a unit length Normal Vector node in shader graph
        #endif
        
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.AbsoluteWorldSpacePosition = GetAbsolutePositionWS(input.positionWS);
        #endif
        
        
            #if UNITY_UV_STARTS_AT_TOP
            #else
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
             float3 AbsoluteWorldSpacePosition;
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
             float3 positionWS : INTERP0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 normalWS : INTERP1;
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
        float4 _BaseTilingOffset;
        float _BaseTriplanarThreshold;
        float4 _BaseNormalMap_TexelSize;
        float _BaseNormalScale;
        float4 _BaseMaskMap_TexelSize;
        float _BaseMetallic;
        float _BaseAORemapMin;
        float _BaseAORemapMax;
        float _BaseSmoothnessRemapMin;
        float _BaseSmoothnessRemapMax;
        float4 _LayerMask_TexelSize;
        float _Invert_Layer_Mask;
        float _Height_Transition;
        float _HeightMin;
        float _HeightMax;
        float _HeightOffset;
        float _HeightMin2;
        float _HeightMax2;
        float _HeightOffset2;
        float4 _Base2Color;
        float4 _Base2ColorMap_TexelSize;
        float4 _Base2TilingOffset;
        float _Base2TriplanarThreshold;
        float4 _Base2NormalMap_TexelSize;
        float _Base2NormalScale;
        float4 _Base2MaskMap_TexelSize;
        float _Base2Metallic;
        float _Base2SmoothnessRemapMin;
        float _Base2SmoothnessRemapMax;
        float _Base2AORemapMin;
        float _Base2AORemapMax;
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
        TEXTURE2D(_LayerMask);
        SAMPLER(sampler_LayerMask);
        TEXTURE2D(_Base2ColorMap);
        SAMPLER(sampler_Base2ColorMap);
        TEXTURE2D(_Base2NormalMap);
        SAMPLER(sampler_Base2NormalMap);
        TEXTURE2D(_Base2MaskMap);
        SAMPLER(sampler_Base2MaskMap);
        TEXTURE2D(_CoverBaseColorMap);
        SAMPLER(sampler_CoverBaseColorMap);
        TEXTURE2D(_CoverNormalMap);
        SAMPLER(sampler_CoverNormalMap);
        TEXTURE2D(_CoverMaskMap);
        SAMPLER(sampler_CoverMaskMap);
        
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
        
        void Unity_Divide_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A / B;
        }
        
        void Unity_Combine_float(float R, float G, float B, float A, out float4 RGBA, out float3 RGB, out float2 RG)
        {
            RGBA = float4(R, G, B, A);
            RGB = float3(R, G, B);
            RG = float2(R, G);
        }
        
        void Unity_Multiply_float4_float4(float4 A, float4 B, out float4 Out)
        {
        Out = A * B;
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
        
        void Unity_Multiply_float_float(float A, float B, out float Out)
        {
        Out = A * B;
        }
        
        void Unity_Add_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A + B;
        }
        
        void Unity_Add_float(float A, float B, out float Out)
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
            UnityTexture2D _Property_d92b1410e1d6bc81a86076b09e35f302_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseColorMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_d4a357b2daff5587ae46468726a33797_Out_0_Vector4 = _BaseTilingOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Divide_c703c79d4bf76e8c9848ea2ecd29211f_Out_2_Vector4;
            Unity_Divide_float4(float4(1, 1, 0, 0), _Property_d4a357b2daff5587ae46468726a33797_Out_0_Vector4, _Divide_c703c79d4bf76e8c9848ea2ecd29211f_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_b168be530d5b4082a2816fc835b55e19_Out_0_Float = _BaseTriplanarThreshold;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579;
            _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4;
            float4 _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XZ_2_Vector4;
            float4 _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_YZ_3_Vector4;
            float4 _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_d92b1410e1d6bc81a86076b09e35f302_Out_0_Texture2D, (_Divide_c703c79d4bf76e8c9848ea2ecd29211f_Out_2_Vector4).x, _Property_b168be530d5b4082a2816fc835b55e19_Out_0_Float, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XZ_2_Vector4, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_YZ_3_Vector4, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_2f38c4b6e08da48093bd9896985f29eb_R_1_Float = _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4[0];
            float _Split_2f38c4b6e08da48093bd9896985f29eb_G_2_Float = _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4[1];
            float _Split_2f38c4b6e08da48093bd9896985f29eb_B_3_Float = _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4[2];
            float _Split_2f38c4b6e08da48093bd9896985f29eb_A_4_Float = _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_a55cb5b55044058c90b91c360cd49672_Out_0_Float = _AlphaCutoff;
            #endif
            surface.Alpha = _Split_2f38c4b6e08da48093bd9896985f29eb_A_4_Float;
            surface.AlphaClipThreshold = _Property_a55cb5b55044058c90b91c360cd49672_Out_0_Float;
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
        output.WorldSpaceNormal = renormFactor * input.normalWS.xyz;      // we want a unit length Normal Vector node in shader graph
        #endif
        
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.AbsoluteWorldSpacePosition = GetAbsolutePositionWS(input.positionWS);
        #endif
        
        
            #if UNITY_UV_STARTS_AT_TOP
            #else
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
             float4 color : INTERP2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 positionWS : INTERP3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 normalWS : INTERP4;
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
        float4 _BaseTilingOffset;
        float _BaseTriplanarThreshold;
        float4 _BaseNormalMap_TexelSize;
        float _BaseNormalScale;
        float4 _BaseMaskMap_TexelSize;
        float _BaseMetallic;
        float _BaseAORemapMin;
        float _BaseAORemapMax;
        float _BaseSmoothnessRemapMin;
        float _BaseSmoothnessRemapMax;
        float4 _LayerMask_TexelSize;
        float _Invert_Layer_Mask;
        float _Height_Transition;
        float _HeightMin;
        float _HeightMax;
        float _HeightOffset;
        float _HeightMin2;
        float _HeightMax2;
        float _HeightOffset2;
        float4 _Base2Color;
        float4 _Base2ColorMap_TexelSize;
        float4 _Base2TilingOffset;
        float _Base2TriplanarThreshold;
        float4 _Base2NormalMap_TexelSize;
        float _Base2NormalScale;
        float4 _Base2MaskMap_TexelSize;
        float _Base2Metallic;
        float _Base2SmoothnessRemapMin;
        float _Base2SmoothnessRemapMax;
        float _Base2AORemapMin;
        float _Base2AORemapMax;
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
        TEXTURE2D(_LayerMask);
        SAMPLER(sampler_LayerMask);
        TEXTURE2D(_Base2ColorMap);
        SAMPLER(sampler_Base2ColorMap);
        TEXTURE2D(_Base2NormalMap);
        SAMPLER(sampler_Base2NormalMap);
        TEXTURE2D(_Base2MaskMap);
        SAMPLER(sampler_Base2MaskMap);
        TEXTURE2D(_CoverBaseColorMap);
        SAMPLER(sampler_CoverBaseColorMap);
        TEXTURE2D(_CoverNormalMap);
        SAMPLER(sampler_CoverNormalMap);
        TEXTURE2D(_CoverMaskMap);
        SAMPLER(sampler_CoverMaskMap);
        
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
        
        void Unity_Divide_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A / B;
        }
        
        void Unity_Combine_float(float R, float G, float B, float A, out float4 RGBA, out float3 RGB, out float2 RG)
        {
            RGBA = float4(R, G, B, A);
            RGB = float3(R, G, B);
            RG = float2(R, G);
        }
        
        void Unity_Multiply_float4_float4(float4 A, float4 B, out float4 Out)
        {
        Out = A * B;
        }
        
        void Unity_Sign_float3(float3 In, out float3 Out)
        {
            Out = sign(In);
        }
        
        void Unity_Multiply_float2_float2(float2 A, float2 B, out float2 Out)
        {
        Out = A * B;
        }
        
        void Unity_Add_float2(float2 A, float2 B, out float2 Out)
        {
            Out = A + B;
        }
        
        void Unity_Multiply_float_float(float A, float B, out float Out)
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
        
        void Unity_Normalize_float3(float3 In, out float3 Out)
        {
            Out = normalize(In);
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
        
        void Unity_NormalStrength_float(float3 In, float Strength, out float3 Out)
        {
            Out = float3(In.rg * Strength, lerp(1, In.b, saturate(Strength)));
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
        
        void Unity_OneMinus_float(float In, out float Out)
        {
            Out = 1 - In;
        }
        
        void Unity_Branch_float(float Predicate, float True, float False, out float Out)
        {
            Out = Predicate ? True : False;
        }
        
        void Unity_Maximum_float(float A, float B, out float Out)
        {
            Out = max(A, B);
        }
        
        void Unity_Subtract_float(float A, float B, out float Out)
        {
            Out = A - B;
        }
        
        struct Bindings_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float
        {
        };
        
        void SG_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float(float3 Vector3_88EEBB5E, float Vector1_DA0A37FA, float3 Vector3_79AA92F, float Vector1_F7E83F1E, float Vector1_1C9222A6, Bindings_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float IN, out float3 OutVector4_1)
        {
        float3 _Property_dd1c841a04c03f8c85e7b00eb025ecda_Out_0_Vector3 = Vector3_88EEBB5E;
        float _Property_14119cc7eaf4128f991283d47cf72d85_Out_0_Float = Vector1_DA0A37FA;
        float _Property_48af0ad45e3f7f82932b938695d21391_Out_0_Float = Vector1_DA0A37FA;
        float _Property_8a30b3ca12ff518fa473ccd686c7d503_Out_0_Float = Vector1_F7E83F1E;
        float _Maximum_c196e4a61637ea8381a3437c93f89ce2_Out_2_Float;
        Unity_Maximum_float(_Property_48af0ad45e3f7f82932b938695d21391_Out_0_Float, _Property_8a30b3ca12ff518fa473ccd686c7d503_Out_0_Float, _Maximum_c196e4a61637ea8381a3437c93f89ce2_Out_2_Float);
        float _Property_ee8d5fc69475d181be60c57e04ea8708_Out_0_Float = Vector1_1C9222A6;
        float _Subtract_61ca880c04c1758eb128f25c9faabd63_Out_2_Float;
        Unity_Subtract_float(_Maximum_c196e4a61637ea8381a3437c93f89ce2_Out_2_Float, _Property_ee8d5fc69475d181be60c57e04ea8708_Out_0_Float, _Subtract_61ca880c04c1758eb128f25c9faabd63_Out_2_Float);
        float _Subtract_e3a7713b556a1b8cb40aad97fc58d619_Out_2_Float;
        Unity_Subtract_float(_Property_14119cc7eaf4128f991283d47cf72d85_Out_0_Float, _Subtract_61ca880c04c1758eb128f25c9faabd63_Out_2_Float, _Subtract_e3a7713b556a1b8cb40aad97fc58d619_Out_2_Float);
        float _Maximum_d02e48d92038448cb0345e5cf3779071_Out_2_Float;
        Unity_Maximum_float(_Subtract_e3a7713b556a1b8cb40aad97fc58d619_Out_2_Float, float(0), _Maximum_d02e48d92038448cb0345e5cf3779071_Out_2_Float);
        float3 _Multiply_79b0b5d7d3528b8395e1135339a090f2_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Property_dd1c841a04c03f8c85e7b00eb025ecda_Out_0_Vector3, (_Maximum_d02e48d92038448cb0345e5cf3779071_Out_2_Float.xxx), _Multiply_79b0b5d7d3528b8395e1135339a090f2_Out_2_Vector3);
        float3 _Property_c7292b3b08585f8c8670172b9a220bf0_Out_0_Vector3 = Vector3_79AA92F;
        float _Property_5e920479576fad83ba1947728dcceab4_Out_0_Float = Vector1_F7E83F1E;
        float _Subtract_b7368f21be9e048aae7f90c8a2bfaae1_Out_2_Float;
        Unity_Subtract_float(_Property_5e920479576fad83ba1947728dcceab4_Out_0_Float, _Subtract_61ca880c04c1758eb128f25c9faabd63_Out_2_Float, _Subtract_b7368f21be9e048aae7f90c8a2bfaae1_Out_2_Float);
        float _Maximum_216777d30802328eab607c8fe68ba3a1_Out_2_Float;
        Unity_Maximum_float(_Subtract_b7368f21be9e048aae7f90c8a2bfaae1_Out_2_Float, float(0), _Maximum_216777d30802328eab607c8fe68ba3a1_Out_2_Float);
        float3 _Multiply_a856b52cd0848f86a6ae1af9b175935c_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Property_c7292b3b08585f8c8670172b9a220bf0_Out_0_Vector3, (_Maximum_216777d30802328eab607c8fe68ba3a1_Out_2_Float.xxx), _Multiply_a856b52cd0848f86a6ae1af9b175935c_Out_2_Vector3);
        float3 _Add_86c6109dc4530b8c9763ef62b056ad4c_Out_2_Vector3;
        Unity_Add_float3(_Multiply_79b0b5d7d3528b8395e1135339a090f2_Out_2_Vector3, _Multiply_a856b52cd0848f86a6ae1af9b175935c_Out_2_Vector3, _Add_86c6109dc4530b8c9763ef62b056ad4c_Out_2_Vector3);
        float _Add_356384b52728f583bd6e694bc1fc3738_Out_2_Float;
        Unity_Add_float(_Maximum_d02e48d92038448cb0345e5cf3779071_Out_2_Float, _Maximum_216777d30802328eab607c8fe68ba3a1_Out_2_Float, _Add_356384b52728f583bd6e694bc1fc3738_Out_2_Float);
        float _Maximum_94a22f5ceb706e88bc16350a5d5d2a82_Out_2_Float;
        Unity_Maximum_float(_Add_356384b52728f583bd6e694bc1fc3738_Out_2_Float, float(1E-05), _Maximum_94a22f5ceb706e88bc16350a5d5d2a82_Out_2_Float);
        float3 _Divide_d7291d1701d7058dbb5263194c1bed22_Out_2_Vector3;
        Unity_Divide_float3(_Add_86c6109dc4530b8c9763ef62b056ad4c_Out_2_Vector3, (_Maximum_94a22f5ceb706e88bc16350a5d5d2a82_Out_2_Float.xxx), _Divide_d7291d1701d7058dbb5263194c1bed22_Out_2_Vector3);
        OutVector4_1 = _Divide_d7291d1701d7058dbb5263194c1bed22_Out_2_Vector3;
        }
        
        void Unity_Clamp_float(float In, float Min, float Max, out float Out)
        {
            Out = clamp(In, Min, Max);
        }
        
        void Unity_Divide_float(float A, float B, out float Out)
        {
            Out = A / B;
        }
        
        void Unity_Absolute_float(float In, out float Out)
        {
            Out = abs(In);
        }
        
        void Unity_Power_float(float A, float B, out float Out)
        {
            Out = pow(A, B);
        }
        
        void Unity_Saturate_float(float In, out float Out)
        {
            Out = saturate(In);
        }
        
        void Unity_Lerp_float3(float3 A, float3 B, float3 T, out float3 Out)
        {
            Out = lerp(A, B, T);
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
            UnityTexture2D _Property_72c615246e955087b85288c29905f048_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseNormalMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_d4a357b2daff5587ae46468726a33797_Out_0_Vector4 = _BaseTilingOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Divide_c703c79d4bf76e8c9848ea2ecd29211f_Out_2_Vector4;
            Unity_Divide_float4(float4(1, 1, 0, 0), _Property_d4a357b2daff5587ae46468726a33797_Out_0_Vector4, _Divide_c703c79d4bf76e8c9848ea2ecd29211f_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_b168be530d5b4082a2816fc835b55e19_Out_0_Float = _BaseTriplanarThreshold;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNMn_059da9746584140498cd018db3c76047_float _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0;
            _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0.WorldSpaceTangent = IN.WorldSpaceTangent;
            _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0.WorldSpacePosition = IN.WorldSpacePosition;
            float4 _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XYZ_1_Vector4;
            float4 _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XZ_2_Vector4;
            float4 _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_YZ_3_Vector4;
            float4 _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XY_4_Vector4;
            SG_TriplanarNMn_059da9746584140498cd018db3c76047_float(_Property_72c615246e955087b85288c29905f048_Out_0_Texture2D, (_Divide_c703c79d4bf76e8c9848ea2ecd29211f_Out_2_Vector4).x, _Property_b168be530d5b4082a2816fc835b55e19_Out_0_Float, _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0, _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XYZ_1_Vector4, _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XZ_2_Vector4, _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_YZ_3_Vector4, _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_7edd97bda70eb38a8c4253094700be37_Out_0_Float = _BaseNormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _NormalStrength_8bafa3d69de37c818a39fccf03db9518_Out_2_Vector3;
            Unity_NormalStrength_float((_TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XYZ_1_Vector4.xyz), _Property_7edd97bda70eb38a8c4253094700be37_Out_0_Float, _NormalStrength_8bafa3d69de37c818a39fccf03db9518_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_080b6cb46abb00848263c964726eac36_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseMaskMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c;
            _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XYZ_1_Vector4;
            float4 _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XZ_2_Vector4;
            float4 _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_YZ_3_Vector4;
            float4 _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_080b6cb46abb00848263c964726eac36_Out_0_Texture2D, (_Divide_c703c79d4bf76e8c9848ea2ecd29211f_Out_2_Vector4).x, _Property_b168be530d5b4082a2816fc835b55e19_Out_0_Float, _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c, _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XYZ_1_Vector4, _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XZ_2_Vector4, _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_YZ_3_Vector4, _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_866a663ed067f988862843fe32765ff8_R_1_Float = _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XYZ_1_Vector4[0];
            float _Split_866a663ed067f988862843fe32765ff8_G_2_Float = _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XYZ_1_Vector4[1];
            float _Split_866a663ed067f988862843fe32765ff8_B_3_Float = _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XYZ_1_Vector4[2];
            float _Split_866a663ed067f988862843fe32765ff8_A_4_Float = _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XYZ_1_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_3b9891099f2f3e84b765eb453f6f6810_Out_0_Float = _HeightMin;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_bde21360babd9089a90a45cd2843925b_Out_0_Float = _HeightMax;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_9f8e90f51ffcfe8bb3d495766c0cabca_Out_0_Vector2 = float2(_Property_3b9891099f2f3e84b765eb453f6f6810_Out_0_Float, _Property_bde21360babd9089a90a45cd2843925b_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_6ff6d72f7b1d0083b4e4ce61e7e7c8d3_Out_0_Float = _HeightOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Add_39687f6bf7045086bc2d1ccf5f94c9de_Out_2_Vector2;
            Unity_Add_float2(_Vector2_9f8e90f51ffcfe8bb3d495766c0cabca_Out_0_Vector2, (_Property_6ff6d72f7b1d0083b4e4ce61e7e7c8d3_Out_0_Float.xx), _Add_39687f6bf7045086bc2d1ccf5f94c9de_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_ddc02d039a9d5388b8add0d2d673d4ac_Out_3_Float;
            Unity_Remap_float(_Split_866a663ed067f988862843fe32765ff8_B_3_Float, float2 (0, 1), _Add_39687f6bf7045086bc2d1ccf5f94c9de_Out_2_Vector2, _Remap_ddc02d039a9d5388b8add0d2d673d4ac_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_6809577d1aa24984aa957e13d0574602_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_Base2NormalMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_221c724b2137d58c8c387fee5b48be14_Out_0_Vector4 = _Base2TilingOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Divide_9f3f46254d5f7a8e87f60c4aa6f5522c_Out_2_Vector4;
            Unity_Divide_float4(float4(1, 1, 0, 0), _Property_221c724b2137d58c8c387fee5b48be14_Out_0_Vector4, _Divide_9f3f46254d5f7a8e87f60c4aa6f5522c_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_20f6a96f64098d87b850c83bc45ddcee_Out_0_Float = _Base2TriplanarThreshold;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNMn_059da9746584140498cd018db3c76047_float _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc;
            _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc.WorldSpaceTangent = IN.WorldSpaceTangent;
            _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc.WorldSpacePosition = IN.WorldSpacePosition;
            float4 _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc_XYZ_1_Vector4;
            float4 _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc_XZ_2_Vector4;
            float4 _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc_YZ_3_Vector4;
            float4 _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc_XY_4_Vector4;
            SG_TriplanarNMn_059da9746584140498cd018db3c76047_float(_Property_6809577d1aa24984aa957e13d0574602_Out_0_Texture2D, (_Divide_9f3f46254d5f7a8e87f60c4aa6f5522c_Out_2_Vector4).x, _Property_20f6a96f64098d87b850c83bc45ddcee_Out_0_Float, _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc, _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc_XYZ_1_Vector4, _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc_XZ_2_Vector4, _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc_YZ_3_Vector4, _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_c3260886a9a91b82a3d14c25e6fd0d2c_Out_0_Float = _Base2NormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _NormalStrength_d049a259d0377180a2e5959b925a78bc_Out_2_Vector3;
            Unity_NormalStrength_float((_TriplanarNMn_8890d23c68a4598d85a048422a8f36fc_XYZ_1_Vector4.xyz), _Property_c3260886a9a91b82a3d14c25e6fd0d2c_Out_0_Float, _NormalStrength_d049a259d0377180a2e5959b925a78bc_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_312b653a29ccc087849b1493611fb73c_Out_0_Boolean = _Invert_Layer_Mask;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_1004d4c014377e8c8fa291ed748b9f84_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_LayerMask);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _SampleTexture2D_c910b4b42510578d81c16169d3cb5727_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_1004d4c014377e8c8fa291ed748b9f84_Out_0_Texture2D.tex, _Property_1004d4c014377e8c8fa291ed748b9f84_Out_0_Texture2D.samplerstate, _Property_1004d4c014377e8c8fa291ed748b9f84_Out_0_Texture2D.GetTransformedUV(IN.uv0.xy) );
            float _SampleTexture2D_c910b4b42510578d81c16169d3cb5727_R_4_Float = _SampleTexture2D_c910b4b42510578d81c16169d3cb5727_RGBA_0_Vector4.r;
            float _SampleTexture2D_c910b4b42510578d81c16169d3cb5727_G_5_Float = _SampleTexture2D_c910b4b42510578d81c16169d3cb5727_RGBA_0_Vector4.g;
            float _SampleTexture2D_c910b4b42510578d81c16169d3cb5727_B_6_Float = _SampleTexture2D_c910b4b42510578d81c16169d3cb5727_RGBA_0_Vector4.b;
            float _SampleTexture2D_c910b4b42510578d81c16169d3cb5727_A_7_Float = _SampleTexture2D_c910b4b42510578d81c16169d3cb5727_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_bc0b8885b596648d9b594130faa6585c_Out_1_Float;
            Unity_OneMinus_float(_SampleTexture2D_c910b4b42510578d81c16169d3cb5727_R_4_Float, _OneMinus_bc0b8885b596648d9b594130faa6585c_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Branch_6b7615e16629338ba87d3570a0096f66_Out_3_Float;
            Unity_Branch_float(_Property_312b653a29ccc087849b1493611fb73c_Out_0_Boolean, _OneMinus_bc0b8885b596648d9b594130faa6585c_Out_1_Float, _SampleTexture2D_c910b4b42510578d81c16169d3cb5727_R_4_Float, _Branch_6b7615e16629338ba87d3570a0096f66_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_b4749c77856157858fffde0aed55fc74_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_Base2MaskMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b;
            _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_XYZ_1_Vector4;
            float4 _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_XZ_2_Vector4;
            float4 _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_YZ_3_Vector4;
            float4 _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_b4749c77856157858fffde0aed55fc74_Out_0_Texture2D, (_Divide_9f3f46254d5f7a8e87f60c4aa6f5522c_Out_2_Vector4).x, _Property_20f6a96f64098d87b850c83bc45ddcee_Out_0_Float, _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b, _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_XYZ_1_Vector4, _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_XZ_2_Vector4, _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_YZ_3_Vector4, _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_0b441b86fba0ea80bc060dae9d7ed0d7_R_1_Float = _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_XYZ_1_Vector4[0];
            float _Split_0b441b86fba0ea80bc060dae9d7ed0d7_G_2_Float = _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_XYZ_1_Vector4[1];
            float _Split_0b441b86fba0ea80bc060dae9d7ed0d7_B_3_Float = _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_XYZ_1_Vector4[2];
            float _Split_0b441b86fba0ea80bc060dae9d7ed0d7_A_4_Float = _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_XYZ_1_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_c1de6a6321562383bfac4b318fc7b0d3_Out_0_Float = _HeightMin2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_145222f375008a879315637be0f172c5_Out_0_Float = _HeightMax2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_416c3ee3a60cc686b2d2360a073acfad_Out_0_Vector2 = float2(_Property_c1de6a6321562383bfac4b318fc7b0d3_Out_0_Float, _Property_145222f375008a879315637be0f172c5_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_8be924d801daee88b294af592a560e75_Out_0_Float = _HeightOffset2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Add_37703f1eb9ce078daaedca833705f5dd_Out_2_Vector2;
            Unity_Add_float2(_Vector2_416c3ee3a60cc686b2d2360a073acfad_Out_0_Vector2, (_Property_8be924d801daee88b294af592a560e75_Out_0_Float.xx), _Add_37703f1eb9ce078daaedca833705f5dd_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_5a8467f2416dc98699682a4cf64a69aa_Out_3_Float;
            Unity_Remap_float(_Split_0b441b86fba0ea80bc060dae9d7ed0d7_B_3_Float, float2 (0, 1), _Add_37703f1eb9ce078daaedca833705f5dd_Out_2_Vector2, _Remap_5a8467f2416dc98699682a4cf64a69aa_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_d9f42ca072d9188ab2566400157a199f_Out_2_Float;
            Unity_Multiply_float_float(_Branch_6b7615e16629338ba87d3570a0096f66_Out_3_Float, _Remap_5a8467f2416dc98699682a4cf64a69aa_Out_3_Float, _Multiply_d9f42ca072d9188ab2566400157a199f_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_b4d08e724ec3df88ab7743c5b7a3f081_R_1_Float = IN.VertexColor[0];
            float _Split_b4d08e724ec3df88ab7743c5b7a3f081_G_2_Float = IN.VertexColor[1];
            float _Split_b4d08e724ec3df88ab7743c5b7a3f081_B_3_Float = IN.VertexColor[2];
            float _Split_b4d08e724ec3df88ab7743c5b7a3f081_A_4_Float = IN.VertexColor[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_55cb55224306dc818a87a2dbf82d5af0_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_d9f42ca072d9188ab2566400157a199f_Out_2_Float, _Split_b4d08e724ec3df88ab7743c5b7a3f081_B_3_Float, _Multiply_55cb55224306dc818a87a2dbf82d5af0_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_c0dc9341fd635288a1c2869945617704_Out_0_Float = _Height_Transition;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float _HeightBlend_a6bf16c3496e828984e7277239132d42;
            float3 _HeightBlend_a6bf16c3496e828984e7277239132d42_OutVector4_1_Vector3;
            SG_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float(_NormalStrength_8bafa3d69de37c818a39fccf03db9518_Out_2_Vector3, _Remap_ddc02d039a9d5388b8add0d2d673d4ac_Out_3_Float, _NormalStrength_d049a259d0377180a2e5959b925a78bc_Out_2_Vector3, _Multiply_55cb55224306dc818a87a2dbf82d5af0_Out_2_Float, _Property_c0dc9341fd635288a1c2869945617704_Out_0_Float, _HeightBlend_a6bf16c3496e828984e7277239132d42, _HeightBlend_a6bf16c3496e828984e7277239132d42_OutVector4_1_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_1dcbde2a42b87e81bb254fd87a4816a5_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverNormalMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_9bedb34aba10fa89a5f5b18919971491_Out_0_Vector4 = _CoverTilingOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Divide_ddaec3b56c9fc58ca3314b828c03b1c8_Out_2_Vector4;
            Unity_Divide_float4(float4(1, 1, 0, 0), _Property_9bedb34aba10fa89a5f5b18919971491_Out_0_Vector4, _Divide_ddaec3b56c9fc58ca3314b828c03b1c8_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_bf361924f27f848994241bda91fc2005_Out_0_Float = _CoverTriplanarThreshold;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNMn_059da9746584140498cd018db3c76047_float _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58;
            _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58.WorldSpaceTangent = IN.WorldSpaceTangent;
            _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58.WorldSpacePosition = IN.WorldSpacePosition;
            float4 _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XYZ_1_Vector4;
            float4 _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XZ_2_Vector4;
            float4 _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_YZ_3_Vector4;
            float4 _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XY_4_Vector4;
            SG_TriplanarNMn_059da9746584140498cd018db3c76047_float(_Property_1dcbde2a42b87e81bb254fd87a4816a5_Out_0_Texture2D, (_Divide_ddaec3b56c9fc58ca3314b828c03b1c8_Out_2_Vector4).x, _Property_bf361924f27f848994241bda91fc2005_Out_0_Float, _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58, _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XYZ_1_Vector4, _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XZ_2_Vector4, _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_YZ_3_Vector4, _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_0709d20641a7668b85ded82df467d4f4_Out_0_Float = _CoverNormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _NormalStrength_d90a27c667bbb48e9e15ec520c3e2ff3_Out_2_Vector3;
            Unity_NormalStrength_float((_TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XYZ_1_Vector4.xyz), _Property_0709d20641a7668b85ded82df467d4f4_Out_0_Float, _NormalStrength_d90a27c667bbb48e9e15ec520c3e2ff3_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_ed6385cfee8242c58d906f36e90cb607_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverBaseColorMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _UV_13d53a8c036ded8490c69d17b7a3bb72_Out_0_Vector4 = IN.uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _SampleTexture2D_b8be215db546638398ea07060feb5224_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_ed6385cfee8242c58d906f36e90cb607_Out_0_Texture2D.tex, _Property_ed6385cfee8242c58d906f36e90cb607_Out_0_Texture2D.samplerstate, _Property_ed6385cfee8242c58d906f36e90cb607_Out_0_Texture2D.GetTransformedUV((_UV_13d53a8c036ded8490c69d17b7a3bb72_Out_0_Vector4.xy)) );
            float _SampleTexture2D_b8be215db546638398ea07060feb5224_R_4_Float = _SampleTexture2D_b8be215db546638398ea07060feb5224_RGBA_0_Vector4.r;
            float _SampleTexture2D_b8be215db546638398ea07060feb5224_G_5_Float = _SampleTexture2D_b8be215db546638398ea07060feb5224_RGBA_0_Vector4.g;
            float _SampleTexture2D_b8be215db546638398ea07060feb5224_B_6_Float = _SampleTexture2D_b8be215db546638398ea07060feb5224_RGBA_0_Vector4.b;
            float _SampleTexture2D_b8be215db546638398ea07060feb5224_A_7_Float = _SampleTexture2D_b8be215db546638398ea07060feb5224_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_b3ce556358f99f80ae9037fb175f4c5f_Out_0_Float = _CoverMaskPower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_ea35dd8ed2523f8b9a4c52fc52ecff0e_Out_2_Float;
            Unity_Multiply_float_float(_SampleTexture2D_b8be215db546638398ea07060feb5224_A_7_Float, _Property_b3ce556358f99f80ae9037fb175f4c5f_Out_0_Float, _Multiply_ea35dd8ed2523f8b9a4c52fc52ecff0e_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_7c0c867aaa1f5b8683768528b130a408_Out_3_Float;
            Unity_Clamp_float(_Multiply_ea35dd8ed2523f8b9a4c52fc52ecff0e_Out_2_Float, float(0), float(1), _Clamp_7c0c867aaa1f5b8683768528b130a408_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Property_509761afcb3aad8f9a29405c122dbf08_Out_0_Vector3 = _CoverDirection;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_9176e0d3ea9ff88a9b888a200800b92d_Out_0_Float = _CoverNormalBlendHardness;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _NormalStrength_51679ed1e0a0ef8aa01b53b035a4da51_Out_2_Vector3;
            Unity_NormalStrength_float((_TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XYZ_1_Vector4.xyz), _Property_9176e0d3ea9ff88a9b888a200800b92d_Out_0_Float, _NormalStrength_51679ed1e0a0ef8aa01b53b035a4da51_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Multiply_ea6008eef104198ca40a18608c76d5a4_Out_2_Vector3;
            Unity_Multiply_float3_float3(_Property_509761afcb3aad8f9a29405c122dbf08_Out_0_Vector3, IN.WorldSpaceNormal, _Multiply_ea6008eef104198ca40a18608c76d5a4_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_e74c8f300b486e86a5700118b60b7885_R_1_Float = _Multiply_ea6008eef104198ca40a18608c76d5a4_Out_2_Vector3[0];
            float _Split_e74c8f300b486e86a5700118b60b7885_G_2_Float = _Multiply_ea6008eef104198ca40a18608c76d5a4_Out_2_Vector3[1];
            float _Split_e74c8f300b486e86a5700118b60b7885_B_3_Float = _Multiply_ea6008eef104198ca40a18608c76d5a4_Out_2_Vector3[2];
            float _Split_e74c8f300b486e86a5700118b60b7885_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_57be4f2ffc62ef89a9b736e6f1a99790_Out_2_Float;
            Unity_Add_float(_Split_e74c8f300b486e86a5700118b60b7885_R_1_Float, _Split_e74c8f300b486e86a5700118b60b7885_G_2_Float, _Add_57be4f2ffc62ef89a9b736e6f1a99790_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_abe82f22f31b958eaf9f12f8db5f150d_Out_2_Float;
            Unity_Add_float(_Add_57be4f2ffc62ef89a9b736e6f1a99790_Out_2_Float, _Split_e74c8f300b486e86a5700118b60b7885_B_3_Float, _Add_abe82f22f31b958eaf9f12f8db5f150d_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_ca7cc2d889a56683904c7546a72cedbf_Out_0_Float = _Cover_Amount;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_398a4ebc3d0302828e04c782fb4f49be_Out_0_Float = _Cover_Amount_Grow_Speed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Subtract_9340fe9ac4518a8aa343888dc6143619_Out_2_Float;
            Unity_Subtract_float(float(4), _Property_398a4ebc3d0302828e04c782fb4f49be_Out_0_Float, _Subtract_9340fe9ac4518a8aa343888dc6143619_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_58b01578ab8c8b858bb5e3a720366e16_Out_2_Float;
            Unity_Divide_float(_Property_ca7cc2d889a56683904c7546a72cedbf_Out_0_Float, _Subtract_9340fe9ac4518a8aa343888dc6143619_Out_2_Float, _Divide_58b01578ab8c8b858bb5e3a720366e16_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Absolute_a4d057707c029a85947bcf9de8128ee5_Out_1_Float;
            Unity_Absolute_float(_Divide_58b01578ab8c8b858bb5e3a720366e16_Out_2_Float, _Absolute_a4d057707c029a85947bcf9de8128ee5_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Power_681b2745dbae62839624b98240ca04f7_Out_2_Float;
            Unity_Power_float(_Absolute_a4d057707c029a85947bcf9de8128ee5_Out_1_Float, _Subtract_9340fe9ac4518a8aa343888dc6143619_Out_2_Float, _Power_681b2745dbae62839624b98240ca04f7_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_7340c193c2d92c81ba9dd931235ba17f_Out_3_Float;
            Unity_Clamp_float(_Power_681b2745dbae62839624b98240ca04f7_Out_2_Float, float(0), float(2), _Clamp_7340c193c2d92c81ba9dd931235ba17f_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_7632a3e8aed6d38e88c7f4b8e72f85dc_Out_2_Float;
            Unity_Multiply_float_float(_Add_abe82f22f31b958eaf9f12f8db5f150d_Out_2_Float, _Clamp_7340c193c2d92c81ba9dd931235ba17f_Out_3_Float, _Multiply_7632a3e8aed6d38e88c7f4b8e72f85dc_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Saturate_0541c8e45c0d1e84acab0ae3a59218fa_Out_1_Float;
            Unity_Saturate_float(_Multiply_7632a3e8aed6d38e88c7f4b8e72f85dc_Out_2_Float, _Saturate_0541c8e45c0d1e84acab0ae3a59218fa_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_3b62dfdf4a729d8a9b33398bfdcff203_Out_3_Float;
            Unity_Clamp_float(_Add_abe82f22f31b958eaf9f12f8db5f150d_Out_2_Float, float(0), float(0.9999), _Clamp_3b62dfdf4a729d8a9b33398bfdcff203_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_2df9fd6ca8ecaa828f0edb7582ef5616_Out_0_Float = _Cover_Max_Angle;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_1e9d5df33719338ca266a822ae3e1c73_Out_2_Float;
            Unity_Divide_float(_Property_2df9fd6ca8ecaa828f0edb7582ef5616_Out_0_Float, float(45), _Divide_1e9d5df33719338ca266a822ae3e1c73_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_2d91255cf28d138db7f5edc0eed1ea86_Out_1_Float;
            Unity_OneMinus_float(_Divide_1e9d5df33719338ca266a822ae3e1c73_Out_2_Float, _OneMinus_2d91255cf28d138db7f5edc0eed1ea86_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Subtract_2ae31a316a35bf8882b8de8d71b44b9f_Out_2_Float;
            Unity_Subtract_float(_Clamp_3b62dfdf4a729d8a9b33398bfdcff203_Out_3_Float, _OneMinus_2d91255cf28d138db7f5edc0eed1ea86_Out_1_Float, _Subtract_2ae31a316a35bf8882b8de8d71b44b9f_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_a3af3696fa69dc8cb04a65e84a3c6c98_Out_3_Float;
            Unity_Clamp_float(_Subtract_2ae31a316a35bf8882b8de8d71b44b9f_Out_2_Float, float(0), float(2), _Clamp_a3af3696fa69dc8cb04a65e84a3c6c98_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_467a4be5b52daa80b2d4bf46d2f429c9_Out_2_Float;
            Unity_Divide_float(float(1), _Divide_1e9d5df33719338ca266a822ae3e1c73_Out_2_Float, _Divide_467a4be5b52daa80b2d4bf46d2f429c9_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_749d76436ed5e58abec68ae130db866b_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_a3af3696fa69dc8cb04a65e84a3c6c98_Out_3_Float, _Divide_467a4be5b52daa80b2d4bf46d2f429c9_Out_2_Float, _Multiply_749d76436ed5e58abec68ae130db866b_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Absolute_043a189b52847189ad0575955b41f403_Out_1_Float;
            Unity_Absolute_float(_Multiply_749d76436ed5e58abec68ae130db866b_Out_2_Float, _Absolute_043a189b52847189ad0575955b41f403_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_d4f4330ee4eced8d88fb074732401835_Out_0_Float = _CoverHardness;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Power_39a2971fc28ddc8e9f6d1423e692613d_Out_2_Float;
            Unity_Power_float(_Absolute_043a189b52847189ad0575955b41f403_Out_1_Float, _Property_d4f4330ee4eced8d88fb074732401835_Out_0_Float, _Power_39a2971fc28ddc8e9f6d1423e692613d_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_ecc3c7fdca2e938aa029cd0ff4fb9db6_Out_0_Float = _Cover_Min_Height;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_6fb68ea250dfc28b97bc87b4872d90b2_Out_1_Float;
            Unity_OneMinus_float(_Property_ecc3c7fdca2e938aa029cd0ff4fb9db6_Out_0_Float, _OneMinus_6fb68ea250dfc28b97bc87b4872d90b2_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_815418660959f184b10470e678ebae30_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
            float _Split_815418660959f184b10470e678ebae30_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
            float _Split_815418660959f184b10470e678ebae30_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
            float _Split_815418660959f184b10470e678ebae30_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_9c527d082534a687b4f0de2b26f2d04d_Out_2_Float;
            Unity_Add_float(_OneMinus_6fb68ea250dfc28b97bc87b4872d90b2_Out_1_Float, _Split_815418660959f184b10470e678ebae30_G_2_Float, _Add_9c527d082534a687b4f0de2b26f2d04d_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_9e2bffcd3cb38a83b04f8e67c5c96a06_Out_2_Float;
            Unity_Add_float(_Add_9c527d082534a687b4f0de2b26f2d04d_Out_2_Float, float(1), _Add_9e2bffcd3cb38a83b04f8e67c5c96a06_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_0d06020cc00e3887b95a3ebd8edd196f_Out_3_Float;
            Unity_Clamp_float(_Add_9e2bffcd3cb38a83b04f8e67c5c96a06_Out_2_Float, float(0), float(1), _Clamp_0d06020cc00e3887b95a3ebd8edd196f_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_6ec32fc8c4434e8b84cf41dd6b52dd34_Out_0_Float = _Cover_Min_Height_Blending;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_e57f70c02382b28397642f05af76cfb0_Out_2_Float;
            Unity_Add_float(_Add_9c527d082534a687b4f0de2b26f2d04d_Out_2_Float, _Property_6ec32fc8c4434e8b84cf41dd6b52dd34_Out_0_Float, _Add_e57f70c02382b28397642f05af76cfb0_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_94bc0a8d86daee888d2cd450fbf0d53e_Out_2_Float;
            Unity_Divide_float(_Add_e57f70c02382b28397642f05af76cfb0_Out_2_Float, _Add_9c527d082534a687b4f0de2b26f2d04d_Out_2_Float, _Divide_94bc0a8d86daee888d2cd450fbf0d53e_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_5447f70dbea44185b79c1ac1bb5ea4fa_Out_1_Float;
            Unity_OneMinus_float(_Divide_94bc0a8d86daee888d2cd450fbf0d53e_Out_2_Float, _OneMinus_5447f70dbea44185b79c1ac1bb5ea4fa_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_de674a5c5a1a348688c87f45d79cf9a1_Out_2_Float;
            Unity_Add_float(_OneMinus_5447f70dbea44185b79c1ac1bb5ea4fa_Out_1_Float, float(-0.5), _Add_de674a5c5a1a348688c87f45d79cf9a1_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_3244d6500fdd2c8a92b20a9929d61642_Out_3_Float;
            Unity_Clamp_float(_Add_de674a5c5a1a348688c87f45d79cf9a1_Out_2_Float, float(0), float(1), _Clamp_3244d6500fdd2c8a92b20a9929d61642_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_ea368e3c8a99368d917c930eb07b8e9f_Out_2_Float;
            Unity_Add_float(_Clamp_0d06020cc00e3887b95a3ebd8edd196f_Out_3_Float, _Clamp_3244d6500fdd2c8a92b20a9929d61642_Out_3_Float, _Add_ea368e3c8a99368d917c930eb07b8e9f_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_ce483c505aaa1f83b698a43bb22bf259_Out_3_Float;
            Unity_Clamp_float(_Add_ea368e3c8a99368d917c930eb07b8e9f_Out_2_Float, float(0), float(1), _Clamp_ce483c505aaa1f83b698a43bb22bf259_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_d1b58293be2e9982898e4a432bd61149_Out_2_Float;
            Unity_Multiply_float_float(_Power_39a2971fc28ddc8e9f6d1423e692613d_Out_2_Float, _Clamp_ce483c505aaa1f83b698a43bb22bf259_Out_3_Float, _Multiply_d1b58293be2e9982898e4a432bd61149_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_5336a32115eb29849650688fd99ee185_Out_2_Float;
            Unity_Multiply_float_float(_Saturate_0541c8e45c0d1e84acab0ae3a59218fa_Out_1_Float, _Multiply_d1b58293be2e9982898e4a432bd61149_Out_2_Float, _Multiply_5336a32115eb29849650688fd99ee185_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Lerp_f5ea06dcb1a8c58bac1ae497649cf333_Out_3_Vector3;
            Unity_Lerp_float3(_HeightBlend_a6bf16c3496e828984e7277239132d42_OutVector4_1_Vector3, _NormalStrength_51679ed1e0a0ef8aa01b53b035a4da51_Out_2_Vector3, (_Multiply_5336a32115eb29849650688fd99ee185_Out_2_Float.xxx), _Lerp_f5ea06dcb1a8c58bac1ae497649cf333_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Transform_9ae402175cd2148a9da0916d2d189ef9_Out_1_Vector3;
            {
                float3x3 tangentTransform = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
                _Transform_9ae402175cd2148a9da0916d2d189ef9_Out_1_Vector3 = TransformTangentToWorldDir(_Lerp_f5ea06dcb1a8c58bac1ae497649cf333_Out_3_Vector3.xyz, tangentTransform, true).xyz;
            }
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Multiply_d902e15376a26b8eac35506e85f63b36_Out_2_Vector3;
            Unity_Multiply_float3_float3(_Property_509761afcb3aad8f9a29405c122dbf08_Out_0_Vector3, _Transform_9ae402175cd2148a9da0916d2d189ef9_Out_1_Vector3, _Multiply_d902e15376a26b8eac35506e85f63b36_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_b821124768adb688becbc5d63b26adb4_R_1_Float = _Multiply_d902e15376a26b8eac35506e85f63b36_Out_2_Vector3[0];
            float _Split_b821124768adb688becbc5d63b26adb4_G_2_Float = _Multiply_d902e15376a26b8eac35506e85f63b36_Out_2_Vector3[1];
            float _Split_b821124768adb688becbc5d63b26adb4_B_3_Float = _Multiply_d902e15376a26b8eac35506e85f63b36_Out_2_Vector3[2];
            float _Split_b821124768adb688becbc5d63b26adb4_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_fd43b427bfe3748cb0ced35df3b22159_Out_2_Float;
            Unity_Add_float(_Split_b821124768adb688becbc5d63b26adb4_R_1_Float, _Split_b821124768adb688becbc5d63b26adb4_G_2_Float, _Add_fd43b427bfe3748cb0ced35df3b22159_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_508b788633abc0829f0843d1b1f942c2_Out_2_Float;
            Unity_Add_float(_Add_fd43b427bfe3748cb0ced35df3b22159_Out_2_Float, _Split_b821124768adb688becbc5d63b26adb4_B_3_Float, _Add_508b788633abc0829f0843d1b1f942c2_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_ad921fb726e47688a4d134f6fb3c2273_Out_2_Float;
            Unity_Multiply_float_float(_Add_508b788633abc0829f0843d1b1f942c2_Out_2_Float, _Clamp_7340c193c2d92c81ba9dd931235ba17f_Out_3_Float, _Multiply_ad921fb726e47688a4d134f6fb3c2273_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_90d91831d95dfc83b55e42e5746bd269_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_7340c193c2d92c81ba9dd931235ba17f_Out_3_Float, _Property_d4f4330ee4eced8d88fb074732401835_Out_0_Float, _Multiply_90d91831d95dfc83b55e42e5746bd269_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_b907f38702eabd80a6c67777243459de_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_90d91831d95dfc83b55e42e5746bd269_Out_2_Float, _Multiply_d1b58293be2e9982898e4a432bd61149_Out_2_Float, _Multiply_b907f38702eabd80a6c67777243459de_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_81bdd2734ef6c68fbc23ffe7409191b9_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_ad921fb726e47688a4d134f6fb3c2273_Out_2_Float, _Multiply_b907f38702eabd80a6c67777243459de_Out_2_Float, _Multiply_81bdd2734ef6c68fbc23ffe7409191b9_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_a0e97293ba0dfb83a0d87d28ef311bc7_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverMaskMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_9b6d5da081e434808a5840cbd915bb28;
            _TriplanarNM_9b6d5da081e434808a5840cbd915bb28.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_9b6d5da081e434808a5840cbd915bb28.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XYZ_1_Vector4;
            float4 _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XZ_2_Vector4;
            float4 _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_YZ_3_Vector4;
            float4 _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_a0e97293ba0dfb83a0d87d28ef311bc7_Out_0_Texture2D, (_Divide_ddaec3b56c9fc58ca3314b828c03b1c8_Out_2_Vector4).x, _Property_bf361924f27f848994241bda91fc2005_Out_0_Float, _TriplanarNM_9b6d5da081e434808a5840cbd915bb28, _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XYZ_1_Vector4, _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XZ_2_Vector4, _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_YZ_3_Vector4, _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_b20618c84cffd183aae7f27c2d0772cb_R_1_Float = _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XYZ_1_Vector4[0];
            float _Split_b20618c84cffd183aae7f27c2d0772cb_G_2_Float = _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XYZ_1_Vector4[1];
            float _Split_b20618c84cffd183aae7f27c2d0772cb_B_3_Float = _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XYZ_1_Vector4[2];
            float _Split_b20618c84cffd183aae7f27c2d0772cb_A_4_Float = _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XYZ_1_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_987a8037965fff81a4930627358fc6e3_Out_0_Float = _CoverHeightMapMin;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_89aeacdce0000086a98e45df79358a56_Out_0_Float = _CoverHeightMapMax;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_d18b9686bb8af48c85d99d319830c000_Out_0_Vector2 = float2(_Property_987a8037965fff81a4930627358fc6e3_Out_0_Float, _Property_89aeacdce0000086a98e45df79358a56_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_856fd4da5f3d1b8c9bdd6966daada2b2_Out_0_Float = _CoverHeightMapOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Add_935266d0fc26dc87a5909ea1bd8aa423_Out_2_Vector2;
            Unity_Add_float2(_Vector2_d18b9686bb8af48c85d99d319830c000_Out_0_Vector2, (_Property_856fd4da5f3d1b8c9bdd6966daada2b2_Out_0_Float.xx), _Add_935266d0fc26dc87a5909ea1bd8aa423_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_f85aa52613b0108d876fab409ea80b8c_Out_3_Float;
            Unity_Remap_float(_Split_b20618c84cffd183aae7f27c2d0772cb_B_3_Float, float2 (0, 1), _Add_935266d0fc26dc87a5909ea1bd8aa423_Out_2_Vector2, _Remap_f85aa52613b0108d876fab409ea80b8c_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_65b9c8cf3a459284a298aa84443140a2_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_81bdd2734ef6c68fbc23ffe7409191b9_Out_2_Float, _Remap_f85aa52613b0108d876fab409ea80b8c_Out_3_Float, _Multiply_65b9c8cf3a459284a298aa84443140a2_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_100e6799ca65308ca7cca7a0e52252db_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_65b9c8cf3a459284a298aa84443140a2_Out_2_Float, _Split_b4d08e724ec3df88ab7743c5b7a3f081_G_2_Float, _Multiply_100e6799ca65308ca7cca7a0e52252db_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Saturate_a340e45e54317a81ae145a84c72daa75_Out_1_Float;
            Unity_Saturate_float(_Multiply_100e6799ca65308ca7cca7a0e52252db_Out_2_Float, _Saturate_a340e45e54317a81ae145a84c72daa75_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_d8ca79d07c3bbe85b09000ed0e769324_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_7c0c867aaa1f5b8683768528b130a408_Out_3_Float, _Saturate_a340e45e54317a81ae145a84c72daa75_Out_1_Float, _Multiply_d8ca79d07c3bbe85b09000ed0e769324_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            #if defined(_USEDYNAMICCOVERTSTATICMASKF_ON)
            float _UseDynamicCoverTStaticMaskF_a32a3630501f778faf03be9cfccfec64_Out_0_Float = _Multiply_d8ca79d07c3bbe85b09000ed0e769324_Out_2_Float;
            #else
            float _UseDynamicCoverTStaticMaskF_a32a3630501f778faf03be9cfccfec64_Out_0_Float = _Clamp_7c0c867aaa1f5b8683768528b130a408_Out_3_Float;
            #endif
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Lerp_1ef9d67a29ba1b85a5434194628b76ad_Out_3_Vector3;
            Unity_Lerp_float3(_HeightBlend_a6bf16c3496e828984e7277239132d42_OutVector4_1_Vector3, _NormalStrength_d90a27c667bbb48e9e15ec520c3e2ff3_Out_2_Vector3, (_UseDynamicCoverTStaticMaskF_a32a3630501f778faf03be9cfccfec64_Out_0_Float.xxx), _Lerp_1ef9d67a29ba1b85a5434194628b76ad_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_d92b1410e1d6bc81a86076b09e35f302_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseColorMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579;
            _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4;
            float4 _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XZ_2_Vector4;
            float4 _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_YZ_3_Vector4;
            float4 _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_d92b1410e1d6bc81a86076b09e35f302_Out_0_Texture2D, (_Divide_c703c79d4bf76e8c9848ea2ecd29211f_Out_2_Vector4).x, _Property_b168be530d5b4082a2816fc835b55e19_Out_0_Float, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XZ_2_Vector4, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_YZ_3_Vector4, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_2f38c4b6e08da48093bd9896985f29eb_R_1_Float = _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4[0];
            float _Split_2f38c4b6e08da48093bd9896985f29eb_G_2_Float = _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4[1];
            float _Split_2f38c4b6e08da48093bd9896985f29eb_B_3_Float = _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4[2];
            float _Split_2f38c4b6e08da48093bd9896985f29eb_A_4_Float = _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_a55cb5b55044058c90b91c360cd49672_Out_0_Float = _AlphaCutoff;
            #endif
            surface.NormalTS = _Lerp_1ef9d67a29ba1b85a5434194628b76ad_Out_3_Vector3;
            surface.Alpha = _Split_2f38c4b6e08da48093bd9896985f29eb_A_4_Float;
            surface.AlphaClipThreshold = _Property_a55cb5b55044058c90b91c360cd49672_Out_0_Float;
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
        float4 _BaseTilingOffset;
        float _BaseTriplanarThreshold;
        float4 _BaseNormalMap_TexelSize;
        float _BaseNormalScale;
        float4 _BaseMaskMap_TexelSize;
        float _BaseMetallic;
        float _BaseAORemapMin;
        float _BaseAORemapMax;
        float _BaseSmoothnessRemapMin;
        float _BaseSmoothnessRemapMax;
        float4 _LayerMask_TexelSize;
        float _Invert_Layer_Mask;
        float _Height_Transition;
        float _HeightMin;
        float _HeightMax;
        float _HeightOffset;
        float _HeightMin2;
        float _HeightMax2;
        float _HeightOffset2;
        float4 _Base2Color;
        float4 _Base2ColorMap_TexelSize;
        float4 _Base2TilingOffset;
        float _Base2TriplanarThreshold;
        float4 _Base2NormalMap_TexelSize;
        float _Base2NormalScale;
        float4 _Base2MaskMap_TexelSize;
        float _Base2Metallic;
        float _Base2SmoothnessRemapMin;
        float _Base2SmoothnessRemapMax;
        float _Base2AORemapMin;
        float _Base2AORemapMax;
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
        TEXTURE2D(_LayerMask);
        SAMPLER(sampler_LayerMask);
        TEXTURE2D(_Base2ColorMap);
        SAMPLER(sampler_Base2ColorMap);
        TEXTURE2D(_Base2NormalMap);
        SAMPLER(sampler_Base2NormalMap);
        TEXTURE2D(_Base2MaskMap);
        SAMPLER(sampler_Base2MaskMap);
        TEXTURE2D(_CoverBaseColorMap);
        SAMPLER(sampler_CoverBaseColorMap);
        TEXTURE2D(_CoverNormalMap);
        SAMPLER(sampler_CoverNormalMap);
        TEXTURE2D(_CoverMaskMap);
        SAMPLER(sampler_CoverMaskMap);
        
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
        
        void Unity_Divide_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A / B;
        }
        
        void Unity_Combine_float(float R, float G, float B, float A, out float4 RGBA, out float3 RGB, out float2 RG)
        {
            RGBA = float4(R, G, B, A);
            RGB = float3(R, G, B);
            RG = float2(R, G);
        }
        
        void Unity_Multiply_float4_float4(float4 A, float4 B, out float4 Out)
        {
        Out = A * B;
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
        
        void Unity_Multiply_float_float(float A, float B, out float Out)
        {
        Out = A * B;
        }
        
        void Unity_Add_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A + B;
        }
        
        void Unity_Add_float(float A, float B, out float Out)
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
        
        void Unity_Add_float2(float2 A, float2 B, out float2 Out)
        {
            Out = A + B;
        }
        
        void Unity_Remap_float(float In, float2 InMinMax, float2 OutMinMax, out float Out)
        {
            Out = OutMinMax.x + (In - InMinMax.x) * (OutMinMax.y - OutMinMax.x) / (InMinMax.y - InMinMax.x);
        }
        
        void Unity_OneMinus_float(float In, out float Out)
        {
            Out = 1 - In;
        }
        
        void Unity_Branch_float(float Predicate, float True, float False, out float Out)
        {
            Out = Predicate ? True : False;
        }
        
        void Unity_Maximum_float(float A, float B, out float Out)
        {
            Out = max(A, B);
        }
        
        void Unity_Subtract_float(float A, float B, out float Out)
        {
            Out = A - B;
        }
        
        void Unity_Add_float3(float3 A, float3 B, out float3 Out)
        {
            Out = A + B;
        }
        
        void Unity_Divide_float3(float3 A, float3 B, out float3 Out)
        {
            Out = A / B;
        }
        
        struct Bindings_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float
        {
        };
        
        void SG_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float(float3 Vector3_88EEBB5E, float Vector1_DA0A37FA, float3 Vector3_79AA92F, float Vector1_F7E83F1E, float Vector1_1C9222A6, Bindings_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float IN, out float3 OutVector4_1)
        {
        float3 _Property_dd1c841a04c03f8c85e7b00eb025ecda_Out_0_Vector3 = Vector3_88EEBB5E;
        float _Property_14119cc7eaf4128f991283d47cf72d85_Out_0_Float = Vector1_DA0A37FA;
        float _Property_48af0ad45e3f7f82932b938695d21391_Out_0_Float = Vector1_DA0A37FA;
        float _Property_8a30b3ca12ff518fa473ccd686c7d503_Out_0_Float = Vector1_F7E83F1E;
        float _Maximum_c196e4a61637ea8381a3437c93f89ce2_Out_2_Float;
        Unity_Maximum_float(_Property_48af0ad45e3f7f82932b938695d21391_Out_0_Float, _Property_8a30b3ca12ff518fa473ccd686c7d503_Out_0_Float, _Maximum_c196e4a61637ea8381a3437c93f89ce2_Out_2_Float);
        float _Property_ee8d5fc69475d181be60c57e04ea8708_Out_0_Float = Vector1_1C9222A6;
        float _Subtract_61ca880c04c1758eb128f25c9faabd63_Out_2_Float;
        Unity_Subtract_float(_Maximum_c196e4a61637ea8381a3437c93f89ce2_Out_2_Float, _Property_ee8d5fc69475d181be60c57e04ea8708_Out_0_Float, _Subtract_61ca880c04c1758eb128f25c9faabd63_Out_2_Float);
        float _Subtract_e3a7713b556a1b8cb40aad97fc58d619_Out_2_Float;
        Unity_Subtract_float(_Property_14119cc7eaf4128f991283d47cf72d85_Out_0_Float, _Subtract_61ca880c04c1758eb128f25c9faabd63_Out_2_Float, _Subtract_e3a7713b556a1b8cb40aad97fc58d619_Out_2_Float);
        float _Maximum_d02e48d92038448cb0345e5cf3779071_Out_2_Float;
        Unity_Maximum_float(_Subtract_e3a7713b556a1b8cb40aad97fc58d619_Out_2_Float, float(0), _Maximum_d02e48d92038448cb0345e5cf3779071_Out_2_Float);
        float3 _Multiply_79b0b5d7d3528b8395e1135339a090f2_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Property_dd1c841a04c03f8c85e7b00eb025ecda_Out_0_Vector3, (_Maximum_d02e48d92038448cb0345e5cf3779071_Out_2_Float.xxx), _Multiply_79b0b5d7d3528b8395e1135339a090f2_Out_2_Vector3);
        float3 _Property_c7292b3b08585f8c8670172b9a220bf0_Out_0_Vector3 = Vector3_79AA92F;
        float _Property_5e920479576fad83ba1947728dcceab4_Out_0_Float = Vector1_F7E83F1E;
        float _Subtract_b7368f21be9e048aae7f90c8a2bfaae1_Out_2_Float;
        Unity_Subtract_float(_Property_5e920479576fad83ba1947728dcceab4_Out_0_Float, _Subtract_61ca880c04c1758eb128f25c9faabd63_Out_2_Float, _Subtract_b7368f21be9e048aae7f90c8a2bfaae1_Out_2_Float);
        float _Maximum_216777d30802328eab607c8fe68ba3a1_Out_2_Float;
        Unity_Maximum_float(_Subtract_b7368f21be9e048aae7f90c8a2bfaae1_Out_2_Float, float(0), _Maximum_216777d30802328eab607c8fe68ba3a1_Out_2_Float);
        float3 _Multiply_a856b52cd0848f86a6ae1af9b175935c_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Property_c7292b3b08585f8c8670172b9a220bf0_Out_0_Vector3, (_Maximum_216777d30802328eab607c8fe68ba3a1_Out_2_Float.xxx), _Multiply_a856b52cd0848f86a6ae1af9b175935c_Out_2_Vector3);
        float3 _Add_86c6109dc4530b8c9763ef62b056ad4c_Out_2_Vector3;
        Unity_Add_float3(_Multiply_79b0b5d7d3528b8395e1135339a090f2_Out_2_Vector3, _Multiply_a856b52cd0848f86a6ae1af9b175935c_Out_2_Vector3, _Add_86c6109dc4530b8c9763ef62b056ad4c_Out_2_Vector3);
        float _Add_356384b52728f583bd6e694bc1fc3738_Out_2_Float;
        Unity_Add_float(_Maximum_d02e48d92038448cb0345e5cf3779071_Out_2_Float, _Maximum_216777d30802328eab607c8fe68ba3a1_Out_2_Float, _Add_356384b52728f583bd6e694bc1fc3738_Out_2_Float);
        float _Maximum_94a22f5ceb706e88bc16350a5d5d2a82_Out_2_Float;
        Unity_Maximum_float(_Add_356384b52728f583bd6e694bc1fc3738_Out_2_Float, float(1E-05), _Maximum_94a22f5ceb706e88bc16350a5d5d2a82_Out_2_Float);
        float3 _Divide_d7291d1701d7058dbb5263194c1bed22_Out_2_Vector3;
        Unity_Divide_float3(_Add_86c6109dc4530b8c9763ef62b056ad4c_Out_2_Vector3, (_Maximum_94a22f5ceb706e88bc16350a5d5d2a82_Out_2_Float.xxx), _Divide_d7291d1701d7058dbb5263194c1bed22_Out_2_Vector3);
        OutVector4_1 = _Divide_d7291d1701d7058dbb5263194c1bed22_Out_2_Vector3;
        }
        
        void Unity_Clamp_float(float In, float Min, float Max, out float Out)
        {
            Out = clamp(In, Min, Max);
        }
        
        void Unity_Normalize_float3(float3 In, out float3 Out)
        {
            Out = normalize(In);
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
        
        void Unity_NormalStrength_float(float3 In, float Strength, out float3 Out)
        {
            Out = float3(In.rg * Strength, lerp(1, In.b, saturate(Strength)));
        }
        
        void Unity_Divide_float(float A, float B, out float Out)
        {
            Out = A / B;
        }
        
        void Unity_Absolute_float(float In, out float Out)
        {
            Out = abs(In);
        }
        
        void Unity_Power_float(float A, float B, out float Out)
        {
            Out = pow(A, B);
        }
        
        void Unity_Saturate_float(float In, out float Out)
        {
            Out = saturate(In);
        }
        
        void Unity_Lerp_float3(float3 A, float3 B, float3 T, out float3 Out)
        {
            Out = lerp(A, B, T);
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
            UnityTexture2D _Property_d92b1410e1d6bc81a86076b09e35f302_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseColorMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_d4a357b2daff5587ae46468726a33797_Out_0_Vector4 = _BaseTilingOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Divide_c703c79d4bf76e8c9848ea2ecd29211f_Out_2_Vector4;
            Unity_Divide_float4(float4(1, 1, 0, 0), _Property_d4a357b2daff5587ae46468726a33797_Out_0_Vector4, _Divide_c703c79d4bf76e8c9848ea2ecd29211f_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_b168be530d5b4082a2816fc835b55e19_Out_0_Float = _BaseTriplanarThreshold;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579;
            _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4;
            float4 _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XZ_2_Vector4;
            float4 _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_YZ_3_Vector4;
            float4 _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_d92b1410e1d6bc81a86076b09e35f302_Out_0_Texture2D, (_Divide_c703c79d4bf76e8c9848ea2ecd29211f_Out_2_Vector4).x, _Property_b168be530d5b4082a2816fc835b55e19_Out_0_Float, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XZ_2_Vector4, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_YZ_3_Vector4, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_17f0f1bec4ec6485881127275660d4f1_Out_0_Vector4 = _BaseColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Multiply_6434c1e27d77608fb8dcec94697eb8d3_Out_2_Vector4;
            Unity_Multiply_float4_float4(_TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4, _Property_17f0f1bec4ec6485881127275660d4f1_Out_0_Vector4, _Multiply_6434c1e27d77608fb8dcec94697eb8d3_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_080b6cb46abb00848263c964726eac36_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseMaskMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c;
            _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XYZ_1_Vector4;
            float4 _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XZ_2_Vector4;
            float4 _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_YZ_3_Vector4;
            float4 _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_080b6cb46abb00848263c964726eac36_Out_0_Texture2D, (_Divide_c703c79d4bf76e8c9848ea2ecd29211f_Out_2_Vector4).x, _Property_b168be530d5b4082a2816fc835b55e19_Out_0_Float, _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c, _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XYZ_1_Vector4, _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XZ_2_Vector4, _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_YZ_3_Vector4, _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_866a663ed067f988862843fe32765ff8_R_1_Float = _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XYZ_1_Vector4[0];
            float _Split_866a663ed067f988862843fe32765ff8_G_2_Float = _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XYZ_1_Vector4[1];
            float _Split_866a663ed067f988862843fe32765ff8_B_3_Float = _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XYZ_1_Vector4[2];
            float _Split_866a663ed067f988862843fe32765ff8_A_4_Float = _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XYZ_1_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_3b9891099f2f3e84b765eb453f6f6810_Out_0_Float = _HeightMin;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_bde21360babd9089a90a45cd2843925b_Out_0_Float = _HeightMax;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_9f8e90f51ffcfe8bb3d495766c0cabca_Out_0_Vector2 = float2(_Property_3b9891099f2f3e84b765eb453f6f6810_Out_0_Float, _Property_bde21360babd9089a90a45cd2843925b_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_6ff6d72f7b1d0083b4e4ce61e7e7c8d3_Out_0_Float = _HeightOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Add_39687f6bf7045086bc2d1ccf5f94c9de_Out_2_Vector2;
            Unity_Add_float2(_Vector2_9f8e90f51ffcfe8bb3d495766c0cabca_Out_0_Vector2, (_Property_6ff6d72f7b1d0083b4e4ce61e7e7c8d3_Out_0_Float.xx), _Add_39687f6bf7045086bc2d1ccf5f94c9de_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_ddc02d039a9d5388b8add0d2d673d4ac_Out_3_Float;
            Unity_Remap_float(_Split_866a663ed067f988862843fe32765ff8_B_3_Float, float2 (0, 1), _Add_39687f6bf7045086bc2d1ccf5f94c9de_Out_2_Vector2, _Remap_ddc02d039a9d5388b8add0d2d673d4ac_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_11586ef261ce8e87953046ff84ce22ab_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_Base2ColorMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_221c724b2137d58c8c387fee5b48be14_Out_0_Vector4 = _Base2TilingOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Divide_9f3f46254d5f7a8e87f60c4aa6f5522c_Out_2_Vector4;
            Unity_Divide_float4(float4(1, 1, 0, 0), _Property_221c724b2137d58c8c387fee5b48be14_Out_0_Vector4, _Divide_9f3f46254d5f7a8e87f60c4aa6f5522c_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_20f6a96f64098d87b850c83bc45ddcee_Out_0_Float = _Base2TriplanarThreshold;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_ca3aaaec266f85859b75e37163da7cba;
            _TriplanarNM_ca3aaaec266f85859b75e37163da7cba.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_ca3aaaec266f85859b75e37163da7cba.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_ca3aaaec266f85859b75e37163da7cba_XYZ_1_Vector4;
            float4 _TriplanarNM_ca3aaaec266f85859b75e37163da7cba_XZ_2_Vector4;
            float4 _TriplanarNM_ca3aaaec266f85859b75e37163da7cba_YZ_3_Vector4;
            float4 _TriplanarNM_ca3aaaec266f85859b75e37163da7cba_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_11586ef261ce8e87953046ff84ce22ab_Out_0_Texture2D, (_Divide_9f3f46254d5f7a8e87f60c4aa6f5522c_Out_2_Vector4).x, _Property_20f6a96f64098d87b850c83bc45ddcee_Out_0_Float, _TriplanarNM_ca3aaaec266f85859b75e37163da7cba, _TriplanarNM_ca3aaaec266f85859b75e37163da7cba_XYZ_1_Vector4, _TriplanarNM_ca3aaaec266f85859b75e37163da7cba_XZ_2_Vector4, _TriplanarNM_ca3aaaec266f85859b75e37163da7cba_YZ_3_Vector4, _TriplanarNM_ca3aaaec266f85859b75e37163da7cba_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_60dff9cc4310ea89874789591a78d84b_Out_0_Vector4 = _Base2Color;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Multiply_4d8e3ca1454e2d85963c9d240239a171_Out_2_Vector4;
            Unity_Multiply_float4_float4(_TriplanarNM_ca3aaaec266f85859b75e37163da7cba_XYZ_1_Vector4, _Property_60dff9cc4310ea89874789591a78d84b_Out_0_Vector4, _Multiply_4d8e3ca1454e2d85963c9d240239a171_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_312b653a29ccc087849b1493611fb73c_Out_0_Boolean = _Invert_Layer_Mask;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_1004d4c014377e8c8fa291ed748b9f84_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_LayerMask);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _SampleTexture2D_c910b4b42510578d81c16169d3cb5727_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_1004d4c014377e8c8fa291ed748b9f84_Out_0_Texture2D.tex, _Property_1004d4c014377e8c8fa291ed748b9f84_Out_0_Texture2D.samplerstate, _Property_1004d4c014377e8c8fa291ed748b9f84_Out_0_Texture2D.GetTransformedUV(IN.uv0.xy) );
            float _SampleTexture2D_c910b4b42510578d81c16169d3cb5727_R_4_Float = _SampleTexture2D_c910b4b42510578d81c16169d3cb5727_RGBA_0_Vector4.r;
            float _SampleTexture2D_c910b4b42510578d81c16169d3cb5727_G_5_Float = _SampleTexture2D_c910b4b42510578d81c16169d3cb5727_RGBA_0_Vector4.g;
            float _SampleTexture2D_c910b4b42510578d81c16169d3cb5727_B_6_Float = _SampleTexture2D_c910b4b42510578d81c16169d3cb5727_RGBA_0_Vector4.b;
            float _SampleTexture2D_c910b4b42510578d81c16169d3cb5727_A_7_Float = _SampleTexture2D_c910b4b42510578d81c16169d3cb5727_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_bc0b8885b596648d9b594130faa6585c_Out_1_Float;
            Unity_OneMinus_float(_SampleTexture2D_c910b4b42510578d81c16169d3cb5727_R_4_Float, _OneMinus_bc0b8885b596648d9b594130faa6585c_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Branch_6b7615e16629338ba87d3570a0096f66_Out_3_Float;
            Unity_Branch_float(_Property_312b653a29ccc087849b1493611fb73c_Out_0_Boolean, _OneMinus_bc0b8885b596648d9b594130faa6585c_Out_1_Float, _SampleTexture2D_c910b4b42510578d81c16169d3cb5727_R_4_Float, _Branch_6b7615e16629338ba87d3570a0096f66_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_b4749c77856157858fffde0aed55fc74_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_Base2MaskMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b;
            _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_XYZ_1_Vector4;
            float4 _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_XZ_2_Vector4;
            float4 _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_YZ_3_Vector4;
            float4 _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_b4749c77856157858fffde0aed55fc74_Out_0_Texture2D, (_Divide_9f3f46254d5f7a8e87f60c4aa6f5522c_Out_2_Vector4).x, _Property_20f6a96f64098d87b850c83bc45ddcee_Out_0_Float, _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b, _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_XYZ_1_Vector4, _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_XZ_2_Vector4, _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_YZ_3_Vector4, _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_0b441b86fba0ea80bc060dae9d7ed0d7_R_1_Float = _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_XYZ_1_Vector4[0];
            float _Split_0b441b86fba0ea80bc060dae9d7ed0d7_G_2_Float = _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_XYZ_1_Vector4[1];
            float _Split_0b441b86fba0ea80bc060dae9d7ed0d7_B_3_Float = _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_XYZ_1_Vector4[2];
            float _Split_0b441b86fba0ea80bc060dae9d7ed0d7_A_4_Float = _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_XYZ_1_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_c1de6a6321562383bfac4b318fc7b0d3_Out_0_Float = _HeightMin2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_145222f375008a879315637be0f172c5_Out_0_Float = _HeightMax2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_416c3ee3a60cc686b2d2360a073acfad_Out_0_Vector2 = float2(_Property_c1de6a6321562383bfac4b318fc7b0d3_Out_0_Float, _Property_145222f375008a879315637be0f172c5_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_8be924d801daee88b294af592a560e75_Out_0_Float = _HeightOffset2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Add_37703f1eb9ce078daaedca833705f5dd_Out_2_Vector2;
            Unity_Add_float2(_Vector2_416c3ee3a60cc686b2d2360a073acfad_Out_0_Vector2, (_Property_8be924d801daee88b294af592a560e75_Out_0_Float.xx), _Add_37703f1eb9ce078daaedca833705f5dd_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_5a8467f2416dc98699682a4cf64a69aa_Out_3_Float;
            Unity_Remap_float(_Split_0b441b86fba0ea80bc060dae9d7ed0d7_B_3_Float, float2 (0, 1), _Add_37703f1eb9ce078daaedca833705f5dd_Out_2_Vector2, _Remap_5a8467f2416dc98699682a4cf64a69aa_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_d9f42ca072d9188ab2566400157a199f_Out_2_Float;
            Unity_Multiply_float_float(_Branch_6b7615e16629338ba87d3570a0096f66_Out_3_Float, _Remap_5a8467f2416dc98699682a4cf64a69aa_Out_3_Float, _Multiply_d9f42ca072d9188ab2566400157a199f_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_b4d08e724ec3df88ab7743c5b7a3f081_R_1_Float = IN.VertexColor[0];
            float _Split_b4d08e724ec3df88ab7743c5b7a3f081_G_2_Float = IN.VertexColor[1];
            float _Split_b4d08e724ec3df88ab7743c5b7a3f081_B_3_Float = IN.VertexColor[2];
            float _Split_b4d08e724ec3df88ab7743c5b7a3f081_A_4_Float = IN.VertexColor[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_55cb55224306dc818a87a2dbf82d5af0_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_d9f42ca072d9188ab2566400157a199f_Out_2_Float, _Split_b4d08e724ec3df88ab7743c5b7a3f081_B_3_Float, _Multiply_55cb55224306dc818a87a2dbf82d5af0_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_c0dc9341fd635288a1c2869945617704_Out_0_Float = _Height_Transition;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float _HeightBlend_d30f443b26dc0d8087616105058c020a;
            float3 _HeightBlend_d30f443b26dc0d8087616105058c020a_OutVector4_1_Vector3;
            SG_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float((_Multiply_6434c1e27d77608fb8dcec94697eb8d3_Out_2_Vector4.xyz), _Remap_ddc02d039a9d5388b8add0d2d673d4ac_Out_3_Float, (_Multiply_4d8e3ca1454e2d85963c9d240239a171_Out_2_Vector4.xyz), _Multiply_55cb55224306dc818a87a2dbf82d5af0_Out_2_Float, _Property_c0dc9341fd635288a1c2869945617704_Out_0_Float, _HeightBlend_d30f443b26dc0d8087616105058c020a, _HeightBlend_d30f443b26dc0d8087616105058c020a_OutVector4_1_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_0b7ec0ec463cd88c8269ef0d2c98eb85_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverBaseColorMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_9bedb34aba10fa89a5f5b18919971491_Out_0_Vector4 = _CoverTilingOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Divide_ddaec3b56c9fc58ca3314b828c03b1c8_Out_2_Vector4;
            Unity_Divide_float4(float4(1, 1, 0, 0), _Property_9bedb34aba10fa89a5f5b18919971491_Out_0_Vector4, _Divide_ddaec3b56c9fc58ca3314b828c03b1c8_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_bf361924f27f848994241bda91fc2005_Out_0_Float = _CoverTriplanarThreshold;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793;
            _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XYZ_1_Vector4;
            float4 _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XZ_2_Vector4;
            float4 _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_YZ_3_Vector4;
            float4 _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_0b7ec0ec463cd88c8269ef0d2c98eb85_Out_0_Texture2D, (_Divide_ddaec3b56c9fc58ca3314b828c03b1c8_Out_2_Vector4).x, _Property_bf361924f27f848994241bda91fc2005_Out_0_Float, _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793, _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XYZ_1_Vector4, _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XZ_2_Vector4, _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_YZ_3_Vector4, _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_19547f2fe562798683b730e775cbfb39_Out_0_Vector4 = _CoverBaseColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Multiply_0652b80f60f8ed84beea389318719c9a_Out_2_Vector4;
            Unity_Multiply_float4_float4(_TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XYZ_1_Vector4, _Property_19547f2fe562798683b730e775cbfb39_Out_0_Vector4, _Multiply_0652b80f60f8ed84beea389318719c9a_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_ed6385cfee8242c58d906f36e90cb607_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverBaseColorMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _UV_13d53a8c036ded8490c69d17b7a3bb72_Out_0_Vector4 = IN.uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _SampleTexture2D_b8be215db546638398ea07060feb5224_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_ed6385cfee8242c58d906f36e90cb607_Out_0_Texture2D.tex, _Property_ed6385cfee8242c58d906f36e90cb607_Out_0_Texture2D.samplerstate, _Property_ed6385cfee8242c58d906f36e90cb607_Out_0_Texture2D.GetTransformedUV((_UV_13d53a8c036ded8490c69d17b7a3bb72_Out_0_Vector4.xy)) );
            float _SampleTexture2D_b8be215db546638398ea07060feb5224_R_4_Float = _SampleTexture2D_b8be215db546638398ea07060feb5224_RGBA_0_Vector4.r;
            float _SampleTexture2D_b8be215db546638398ea07060feb5224_G_5_Float = _SampleTexture2D_b8be215db546638398ea07060feb5224_RGBA_0_Vector4.g;
            float _SampleTexture2D_b8be215db546638398ea07060feb5224_B_6_Float = _SampleTexture2D_b8be215db546638398ea07060feb5224_RGBA_0_Vector4.b;
            float _SampleTexture2D_b8be215db546638398ea07060feb5224_A_7_Float = _SampleTexture2D_b8be215db546638398ea07060feb5224_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_b3ce556358f99f80ae9037fb175f4c5f_Out_0_Float = _CoverMaskPower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_ea35dd8ed2523f8b9a4c52fc52ecff0e_Out_2_Float;
            Unity_Multiply_float_float(_SampleTexture2D_b8be215db546638398ea07060feb5224_A_7_Float, _Property_b3ce556358f99f80ae9037fb175f4c5f_Out_0_Float, _Multiply_ea35dd8ed2523f8b9a4c52fc52ecff0e_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_7c0c867aaa1f5b8683768528b130a408_Out_3_Float;
            Unity_Clamp_float(_Multiply_ea35dd8ed2523f8b9a4c52fc52ecff0e_Out_2_Float, float(0), float(1), _Clamp_7c0c867aaa1f5b8683768528b130a408_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Property_509761afcb3aad8f9a29405c122dbf08_Out_0_Vector3 = _CoverDirection;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_72c615246e955087b85288c29905f048_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseNormalMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNMn_059da9746584140498cd018db3c76047_float _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0;
            _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0.WorldSpaceTangent = IN.WorldSpaceTangent;
            _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0.WorldSpacePosition = IN.WorldSpacePosition;
            float4 _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XYZ_1_Vector4;
            float4 _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XZ_2_Vector4;
            float4 _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_YZ_3_Vector4;
            float4 _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XY_4_Vector4;
            SG_TriplanarNMn_059da9746584140498cd018db3c76047_float(_Property_72c615246e955087b85288c29905f048_Out_0_Texture2D, (_Divide_c703c79d4bf76e8c9848ea2ecd29211f_Out_2_Vector4).x, _Property_b168be530d5b4082a2816fc835b55e19_Out_0_Float, _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0, _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XYZ_1_Vector4, _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XZ_2_Vector4, _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_YZ_3_Vector4, _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_7edd97bda70eb38a8c4253094700be37_Out_0_Float = _BaseNormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _NormalStrength_8bafa3d69de37c818a39fccf03db9518_Out_2_Vector3;
            Unity_NormalStrength_float((_TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XYZ_1_Vector4.xyz), _Property_7edd97bda70eb38a8c4253094700be37_Out_0_Float, _NormalStrength_8bafa3d69de37c818a39fccf03db9518_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_6809577d1aa24984aa957e13d0574602_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_Base2NormalMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNMn_059da9746584140498cd018db3c76047_float _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc;
            _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc.WorldSpaceTangent = IN.WorldSpaceTangent;
            _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc.WorldSpacePosition = IN.WorldSpacePosition;
            float4 _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc_XYZ_1_Vector4;
            float4 _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc_XZ_2_Vector4;
            float4 _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc_YZ_3_Vector4;
            float4 _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc_XY_4_Vector4;
            SG_TriplanarNMn_059da9746584140498cd018db3c76047_float(_Property_6809577d1aa24984aa957e13d0574602_Out_0_Texture2D, (_Divide_9f3f46254d5f7a8e87f60c4aa6f5522c_Out_2_Vector4).x, _Property_20f6a96f64098d87b850c83bc45ddcee_Out_0_Float, _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc, _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc_XYZ_1_Vector4, _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc_XZ_2_Vector4, _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc_YZ_3_Vector4, _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_c3260886a9a91b82a3d14c25e6fd0d2c_Out_0_Float = _Base2NormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _NormalStrength_d049a259d0377180a2e5959b925a78bc_Out_2_Vector3;
            Unity_NormalStrength_float((_TriplanarNMn_8890d23c68a4598d85a048422a8f36fc_XYZ_1_Vector4.xyz), _Property_c3260886a9a91b82a3d14c25e6fd0d2c_Out_0_Float, _NormalStrength_d049a259d0377180a2e5959b925a78bc_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float _HeightBlend_a6bf16c3496e828984e7277239132d42;
            float3 _HeightBlend_a6bf16c3496e828984e7277239132d42_OutVector4_1_Vector3;
            SG_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float(_NormalStrength_8bafa3d69de37c818a39fccf03db9518_Out_2_Vector3, _Remap_ddc02d039a9d5388b8add0d2d673d4ac_Out_3_Float, _NormalStrength_d049a259d0377180a2e5959b925a78bc_Out_2_Vector3, _Multiply_55cb55224306dc818a87a2dbf82d5af0_Out_2_Float, _Property_c0dc9341fd635288a1c2869945617704_Out_0_Float, _HeightBlend_a6bf16c3496e828984e7277239132d42, _HeightBlend_a6bf16c3496e828984e7277239132d42_OutVector4_1_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_1dcbde2a42b87e81bb254fd87a4816a5_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverNormalMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNMn_059da9746584140498cd018db3c76047_float _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58;
            _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58.WorldSpaceTangent = IN.WorldSpaceTangent;
            _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58.WorldSpacePosition = IN.WorldSpacePosition;
            float4 _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XYZ_1_Vector4;
            float4 _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XZ_2_Vector4;
            float4 _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_YZ_3_Vector4;
            float4 _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XY_4_Vector4;
            SG_TriplanarNMn_059da9746584140498cd018db3c76047_float(_Property_1dcbde2a42b87e81bb254fd87a4816a5_Out_0_Texture2D, (_Divide_ddaec3b56c9fc58ca3314b828c03b1c8_Out_2_Vector4).x, _Property_bf361924f27f848994241bda91fc2005_Out_0_Float, _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58, _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XYZ_1_Vector4, _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XZ_2_Vector4, _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_YZ_3_Vector4, _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_9176e0d3ea9ff88a9b888a200800b92d_Out_0_Float = _CoverNormalBlendHardness;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _NormalStrength_51679ed1e0a0ef8aa01b53b035a4da51_Out_2_Vector3;
            Unity_NormalStrength_float((_TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XYZ_1_Vector4.xyz), _Property_9176e0d3ea9ff88a9b888a200800b92d_Out_0_Float, _NormalStrength_51679ed1e0a0ef8aa01b53b035a4da51_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Multiply_ea6008eef104198ca40a18608c76d5a4_Out_2_Vector3;
            Unity_Multiply_float3_float3(_Property_509761afcb3aad8f9a29405c122dbf08_Out_0_Vector3, IN.WorldSpaceNormal, _Multiply_ea6008eef104198ca40a18608c76d5a4_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_e74c8f300b486e86a5700118b60b7885_R_1_Float = _Multiply_ea6008eef104198ca40a18608c76d5a4_Out_2_Vector3[0];
            float _Split_e74c8f300b486e86a5700118b60b7885_G_2_Float = _Multiply_ea6008eef104198ca40a18608c76d5a4_Out_2_Vector3[1];
            float _Split_e74c8f300b486e86a5700118b60b7885_B_3_Float = _Multiply_ea6008eef104198ca40a18608c76d5a4_Out_2_Vector3[2];
            float _Split_e74c8f300b486e86a5700118b60b7885_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_57be4f2ffc62ef89a9b736e6f1a99790_Out_2_Float;
            Unity_Add_float(_Split_e74c8f300b486e86a5700118b60b7885_R_1_Float, _Split_e74c8f300b486e86a5700118b60b7885_G_2_Float, _Add_57be4f2ffc62ef89a9b736e6f1a99790_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_abe82f22f31b958eaf9f12f8db5f150d_Out_2_Float;
            Unity_Add_float(_Add_57be4f2ffc62ef89a9b736e6f1a99790_Out_2_Float, _Split_e74c8f300b486e86a5700118b60b7885_B_3_Float, _Add_abe82f22f31b958eaf9f12f8db5f150d_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_ca7cc2d889a56683904c7546a72cedbf_Out_0_Float = _Cover_Amount;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_398a4ebc3d0302828e04c782fb4f49be_Out_0_Float = _Cover_Amount_Grow_Speed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Subtract_9340fe9ac4518a8aa343888dc6143619_Out_2_Float;
            Unity_Subtract_float(float(4), _Property_398a4ebc3d0302828e04c782fb4f49be_Out_0_Float, _Subtract_9340fe9ac4518a8aa343888dc6143619_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_58b01578ab8c8b858bb5e3a720366e16_Out_2_Float;
            Unity_Divide_float(_Property_ca7cc2d889a56683904c7546a72cedbf_Out_0_Float, _Subtract_9340fe9ac4518a8aa343888dc6143619_Out_2_Float, _Divide_58b01578ab8c8b858bb5e3a720366e16_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Absolute_a4d057707c029a85947bcf9de8128ee5_Out_1_Float;
            Unity_Absolute_float(_Divide_58b01578ab8c8b858bb5e3a720366e16_Out_2_Float, _Absolute_a4d057707c029a85947bcf9de8128ee5_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Power_681b2745dbae62839624b98240ca04f7_Out_2_Float;
            Unity_Power_float(_Absolute_a4d057707c029a85947bcf9de8128ee5_Out_1_Float, _Subtract_9340fe9ac4518a8aa343888dc6143619_Out_2_Float, _Power_681b2745dbae62839624b98240ca04f7_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_7340c193c2d92c81ba9dd931235ba17f_Out_3_Float;
            Unity_Clamp_float(_Power_681b2745dbae62839624b98240ca04f7_Out_2_Float, float(0), float(2), _Clamp_7340c193c2d92c81ba9dd931235ba17f_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_7632a3e8aed6d38e88c7f4b8e72f85dc_Out_2_Float;
            Unity_Multiply_float_float(_Add_abe82f22f31b958eaf9f12f8db5f150d_Out_2_Float, _Clamp_7340c193c2d92c81ba9dd931235ba17f_Out_3_Float, _Multiply_7632a3e8aed6d38e88c7f4b8e72f85dc_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Saturate_0541c8e45c0d1e84acab0ae3a59218fa_Out_1_Float;
            Unity_Saturate_float(_Multiply_7632a3e8aed6d38e88c7f4b8e72f85dc_Out_2_Float, _Saturate_0541c8e45c0d1e84acab0ae3a59218fa_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_3b62dfdf4a729d8a9b33398bfdcff203_Out_3_Float;
            Unity_Clamp_float(_Add_abe82f22f31b958eaf9f12f8db5f150d_Out_2_Float, float(0), float(0.9999), _Clamp_3b62dfdf4a729d8a9b33398bfdcff203_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_2df9fd6ca8ecaa828f0edb7582ef5616_Out_0_Float = _Cover_Max_Angle;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_1e9d5df33719338ca266a822ae3e1c73_Out_2_Float;
            Unity_Divide_float(_Property_2df9fd6ca8ecaa828f0edb7582ef5616_Out_0_Float, float(45), _Divide_1e9d5df33719338ca266a822ae3e1c73_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_2d91255cf28d138db7f5edc0eed1ea86_Out_1_Float;
            Unity_OneMinus_float(_Divide_1e9d5df33719338ca266a822ae3e1c73_Out_2_Float, _OneMinus_2d91255cf28d138db7f5edc0eed1ea86_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Subtract_2ae31a316a35bf8882b8de8d71b44b9f_Out_2_Float;
            Unity_Subtract_float(_Clamp_3b62dfdf4a729d8a9b33398bfdcff203_Out_3_Float, _OneMinus_2d91255cf28d138db7f5edc0eed1ea86_Out_1_Float, _Subtract_2ae31a316a35bf8882b8de8d71b44b9f_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_a3af3696fa69dc8cb04a65e84a3c6c98_Out_3_Float;
            Unity_Clamp_float(_Subtract_2ae31a316a35bf8882b8de8d71b44b9f_Out_2_Float, float(0), float(2), _Clamp_a3af3696fa69dc8cb04a65e84a3c6c98_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_467a4be5b52daa80b2d4bf46d2f429c9_Out_2_Float;
            Unity_Divide_float(float(1), _Divide_1e9d5df33719338ca266a822ae3e1c73_Out_2_Float, _Divide_467a4be5b52daa80b2d4bf46d2f429c9_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_749d76436ed5e58abec68ae130db866b_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_a3af3696fa69dc8cb04a65e84a3c6c98_Out_3_Float, _Divide_467a4be5b52daa80b2d4bf46d2f429c9_Out_2_Float, _Multiply_749d76436ed5e58abec68ae130db866b_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Absolute_043a189b52847189ad0575955b41f403_Out_1_Float;
            Unity_Absolute_float(_Multiply_749d76436ed5e58abec68ae130db866b_Out_2_Float, _Absolute_043a189b52847189ad0575955b41f403_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_d4f4330ee4eced8d88fb074732401835_Out_0_Float = _CoverHardness;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Power_39a2971fc28ddc8e9f6d1423e692613d_Out_2_Float;
            Unity_Power_float(_Absolute_043a189b52847189ad0575955b41f403_Out_1_Float, _Property_d4f4330ee4eced8d88fb074732401835_Out_0_Float, _Power_39a2971fc28ddc8e9f6d1423e692613d_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_ecc3c7fdca2e938aa029cd0ff4fb9db6_Out_0_Float = _Cover_Min_Height;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_6fb68ea250dfc28b97bc87b4872d90b2_Out_1_Float;
            Unity_OneMinus_float(_Property_ecc3c7fdca2e938aa029cd0ff4fb9db6_Out_0_Float, _OneMinus_6fb68ea250dfc28b97bc87b4872d90b2_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_815418660959f184b10470e678ebae30_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
            float _Split_815418660959f184b10470e678ebae30_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
            float _Split_815418660959f184b10470e678ebae30_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
            float _Split_815418660959f184b10470e678ebae30_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_9c527d082534a687b4f0de2b26f2d04d_Out_2_Float;
            Unity_Add_float(_OneMinus_6fb68ea250dfc28b97bc87b4872d90b2_Out_1_Float, _Split_815418660959f184b10470e678ebae30_G_2_Float, _Add_9c527d082534a687b4f0de2b26f2d04d_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_9e2bffcd3cb38a83b04f8e67c5c96a06_Out_2_Float;
            Unity_Add_float(_Add_9c527d082534a687b4f0de2b26f2d04d_Out_2_Float, float(1), _Add_9e2bffcd3cb38a83b04f8e67c5c96a06_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_0d06020cc00e3887b95a3ebd8edd196f_Out_3_Float;
            Unity_Clamp_float(_Add_9e2bffcd3cb38a83b04f8e67c5c96a06_Out_2_Float, float(0), float(1), _Clamp_0d06020cc00e3887b95a3ebd8edd196f_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_6ec32fc8c4434e8b84cf41dd6b52dd34_Out_0_Float = _Cover_Min_Height_Blending;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_e57f70c02382b28397642f05af76cfb0_Out_2_Float;
            Unity_Add_float(_Add_9c527d082534a687b4f0de2b26f2d04d_Out_2_Float, _Property_6ec32fc8c4434e8b84cf41dd6b52dd34_Out_0_Float, _Add_e57f70c02382b28397642f05af76cfb0_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_94bc0a8d86daee888d2cd450fbf0d53e_Out_2_Float;
            Unity_Divide_float(_Add_e57f70c02382b28397642f05af76cfb0_Out_2_Float, _Add_9c527d082534a687b4f0de2b26f2d04d_Out_2_Float, _Divide_94bc0a8d86daee888d2cd450fbf0d53e_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_5447f70dbea44185b79c1ac1bb5ea4fa_Out_1_Float;
            Unity_OneMinus_float(_Divide_94bc0a8d86daee888d2cd450fbf0d53e_Out_2_Float, _OneMinus_5447f70dbea44185b79c1ac1bb5ea4fa_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_de674a5c5a1a348688c87f45d79cf9a1_Out_2_Float;
            Unity_Add_float(_OneMinus_5447f70dbea44185b79c1ac1bb5ea4fa_Out_1_Float, float(-0.5), _Add_de674a5c5a1a348688c87f45d79cf9a1_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_3244d6500fdd2c8a92b20a9929d61642_Out_3_Float;
            Unity_Clamp_float(_Add_de674a5c5a1a348688c87f45d79cf9a1_Out_2_Float, float(0), float(1), _Clamp_3244d6500fdd2c8a92b20a9929d61642_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_ea368e3c8a99368d917c930eb07b8e9f_Out_2_Float;
            Unity_Add_float(_Clamp_0d06020cc00e3887b95a3ebd8edd196f_Out_3_Float, _Clamp_3244d6500fdd2c8a92b20a9929d61642_Out_3_Float, _Add_ea368e3c8a99368d917c930eb07b8e9f_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_ce483c505aaa1f83b698a43bb22bf259_Out_3_Float;
            Unity_Clamp_float(_Add_ea368e3c8a99368d917c930eb07b8e9f_Out_2_Float, float(0), float(1), _Clamp_ce483c505aaa1f83b698a43bb22bf259_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_d1b58293be2e9982898e4a432bd61149_Out_2_Float;
            Unity_Multiply_float_float(_Power_39a2971fc28ddc8e9f6d1423e692613d_Out_2_Float, _Clamp_ce483c505aaa1f83b698a43bb22bf259_Out_3_Float, _Multiply_d1b58293be2e9982898e4a432bd61149_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_5336a32115eb29849650688fd99ee185_Out_2_Float;
            Unity_Multiply_float_float(_Saturate_0541c8e45c0d1e84acab0ae3a59218fa_Out_1_Float, _Multiply_d1b58293be2e9982898e4a432bd61149_Out_2_Float, _Multiply_5336a32115eb29849650688fd99ee185_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Lerp_f5ea06dcb1a8c58bac1ae497649cf333_Out_3_Vector3;
            Unity_Lerp_float3(_HeightBlend_a6bf16c3496e828984e7277239132d42_OutVector4_1_Vector3, _NormalStrength_51679ed1e0a0ef8aa01b53b035a4da51_Out_2_Vector3, (_Multiply_5336a32115eb29849650688fd99ee185_Out_2_Float.xxx), _Lerp_f5ea06dcb1a8c58bac1ae497649cf333_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Transform_9ae402175cd2148a9da0916d2d189ef9_Out_1_Vector3;
            {
                float3x3 tangentTransform = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
                _Transform_9ae402175cd2148a9da0916d2d189ef9_Out_1_Vector3 = TransformTangentToWorldDir(_Lerp_f5ea06dcb1a8c58bac1ae497649cf333_Out_3_Vector3.xyz, tangentTransform, true).xyz;
            }
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Multiply_d902e15376a26b8eac35506e85f63b36_Out_2_Vector3;
            Unity_Multiply_float3_float3(_Property_509761afcb3aad8f9a29405c122dbf08_Out_0_Vector3, _Transform_9ae402175cd2148a9da0916d2d189ef9_Out_1_Vector3, _Multiply_d902e15376a26b8eac35506e85f63b36_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_b821124768adb688becbc5d63b26adb4_R_1_Float = _Multiply_d902e15376a26b8eac35506e85f63b36_Out_2_Vector3[0];
            float _Split_b821124768adb688becbc5d63b26adb4_G_2_Float = _Multiply_d902e15376a26b8eac35506e85f63b36_Out_2_Vector3[1];
            float _Split_b821124768adb688becbc5d63b26adb4_B_3_Float = _Multiply_d902e15376a26b8eac35506e85f63b36_Out_2_Vector3[2];
            float _Split_b821124768adb688becbc5d63b26adb4_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_fd43b427bfe3748cb0ced35df3b22159_Out_2_Float;
            Unity_Add_float(_Split_b821124768adb688becbc5d63b26adb4_R_1_Float, _Split_b821124768adb688becbc5d63b26adb4_G_2_Float, _Add_fd43b427bfe3748cb0ced35df3b22159_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_508b788633abc0829f0843d1b1f942c2_Out_2_Float;
            Unity_Add_float(_Add_fd43b427bfe3748cb0ced35df3b22159_Out_2_Float, _Split_b821124768adb688becbc5d63b26adb4_B_3_Float, _Add_508b788633abc0829f0843d1b1f942c2_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_ad921fb726e47688a4d134f6fb3c2273_Out_2_Float;
            Unity_Multiply_float_float(_Add_508b788633abc0829f0843d1b1f942c2_Out_2_Float, _Clamp_7340c193c2d92c81ba9dd931235ba17f_Out_3_Float, _Multiply_ad921fb726e47688a4d134f6fb3c2273_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_90d91831d95dfc83b55e42e5746bd269_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_7340c193c2d92c81ba9dd931235ba17f_Out_3_Float, _Property_d4f4330ee4eced8d88fb074732401835_Out_0_Float, _Multiply_90d91831d95dfc83b55e42e5746bd269_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_b907f38702eabd80a6c67777243459de_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_90d91831d95dfc83b55e42e5746bd269_Out_2_Float, _Multiply_d1b58293be2e9982898e4a432bd61149_Out_2_Float, _Multiply_b907f38702eabd80a6c67777243459de_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_81bdd2734ef6c68fbc23ffe7409191b9_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_ad921fb726e47688a4d134f6fb3c2273_Out_2_Float, _Multiply_b907f38702eabd80a6c67777243459de_Out_2_Float, _Multiply_81bdd2734ef6c68fbc23ffe7409191b9_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_a0e97293ba0dfb83a0d87d28ef311bc7_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverMaskMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_9b6d5da081e434808a5840cbd915bb28;
            _TriplanarNM_9b6d5da081e434808a5840cbd915bb28.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_9b6d5da081e434808a5840cbd915bb28.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XYZ_1_Vector4;
            float4 _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XZ_2_Vector4;
            float4 _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_YZ_3_Vector4;
            float4 _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_a0e97293ba0dfb83a0d87d28ef311bc7_Out_0_Texture2D, (_Divide_ddaec3b56c9fc58ca3314b828c03b1c8_Out_2_Vector4).x, _Property_bf361924f27f848994241bda91fc2005_Out_0_Float, _TriplanarNM_9b6d5da081e434808a5840cbd915bb28, _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XYZ_1_Vector4, _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XZ_2_Vector4, _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_YZ_3_Vector4, _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_b20618c84cffd183aae7f27c2d0772cb_R_1_Float = _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XYZ_1_Vector4[0];
            float _Split_b20618c84cffd183aae7f27c2d0772cb_G_2_Float = _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XYZ_1_Vector4[1];
            float _Split_b20618c84cffd183aae7f27c2d0772cb_B_3_Float = _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XYZ_1_Vector4[2];
            float _Split_b20618c84cffd183aae7f27c2d0772cb_A_4_Float = _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XYZ_1_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_987a8037965fff81a4930627358fc6e3_Out_0_Float = _CoverHeightMapMin;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_89aeacdce0000086a98e45df79358a56_Out_0_Float = _CoverHeightMapMax;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_d18b9686bb8af48c85d99d319830c000_Out_0_Vector2 = float2(_Property_987a8037965fff81a4930627358fc6e3_Out_0_Float, _Property_89aeacdce0000086a98e45df79358a56_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_856fd4da5f3d1b8c9bdd6966daada2b2_Out_0_Float = _CoverHeightMapOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Add_935266d0fc26dc87a5909ea1bd8aa423_Out_2_Vector2;
            Unity_Add_float2(_Vector2_d18b9686bb8af48c85d99d319830c000_Out_0_Vector2, (_Property_856fd4da5f3d1b8c9bdd6966daada2b2_Out_0_Float.xx), _Add_935266d0fc26dc87a5909ea1bd8aa423_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_f85aa52613b0108d876fab409ea80b8c_Out_3_Float;
            Unity_Remap_float(_Split_b20618c84cffd183aae7f27c2d0772cb_B_3_Float, float2 (0, 1), _Add_935266d0fc26dc87a5909ea1bd8aa423_Out_2_Vector2, _Remap_f85aa52613b0108d876fab409ea80b8c_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_65b9c8cf3a459284a298aa84443140a2_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_81bdd2734ef6c68fbc23ffe7409191b9_Out_2_Float, _Remap_f85aa52613b0108d876fab409ea80b8c_Out_3_Float, _Multiply_65b9c8cf3a459284a298aa84443140a2_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_100e6799ca65308ca7cca7a0e52252db_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_65b9c8cf3a459284a298aa84443140a2_Out_2_Float, _Split_b4d08e724ec3df88ab7743c5b7a3f081_G_2_Float, _Multiply_100e6799ca65308ca7cca7a0e52252db_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Saturate_a340e45e54317a81ae145a84c72daa75_Out_1_Float;
            Unity_Saturate_float(_Multiply_100e6799ca65308ca7cca7a0e52252db_Out_2_Float, _Saturate_a340e45e54317a81ae145a84c72daa75_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_d8ca79d07c3bbe85b09000ed0e769324_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_7c0c867aaa1f5b8683768528b130a408_Out_3_Float, _Saturate_a340e45e54317a81ae145a84c72daa75_Out_1_Float, _Multiply_d8ca79d07c3bbe85b09000ed0e769324_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            #if defined(_USEDYNAMICCOVERTSTATICMASKF_ON)
            float _UseDynamicCoverTStaticMaskF_a32a3630501f778faf03be9cfccfec64_Out_0_Float = _Multiply_d8ca79d07c3bbe85b09000ed0e769324_Out_2_Float;
            #else
            float _UseDynamicCoverTStaticMaskF_a32a3630501f778faf03be9cfccfec64_Out_0_Float = _Clamp_7c0c867aaa1f5b8683768528b130a408_Out_3_Float;
            #endif
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Lerp_7b425abcb4dfd0859d63f71a714fbb7d_Out_3_Vector3;
            Unity_Lerp_float3(_HeightBlend_d30f443b26dc0d8087616105058c020a_OutVector4_1_Vector3, (_Multiply_0652b80f60f8ed84beea389318719c9a_Out_2_Vector4.xyz), (_UseDynamicCoverTStaticMaskF_a32a3630501f778faf03be9cfccfec64_Out_0_Float.xxx), _Lerp_7b425abcb4dfd0859d63f71a714fbb7d_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_2ff5681ef4527d809ef09fdc5f8ef937_Out_0_Vector4 = _WetColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Multiply_85d9904c4b12ce85939f7948252c76b2_Out_2_Vector3;
            Unity_Multiply_float3_float3((_Property_2ff5681ef4527d809ef09fdc5f8ef937_Out_0_Vector4.xyz), _Lerp_7b425abcb4dfd0859d63f71a714fbb7d_Out_3_Vector3, _Multiply_85d9904c4b12ce85939f7948252c76b2_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_f1784d825dacdb8785770d3eca446428_Out_1_Float;
            Unity_OneMinus_float(_Split_b4d08e724ec3df88ab7743c5b7a3f081_R_1_Float, _OneMinus_f1784d825dacdb8785770d3eca446428_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Lerp_f330c9b8f318a885ac2822e63f9269e8_Out_3_Vector3;
            Unity_Lerp_float3(_Lerp_7b425abcb4dfd0859d63f71a714fbb7d_Out_3_Vector3, _Multiply_85d9904c4b12ce85939f7948252c76b2_Out_2_Vector3, (_OneMinus_f1784d825dacdb8785770d3eca446428_Out_1_Float.xxx), _Lerp_f330c9b8f318a885ac2822e63f9269e8_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_2f38c4b6e08da48093bd9896985f29eb_R_1_Float = _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4[0];
            float _Split_2f38c4b6e08da48093bd9896985f29eb_G_2_Float = _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4[1];
            float _Split_2f38c4b6e08da48093bd9896985f29eb_B_3_Float = _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4[2];
            float _Split_2f38c4b6e08da48093bd9896985f29eb_A_4_Float = _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_a55cb5b55044058c90b91c360cd49672_Out_0_Float = _AlphaCutoff;
            #endif
            surface.BaseColor = _Lerp_f330c9b8f318a885ac2822e63f9269e8_Out_3_Vector3;
            surface.Emission = float3(0, 0, 0);
            surface.Alpha = _Split_2f38c4b6e08da48093bd9896985f29eb_A_4_Float;
            surface.AlphaClipThreshold = _Property_a55cb5b55044058c90b91c360cd49672_Out_0_Float;
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
             float3 AbsoluteWorldSpacePosition;
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
             float3 positionWS : INTERP0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 normalWS : INTERP1;
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
        float4 _BaseTilingOffset;
        float _BaseTriplanarThreshold;
        float4 _BaseNormalMap_TexelSize;
        float _BaseNormalScale;
        float4 _BaseMaskMap_TexelSize;
        float _BaseMetallic;
        float _BaseAORemapMin;
        float _BaseAORemapMax;
        float _BaseSmoothnessRemapMin;
        float _BaseSmoothnessRemapMax;
        float4 _LayerMask_TexelSize;
        float _Invert_Layer_Mask;
        float _Height_Transition;
        float _HeightMin;
        float _HeightMax;
        float _HeightOffset;
        float _HeightMin2;
        float _HeightMax2;
        float _HeightOffset2;
        float4 _Base2Color;
        float4 _Base2ColorMap_TexelSize;
        float4 _Base2TilingOffset;
        float _Base2TriplanarThreshold;
        float4 _Base2NormalMap_TexelSize;
        float _Base2NormalScale;
        float4 _Base2MaskMap_TexelSize;
        float _Base2Metallic;
        float _Base2SmoothnessRemapMin;
        float _Base2SmoothnessRemapMax;
        float _Base2AORemapMin;
        float _Base2AORemapMax;
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
        TEXTURE2D(_LayerMask);
        SAMPLER(sampler_LayerMask);
        TEXTURE2D(_Base2ColorMap);
        SAMPLER(sampler_Base2ColorMap);
        TEXTURE2D(_Base2NormalMap);
        SAMPLER(sampler_Base2NormalMap);
        TEXTURE2D(_Base2MaskMap);
        SAMPLER(sampler_Base2MaskMap);
        TEXTURE2D(_CoverBaseColorMap);
        SAMPLER(sampler_CoverBaseColorMap);
        TEXTURE2D(_CoverNormalMap);
        SAMPLER(sampler_CoverNormalMap);
        TEXTURE2D(_CoverMaskMap);
        SAMPLER(sampler_CoverMaskMap);
        
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
        
        void Unity_Divide_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A / B;
        }
        
        void Unity_Combine_float(float R, float G, float B, float A, out float4 RGBA, out float3 RGB, out float2 RG)
        {
            RGBA = float4(R, G, B, A);
            RGB = float3(R, G, B);
            RG = float2(R, G);
        }
        
        void Unity_Multiply_float4_float4(float4 A, float4 B, out float4 Out)
        {
        Out = A * B;
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
        
        void Unity_Multiply_float_float(float A, float B, out float Out)
        {
        Out = A * B;
        }
        
        void Unity_Add_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A + B;
        }
        
        void Unity_Add_float(float A, float B, out float Out)
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
            UnityTexture2D _Property_d92b1410e1d6bc81a86076b09e35f302_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseColorMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_d4a357b2daff5587ae46468726a33797_Out_0_Vector4 = _BaseTilingOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Divide_c703c79d4bf76e8c9848ea2ecd29211f_Out_2_Vector4;
            Unity_Divide_float4(float4(1, 1, 0, 0), _Property_d4a357b2daff5587ae46468726a33797_Out_0_Vector4, _Divide_c703c79d4bf76e8c9848ea2ecd29211f_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_b168be530d5b4082a2816fc835b55e19_Out_0_Float = _BaseTriplanarThreshold;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579;
            _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4;
            float4 _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XZ_2_Vector4;
            float4 _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_YZ_3_Vector4;
            float4 _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_d92b1410e1d6bc81a86076b09e35f302_Out_0_Texture2D, (_Divide_c703c79d4bf76e8c9848ea2ecd29211f_Out_2_Vector4).x, _Property_b168be530d5b4082a2816fc835b55e19_Out_0_Float, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XZ_2_Vector4, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_YZ_3_Vector4, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_2f38c4b6e08da48093bd9896985f29eb_R_1_Float = _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4[0];
            float _Split_2f38c4b6e08da48093bd9896985f29eb_G_2_Float = _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4[1];
            float _Split_2f38c4b6e08da48093bd9896985f29eb_B_3_Float = _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4[2];
            float _Split_2f38c4b6e08da48093bd9896985f29eb_A_4_Float = _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_a55cb5b55044058c90b91c360cd49672_Out_0_Float = _AlphaCutoff;
            #endif
            surface.Alpha = _Split_2f38c4b6e08da48093bd9896985f29eb_A_4_Float;
            surface.AlphaClipThreshold = _Property_a55cb5b55044058c90b91c360cd49672_Out_0_Float;
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
        output.WorldSpaceNormal = renormFactor * input.normalWS.xyz;      // we want a unit length Normal Vector node in shader graph
        #endif
        
        
        
        #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
        output.AbsoluteWorldSpacePosition = GetAbsolutePositionWS(input.positionWS);
        #endif
        
        
            #if UNITY_UV_STARTS_AT_TOP
            #else
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
             float4 color : INTERP2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 positionWS : INTERP3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 normalWS : INTERP4;
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
        float4 _BaseTilingOffset;
        float _BaseTriplanarThreshold;
        float4 _BaseNormalMap_TexelSize;
        float _BaseNormalScale;
        float4 _BaseMaskMap_TexelSize;
        float _BaseMetallic;
        float _BaseAORemapMin;
        float _BaseAORemapMax;
        float _BaseSmoothnessRemapMin;
        float _BaseSmoothnessRemapMax;
        float4 _LayerMask_TexelSize;
        float _Invert_Layer_Mask;
        float _Height_Transition;
        float _HeightMin;
        float _HeightMax;
        float _HeightOffset;
        float _HeightMin2;
        float _HeightMax2;
        float _HeightOffset2;
        float4 _Base2Color;
        float4 _Base2ColorMap_TexelSize;
        float4 _Base2TilingOffset;
        float _Base2TriplanarThreshold;
        float4 _Base2NormalMap_TexelSize;
        float _Base2NormalScale;
        float4 _Base2MaskMap_TexelSize;
        float _Base2Metallic;
        float _Base2SmoothnessRemapMin;
        float _Base2SmoothnessRemapMax;
        float _Base2AORemapMin;
        float _Base2AORemapMax;
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
        TEXTURE2D(_LayerMask);
        SAMPLER(sampler_LayerMask);
        TEXTURE2D(_Base2ColorMap);
        SAMPLER(sampler_Base2ColorMap);
        TEXTURE2D(_Base2NormalMap);
        SAMPLER(sampler_Base2NormalMap);
        TEXTURE2D(_Base2MaskMap);
        SAMPLER(sampler_Base2MaskMap);
        TEXTURE2D(_CoverBaseColorMap);
        SAMPLER(sampler_CoverBaseColorMap);
        TEXTURE2D(_CoverNormalMap);
        SAMPLER(sampler_CoverNormalMap);
        TEXTURE2D(_CoverMaskMap);
        SAMPLER(sampler_CoverMaskMap);
        
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
        
        void Unity_Divide_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A / B;
        }
        
        void Unity_Combine_float(float R, float G, float B, float A, out float4 RGBA, out float3 RGB, out float2 RG)
        {
            RGBA = float4(R, G, B, A);
            RGB = float3(R, G, B);
            RG = float2(R, G);
        }
        
        void Unity_Multiply_float4_float4(float4 A, float4 B, out float4 Out)
        {
        Out = A * B;
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
        
        void Unity_Multiply_float_float(float A, float B, out float Out)
        {
        Out = A * B;
        }
        
        void Unity_Add_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A + B;
        }
        
        void Unity_Add_float(float A, float B, out float Out)
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
        
        void Unity_Add_float2(float2 A, float2 B, out float2 Out)
        {
            Out = A + B;
        }
        
        void Unity_Remap_float(float In, float2 InMinMax, float2 OutMinMax, out float Out)
        {
            Out = OutMinMax.x + (In - InMinMax.x) * (OutMinMax.y - OutMinMax.x) / (InMinMax.y - InMinMax.x);
        }
        
        void Unity_OneMinus_float(float In, out float Out)
        {
            Out = 1 - In;
        }
        
        void Unity_Branch_float(float Predicate, float True, float False, out float Out)
        {
            Out = Predicate ? True : False;
        }
        
        void Unity_Maximum_float(float A, float B, out float Out)
        {
            Out = max(A, B);
        }
        
        void Unity_Subtract_float(float A, float B, out float Out)
        {
            Out = A - B;
        }
        
        void Unity_Add_float3(float3 A, float3 B, out float3 Out)
        {
            Out = A + B;
        }
        
        void Unity_Divide_float3(float3 A, float3 B, out float3 Out)
        {
            Out = A / B;
        }
        
        struct Bindings_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float
        {
        };
        
        void SG_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float(float3 Vector3_88EEBB5E, float Vector1_DA0A37FA, float3 Vector3_79AA92F, float Vector1_F7E83F1E, float Vector1_1C9222A6, Bindings_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float IN, out float3 OutVector4_1)
        {
        float3 _Property_dd1c841a04c03f8c85e7b00eb025ecda_Out_0_Vector3 = Vector3_88EEBB5E;
        float _Property_14119cc7eaf4128f991283d47cf72d85_Out_0_Float = Vector1_DA0A37FA;
        float _Property_48af0ad45e3f7f82932b938695d21391_Out_0_Float = Vector1_DA0A37FA;
        float _Property_8a30b3ca12ff518fa473ccd686c7d503_Out_0_Float = Vector1_F7E83F1E;
        float _Maximum_c196e4a61637ea8381a3437c93f89ce2_Out_2_Float;
        Unity_Maximum_float(_Property_48af0ad45e3f7f82932b938695d21391_Out_0_Float, _Property_8a30b3ca12ff518fa473ccd686c7d503_Out_0_Float, _Maximum_c196e4a61637ea8381a3437c93f89ce2_Out_2_Float);
        float _Property_ee8d5fc69475d181be60c57e04ea8708_Out_0_Float = Vector1_1C9222A6;
        float _Subtract_61ca880c04c1758eb128f25c9faabd63_Out_2_Float;
        Unity_Subtract_float(_Maximum_c196e4a61637ea8381a3437c93f89ce2_Out_2_Float, _Property_ee8d5fc69475d181be60c57e04ea8708_Out_0_Float, _Subtract_61ca880c04c1758eb128f25c9faabd63_Out_2_Float);
        float _Subtract_e3a7713b556a1b8cb40aad97fc58d619_Out_2_Float;
        Unity_Subtract_float(_Property_14119cc7eaf4128f991283d47cf72d85_Out_0_Float, _Subtract_61ca880c04c1758eb128f25c9faabd63_Out_2_Float, _Subtract_e3a7713b556a1b8cb40aad97fc58d619_Out_2_Float);
        float _Maximum_d02e48d92038448cb0345e5cf3779071_Out_2_Float;
        Unity_Maximum_float(_Subtract_e3a7713b556a1b8cb40aad97fc58d619_Out_2_Float, float(0), _Maximum_d02e48d92038448cb0345e5cf3779071_Out_2_Float);
        float3 _Multiply_79b0b5d7d3528b8395e1135339a090f2_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Property_dd1c841a04c03f8c85e7b00eb025ecda_Out_0_Vector3, (_Maximum_d02e48d92038448cb0345e5cf3779071_Out_2_Float.xxx), _Multiply_79b0b5d7d3528b8395e1135339a090f2_Out_2_Vector3);
        float3 _Property_c7292b3b08585f8c8670172b9a220bf0_Out_0_Vector3 = Vector3_79AA92F;
        float _Property_5e920479576fad83ba1947728dcceab4_Out_0_Float = Vector1_F7E83F1E;
        float _Subtract_b7368f21be9e048aae7f90c8a2bfaae1_Out_2_Float;
        Unity_Subtract_float(_Property_5e920479576fad83ba1947728dcceab4_Out_0_Float, _Subtract_61ca880c04c1758eb128f25c9faabd63_Out_2_Float, _Subtract_b7368f21be9e048aae7f90c8a2bfaae1_Out_2_Float);
        float _Maximum_216777d30802328eab607c8fe68ba3a1_Out_2_Float;
        Unity_Maximum_float(_Subtract_b7368f21be9e048aae7f90c8a2bfaae1_Out_2_Float, float(0), _Maximum_216777d30802328eab607c8fe68ba3a1_Out_2_Float);
        float3 _Multiply_a856b52cd0848f86a6ae1af9b175935c_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Property_c7292b3b08585f8c8670172b9a220bf0_Out_0_Vector3, (_Maximum_216777d30802328eab607c8fe68ba3a1_Out_2_Float.xxx), _Multiply_a856b52cd0848f86a6ae1af9b175935c_Out_2_Vector3);
        float3 _Add_86c6109dc4530b8c9763ef62b056ad4c_Out_2_Vector3;
        Unity_Add_float3(_Multiply_79b0b5d7d3528b8395e1135339a090f2_Out_2_Vector3, _Multiply_a856b52cd0848f86a6ae1af9b175935c_Out_2_Vector3, _Add_86c6109dc4530b8c9763ef62b056ad4c_Out_2_Vector3);
        float _Add_356384b52728f583bd6e694bc1fc3738_Out_2_Float;
        Unity_Add_float(_Maximum_d02e48d92038448cb0345e5cf3779071_Out_2_Float, _Maximum_216777d30802328eab607c8fe68ba3a1_Out_2_Float, _Add_356384b52728f583bd6e694bc1fc3738_Out_2_Float);
        float _Maximum_94a22f5ceb706e88bc16350a5d5d2a82_Out_2_Float;
        Unity_Maximum_float(_Add_356384b52728f583bd6e694bc1fc3738_Out_2_Float, float(1E-05), _Maximum_94a22f5ceb706e88bc16350a5d5d2a82_Out_2_Float);
        float3 _Divide_d7291d1701d7058dbb5263194c1bed22_Out_2_Vector3;
        Unity_Divide_float3(_Add_86c6109dc4530b8c9763ef62b056ad4c_Out_2_Vector3, (_Maximum_94a22f5ceb706e88bc16350a5d5d2a82_Out_2_Float.xxx), _Divide_d7291d1701d7058dbb5263194c1bed22_Out_2_Vector3);
        OutVector4_1 = _Divide_d7291d1701d7058dbb5263194c1bed22_Out_2_Vector3;
        }
        
        void Unity_Clamp_float(float In, float Min, float Max, out float Out)
        {
            Out = clamp(In, Min, Max);
        }
        
        void Unity_Normalize_float3(float3 In, out float3 Out)
        {
            Out = normalize(In);
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
        
        void Unity_NormalStrength_float(float3 In, float Strength, out float3 Out)
        {
            Out = float3(In.rg * Strength, lerp(1, In.b, saturate(Strength)));
        }
        
        void Unity_Divide_float(float A, float B, out float Out)
        {
            Out = A / B;
        }
        
        void Unity_Absolute_float(float In, out float Out)
        {
            Out = abs(In);
        }
        
        void Unity_Power_float(float A, float B, out float Out)
        {
            Out = pow(A, B);
        }
        
        void Unity_Saturate_float(float In, out float Out)
        {
            Out = saturate(In);
        }
        
        void Unity_Lerp_float3(float3 A, float3 B, float3 T, out float3 Out)
        {
            Out = lerp(A, B, T);
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
            UnityTexture2D _Property_d92b1410e1d6bc81a86076b09e35f302_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseColorMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_d4a357b2daff5587ae46468726a33797_Out_0_Vector4 = _BaseTilingOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Divide_c703c79d4bf76e8c9848ea2ecd29211f_Out_2_Vector4;
            Unity_Divide_float4(float4(1, 1, 0, 0), _Property_d4a357b2daff5587ae46468726a33797_Out_0_Vector4, _Divide_c703c79d4bf76e8c9848ea2ecd29211f_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_b168be530d5b4082a2816fc835b55e19_Out_0_Float = _BaseTriplanarThreshold;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579;
            _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4;
            float4 _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XZ_2_Vector4;
            float4 _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_YZ_3_Vector4;
            float4 _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_d92b1410e1d6bc81a86076b09e35f302_Out_0_Texture2D, (_Divide_c703c79d4bf76e8c9848ea2ecd29211f_Out_2_Vector4).x, _Property_b168be530d5b4082a2816fc835b55e19_Out_0_Float, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XZ_2_Vector4, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_YZ_3_Vector4, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_17f0f1bec4ec6485881127275660d4f1_Out_0_Vector4 = _BaseColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Multiply_6434c1e27d77608fb8dcec94697eb8d3_Out_2_Vector4;
            Unity_Multiply_float4_float4(_TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4, _Property_17f0f1bec4ec6485881127275660d4f1_Out_0_Vector4, _Multiply_6434c1e27d77608fb8dcec94697eb8d3_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_080b6cb46abb00848263c964726eac36_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseMaskMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c;
            _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XYZ_1_Vector4;
            float4 _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XZ_2_Vector4;
            float4 _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_YZ_3_Vector4;
            float4 _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_080b6cb46abb00848263c964726eac36_Out_0_Texture2D, (_Divide_c703c79d4bf76e8c9848ea2ecd29211f_Out_2_Vector4).x, _Property_b168be530d5b4082a2816fc835b55e19_Out_0_Float, _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c, _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XYZ_1_Vector4, _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XZ_2_Vector4, _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_YZ_3_Vector4, _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_866a663ed067f988862843fe32765ff8_R_1_Float = _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XYZ_1_Vector4[0];
            float _Split_866a663ed067f988862843fe32765ff8_G_2_Float = _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XYZ_1_Vector4[1];
            float _Split_866a663ed067f988862843fe32765ff8_B_3_Float = _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XYZ_1_Vector4[2];
            float _Split_866a663ed067f988862843fe32765ff8_A_4_Float = _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XYZ_1_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_3b9891099f2f3e84b765eb453f6f6810_Out_0_Float = _HeightMin;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_bde21360babd9089a90a45cd2843925b_Out_0_Float = _HeightMax;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_9f8e90f51ffcfe8bb3d495766c0cabca_Out_0_Vector2 = float2(_Property_3b9891099f2f3e84b765eb453f6f6810_Out_0_Float, _Property_bde21360babd9089a90a45cd2843925b_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_6ff6d72f7b1d0083b4e4ce61e7e7c8d3_Out_0_Float = _HeightOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Add_39687f6bf7045086bc2d1ccf5f94c9de_Out_2_Vector2;
            Unity_Add_float2(_Vector2_9f8e90f51ffcfe8bb3d495766c0cabca_Out_0_Vector2, (_Property_6ff6d72f7b1d0083b4e4ce61e7e7c8d3_Out_0_Float.xx), _Add_39687f6bf7045086bc2d1ccf5f94c9de_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_ddc02d039a9d5388b8add0d2d673d4ac_Out_3_Float;
            Unity_Remap_float(_Split_866a663ed067f988862843fe32765ff8_B_3_Float, float2 (0, 1), _Add_39687f6bf7045086bc2d1ccf5f94c9de_Out_2_Vector2, _Remap_ddc02d039a9d5388b8add0d2d673d4ac_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_11586ef261ce8e87953046ff84ce22ab_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_Base2ColorMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_221c724b2137d58c8c387fee5b48be14_Out_0_Vector4 = _Base2TilingOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Divide_9f3f46254d5f7a8e87f60c4aa6f5522c_Out_2_Vector4;
            Unity_Divide_float4(float4(1, 1, 0, 0), _Property_221c724b2137d58c8c387fee5b48be14_Out_0_Vector4, _Divide_9f3f46254d5f7a8e87f60c4aa6f5522c_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_20f6a96f64098d87b850c83bc45ddcee_Out_0_Float = _Base2TriplanarThreshold;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_ca3aaaec266f85859b75e37163da7cba;
            _TriplanarNM_ca3aaaec266f85859b75e37163da7cba.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_ca3aaaec266f85859b75e37163da7cba.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_ca3aaaec266f85859b75e37163da7cba_XYZ_1_Vector4;
            float4 _TriplanarNM_ca3aaaec266f85859b75e37163da7cba_XZ_2_Vector4;
            float4 _TriplanarNM_ca3aaaec266f85859b75e37163da7cba_YZ_3_Vector4;
            float4 _TriplanarNM_ca3aaaec266f85859b75e37163da7cba_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_11586ef261ce8e87953046ff84ce22ab_Out_0_Texture2D, (_Divide_9f3f46254d5f7a8e87f60c4aa6f5522c_Out_2_Vector4).x, _Property_20f6a96f64098d87b850c83bc45ddcee_Out_0_Float, _TriplanarNM_ca3aaaec266f85859b75e37163da7cba, _TriplanarNM_ca3aaaec266f85859b75e37163da7cba_XYZ_1_Vector4, _TriplanarNM_ca3aaaec266f85859b75e37163da7cba_XZ_2_Vector4, _TriplanarNM_ca3aaaec266f85859b75e37163da7cba_YZ_3_Vector4, _TriplanarNM_ca3aaaec266f85859b75e37163da7cba_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_60dff9cc4310ea89874789591a78d84b_Out_0_Vector4 = _Base2Color;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Multiply_4d8e3ca1454e2d85963c9d240239a171_Out_2_Vector4;
            Unity_Multiply_float4_float4(_TriplanarNM_ca3aaaec266f85859b75e37163da7cba_XYZ_1_Vector4, _Property_60dff9cc4310ea89874789591a78d84b_Out_0_Vector4, _Multiply_4d8e3ca1454e2d85963c9d240239a171_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_312b653a29ccc087849b1493611fb73c_Out_0_Boolean = _Invert_Layer_Mask;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_1004d4c014377e8c8fa291ed748b9f84_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_LayerMask);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _SampleTexture2D_c910b4b42510578d81c16169d3cb5727_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_1004d4c014377e8c8fa291ed748b9f84_Out_0_Texture2D.tex, _Property_1004d4c014377e8c8fa291ed748b9f84_Out_0_Texture2D.samplerstate, _Property_1004d4c014377e8c8fa291ed748b9f84_Out_0_Texture2D.GetTransformedUV(IN.uv0.xy) );
            float _SampleTexture2D_c910b4b42510578d81c16169d3cb5727_R_4_Float = _SampleTexture2D_c910b4b42510578d81c16169d3cb5727_RGBA_0_Vector4.r;
            float _SampleTexture2D_c910b4b42510578d81c16169d3cb5727_G_5_Float = _SampleTexture2D_c910b4b42510578d81c16169d3cb5727_RGBA_0_Vector4.g;
            float _SampleTexture2D_c910b4b42510578d81c16169d3cb5727_B_6_Float = _SampleTexture2D_c910b4b42510578d81c16169d3cb5727_RGBA_0_Vector4.b;
            float _SampleTexture2D_c910b4b42510578d81c16169d3cb5727_A_7_Float = _SampleTexture2D_c910b4b42510578d81c16169d3cb5727_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_bc0b8885b596648d9b594130faa6585c_Out_1_Float;
            Unity_OneMinus_float(_SampleTexture2D_c910b4b42510578d81c16169d3cb5727_R_4_Float, _OneMinus_bc0b8885b596648d9b594130faa6585c_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Branch_6b7615e16629338ba87d3570a0096f66_Out_3_Float;
            Unity_Branch_float(_Property_312b653a29ccc087849b1493611fb73c_Out_0_Boolean, _OneMinus_bc0b8885b596648d9b594130faa6585c_Out_1_Float, _SampleTexture2D_c910b4b42510578d81c16169d3cb5727_R_4_Float, _Branch_6b7615e16629338ba87d3570a0096f66_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_b4749c77856157858fffde0aed55fc74_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_Base2MaskMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b;
            _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_XYZ_1_Vector4;
            float4 _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_XZ_2_Vector4;
            float4 _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_YZ_3_Vector4;
            float4 _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_b4749c77856157858fffde0aed55fc74_Out_0_Texture2D, (_Divide_9f3f46254d5f7a8e87f60c4aa6f5522c_Out_2_Vector4).x, _Property_20f6a96f64098d87b850c83bc45ddcee_Out_0_Float, _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b, _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_XYZ_1_Vector4, _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_XZ_2_Vector4, _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_YZ_3_Vector4, _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_0b441b86fba0ea80bc060dae9d7ed0d7_R_1_Float = _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_XYZ_1_Vector4[0];
            float _Split_0b441b86fba0ea80bc060dae9d7ed0d7_G_2_Float = _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_XYZ_1_Vector4[1];
            float _Split_0b441b86fba0ea80bc060dae9d7ed0d7_B_3_Float = _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_XYZ_1_Vector4[2];
            float _Split_0b441b86fba0ea80bc060dae9d7ed0d7_A_4_Float = _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_XYZ_1_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_c1de6a6321562383bfac4b318fc7b0d3_Out_0_Float = _HeightMin2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_145222f375008a879315637be0f172c5_Out_0_Float = _HeightMax2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_416c3ee3a60cc686b2d2360a073acfad_Out_0_Vector2 = float2(_Property_c1de6a6321562383bfac4b318fc7b0d3_Out_0_Float, _Property_145222f375008a879315637be0f172c5_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_8be924d801daee88b294af592a560e75_Out_0_Float = _HeightOffset2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Add_37703f1eb9ce078daaedca833705f5dd_Out_2_Vector2;
            Unity_Add_float2(_Vector2_416c3ee3a60cc686b2d2360a073acfad_Out_0_Vector2, (_Property_8be924d801daee88b294af592a560e75_Out_0_Float.xx), _Add_37703f1eb9ce078daaedca833705f5dd_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_5a8467f2416dc98699682a4cf64a69aa_Out_3_Float;
            Unity_Remap_float(_Split_0b441b86fba0ea80bc060dae9d7ed0d7_B_3_Float, float2 (0, 1), _Add_37703f1eb9ce078daaedca833705f5dd_Out_2_Vector2, _Remap_5a8467f2416dc98699682a4cf64a69aa_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_d9f42ca072d9188ab2566400157a199f_Out_2_Float;
            Unity_Multiply_float_float(_Branch_6b7615e16629338ba87d3570a0096f66_Out_3_Float, _Remap_5a8467f2416dc98699682a4cf64a69aa_Out_3_Float, _Multiply_d9f42ca072d9188ab2566400157a199f_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_b4d08e724ec3df88ab7743c5b7a3f081_R_1_Float = IN.VertexColor[0];
            float _Split_b4d08e724ec3df88ab7743c5b7a3f081_G_2_Float = IN.VertexColor[1];
            float _Split_b4d08e724ec3df88ab7743c5b7a3f081_B_3_Float = IN.VertexColor[2];
            float _Split_b4d08e724ec3df88ab7743c5b7a3f081_A_4_Float = IN.VertexColor[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_55cb55224306dc818a87a2dbf82d5af0_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_d9f42ca072d9188ab2566400157a199f_Out_2_Float, _Split_b4d08e724ec3df88ab7743c5b7a3f081_B_3_Float, _Multiply_55cb55224306dc818a87a2dbf82d5af0_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_c0dc9341fd635288a1c2869945617704_Out_0_Float = _Height_Transition;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float _HeightBlend_d30f443b26dc0d8087616105058c020a;
            float3 _HeightBlend_d30f443b26dc0d8087616105058c020a_OutVector4_1_Vector3;
            SG_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float((_Multiply_6434c1e27d77608fb8dcec94697eb8d3_Out_2_Vector4.xyz), _Remap_ddc02d039a9d5388b8add0d2d673d4ac_Out_3_Float, (_Multiply_4d8e3ca1454e2d85963c9d240239a171_Out_2_Vector4.xyz), _Multiply_55cb55224306dc818a87a2dbf82d5af0_Out_2_Float, _Property_c0dc9341fd635288a1c2869945617704_Out_0_Float, _HeightBlend_d30f443b26dc0d8087616105058c020a, _HeightBlend_d30f443b26dc0d8087616105058c020a_OutVector4_1_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_0b7ec0ec463cd88c8269ef0d2c98eb85_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverBaseColorMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_9bedb34aba10fa89a5f5b18919971491_Out_0_Vector4 = _CoverTilingOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Divide_ddaec3b56c9fc58ca3314b828c03b1c8_Out_2_Vector4;
            Unity_Divide_float4(float4(1, 1, 0, 0), _Property_9bedb34aba10fa89a5f5b18919971491_Out_0_Vector4, _Divide_ddaec3b56c9fc58ca3314b828c03b1c8_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_bf361924f27f848994241bda91fc2005_Out_0_Float = _CoverTriplanarThreshold;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793;
            _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XYZ_1_Vector4;
            float4 _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XZ_2_Vector4;
            float4 _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_YZ_3_Vector4;
            float4 _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_0b7ec0ec463cd88c8269ef0d2c98eb85_Out_0_Texture2D, (_Divide_ddaec3b56c9fc58ca3314b828c03b1c8_Out_2_Vector4).x, _Property_bf361924f27f848994241bda91fc2005_Out_0_Float, _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793, _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XYZ_1_Vector4, _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XZ_2_Vector4, _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_YZ_3_Vector4, _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_19547f2fe562798683b730e775cbfb39_Out_0_Vector4 = _CoverBaseColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Multiply_0652b80f60f8ed84beea389318719c9a_Out_2_Vector4;
            Unity_Multiply_float4_float4(_TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XYZ_1_Vector4, _Property_19547f2fe562798683b730e775cbfb39_Out_0_Vector4, _Multiply_0652b80f60f8ed84beea389318719c9a_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_ed6385cfee8242c58d906f36e90cb607_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverBaseColorMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _UV_13d53a8c036ded8490c69d17b7a3bb72_Out_0_Vector4 = IN.uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _SampleTexture2D_b8be215db546638398ea07060feb5224_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_ed6385cfee8242c58d906f36e90cb607_Out_0_Texture2D.tex, _Property_ed6385cfee8242c58d906f36e90cb607_Out_0_Texture2D.samplerstate, _Property_ed6385cfee8242c58d906f36e90cb607_Out_0_Texture2D.GetTransformedUV((_UV_13d53a8c036ded8490c69d17b7a3bb72_Out_0_Vector4.xy)) );
            float _SampleTexture2D_b8be215db546638398ea07060feb5224_R_4_Float = _SampleTexture2D_b8be215db546638398ea07060feb5224_RGBA_0_Vector4.r;
            float _SampleTexture2D_b8be215db546638398ea07060feb5224_G_5_Float = _SampleTexture2D_b8be215db546638398ea07060feb5224_RGBA_0_Vector4.g;
            float _SampleTexture2D_b8be215db546638398ea07060feb5224_B_6_Float = _SampleTexture2D_b8be215db546638398ea07060feb5224_RGBA_0_Vector4.b;
            float _SampleTexture2D_b8be215db546638398ea07060feb5224_A_7_Float = _SampleTexture2D_b8be215db546638398ea07060feb5224_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_b3ce556358f99f80ae9037fb175f4c5f_Out_0_Float = _CoverMaskPower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_ea35dd8ed2523f8b9a4c52fc52ecff0e_Out_2_Float;
            Unity_Multiply_float_float(_SampleTexture2D_b8be215db546638398ea07060feb5224_A_7_Float, _Property_b3ce556358f99f80ae9037fb175f4c5f_Out_0_Float, _Multiply_ea35dd8ed2523f8b9a4c52fc52ecff0e_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_7c0c867aaa1f5b8683768528b130a408_Out_3_Float;
            Unity_Clamp_float(_Multiply_ea35dd8ed2523f8b9a4c52fc52ecff0e_Out_2_Float, float(0), float(1), _Clamp_7c0c867aaa1f5b8683768528b130a408_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Property_509761afcb3aad8f9a29405c122dbf08_Out_0_Vector3 = _CoverDirection;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_72c615246e955087b85288c29905f048_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseNormalMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNMn_059da9746584140498cd018db3c76047_float _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0;
            _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0.WorldSpaceTangent = IN.WorldSpaceTangent;
            _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0.WorldSpacePosition = IN.WorldSpacePosition;
            float4 _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XYZ_1_Vector4;
            float4 _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XZ_2_Vector4;
            float4 _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_YZ_3_Vector4;
            float4 _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XY_4_Vector4;
            SG_TriplanarNMn_059da9746584140498cd018db3c76047_float(_Property_72c615246e955087b85288c29905f048_Out_0_Texture2D, (_Divide_c703c79d4bf76e8c9848ea2ecd29211f_Out_2_Vector4).x, _Property_b168be530d5b4082a2816fc835b55e19_Out_0_Float, _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0, _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XYZ_1_Vector4, _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XZ_2_Vector4, _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_YZ_3_Vector4, _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_7edd97bda70eb38a8c4253094700be37_Out_0_Float = _BaseNormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _NormalStrength_8bafa3d69de37c818a39fccf03db9518_Out_2_Vector3;
            Unity_NormalStrength_float((_TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XYZ_1_Vector4.xyz), _Property_7edd97bda70eb38a8c4253094700be37_Out_0_Float, _NormalStrength_8bafa3d69de37c818a39fccf03db9518_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_6809577d1aa24984aa957e13d0574602_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_Base2NormalMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNMn_059da9746584140498cd018db3c76047_float _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc;
            _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc.WorldSpaceTangent = IN.WorldSpaceTangent;
            _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc.WorldSpacePosition = IN.WorldSpacePosition;
            float4 _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc_XYZ_1_Vector4;
            float4 _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc_XZ_2_Vector4;
            float4 _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc_YZ_3_Vector4;
            float4 _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc_XY_4_Vector4;
            SG_TriplanarNMn_059da9746584140498cd018db3c76047_float(_Property_6809577d1aa24984aa957e13d0574602_Out_0_Texture2D, (_Divide_9f3f46254d5f7a8e87f60c4aa6f5522c_Out_2_Vector4).x, _Property_20f6a96f64098d87b850c83bc45ddcee_Out_0_Float, _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc, _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc_XYZ_1_Vector4, _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc_XZ_2_Vector4, _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc_YZ_3_Vector4, _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_c3260886a9a91b82a3d14c25e6fd0d2c_Out_0_Float = _Base2NormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _NormalStrength_d049a259d0377180a2e5959b925a78bc_Out_2_Vector3;
            Unity_NormalStrength_float((_TriplanarNMn_8890d23c68a4598d85a048422a8f36fc_XYZ_1_Vector4.xyz), _Property_c3260886a9a91b82a3d14c25e6fd0d2c_Out_0_Float, _NormalStrength_d049a259d0377180a2e5959b925a78bc_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float _HeightBlend_a6bf16c3496e828984e7277239132d42;
            float3 _HeightBlend_a6bf16c3496e828984e7277239132d42_OutVector4_1_Vector3;
            SG_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float(_NormalStrength_8bafa3d69de37c818a39fccf03db9518_Out_2_Vector3, _Remap_ddc02d039a9d5388b8add0d2d673d4ac_Out_3_Float, _NormalStrength_d049a259d0377180a2e5959b925a78bc_Out_2_Vector3, _Multiply_55cb55224306dc818a87a2dbf82d5af0_Out_2_Float, _Property_c0dc9341fd635288a1c2869945617704_Out_0_Float, _HeightBlend_a6bf16c3496e828984e7277239132d42, _HeightBlend_a6bf16c3496e828984e7277239132d42_OutVector4_1_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_1dcbde2a42b87e81bb254fd87a4816a5_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverNormalMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNMn_059da9746584140498cd018db3c76047_float _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58;
            _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58.WorldSpaceTangent = IN.WorldSpaceTangent;
            _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58.WorldSpacePosition = IN.WorldSpacePosition;
            float4 _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XYZ_1_Vector4;
            float4 _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XZ_2_Vector4;
            float4 _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_YZ_3_Vector4;
            float4 _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XY_4_Vector4;
            SG_TriplanarNMn_059da9746584140498cd018db3c76047_float(_Property_1dcbde2a42b87e81bb254fd87a4816a5_Out_0_Texture2D, (_Divide_ddaec3b56c9fc58ca3314b828c03b1c8_Out_2_Vector4).x, _Property_bf361924f27f848994241bda91fc2005_Out_0_Float, _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58, _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XYZ_1_Vector4, _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XZ_2_Vector4, _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_YZ_3_Vector4, _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_9176e0d3ea9ff88a9b888a200800b92d_Out_0_Float = _CoverNormalBlendHardness;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _NormalStrength_51679ed1e0a0ef8aa01b53b035a4da51_Out_2_Vector3;
            Unity_NormalStrength_float((_TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XYZ_1_Vector4.xyz), _Property_9176e0d3ea9ff88a9b888a200800b92d_Out_0_Float, _NormalStrength_51679ed1e0a0ef8aa01b53b035a4da51_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Multiply_ea6008eef104198ca40a18608c76d5a4_Out_2_Vector3;
            Unity_Multiply_float3_float3(_Property_509761afcb3aad8f9a29405c122dbf08_Out_0_Vector3, IN.WorldSpaceNormal, _Multiply_ea6008eef104198ca40a18608c76d5a4_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_e74c8f300b486e86a5700118b60b7885_R_1_Float = _Multiply_ea6008eef104198ca40a18608c76d5a4_Out_2_Vector3[0];
            float _Split_e74c8f300b486e86a5700118b60b7885_G_2_Float = _Multiply_ea6008eef104198ca40a18608c76d5a4_Out_2_Vector3[1];
            float _Split_e74c8f300b486e86a5700118b60b7885_B_3_Float = _Multiply_ea6008eef104198ca40a18608c76d5a4_Out_2_Vector3[2];
            float _Split_e74c8f300b486e86a5700118b60b7885_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_57be4f2ffc62ef89a9b736e6f1a99790_Out_2_Float;
            Unity_Add_float(_Split_e74c8f300b486e86a5700118b60b7885_R_1_Float, _Split_e74c8f300b486e86a5700118b60b7885_G_2_Float, _Add_57be4f2ffc62ef89a9b736e6f1a99790_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_abe82f22f31b958eaf9f12f8db5f150d_Out_2_Float;
            Unity_Add_float(_Add_57be4f2ffc62ef89a9b736e6f1a99790_Out_2_Float, _Split_e74c8f300b486e86a5700118b60b7885_B_3_Float, _Add_abe82f22f31b958eaf9f12f8db5f150d_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_ca7cc2d889a56683904c7546a72cedbf_Out_0_Float = _Cover_Amount;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_398a4ebc3d0302828e04c782fb4f49be_Out_0_Float = _Cover_Amount_Grow_Speed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Subtract_9340fe9ac4518a8aa343888dc6143619_Out_2_Float;
            Unity_Subtract_float(float(4), _Property_398a4ebc3d0302828e04c782fb4f49be_Out_0_Float, _Subtract_9340fe9ac4518a8aa343888dc6143619_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_58b01578ab8c8b858bb5e3a720366e16_Out_2_Float;
            Unity_Divide_float(_Property_ca7cc2d889a56683904c7546a72cedbf_Out_0_Float, _Subtract_9340fe9ac4518a8aa343888dc6143619_Out_2_Float, _Divide_58b01578ab8c8b858bb5e3a720366e16_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Absolute_a4d057707c029a85947bcf9de8128ee5_Out_1_Float;
            Unity_Absolute_float(_Divide_58b01578ab8c8b858bb5e3a720366e16_Out_2_Float, _Absolute_a4d057707c029a85947bcf9de8128ee5_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Power_681b2745dbae62839624b98240ca04f7_Out_2_Float;
            Unity_Power_float(_Absolute_a4d057707c029a85947bcf9de8128ee5_Out_1_Float, _Subtract_9340fe9ac4518a8aa343888dc6143619_Out_2_Float, _Power_681b2745dbae62839624b98240ca04f7_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_7340c193c2d92c81ba9dd931235ba17f_Out_3_Float;
            Unity_Clamp_float(_Power_681b2745dbae62839624b98240ca04f7_Out_2_Float, float(0), float(2), _Clamp_7340c193c2d92c81ba9dd931235ba17f_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_7632a3e8aed6d38e88c7f4b8e72f85dc_Out_2_Float;
            Unity_Multiply_float_float(_Add_abe82f22f31b958eaf9f12f8db5f150d_Out_2_Float, _Clamp_7340c193c2d92c81ba9dd931235ba17f_Out_3_Float, _Multiply_7632a3e8aed6d38e88c7f4b8e72f85dc_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Saturate_0541c8e45c0d1e84acab0ae3a59218fa_Out_1_Float;
            Unity_Saturate_float(_Multiply_7632a3e8aed6d38e88c7f4b8e72f85dc_Out_2_Float, _Saturate_0541c8e45c0d1e84acab0ae3a59218fa_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_3b62dfdf4a729d8a9b33398bfdcff203_Out_3_Float;
            Unity_Clamp_float(_Add_abe82f22f31b958eaf9f12f8db5f150d_Out_2_Float, float(0), float(0.9999), _Clamp_3b62dfdf4a729d8a9b33398bfdcff203_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_2df9fd6ca8ecaa828f0edb7582ef5616_Out_0_Float = _Cover_Max_Angle;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_1e9d5df33719338ca266a822ae3e1c73_Out_2_Float;
            Unity_Divide_float(_Property_2df9fd6ca8ecaa828f0edb7582ef5616_Out_0_Float, float(45), _Divide_1e9d5df33719338ca266a822ae3e1c73_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_2d91255cf28d138db7f5edc0eed1ea86_Out_1_Float;
            Unity_OneMinus_float(_Divide_1e9d5df33719338ca266a822ae3e1c73_Out_2_Float, _OneMinus_2d91255cf28d138db7f5edc0eed1ea86_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Subtract_2ae31a316a35bf8882b8de8d71b44b9f_Out_2_Float;
            Unity_Subtract_float(_Clamp_3b62dfdf4a729d8a9b33398bfdcff203_Out_3_Float, _OneMinus_2d91255cf28d138db7f5edc0eed1ea86_Out_1_Float, _Subtract_2ae31a316a35bf8882b8de8d71b44b9f_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_a3af3696fa69dc8cb04a65e84a3c6c98_Out_3_Float;
            Unity_Clamp_float(_Subtract_2ae31a316a35bf8882b8de8d71b44b9f_Out_2_Float, float(0), float(2), _Clamp_a3af3696fa69dc8cb04a65e84a3c6c98_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_467a4be5b52daa80b2d4bf46d2f429c9_Out_2_Float;
            Unity_Divide_float(float(1), _Divide_1e9d5df33719338ca266a822ae3e1c73_Out_2_Float, _Divide_467a4be5b52daa80b2d4bf46d2f429c9_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_749d76436ed5e58abec68ae130db866b_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_a3af3696fa69dc8cb04a65e84a3c6c98_Out_3_Float, _Divide_467a4be5b52daa80b2d4bf46d2f429c9_Out_2_Float, _Multiply_749d76436ed5e58abec68ae130db866b_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Absolute_043a189b52847189ad0575955b41f403_Out_1_Float;
            Unity_Absolute_float(_Multiply_749d76436ed5e58abec68ae130db866b_Out_2_Float, _Absolute_043a189b52847189ad0575955b41f403_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_d4f4330ee4eced8d88fb074732401835_Out_0_Float = _CoverHardness;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Power_39a2971fc28ddc8e9f6d1423e692613d_Out_2_Float;
            Unity_Power_float(_Absolute_043a189b52847189ad0575955b41f403_Out_1_Float, _Property_d4f4330ee4eced8d88fb074732401835_Out_0_Float, _Power_39a2971fc28ddc8e9f6d1423e692613d_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_ecc3c7fdca2e938aa029cd0ff4fb9db6_Out_0_Float = _Cover_Min_Height;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_6fb68ea250dfc28b97bc87b4872d90b2_Out_1_Float;
            Unity_OneMinus_float(_Property_ecc3c7fdca2e938aa029cd0ff4fb9db6_Out_0_Float, _OneMinus_6fb68ea250dfc28b97bc87b4872d90b2_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_815418660959f184b10470e678ebae30_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
            float _Split_815418660959f184b10470e678ebae30_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
            float _Split_815418660959f184b10470e678ebae30_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
            float _Split_815418660959f184b10470e678ebae30_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_9c527d082534a687b4f0de2b26f2d04d_Out_2_Float;
            Unity_Add_float(_OneMinus_6fb68ea250dfc28b97bc87b4872d90b2_Out_1_Float, _Split_815418660959f184b10470e678ebae30_G_2_Float, _Add_9c527d082534a687b4f0de2b26f2d04d_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_9e2bffcd3cb38a83b04f8e67c5c96a06_Out_2_Float;
            Unity_Add_float(_Add_9c527d082534a687b4f0de2b26f2d04d_Out_2_Float, float(1), _Add_9e2bffcd3cb38a83b04f8e67c5c96a06_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_0d06020cc00e3887b95a3ebd8edd196f_Out_3_Float;
            Unity_Clamp_float(_Add_9e2bffcd3cb38a83b04f8e67c5c96a06_Out_2_Float, float(0), float(1), _Clamp_0d06020cc00e3887b95a3ebd8edd196f_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_6ec32fc8c4434e8b84cf41dd6b52dd34_Out_0_Float = _Cover_Min_Height_Blending;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_e57f70c02382b28397642f05af76cfb0_Out_2_Float;
            Unity_Add_float(_Add_9c527d082534a687b4f0de2b26f2d04d_Out_2_Float, _Property_6ec32fc8c4434e8b84cf41dd6b52dd34_Out_0_Float, _Add_e57f70c02382b28397642f05af76cfb0_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_94bc0a8d86daee888d2cd450fbf0d53e_Out_2_Float;
            Unity_Divide_float(_Add_e57f70c02382b28397642f05af76cfb0_Out_2_Float, _Add_9c527d082534a687b4f0de2b26f2d04d_Out_2_Float, _Divide_94bc0a8d86daee888d2cd450fbf0d53e_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_5447f70dbea44185b79c1ac1bb5ea4fa_Out_1_Float;
            Unity_OneMinus_float(_Divide_94bc0a8d86daee888d2cd450fbf0d53e_Out_2_Float, _OneMinus_5447f70dbea44185b79c1ac1bb5ea4fa_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_de674a5c5a1a348688c87f45d79cf9a1_Out_2_Float;
            Unity_Add_float(_OneMinus_5447f70dbea44185b79c1ac1bb5ea4fa_Out_1_Float, float(-0.5), _Add_de674a5c5a1a348688c87f45d79cf9a1_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_3244d6500fdd2c8a92b20a9929d61642_Out_3_Float;
            Unity_Clamp_float(_Add_de674a5c5a1a348688c87f45d79cf9a1_Out_2_Float, float(0), float(1), _Clamp_3244d6500fdd2c8a92b20a9929d61642_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_ea368e3c8a99368d917c930eb07b8e9f_Out_2_Float;
            Unity_Add_float(_Clamp_0d06020cc00e3887b95a3ebd8edd196f_Out_3_Float, _Clamp_3244d6500fdd2c8a92b20a9929d61642_Out_3_Float, _Add_ea368e3c8a99368d917c930eb07b8e9f_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_ce483c505aaa1f83b698a43bb22bf259_Out_3_Float;
            Unity_Clamp_float(_Add_ea368e3c8a99368d917c930eb07b8e9f_Out_2_Float, float(0), float(1), _Clamp_ce483c505aaa1f83b698a43bb22bf259_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_d1b58293be2e9982898e4a432bd61149_Out_2_Float;
            Unity_Multiply_float_float(_Power_39a2971fc28ddc8e9f6d1423e692613d_Out_2_Float, _Clamp_ce483c505aaa1f83b698a43bb22bf259_Out_3_Float, _Multiply_d1b58293be2e9982898e4a432bd61149_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_5336a32115eb29849650688fd99ee185_Out_2_Float;
            Unity_Multiply_float_float(_Saturate_0541c8e45c0d1e84acab0ae3a59218fa_Out_1_Float, _Multiply_d1b58293be2e9982898e4a432bd61149_Out_2_Float, _Multiply_5336a32115eb29849650688fd99ee185_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Lerp_f5ea06dcb1a8c58bac1ae497649cf333_Out_3_Vector3;
            Unity_Lerp_float3(_HeightBlend_a6bf16c3496e828984e7277239132d42_OutVector4_1_Vector3, _NormalStrength_51679ed1e0a0ef8aa01b53b035a4da51_Out_2_Vector3, (_Multiply_5336a32115eb29849650688fd99ee185_Out_2_Float.xxx), _Lerp_f5ea06dcb1a8c58bac1ae497649cf333_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Transform_9ae402175cd2148a9da0916d2d189ef9_Out_1_Vector3;
            {
                float3x3 tangentTransform = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
                _Transform_9ae402175cd2148a9da0916d2d189ef9_Out_1_Vector3 = TransformTangentToWorldDir(_Lerp_f5ea06dcb1a8c58bac1ae497649cf333_Out_3_Vector3.xyz, tangentTransform, true).xyz;
            }
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Multiply_d902e15376a26b8eac35506e85f63b36_Out_2_Vector3;
            Unity_Multiply_float3_float3(_Property_509761afcb3aad8f9a29405c122dbf08_Out_0_Vector3, _Transform_9ae402175cd2148a9da0916d2d189ef9_Out_1_Vector3, _Multiply_d902e15376a26b8eac35506e85f63b36_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_b821124768adb688becbc5d63b26adb4_R_1_Float = _Multiply_d902e15376a26b8eac35506e85f63b36_Out_2_Vector3[0];
            float _Split_b821124768adb688becbc5d63b26adb4_G_2_Float = _Multiply_d902e15376a26b8eac35506e85f63b36_Out_2_Vector3[1];
            float _Split_b821124768adb688becbc5d63b26adb4_B_3_Float = _Multiply_d902e15376a26b8eac35506e85f63b36_Out_2_Vector3[2];
            float _Split_b821124768adb688becbc5d63b26adb4_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_fd43b427bfe3748cb0ced35df3b22159_Out_2_Float;
            Unity_Add_float(_Split_b821124768adb688becbc5d63b26adb4_R_1_Float, _Split_b821124768adb688becbc5d63b26adb4_G_2_Float, _Add_fd43b427bfe3748cb0ced35df3b22159_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_508b788633abc0829f0843d1b1f942c2_Out_2_Float;
            Unity_Add_float(_Add_fd43b427bfe3748cb0ced35df3b22159_Out_2_Float, _Split_b821124768adb688becbc5d63b26adb4_B_3_Float, _Add_508b788633abc0829f0843d1b1f942c2_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_ad921fb726e47688a4d134f6fb3c2273_Out_2_Float;
            Unity_Multiply_float_float(_Add_508b788633abc0829f0843d1b1f942c2_Out_2_Float, _Clamp_7340c193c2d92c81ba9dd931235ba17f_Out_3_Float, _Multiply_ad921fb726e47688a4d134f6fb3c2273_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_90d91831d95dfc83b55e42e5746bd269_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_7340c193c2d92c81ba9dd931235ba17f_Out_3_Float, _Property_d4f4330ee4eced8d88fb074732401835_Out_0_Float, _Multiply_90d91831d95dfc83b55e42e5746bd269_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_b907f38702eabd80a6c67777243459de_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_90d91831d95dfc83b55e42e5746bd269_Out_2_Float, _Multiply_d1b58293be2e9982898e4a432bd61149_Out_2_Float, _Multiply_b907f38702eabd80a6c67777243459de_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_81bdd2734ef6c68fbc23ffe7409191b9_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_ad921fb726e47688a4d134f6fb3c2273_Out_2_Float, _Multiply_b907f38702eabd80a6c67777243459de_Out_2_Float, _Multiply_81bdd2734ef6c68fbc23ffe7409191b9_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_a0e97293ba0dfb83a0d87d28ef311bc7_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverMaskMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_9b6d5da081e434808a5840cbd915bb28;
            _TriplanarNM_9b6d5da081e434808a5840cbd915bb28.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_9b6d5da081e434808a5840cbd915bb28.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XYZ_1_Vector4;
            float4 _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XZ_2_Vector4;
            float4 _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_YZ_3_Vector4;
            float4 _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_a0e97293ba0dfb83a0d87d28ef311bc7_Out_0_Texture2D, (_Divide_ddaec3b56c9fc58ca3314b828c03b1c8_Out_2_Vector4).x, _Property_bf361924f27f848994241bda91fc2005_Out_0_Float, _TriplanarNM_9b6d5da081e434808a5840cbd915bb28, _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XYZ_1_Vector4, _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XZ_2_Vector4, _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_YZ_3_Vector4, _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_b20618c84cffd183aae7f27c2d0772cb_R_1_Float = _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XYZ_1_Vector4[0];
            float _Split_b20618c84cffd183aae7f27c2d0772cb_G_2_Float = _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XYZ_1_Vector4[1];
            float _Split_b20618c84cffd183aae7f27c2d0772cb_B_3_Float = _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XYZ_1_Vector4[2];
            float _Split_b20618c84cffd183aae7f27c2d0772cb_A_4_Float = _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XYZ_1_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_987a8037965fff81a4930627358fc6e3_Out_0_Float = _CoverHeightMapMin;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_89aeacdce0000086a98e45df79358a56_Out_0_Float = _CoverHeightMapMax;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_d18b9686bb8af48c85d99d319830c000_Out_0_Vector2 = float2(_Property_987a8037965fff81a4930627358fc6e3_Out_0_Float, _Property_89aeacdce0000086a98e45df79358a56_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_856fd4da5f3d1b8c9bdd6966daada2b2_Out_0_Float = _CoverHeightMapOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Add_935266d0fc26dc87a5909ea1bd8aa423_Out_2_Vector2;
            Unity_Add_float2(_Vector2_d18b9686bb8af48c85d99d319830c000_Out_0_Vector2, (_Property_856fd4da5f3d1b8c9bdd6966daada2b2_Out_0_Float.xx), _Add_935266d0fc26dc87a5909ea1bd8aa423_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_f85aa52613b0108d876fab409ea80b8c_Out_3_Float;
            Unity_Remap_float(_Split_b20618c84cffd183aae7f27c2d0772cb_B_3_Float, float2 (0, 1), _Add_935266d0fc26dc87a5909ea1bd8aa423_Out_2_Vector2, _Remap_f85aa52613b0108d876fab409ea80b8c_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_65b9c8cf3a459284a298aa84443140a2_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_81bdd2734ef6c68fbc23ffe7409191b9_Out_2_Float, _Remap_f85aa52613b0108d876fab409ea80b8c_Out_3_Float, _Multiply_65b9c8cf3a459284a298aa84443140a2_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_100e6799ca65308ca7cca7a0e52252db_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_65b9c8cf3a459284a298aa84443140a2_Out_2_Float, _Split_b4d08e724ec3df88ab7743c5b7a3f081_G_2_Float, _Multiply_100e6799ca65308ca7cca7a0e52252db_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Saturate_a340e45e54317a81ae145a84c72daa75_Out_1_Float;
            Unity_Saturate_float(_Multiply_100e6799ca65308ca7cca7a0e52252db_Out_2_Float, _Saturate_a340e45e54317a81ae145a84c72daa75_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_d8ca79d07c3bbe85b09000ed0e769324_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_7c0c867aaa1f5b8683768528b130a408_Out_3_Float, _Saturate_a340e45e54317a81ae145a84c72daa75_Out_1_Float, _Multiply_d8ca79d07c3bbe85b09000ed0e769324_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            #if defined(_USEDYNAMICCOVERTSTATICMASKF_ON)
            float _UseDynamicCoverTStaticMaskF_a32a3630501f778faf03be9cfccfec64_Out_0_Float = _Multiply_d8ca79d07c3bbe85b09000ed0e769324_Out_2_Float;
            #else
            float _UseDynamicCoverTStaticMaskF_a32a3630501f778faf03be9cfccfec64_Out_0_Float = _Clamp_7c0c867aaa1f5b8683768528b130a408_Out_3_Float;
            #endif
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Lerp_7b425abcb4dfd0859d63f71a714fbb7d_Out_3_Vector3;
            Unity_Lerp_float3(_HeightBlend_d30f443b26dc0d8087616105058c020a_OutVector4_1_Vector3, (_Multiply_0652b80f60f8ed84beea389318719c9a_Out_2_Vector4.xyz), (_UseDynamicCoverTStaticMaskF_a32a3630501f778faf03be9cfccfec64_Out_0_Float.xxx), _Lerp_7b425abcb4dfd0859d63f71a714fbb7d_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_2ff5681ef4527d809ef09fdc5f8ef937_Out_0_Vector4 = _WetColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Multiply_85d9904c4b12ce85939f7948252c76b2_Out_2_Vector3;
            Unity_Multiply_float3_float3((_Property_2ff5681ef4527d809ef09fdc5f8ef937_Out_0_Vector4.xyz), _Lerp_7b425abcb4dfd0859d63f71a714fbb7d_Out_3_Vector3, _Multiply_85d9904c4b12ce85939f7948252c76b2_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_f1784d825dacdb8785770d3eca446428_Out_1_Float;
            Unity_OneMinus_float(_Split_b4d08e724ec3df88ab7743c5b7a3f081_R_1_Float, _OneMinus_f1784d825dacdb8785770d3eca446428_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Lerp_f330c9b8f318a885ac2822e63f9269e8_Out_3_Vector3;
            Unity_Lerp_float3(_Lerp_7b425abcb4dfd0859d63f71a714fbb7d_Out_3_Vector3, _Multiply_85d9904c4b12ce85939f7948252c76b2_Out_2_Vector3, (_OneMinus_f1784d825dacdb8785770d3eca446428_Out_1_Float.xxx), _Lerp_f330c9b8f318a885ac2822e63f9269e8_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_2f38c4b6e08da48093bd9896985f29eb_R_1_Float = _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4[0];
            float _Split_2f38c4b6e08da48093bd9896985f29eb_G_2_Float = _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4[1];
            float _Split_2f38c4b6e08da48093bd9896985f29eb_B_3_Float = _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4[2];
            float _Split_2f38c4b6e08da48093bd9896985f29eb_A_4_Float = _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_a55cb5b55044058c90b91c360cd49672_Out_0_Float = _AlphaCutoff;
            #endif
            surface.BaseColor = _Lerp_f330c9b8f318a885ac2822e63f9269e8_Out_3_Vector3;
            surface.Alpha = _Split_2f38c4b6e08da48093bd9896985f29eb_A_4_Float;
            surface.AlphaClipThreshold = _Property_a55cb5b55044058c90b91c360cd49672_Out_0_Float;
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
             float4 color : INTERP2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 positionWS : INTERP3;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
             float3 normalWS : INTERP4;
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
        float4 _BaseTilingOffset;
        float _BaseTriplanarThreshold;
        float4 _BaseNormalMap_TexelSize;
        float _BaseNormalScale;
        float4 _BaseMaskMap_TexelSize;
        float _BaseMetallic;
        float _BaseAORemapMin;
        float _BaseAORemapMax;
        float _BaseSmoothnessRemapMin;
        float _BaseSmoothnessRemapMax;
        float4 _LayerMask_TexelSize;
        float _Invert_Layer_Mask;
        float _Height_Transition;
        float _HeightMin;
        float _HeightMax;
        float _HeightOffset;
        float _HeightMin2;
        float _HeightMax2;
        float _HeightOffset2;
        float4 _Base2Color;
        float4 _Base2ColorMap_TexelSize;
        float4 _Base2TilingOffset;
        float _Base2TriplanarThreshold;
        float4 _Base2NormalMap_TexelSize;
        float _Base2NormalScale;
        float4 _Base2MaskMap_TexelSize;
        float _Base2Metallic;
        float _Base2SmoothnessRemapMin;
        float _Base2SmoothnessRemapMax;
        float _Base2AORemapMin;
        float _Base2AORemapMax;
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
        TEXTURE2D(_LayerMask);
        SAMPLER(sampler_LayerMask);
        TEXTURE2D(_Base2ColorMap);
        SAMPLER(sampler_Base2ColorMap);
        TEXTURE2D(_Base2NormalMap);
        SAMPLER(sampler_Base2NormalMap);
        TEXTURE2D(_Base2MaskMap);
        SAMPLER(sampler_Base2MaskMap);
        TEXTURE2D(_CoverBaseColorMap);
        SAMPLER(sampler_CoverBaseColorMap);
        TEXTURE2D(_CoverNormalMap);
        SAMPLER(sampler_CoverNormalMap);
        TEXTURE2D(_CoverMaskMap);
        SAMPLER(sampler_CoverMaskMap);
        
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
        
        void Unity_Divide_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A / B;
        }
        
        void Unity_Combine_float(float R, float G, float B, float A, out float4 RGBA, out float3 RGB, out float2 RG)
        {
            RGBA = float4(R, G, B, A);
            RGB = float3(R, G, B);
            RG = float2(R, G);
        }
        
        void Unity_Multiply_float4_float4(float4 A, float4 B, out float4 Out)
        {
        Out = A * B;
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
        
        void Unity_Multiply_float_float(float A, float B, out float Out)
        {
        Out = A * B;
        }
        
        void Unity_Add_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A + B;
        }
        
        void Unity_Add_float(float A, float B, out float Out)
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
        
        void Unity_Add_float2(float2 A, float2 B, out float2 Out)
        {
            Out = A + B;
        }
        
        void Unity_Remap_float(float In, float2 InMinMax, float2 OutMinMax, out float Out)
        {
            Out = OutMinMax.x + (In - InMinMax.x) * (OutMinMax.y - OutMinMax.x) / (InMinMax.y - InMinMax.x);
        }
        
        void Unity_OneMinus_float(float In, out float Out)
        {
            Out = 1 - In;
        }
        
        void Unity_Branch_float(float Predicate, float True, float False, out float Out)
        {
            Out = Predicate ? True : False;
        }
        
        void Unity_Maximum_float(float A, float B, out float Out)
        {
            Out = max(A, B);
        }
        
        void Unity_Subtract_float(float A, float B, out float Out)
        {
            Out = A - B;
        }
        
        void Unity_Add_float3(float3 A, float3 B, out float3 Out)
        {
            Out = A + B;
        }
        
        void Unity_Divide_float3(float3 A, float3 B, out float3 Out)
        {
            Out = A / B;
        }
        
        struct Bindings_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float
        {
        };
        
        void SG_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float(float3 Vector3_88EEBB5E, float Vector1_DA0A37FA, float3 Vector3_79AA92F, float Vector1_F7E83F1E, float Vector1_1C9222A6, Bindings_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float IN, out float3 OutVector4_1)
        {
        float3 _Property_dd1c841a04c03f8c85e7b00eb025ecda_Out_0_Vector3 = Vector3_88EEBB5E;
        float _Property_14119cc7eaf4128f991283d47cf72d85_Out_0_Float = Vector1_DA0A37FA;
        float _Property_48af0ad45e3f7f82932b938695d21391_Out_0_Float = Vector1_DA0A37FA;
        float _Property_8a30b3ca12ff518fa473ccd686c7d503_Out_0_Float = Vector1_F7E83F1E;
        float _Maximum_c196e4a61637ea8381a3437c93f89ce2_Out_2_Float;
        Unity_Maximum_float(_Property_48af0ad45e3f7f82932b938695d21391_Out_0_Float, _Property_8a30b3ca12ff518fa473ccd686c7d503_Out_0_Float, _Maximum_c196e4a61637ea8381a3437c93f89ce2_Out_2_Float);
        float _Property_ee8d5fc69475d181be60c57e04ea8708_Out_0_Float = Vector1_1C9222A6;
        float _Subtract_61ca880c04c1758eb128f25c9faabd63_Out_2_Float;
        Unity_Subtract_float(_Maximum_c196e4a61637ea8381a3437c93f89ce2_Out_2_Float, _Property_ee8d5fc69475d181be60c57e04ea8708_Out_0_Float, _Subtract_61ca880c04c1758eb128f25c9faabd63_Out_2_Float);
        float _Subtract_e3a7713b556a1b8cb40aad97fc58d619_Out_2_Float;
        Unity_Subtract_float(_Property_14119cc7eaf4128f991283d47cf72d85_Out_0_Float, _Subtract_61ca880c04c1758eb128f25c9faabd63_Out_2_Float, _Subtract_e3a7713b556a1b8cb40aad97fc58d619_Out_2_Float);
        float _Maximum_d02e48d92038448cb0345e5cf3779071_Out_2_Float;
        Unity_Maximum_float(_Subtract_e3a7713b556a1b8cb40aad97fc58d619_Out_2_Float, float(0), _Maximum_d02e48d92038448cb0345e5cf3779071_Out_2_Float);
        float3 _Multiply_79b0b5d7d3528b8395e1135339a090f2_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Property_dd1c841a04c03f8c85e7b00eb025ecda_Out_0_Vector3, (_Maximum_d02e48d92038448cb0345e5cf3779071_Out_2_Float.xxx), _Multiply_79b0b5d7d3528b8395e1135339a090f2_Out_2_Vector3);
        float3 _Property_c7292b3b08585f8c8670172b9a220bf0_Out_0_Vector3 = Vector3_79AA92F;
        float _Property_5e920479576fad83ba1947728dcceab4_Out_0_Float = Vector1_F7E83F1E;
        float _Subtract_b7368f21be9e048aae7f90c8a2bfaae1_Out_2_Float;
        Unity_Subtract_float(_Property_5e920479576fad83ba1947728dcceab4_Out_0_Float, _Subtract_61ca880c04c1758eb128f25c9faabd63_Out_2_Float, _Subtract_b7368f21be9e048aae7f90c8a2bfaae1_Out_2_Float);
        float _Maximum_216777d30802328eab607c8fe68ba3a1_Out_2_Float;
        Unity_Maximum_float(_Subtract_b7368f21be9e048aae7f90c8a2bfaae1_Out_2_Float, float(0), _Maximum_216777d30802328eab607c8fe68ba3a1_Out_2_Float);
        float3 _Multiply_a856b52cd0848f86a6ae1af9b175935c_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Property_c7292b3b08585f8c8670172b9a220bf0_Out_0_Vector3, (_Maximum_216777d30802328eab607c8fe68ba3a1_Out_2_Float.xxx), _Multiply_a856b52cd0848f86a6ae1af9b175935c_Out_2_Vector3);
        float3 _Add_86c6109dc4530b8c9763ef62b056ad4c_Out_2_Vector3;
        Unity_Add_float3(_Multiply_79b0b5d7d3528b8395e1135339a090f2_Out_2_Vector3, _Multiply_a856b52cd0848f86a6ae1af9b175935c_Out_2_Vector3, _Add_86c6109dc4530b8c9763ef62b056ad4c_Out_2_Vector3);
        float _Add_356384b52728f583bd6e694bc1fc3738_Out_2_Float;
        Unity_Add_float(_Maximum_d02e48d92038448cb0345e5cf3779071_Out_2_Float, _Maximum_216777d30802328eab607c8fe68ba3a1_Out_2_Float, _Add_356384b52728f583bd6e694bc1fc3738_Out_2_Float);
        float _Maximum_94a22f5ceb706e88bc16350a5d5d2a82_Out_2_Float;
        Unity_Maximum_float(_Add_356384b52728f583bd6e694bc1fc3738_Out_2_Float, float(1E-05), _Maximum_94a22f5ceb706e88bc16350a5d5d2a82_Out_2_Float);
        float3 _Divide_d7291d1701d7058dbb5263194c1bed22_Out_2_Vector3;
        Unity_Divide_float3(_Add_86c6109dc4530b8c9763ef62b056ad4c_Out_2_Vector3, (_Maximum_94a22f5ceb706e88bc16350a5d5d2a82_Out_2_Float.xxx), _Divide_d7291d1701d7058dbb5263194c1bed22_Out_2_Vector3);
        OutVector4_1 = _Divide_d7291d1701d7058dbb5263194c1bed22_Out_2_Vector3;
        }
        
        void Unity_Clamp_float(float In, float Min, float Max, out float Out)
        {
            Out = clamp(In, Min, Max);
        }
        
        void Unity_Normalize_float3(float3 In, out float3 Out)
        {
            Out = normalize(In);
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
        
        void Unity_NormalStrength_float(float3 In, float Strength, out float3 Out)
        {
            Out = float3(In.rg * Strength, lerp(1, In.b, saturate(Strength)));
        }
        
        void Unity_Divide_float(float A, float B, out float Out)
        {
            Out = A / B;
        }
        
        void Unity_Absolute_float(float In, out float Out)
        {
            Out = abs(In);
        }
        
        void Unity_Power_float(float A, float B, out float Out)
        {
            Out = pow(A, B);
        }
        
        void Unity_Saturate_float(float In, out float Out)
        {
            Out = saturate(In);
        }
        
        void Unity_Lerp_float3(float3 A, float3 B, float3 T, out float3 Out)
        {
            Out = lerp(A, B, T);
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
            UnityTexture2D _Property_d92b1410e1d6bc81a86076b09e35f302_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseColorMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_d4a357b2daff5587ae46468726a33797_Out_0_Vector4 = _BaseTilingOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Divide_c703c79d4bf76e8c9848ea2ecd29211f_Out_2_Vector4;
            Unity_Divide_float4(float4(1, 1, 0, 0), _Property_d4a357b2daff5587ae46468726a33797_Out_0_Vector4, _Divide_c703c79d4bf76e8c9848ea2ecd29211f_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_b168be530d5b4082a2816fc835b55e19_Out_0_Float = _BaseTriplanarThreshold;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579;
            _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4;
            float4 _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XZ_2_Vector4;
            float4 _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_YZ_3_Vector4;
            float4 _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_d92b1410e1d6bc81a86076b09e35f302_Out_0_Texture2D, (_Divide_c703c79d4bf76e8c9848ea2ecd29211f_Out_2_Vector4).x, _Property_b168be530d5b4082a2816fc835b55e19_Out_0_Float, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XZ_2_Vector4, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_YZ_3_Vector4, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_17f0f1bec4ec6485881127275660d4f1_Out_0_Vector4 = _BaseColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Multiply_6434c1e27d77608fb8dcec94697eb8d3_Out_2_Vector4;
            Unity_Multiply_float4_float4(_TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4, _Property_17f0f1bec4ec6485881127275660d4f1_Out_0_Vector4, _Multiply_6434c1e27d77608fb8dcec94697eb8d3_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_080b6cb46abb00848263c964726eac36_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseMaskMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c;
            _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XYZ_1_Vector4;
            float4 _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XZ_2_Vector4;
            float4 _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_YZ_3_Vector4;
            float4 _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_080b6cb46abb00848263c964726eac36_Out_0_Texture2D, (_Divide_c703c79d4bf76e8c9848ea2ecd29211f_Out_2_Vector4).x, _Property_b168be530d5b4082a2816fc835b55e19_Out_0_Float, _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c, _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XYZ_1_Vector4, _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XZ_2_Vector4, _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_YZ_3_Vector4, _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_866a663ed067f988862843fe32765ff8_R_1_Float = _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XYZ_1_Vector4[0];
            float _Split_866a663ed067f988862843fe32765ff8_G_2_Float = _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XYZ_1_Vector4[1];
            float _Split_866a663ed067f988862843fe32765ff8_B_3_Float = _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XYZ_1_Vector4[2];
            float _Split_866a663ed067f988862843fe32765ff8_A_4_Float = _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XYZ_1_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_3b9891099f2f3e84b765eb453f6f6810_Out_0_Float = _HeightMin;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_bde21360babd9089a90a45cd2843925b_Out_0_Float = _HeightMax;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_9f8e90f51ffcfe8bb3d495766c0cabca_Out_0_Vector2 = float2(_Property_3b9891099f2f3e84b765eb453f6f6810_Out_0_Float, _Property_bde21360babd9089a90a45cd2843925b_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_6ff6d72f7b1d0083b4e4ce61e7e7c8d3_Out_0_Float = _HeightOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Add_39687f6bf7045086bc2d1ccf5f94c9de_Out_2_Vector2;
            Unity_Add_float2(_Vector2_9f8e90f51ffcfe8bb3d495766c0cabca_Out_0_Vector2, (_Property_6ff6d72f7b1d0083b4e4ce61e7e7c8d3_Out_0_Float.xx), _Add_39687f6bf7045086bc2d1ccf5f94c9de_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_ddc02d039a9d5388b8add0d2d673d4ac_Out_3_Float;
            Unity_Remap_float(_Split_866a663ed067f988862843fe32765ff8_B_3_Float, float2 (0, 1), _Add_39687f6bf7045086bc2d1ccf5f94c9de_Out_2_Vector2, _Remap_ddc02d039a9d5388b8add0d2d673d4ac_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_11586ef261ce8e87953046ff84ce22ab_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_Base2ColorMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_221c724b2137d58c8c387fee5b48be14_Out_0_Vector4 = _Base2TilingOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Divide_9f3f46254d5f7a8e87f60c4aa6f5522c_Out_2_Vector4;
            Unity_Divide_float4(float4(1, 1, 0, 0), _Property_221c724b2137d58c8c387fee5b48be14_Out_0_Vector4, _Divide_9f3f46254d5f7a8e87f60c4aa6f5522c_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_20f6a96f64098d87b850c83bc45ddcee_Out_0_Float = _Base2TriplanarThreshold;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_ca3aaaec266f85859b75e37163da7cba;
            _TriplanarNM_ca3aaaec266f85859b75e37163da7cba.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_ca3aaaec266f85859b75e37163da7cba.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_ca3aaaec266f85859b75e37163da7cba_XYZ_1_Vector4;
            float4 _TriplanarNM_ca3aaaec266f85859b75e37163da7cba_XZ_2_Vector4;
            float4 _TriplanarNM_ca3aaaec266f85859b75e37163da7cba_YZ_3_Vector4;
            float4 _TriplanarNM_ca3aaaec266f85859b75e37163da7cba_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_11586ef261ce8e87953046ff84ce22ab_Out_0_Texture2D, (_Divide_9f3f46254d5f7a8e87f60c4aa6f5522c_Out_2_Vector4).x, _Property_20f6a96f64098d87b850c83bc45ddcee_Out_0_Float, _TriplanarNM_ca3aaaec266f85859b75e37163da7cba, _TriplanarNM_ca3aaaec266f85859b75e37163da7cba_XYZ_1_Vector4, _TriplanarNM_ca3aaaec266f85859b75e37163da7cba_XZ_2_Vector4, _TriplanarNM_ca3aaaec266f85859b75e37163da7cba_YZ_3_Vector4, _TriplanarNM_ca3aaaec266f85859b75e37163da7cba_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_60dff9cc4310ea89874789591a78d84b_Out_0_Vector4 = _Base2Color;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Multiply_4d8e3ca1454e2d85963c9d240239a171_Out_2_Vector4;
            Unity_Multiply_float4_float4(_TriplanarNM_ca3aaaec266f85859b75e37163da7cba_XYZ_1_Vector4, _Property_60dff9cc4310ea89874789591a78d84b_Out_0_Vector4, _Multiply_4d8e3ca1454e2d85963c9d240239a171_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_312b653a29ccc087849b1493611fb73c_Out_0_Boolean = _Invert_Layer_Mask;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_1004d4c014377e8c8fa291ed748b9f84_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_LayerMask);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _SampleTexture2D_c910b4b42510578d81c16169d3cb5727_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_1004d4c014377e8c8fa291ed748b9f84_Out_0_Texture2D.tex, _Property_1004d4c014377e8c8fa291ed748b9f84_Out_0_Texture2D.samplerstate, _Property_1004d4c014377e8c8fa291ed748b9f84_Out_0_Texture2D.GetTransformedUV(IN.uv0.xy) );
            float _SampleTexture2D_c910b4b42510578d81c16169d3cb5727_R_4_Float = _SampleTexture2D_c910b4b42510578d81c16169d3cb5727_RGBA_0_Vector4.r;
            float _SampleTexture2D_c910b4b42510578d81c16169d3cb5727_G_5_Float = _SampleTexture2D_c910b4b42510578d81c16169d3cb5727_RGBA_0_Vector4.g;
            float _SampleTexture2D_c910b4b42510578d81c16169d3cb5727_B_6_Float = _SampleTexture2D_c910b4b42510578d81c16169d3cb5727_RGBA_0_Vector4.b;
            float _SampleTexture2D_c910b4b42510578d81c16169d3cb5727_A_7_Float = _SampleTexture2D_c910b4b42510578d81c16169d3cb5727_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_bc0b8885b596648d9b594130faa6585c_Out_1_Float;
            Unity_OneMinus_float(_SampleTexture2D_c910b4b42510578d81c16169d3cb5727_R_4_Float, _OneMinus_bc0b8885b596648d9b594130faa6585c_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Branch_6b7615e16629338ba87d3570a0096f66_Out_3_Float;
            Unity_Branch_float(_Property_312b653a29ccc087849b1493611fb73c_Out_0_Boolean, _OneMinus_bc0b8885b596648d9b594130faa6585c_Out_1_Float, _SampleTexture2D_c910b4b42510578d81c16169d3cb5727_R_4_Float, _Branch_6b7615e16629338ba87d3570a0096f66_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_b4749c77856157858fffde0aed55fc74_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_Base2MaskMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b;
            _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_XYZ_1_Vector4;
            float4 _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_XZ_2_Vector4;
            float4 _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_YZ_3_Vector4;
            float4 _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_b4749c77856157858fffde0aed55fc74_Out_0_Texture2D, (_Divide_9f3f46254d5f7a8e87f60c4aa6f5522c_Out_2_Vector4).x, _Property_20f6a96f64098d87b850c83bc45ddcee_Out_0_Float, _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b, _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_XYZ_1_Vector4, _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_XZ_2_Vector4, _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_YZ_3_Vector4, _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_0b441b86fba0ea80bc060dae9d7ed0d7_R_1_Float = _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_XYZ_1_Vector4[0];
            float _Split_0b441b86fba0ea80bc060dae9d7ed0d7_G_2_Float = _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_XYZ_1_Vector4[1];
            float _Split_0b441b86fba0ea80bc060dae9d7ed0d7_B_3_Float = _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_XYZ_1_Vector4[2];
            float _Split_0b441b86fba0ea80bc060dae9d7ed0d7_A_4_Float = _TriplanarNM_e1cbd521c1f2548db05840885a8dbe6b_XYZ_1_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_c1de6a6321562383bfac4b318fc7b0d3_Out_0_Float = _HeightMin2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_145222f375008a879315637be0f172c5_Out_0_Float = _HeightMax2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_416c3ee3a60cc686b2d2360a073acfad_Out_0_Vector2 = float2(_Property_c1de6a6321562383bfac4b318fc7b0d3_Out_0_Float, _Property_145222f375008a879315637be0f172c5_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_8be924d801daee88b294af592a560e75_Out_0_Float = _HeightOffset2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Add_37703f1eb9ce078daaedca833705f5dd_Out_2_Vector2;
            Unity_Add_float2(_Vector2_416c3ee3a60cc686b2d2360a073acfad_Out_0_Vector2, (_Property_8be924d801daee88b294af592a560e75_Out_0_Float.xx), _Add_37703f1eb9ce078daaedca833705f5dd_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_5a8467f2416dc98699682a4cf64a69aa_Out_3_Float;
            Unity_Remap_float(_Split_0b441b86fba0ea80bc060dae9d7ed0d7_B_3_Float, float2 (0, 1), _Add_37703f1eb9ce078daaedca833705f5dd_Out_2_Vector2, _Remap_5a8467f2416dc98699682a4cf64a69aa_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_d9f42ca072d9188ab2566400157a199f_Out_2_Float;
            Unity_Multiply_float_float(_Branch_6b7615e16629338ba87d3570a0096f66_Out_3_Float, _Remap_5a8467f2416dc98699682a4cf64a69aa_Out_3_Float, _Multiply_d9f42ca072d9188ab2566400157a199f_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_b4d08e724ec3df88ab7743c5b7a3f081_R_1_Float = IN.VertexColor[0];
            float _Split_b4d08e724ec3df88ab7743c5b7a3f081_G_2_Float = IN.VertexColor[1];
            float _Split_b4d08e724ec3df88ab7743c5b7a3f081_B_3_Float = IN.VertexColor[2];
            float _Split_b4d08e724ec3df88ab7743c5b7a3f081_A_4_Float = IN.VertexColor[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_55cb55224306dc818a87a2dbf82d5af0_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_d9f42ca072d9188ab2566400157a199f_Out_2_Float, _Split_b4d08e724ec3df88ab7743c5b7a3f081_B_3_Float, _Multiply_55cb55224306dc818a87a2dbf82d5af0_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_c0dc9341fd635288a1c2869945617704_Out_0_Float = _Height_Transition;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float _HeightBlend_d30f443b26dc0d8087616105058c020a;
            float3 _HeightBlend_d30f443b26dc0d8087616105058c020a_OutVector4_1_Vector3;
            SG_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float((_Multiply_6434c1e27d77608fb8dcec94697eb8d3_Out_2_Vector4.xyz), _Remap_ddc02d039a9d5388b8add0d2d673d4ac_Out_3_Float, (_Multiply_4d8e3ca1454e2d85963c9d240239a171_Out_2_Vector4.xyz), _Multiply_55cb55224306dc818a87a2dbf82d5af0_Out_2_Float, _Property_c0dc9341fd635288a1c2869945617704_Out_0_Float, _HeightBlend_d30f443b26dc0d8087616105058c020a, _HeightBlend_d30f443b26dc0d8087616105058c020a_OutVector4_1_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_0b7ec0ec463cd88c8269ef0d2c98eb85_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverBaseColorMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_9bedb34aba10fa89a5f5b18919971491_Out_0_Vector4 = _CoverTilingOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Divide_ddaec3b56c9fc58ca3314b828c03b1c8_Out_2_Vector4;
            Unity_Divide_float4(float4(1, 1, 0, 0), _Property_9bedb34aba10fa89a5f5b18919971491_Out_0_Vector4, _Divide_ddaec3b56c9fc58ca3314b828c03b1c8_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_bf361924f27f848994241bda91fc2005_Out_0_Float = _CoverTriplanarThreshold;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793;
            _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XYZ_1_Vector4;
            float4 _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XZ_2_Vector4;
            float4 _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_YZ_3_Vector4;
            float4 _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_0b7ec0ec463cd88c8269ef0d2c98eb85_Out_0_Texture2D, (_Divide_ddaec3b56c9fc58ca3314b828c03b1c8_Out_2_Vector4).x, _Property_bf361924f27f848994241bda91fc2005_Out_0_Float, _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793, _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XYZ_1_Vector4, _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XZ_2_Vector4, _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_YZ_3_Vector4, _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_19547f2fe562798683b730e775cbfb39_Out_0_Vector4 = _CoverBaseColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Multiply_0652b80f60f8ed84beea389318719c9a_Out_2_Vector4;
            Unity_Multiply_float4_float4(_TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XYZ_1_Vector4, _Property_19547f2fe562798683b730e775cbfb39_Out_0_Vector4, _Multiply_0652b80f60f8ed84beea389318719c9a_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_ed6385cfee8242c58d906f36e90cb607_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverBaseColorMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _UV_13d53a8c036ded8490c69d17b7a3bb72_Out_0_Vector4 = IN.uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _SampleTexture2D_b8be215db546638398ea07060feb5224_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_ed6385cfee8242c58d906f36e90cb607_Out_0_Texture2D.tex, _Property_ed6385cfee8242c58d906f36e90cb607_Out_0_Texture2D.samplerstate, _Property_ed6385cfee8242c58d906f36e90cb607_Out_0_Texture2D.GetTransformedUV((_UV_13d53a8c036ded8490c69d17b7a3bb72_Out_0_Vector4.xy)) );
            float _SampleTexture2D_b8be215db546638398ea07060feb5224_R_4_Float = _SampleTexture2D_b8be215db546638398ea07060feb5224_RGBA_0_Vector4.r;
            float _SampleTexture2D_b8be215db546638398ea07060feb5224_G_5_Float = _SampleTexture2D_b8be215db546638398ea07060feb5224_RGBA_0_Vector4.g;
            float _SampleTexture2D_b8be215db546638398ea07060feb5224_B_6_Float = _SampleTexture2D_b8be215db546638398ea07060feb5224_RGBA_0_Vector4.b;
            float _SampleTexture2D_b8be215db546638398ea07060feb5224_A_7_Float = _SampleTexture2D_b8be215db546638398ea07060feb5224_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_b3ce556358f99f80ae9037fb175f4c5f_Out_0_Float = _CoverMaskPower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_ea35dd8ed2523f8b9a4c52fc52ecff0e_Out_2_Float;
            Unity_Multiply_float_float(_SampleTexture2D_b8be215db546638398ea07060feb5224_A_7_Float, _Property_b3ce556358f99f80ae9037fb175f4c5f_Out_0_Float, _Multiply_ea35dd8ed2523f8b9a4c52fc52ecff0e_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_7c0c867aaa1f5b8683768528b130a408_Out_3_Float;
            Unity_Clamp_float(_Multiply_ea35dd8ed2523f8b9a4c52fc52ecff0e_Out_2_Float, float(0), float(1), _Clamp_7c0c867aaa1f5b8683768528b130a408_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Property_509761afcb3aad8f9a29405c122dbf08_Out_0_Vector3 = _CoverDirection;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_72c615246e955087b85288c29905f048_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseNormalMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNMn_059da9746584140498cd018db3c76047_float _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0;
            _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0.WorldSpaceTangent = IN.WorldSpaceTangent;
            _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0.WorldSpacePosition = IN.WorldSpacePosition;
            float4 _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XYZ_1_Vector4;
            float4 _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XZ_2_Vector4;
            float4 _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_YZ_3_Vector4;
            float4 _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XY_4_Vector4;
            SG_TriplanarNMn_059da9746584140498cd018db3c76047_float(_Property_72c615246e955087b85288c29905f048_Out_0_Texture2D, (_Divide_c703c79d4bf76e8c9848ea2ecd29211f_Out_2_Vector4).x, _Property_b168be530d5b4082a2816fc835b55e19_Out_0_Float, _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0, _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XYZ_1_Vector4, _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XZ_2_Vector4, _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_YZ_3_Vector4, _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_7edd97bda70eb38a8c4253094700be37_Out_0_Float = _BaseNormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _NormalStrength_8bafa3d69de37c818a39fccf03db9518_Out_2_Vector3;
            Unity_NormalStrength_float((_TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XYZ_1_Vector4.xyz), _Property_7edd97bda70eb38a8c4253094700be37_Out_0_Float, _NormalStrength_8bafa3d69de37c818a39fccf03db9518_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_6809577d1aa24984aa957e13d0574602_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_Base2NormalMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNMn_059da9746584140498cd018db3c76047_float _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc;
            _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc.WorldSpaceTangent = IN.WorldSpaceTangent;
            _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc.WorldSpacePosition = IN.WorldSpacePosition;
            float4 _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc_XYZ_1_Vector4;
            float4 _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc_XZ_2_Vector4;
            float4 _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc_YZ_3_Vector4;
            float4 _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc_XY_4_Vector4;
            SG_TriplanarNMn_059da9746584140498cd018db3c76047_float(_Property_6809577d1aa24984aa957e13d0574602_Out_0_Texture2D, (_Divide_9f3f46254d5f7a8e87f60c4aa6f5522c_Out_2_Vector4).x, _Property_20f6a96f64098d87b850c83bc45ddcee_Out_0_Float, _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc, _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc_XYZ_1_Vector4, _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc_XZ_2_Vector4, _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc_YZ_3_Vector4, _TriplanarNMn_8890d23c68a4598d85a048422a8f36fc_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_c3260886a9a91b82a3d14c25e6fd0d2c_Out_0_Float = _Base2NormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _NormalStrength_d049a259d0377180a2e5959b925a78bc_Out_2_Vector3;
            Unity_NormalStrength_float((_TriplanarNMn_8890d23c68a4598d85a048422a8f36fc_XYZ_1_Vector4.xyz), _Property_c3260886a9a91b82a3d14c25e6fd0d2c_Out_0_Float, _NormalStrength_d049a259d0377180a2e5959b925a78bc_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float _HeightBlend_a6bf16c3496e828984e7277239132d42;
            float3 _HeightBlend_a6bf16c3496e828984e7277239132d42_OutVector4_1_Vector3;
            SG_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float(_NormalStrength_8bafa3d69de37c818a39fccf03db9518_Out_2_Vector3, _Remap_ddc02d039a9d5388b8add0d2d673d4ac_Out_3_Float, _NormalStrength_d049a259d0377180a2e5959b925a78bc_Out_2_Vector3, _Multiply_55cb55224306dc818a87a2dbf82d5af0_Out_2_Float, _Property_c0dc9341fd635288a1c2869945617704_Out_0_Float, _HeightBlend_a6bf16c3496e828984e7277239132d42, _HeightBlend_a6bf16c3496e828984e7277239132d42_OutVector4_1_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_1dcbde2a42b87e81bb254fd87a4816a5_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverNormalMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNMn_059da9746584140498cd018db3c76047_float _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58;
            _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58.WorldSpaceTangent = IN.WorldSpaceTangent;
            _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58.WorldSpacePosition = IN.WorldSpacePosition;
            float4 _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XYZ_1_Vector4;
            float4 _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XZ_2_Vector4;
            float4 _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_YZ_3_Vector4;
            float4 _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XY_4_Vector4;
            SG_TriplanarNMn_059da9746584140498cd018db3c76047_float(_Property_1dcbde2a42b87e81bb254fd87a4816a5_Out_0_Texture2D, (_Divide_ddaec3b56c9fc58ca3314b828c03b1c8_Out_2_Vector4).x, _Property_bf361924f27f848994241bda91fc2005_Out_0_Float, _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58, _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XYZ_1_Vector4, _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XZ_2_Vector4, _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_YZ_3_Vector4, _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_9176e0d3ea9ff88a9b888a200800b92d_Out_0_Float = _CoverNormalBlendHardness;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _NormalStrength_51679ed1e0a0ef8aa01b53b035a4da51_Out_2_Vector3;
            Unity_NormalStrength_float((_TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XYZ_1_Vector4.xyz), _Property_9176e0d3ea9ff88a9b888a200800b92d_Out_0_Float, _NormalStrength_51679ed1e0a0ef8aa01b53b035a4da51_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Multiply_ea6008eef104198ca40a18608c76d5a4_Out_2_Vector3;
            Unity_Multiply_float3_float3(_Property_509761afcb3aad8f9a29405c122dbf08_Out_0_Vector3, IN.WorldSpaceNormal, _Multiply_ea6008eef104198ca40a18608c76d5a4_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_e74c8f300b486e86a5700118b60b7885_R_1_Float = _Multiply_ea6008eef104198ca40a18608c76d5a4_Out_2_Vector3[0];
            float _Split_e74c8f300b486e86a5700118b60b7885_G_2_Float = _Multiply_ea6008eef104198ca40a18608c76d5a4_Out_2_Vector3[1];
            float _Split_e74c8f300b486e86a5700118b60b7885_B_3_Float = _Multiply_ea6008eef104198ca40a18608c76d5a4_Out_2_Vector3[2];
            float _Split_e74c8f300b486e86a5700118b60b7885_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_57be4f2ffc62ef89a9b736e6f1a99790_Out_2_Float;
            Unity_Add_float(_Split_e74c8f300b486e86a5700118b60b7885_R_1_Float, _Split_e74c8f300b486e86a5700118b60b7885_G_2_Float, _Add_57be4f2ffc62ef89a9b736e6f1a99790_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_abe82f22f31b958eaf9f12f8db5f150d_Out_2_Float;
            Unity_Add_float(_Add_57be4f2ffc62ef89a9b736e6f1a99790_Out_2_Float, _Split_e74c8f300b486e86a5700118b60b7885_B_3_Float, _Add_abe82f22f31b958eaf9f12f8db5f150d_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_ca7cc2d889a56683904c7546a72cedbf_Out_0_Float = _Cover_Amount;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_398a4ebc3d0302828e04c782fb4f49be_Out_0_Float = _Cover_Amount_Grow_Speed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Subtract_9340fe9ac4518a8aa343888dc6143619_Out_2_Float;
            Unity_Subtract_float(float(4), _Property_398a4ebc3d0302828e04c782fb4f49be_Out_0_Float, _Subtract_9340fe9ac4518a8aa343888dc6143619_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_58b01578ab8c8b858bb5e3a720366e16_Out_2_Float;
            Unity_Divide_float(_Property_ca7cc2d889a56683904c7546a72cedbf_Out_0_Float, _Subtract_9340fe9ac4518a8aa343888dc6143619_Out_2_Float, _Divide_58b01578ab8c8b858bb5e3a720366e16_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Absolute_a4d057707c029a85947bcf9de8128ee5_Out_1_Float;
            Unity_Absolute_float(_Divide_58b01578ab8c8b858bb5e3a720366e16_Out_2_Float, _Absolute_a4d057707c029a85947bcf9de8128ee5_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Power_681b2745dbae62839624b98240ca04f7_Out_2_Float;
            Unity_Power_float(_Absolute_a4d057707c029a85947bcf9de8128ee5_Out_1_Float, _Subtract_9340fe9ac4518a8aa343888dc6143619_Out_2_Float, _Power_681b2745dbae62839624b98240ca04f7_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_7340c193c2d92c81ba9dd931235ba17f_Out_3_Float;
            Unity_Clamp_float(_Power_681b2745dbae62839624b98240ca04f7_Out_2_Float, float(0), float(2), _Clamp_7340c193c2d92c81ba9dd931235ba17f_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_7632a3e8aed6d38e88c7f4b8e72f85dc_Out_2_Float;
            Unity_Multiply_float_float(_Add_abe82f22f31b958eaf9f12f8db5f150d_Out_2_Float, _Clamp_7340c193c2d92c81ba9dd931235ba17f_Out_3_Float, _Multiply_7632a3e8aed6d38e88c7f4b8e72f85dc_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Saturate_0541c8e45c0d1e84acab0ae3a59218fa_Out_1_Float;
            Unity_Saturate_float(_Multiply_7632a3e8aed6d38e88c7f4b8e72f85dc_Out_2_Float, _Saturate_0541c8e45c0d1e84acab0ae3a59218fa_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_3b62dfdf4a729d8a9b33398bfdcff203_Out_3_Float;
            Unity_Clamp_float(_Add_abe82f22f31b958eaf9f12f8db5f150d_Out_2_Float, float(0), float(0.9999), _Clamp_3b62dfdf4a729d8a9b33398bfdcff203_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_2df9fd6ca8ecaa828f0edb7582ef5616_Out_0_Float = _Cover_Max_Angle;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_1e9d5df33719338ca266a822ae3e1c73_Out_2_Float;
            Unity_Divide_float(_Property_2df9fd6ca8ecaa828f0edb7582ef5616_Out_0_Float, float(45), _Divide_1e9d5df33719338ca266a822ae3e1c73_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_2d91255cf28d138db7f5edc0eed1ea86_Out_1_Float;
            Unity_OneMinus_float(_Divide_1e9d5df33719338ca266a822ae3e1c73_Out_2_Float, _OneMinus_2d91255cf28d138db7f5edc0eed1ea86_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Subtract_2ae31a316a35bf8882b8de8d71b44b9f_Out_2_Float;
            Unity_Subtract_float(_Clamp_3b62dfdf4a729d8a9b33398bfdcff203_Out_3_Float, _OneMinus_2d91255cf28d138db7f5edc0eed1ea86_Out_1_Float, _Subtract_2ae31a316a35bf8882b8de8d71b44b9f_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_a3af3696fa69dc8cb04a65e84a3c6c98_Out_3_Float;
            Unity_Clamp_float(_Subtract_2ae31a316a35bf8882b8de8d71b44b9f_Out_2_Float, float(0), float(2), _Clamp_a3af3696fa69dc8cb04a65e84a3c6c98_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_467a4be5b52daa80b2d4bf46d2f429c9_Out_2_Float;
            Unity_Divide_float(float(1), _Divide_1e9d5df33719338ca266a822ae3e1c73_Out_2_Float, _Divide_467a4be5b52daa80b2d4bf46d2f429c9_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_749d76436ed5e58abec68ae130db866b_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_a3af3696fa69dc8cb04a65e84a3c6c98_Out_3_Float, _Divide_467a4be5b52daa80b2d4bf46d2f429c9_Out_2_Float, _Multiply_749d76436ed5e58abec68ae130db866b_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Absolute_043a189b52847189ad0575955b41f403_Out_1_Float;
            Unity_Absolute_float(_Multiply_749d76436ed5e58abec68ae130db866b_Out_2_Float, _Absolute_043a189b52847189ad0575955b41f403_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_d4f4330ee4eced8d88fb074732401835_Out_0_Float = _CoverHardness;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Power_39a2971fc28ddc8e9f6d1423e692613d_Out_2_Float;
            Unity_Power_float(_Absolute_043a189b52847189ad0575955b41f403_Out_1_Float, _Property_d4f4330ee4eced8d88fb074732401835_Out_0_Float, _Power_39a2971fc28ddc8e9f6d1423e692613d_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_ecc3c7fdca2e938aa029cd0ff4fb9db6_Out_0_Float = _Cover_Min_Height;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_6fb68ea250dfc28b97bc87b4872d90b2_Out_1_Float;
            Unity_OneMinus_float(_Property_ecc3c7fdca2e938aa029cd0ff4fb9db6_Out_0_Float, _OneMinus_6fb68ea250dfc28b97bc87b4872d90b2_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_815418660959f184b10470e678ebae30_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
            float _Split_815418660959f184b10470e678ebae30_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
            float _Split_815418660959f184b10470e678ebae30_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
            float _Split_815418660959f184b10470e678ebae30_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_9c527d082534a687b4f0de2b26f2d04d_Out_2_Float;
            Unity_Add_float(_OneMinus_6fb68ea250dfc28b97bc87b4872d90b2_Out_1_Float, _Split_815418660959f184b10470e678ebae30_G_2_Float, _Add_9c527d082534a687b4f0de2b26f2d04d_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_9e2bffcd3cb38a83b04f8e67c5c96a06_Out_2_Float;
            Unity_Add_float(_Add_9c527d082534a687b4f0de2b26f2d04d_Out_2_Float, float(1), _Add_9e2bffcd3cb38a83b04f8e67c5c96a06_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_0d06020cc00e3887b95a3ebd8edd196f_Out_3_Float;
            Unity_Clamp_float(_Add_9e2bffcd3cb38a83b04f8e67c5c96a06_Out_2_Float, float(0), float(1), _Clamp_0d06020cc00e3887b95a3ebd8edd196f_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_6ec32fc8c4434e8b84cf41dd6b52dd34_Out_0_Float = _Cover_Min_Height_Blending;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_e57f70c02382b28397642f05af76cfb0_Out_2_Float;
            Unity_Add_float(_Add_9c527d082534a687b4f0de2b26f2d04d_Out_2_Float, _Property_6ec32fc8c4434e8b84cf41dd6b52dd34_Out_0_Float, _Add_e57f70c02382b28397642f05af76cfb0_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_94bc0a8d86daee888d2cd450fbf0d53e_Out_2_Float;
            Unity_Divide_float(_Add_e57f70c02382b28397642f05af76cfb0_Out_2_Float, _Add_9c527d082534a687b4f0de2b26f2d04d_Out_2_Float, _Divide_94bc0a8d86daee888d2cd450fbf0d53e_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_5447f70dbea44185b79c1ac1bb5ea4fa_Out_1_Float;
            Unity_OneMinus_float(_Divide_94bc0a8d86daee888d2cd450fbf0d53e_Out_2_Float, _OneMinus_5447f70dbea44185b79c1ac1bb5ea4fa_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_de674a5c5a1a348688c87f45d79cf9a1_Out_2_Float;
            Unity_Add_float(_OneMinus_5447f70dbea44185b79c1ac1bb5ea4fa_Out_1_Float, float(-0.5), _Add_de674a5c5a1a348688c87f45d79cf9a1_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_3244d6500fdd2c8a92b20a9929d61642_Out_3_Float;
            Unity_Clamp_float(_Add_de674a5c5a1a348688c87f45d79cf9a1_Out_2_Float, float(0), float(1), _Clamp_3244d6500fdd2c8a92b20a9929d61642_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_ea368e3c8a99368d917c930eb07b8e9f_Out_2_Float;
            Unity_Add_float(_Clamp_0d06020cc00e3887b95a3ebd8edd196f_Out_3_Float, _Clamp_3244d6500fdd2c8a92b20a9929d61642_Out_3_Float, _Add_ea368e3c8a99368d917c930eb07b8e9f_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_ce483c505aaa1f83b698a43bb22bf259_Out_3_Float;
            Unity_Clamp_float(_Add_ea368e3c8a99368d917c930eb07b8e9f_Out_2_Float, float(0), float(1), _Clamp_ce483c505aaa1f83b698a43bb22bf259_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_d1b58293be2e9982898e4a432bd61149_Out_2_Float;
            Unity_Multiply_float_float(_Power_39a2971fc28ddc8e9f6d1423e692613d_Out_2_Float, _Clamp_ce483c505aaa1f83b698a43bb22bf259_Out_3_Float, _Multiply_d1b58293be2e9982898e4a432bd61149_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_5336a32115eb29849650688fd99ee185_Out_2_Float;
            Unity_Multiply_float_float(_Saturate_0541c8e45c0d1e84acab0ae3a59218fa_Out_1_Float, _Multiply_d1b58293be2e9982898e4a432bd61149_Out_2_Float, _Multiply_5336a32115eb29849650688fd99ee185_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Lerp_f5ea06dcb1a8c58bac1ae497649cf333_Out_3_Vector3;
            Unity_Lerp_float3(_HeightBlend_a6bf16c3496e828984e7277239132d42_OutVector4_1_Vector3, _NormalStrength_51679ed1e0a0ef8aa01b53b035a4da51_Out_2_Vector3, (_Multiply_5336a32115eb29849650688fd99ee185_Out_2_Float.xxx), _Lerp_f5ea06dcb1a8c58bac1ae497649cf333_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Transform_9ae402175cd2148a9da0916d2d189ef9_Out_1_Vector3;
            {
                float3x3 tangentTransform = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
                _Transform_9ae402175cd2148a9da0916d2d189ef9_Out_1_Vector3 = TransformTangentToWorldDir(_Lerp_f5ea06dcb1a8c58bac1ae497649cf333_Out_3_Vector3.xyz, tangentTransform, true).xyz;
            }
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Multiply_d902e15376a26b8eac35506e85f63b36_Out_2_Vector3;
            Unity_Multiply_float3_float3(_Property_509761afcb3aad8f9a29405c122dbf08_Out_0_Vector3, _Transform_9ae402175cd2148a9da0916d2d189ef9_Out_1_Vector3, _Multiply_d902e15376a26b8eac35506e85f63b36_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_b821124768adb688becbc5d63b26adb4_R_1_Float = _Multiply_d902e15376a26b8eac35506e85f63b36_Out_2_Vector3[0];
            float _Split_b821124768adb688becbc5d63b26adb4_G_2_Float = _Multiply_d902e15376a26b8eac35506e85f63b36_Out_2_Vector3[1];
            float _Split_b821124768adb688becbc5d63b26adb4_B_3_Float = _Multiply_d902e15376a26b8eac35506e85f63b36_Out_2_Vector3[2];
            float _Split_b821124768adb688becbc5d63b26adb4_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_fd43b427bfe3748cb0ced35df3b22159_Out_2_Float;
            Unity_Add_float(_Split_b821124768adb688becbc5d63b26adb4_R_1_Float, _Split_b821124768adb688becbc5d63b26adb4_G_2_Float, _Add_fd43b427bfe3748cb0ced35df3b22159_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_508b788633abc0829f0843d1b1f942c2_Out_2_Float;
            Unity_Add_float(_Add_fd43b427bfe3748cb0ced35df3b22159_Out_2_Float, _Split_b821124768adb688becbc5d63b26adb4_B_3_Float, _Add_508b788633abc0829f0843d1b1f942c2_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_ad921fb726e47688a4d134f6fb3c2273_Out_2_Float;
            Unity_Multiply_float_float(_Add_508b788633abc0829f0843d1b1f942c2_Out_2_Float, _Clamp_7340c193c2d92c81ba9dd931235ba17f_Out_3_Float, _Multiply_ad921fb726e47688a4d134f6fb3c2273_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_90d91831d95dfc83b55e42e5746bd269_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_7340c193c2d92c81ba9dd931235ba17f_Out_3_Float, _Property_d4f4330ee4eced8d88fb074732401835_Out_0_Float, _Multiply_90d91831d95dfc83b55e42e5746bd269_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_b907f38702eabd80a6c67777243459de_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_90d91831d95dfc83b55e42e5746bd269_Out_2_Float, _Multiply_d1b58293be2e9982898e4a432bd61149_Out_2_Float, _Multiply_b907f38702eabd80a6c67777243459de_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_81bdd2734ef6c68fbc23ffe7409191b9_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_ad921fb726e47688a4d134f6fb3c2273_Out_2_Float, _Multiply_b907f38702eabd80a6c67777243459de_Out_2_Float, _Multiply_81bdd2734ef6c68fbc23ffe7409191b9_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_a0e97293ba0dfb83a0d87d28ef311bc7_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverMaskMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_9b6d5da081e434808a5840cbd915bb28;
            _TriplanarNM_9b6d5da081e434808a5840cbd915bb28.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_9b6d5da081e434808a5840cbd915bb28.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XYZ_1_Vector4;
            float4 _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XZ_2_Vector4;
            float4 _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_YZ_3_Vector4;
            float4 _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_a0e97293ba0dfb83a0d87d28ef311bc7_Out_0_Texture2D, (_Divide_ddaec3b56c9fc58ca3314b828c03b1c8_Out_2_Vector4).x, _Property_bf361924f27f848994241bda91fc2005_Out_0_Float, _TriplanarNM_9b6d5da081e434808a5840cbd915bb28, _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XYZ_1_Vector4, _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XZ_2_Vector4, _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_YZ_3_Vector4, _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_b20618c84cffd183aae7f27c2d0772cb_R_1_Float = _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XYZ_1_Vector4[0];
            float _Split_b20618c84cffd183aae7f27c2d0772cb_G_2_Float = _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XYZ_1_Vector4[1];
            float _Split_b20618c84cffd183aae7f27c2d0772cb_B_3_Float = _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XYZ_1_Vector4[2];
            float _Split_b20618c84cffd183aae7f27c2d0772cb_A_4_Float = _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XYZ_1_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_987a8037965fff81a4930627358fc6e3_Out_0_Float = _CoverHeightMapMin;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_89aeacdce0000086a98e45df79358a56_Out_0_Float = _CoverHeightMapMax;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_d18b9686bb8af48c85d99d319830c000_Out_0_Vector2 = float2(_Property_987a8037965fff81a4930627358fc6e3_Out_0_Float, _Property_89aeacdce0000086a98e45df79358a56_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_856fd4da5f3d1b8c9bdd6966daada2b2_Out_0_Float = _CoverHeightMapOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Add_935266d0fc26dc87a5909ea1bd8aa423_Out_2_Vector2;
            Unity_Add_float2(_Vector2_d18b9686bb8af48c85d99d319830c000_Out_0_Vector2, (_Property_856fd4da5f3d1b8c9bdd6966daada2b2_Out_0_Float.xx), _Add_935266d0fc26dc87a5909ea1bd8aa423_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_f85aa52613b0108d876fab409ea80b8c_Out_3_Float;
            Unity_Remap_float(_Split_b20618c84cffd183aae7f27c2d0772cb_B_3_Float, float2 (0, 1), _Add_935266d0fc26dc87a5909ea1bd8aa423_Out_2_Vector2, _Remap_f85aa52613b0108d876fab409ea80b8c_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_65b9c8cf3a459284a298aa84443140a2_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_81bdd2734ef6c68fbc23ffe7409191b9_Out_2_Float, _Remap_f85aa52613b0108d876fab409ea80b8c_Out_3_Float, _Multiply_65b9c8cf3a459284a298aa84443140a2_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_100e6799ca65308ca7cca7a0e52252db_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_65b9c8cf3a459284a298aa84443140a2_Out_2_Float, _Split_b4d08e724ec3df88ab7743c5b7a3f081_G_2_Float, _Multiply_100e6799ca65308ca7cca7a0e52252db_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Saturate_a340e45e54317a81ae145a84c72daa75_Out_1_Float;
            Unity_Saturate_float(_Multiply_100e6799ca65308ca7cca7a0e52252db_Out_2_Float, _Saturate_a340e45e54317a81ae145a84c72daa75_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_d8ca79d07c3bbe85b09000ed0e769324_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_7c0c867aaa1f5b8683768528b130a408_Out_3_Float, _Saturate_a340e45e54317a81ae145a84c72daa75_Out_1_Float, _Multiply_d8ca79d07c3bbe85b09000ed0e769324_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            #if defined(_USEDYNAMICCOVERTSTATICMASKF_ON)
            float _UseDynamicCoverTStaticMaskF_a32a3630501f778faf03be9cfccfec64_Out_0_Float = _Multiply_d8ca79d07c3bbe85b09000ed0e769324_Out_2_Float;
            #else
            float _UseDynamicCoverTStaticMaskF_a32a3630501f778faf03be9cfccfec64_Out_0_Float = _Clamp_7c0c867aaa1f5b8683768528b130a408_Out_3_Float;
            #endif
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Lerp_7b425abcb4dfd0859d63f71a714fbb7d_Out_3_Vector3;
            Unity_Lerp_float3(_HeightBlend_d30f443b26dc0d8087616105058c020a_OutVector4_1_Vector3, (_Multiply_0652b80f60f8ed84beea389318719c9a_Out_2_Vector4.xyz), (_UseDynamicCoverTStaticMaskF_a32a3630501f778faf03be9cfccfec64_Out_0_Float.xxx), _Lerp_7b425abcb4dfd0859d63f71a714fbb7d_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_2ff5681ef4527d809ef09fdc5f8ef937_Out_0_Vector4 = _WetColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Multiply_85d9904c4b12ce85939f7948252c76b2_Out_2_Vector3;
            Unity_Multiply_float3_float3((_Property_2ff5681ef4527d809ef09fdc5f8ef937_Out_0_Vector4.xyz), _Lerp_7b425abcb4dfd0859d63f71a714fbb7d_Out_3_Vector3, _Multiply_85d9904c4b12ce85939f7948252c76b2_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_f1784d825dacdb8785770d3eca446428_Out_1_Float;
            Unity_OneMinus_float(_Split_b4d08e724ec3df88ab7743c5b7a3f081_R_1_Float, _OneMinus_f1784d825dacdb8785770d3eca446428_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Lerp_f330c9b8f318a885ac2822e63f9269e8_Out_3_Vector3;
            Unity_Lerp_float3(_Lerp_7b425abcb4dfd0859d63f71a714fbb7d_Out_3_Vector3, _Multiply_85d9904c4b12ce85939f7948252c76b2_Out_2_Vector3, (_OneMinus_f1784d825dacdb8785770d3eca446428_Out_1_Float.xxx), _Lerp_f330c9b8f318a885ac2822e63f9269e8_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_2f38c4b6e08da48093bd9896985f29eb_R_1_Float = _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4[0];
            float _Split_2f38c4b6e08da48093bd9896985f29eb_G_2_Float = _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4[1];
            float _Split_2f38c4b6e08da48093bd9896985f29eb_B_3_Float = _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4[2];
            float _Split_2f38c4b6e08da48093bd9896985f29eb_A_4_Float = _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_a55cb5b55044058c90b91c360cd49672_Out_0_Float = _AlphaCutoff;
            #endif
            surface.BaseColor = _Lerp_f330c9b8f318a885ac2822e63f9269e8_Out_3_Vector3;
            surface.Alpha = _Split_2f38c4b6e08da48093bd9896985f29eb_A_4_Float;
            surface.AlphaClipThreshold = _Property_a55cb5b55044058c90b91c360cd49672_Out_0_Float;
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