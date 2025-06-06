﻿Shader "NatureManufacture/URP/Layered/Triplanar Cover"
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
        [Normal][NoScaleOffset]_Base2NormalMap("Base 2 Normal Map", 2D) = "bump" {}
        _Base2NormalScale("Base 2 Normal Scale", Range(0, 8)) = 1
        [ToggleUI]_Base2UsePlanarUV("Base 2 Use Planar UV", Float) = 0
        [NoScaleOffset]_Base2MaskMap("Base 2 Mask Map MT(R) AO(G) H(B) SM(A)", 2D) = "white" {}
        Vector1_D38A0468("Base 2 Metallic", Range(0, 1)) = 1
        _Base2SmoothnessRemapMin("Base 2 Smoothness Remap Min", Range(0, 1)) = 0
        _Base2SmoothnessRemapMax("Base 2 Smoothness Remap Max", Range(0, 1)) = 1
        _Base2AORemapMin("Base 2 AO Remap Min", Range(0, 1)) = 0
        _Base2AORemapMax("Base 2 AO Remap Max", Range(0, 1)) = 1
        _CoverMaskPower("Cover Mask Power", Range(0, 10)) = 1
        _Cover_Amount("Cover Amount", Range(0, 2)) = 0
        _Cover_Amount_Grow_Speed("Cover Amount Grow Speed", Range(0, 3)) = 3
        _CoverDirection("Cover Direction", Vector) = (0, 1, 0, 0)
        _Cover_Max_Angle("Cover Max Angle", Range(0.001, 90)) = 35
        _Cover_Min_Height("Cover Min Height", Float) = -10000
        _Cover_Min_Height_Blending("Cover Min Height Blending", Range(0, 500)) = 1
        _CoverBaseColor("Cover Base Color", Color) = (1, 1, 1, 0)
        [NoScaleOffset]_CoverBaseColorMap("Cover Base Map (RGB) Mask (A)", 2D) = "white" {}
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
        _CoverAORemapMax("Cover Smoothness Remap Min", Range(0, 1)) = 0
        _CoverSmoothnessRemapMin("Cover AO Remap Max", Range(0, 1)) = 1
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
        float4 _Base2NormalMap_TexelSize;
        float _Base2NormalScale;
        float _Base2UsePlanarUV;
        float4 _Base2MaskMap_TexelSize;
        float Vector1_D38A0468;
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
        
        void Unity_Multiply_float_float(float A, float B, out float Out)
        {
            Out = A * B;
        }
        
        void Unity_Maximum_float(float A, float B, out float Out)
        {
            Out = max(A, B);
        }
        
        void Unity_Subtract_float(float A, float B, out float Out)
        {
            Out = A - B;
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
            UnityTexture2D _Property_9877f7d14ab03a82ac49746caa97aeb7_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseColorMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_cdba86d1e85a37858062d83b2fa6392d_Out_0_Vector4 = _BaseTilingOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_c4d58d2885325e85994407e8fe45e088_Out_0_Boolean = _BaseUsePlanarUV;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_939c16e3e51f06888092ac69b8f75998;
            _PlanarNM_939c16e3e51f06888092ac69b8f75998.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_939c16e3e51f06888092ac69b8f75998.uv0 = IN.uv0;
            _PlanarNM_939c16e3e51f06888092ac69b8f75998.uv2 = IN.uv2;
            float4 _PlanarNM_939c16e3e51f06888092ac69b8f75998_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_9877f7d14ab03a82ac49746caa97aeb7_Out_0_Texture2D, _Property_cdba86d1e85a37858062d83b2fa6392d_Out_0_Vector4, _Property_c4d58d2885325e85994407e8fe45e088_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), 1, _PlanarNM_939c16e3e51f06888092ac69b8f75998, _PlanarNM_939c16e3e51f06888092ac69b8f75998_XZ_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_2c84a3da85882688884fbe610ed37b04_Out_0_Vector4 = _BaseColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Multiply_4dd3ecf3f3b38786bdcf91b238ffdbb2_Out_2_Vector4;
            Unity_Multiply_float4_float4(_PlanarNM_939c16e3e51f06888092ac69b8f75998_XZ_2_Vector4, _Property_2c84a3da85882688884fbe610ed37b04_Out_0_Vector4, _Multiply_4dd3ecf3f3b38786bdcf91b238ffdbb2_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_75d5c7e24ff6e88ab1561e2a54e6463d_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseMaskMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_f82d57d4f65ad48d9435f5e38fd6ce0c;
            _PlanarNM_f82d57d4f65ad48d9435f5e38fd6ce0c.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_f82d57d4f65ad48d9435f5e38fd6ce0c.uv0 = IN.uv0;
            _PlanarNM_f82d57d4f65ad48d9435f5e38fd6ce0c.uv2 = IN.uv2;
            float4 _PlanarNM_f82d57d4f65ad48d9435f5e38fd6ce0c_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_75d5c7e24ff6e88ab1561e2a54e6463d_Out_0_Texture2D, _Property_cdba86d1e85a37858062d83b2fa6392d_Out_0_Vector4, _Property_c4d58d2885325e85994407e8fe45e088_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), 1, _PlanarNM_f82d57d4f65ad48d9435f5e38fd6ce0c, _PlanarNM_f82d57d4f65ad48d9435f5e38fd6ce0c_XZ_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_2873060f5cfdf687b30bd679f8a5291e_R_1_Float = _PlanarNM_f82d57d4f65ad48d9435f5e38fd6ce0c_XZ_2_Vector4[0];
            float _Split_2873060f5cfdf687b30bd679f8a5291e_G_2_Float = _PlanarNM_f82d57d4f65ad48d9435f5e38fd6ce0c_XZ_2_Vector4[1];
            float _Split_2873060f5cfdf687b30bd679f8a5291e_B_3_Float = _PlanarNM_f82d57d4f65ad48d9435f5e38fd6ce0c_XZ_2_Vector4[2];
            float _Split_2873060f5cfdf687b30bd679f8a5291e_A_4_Float = _PlanarNM_f82d57d4f65ad48d9435f5e38fd6ce0c_XZ_2_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_57489d8e60c5e48ebbd4e6f83cd04306_Out_0_Float = _HeightMin;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_b3c11986fefcb082abf933a1c5505d71_Out_0_Float = _HeightMax;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_bf00af3771fe7882a94dd98123dc06eb_Out_0_Vector2 = float2(_Property_57489d8e60c5e48ebbd4e6f83cd04306_Out_0_Float, _Property_b3c11986fefcb082abf933a1c5505d71_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_d430dab1be180289a026a73080dc2a0d_Out_0_Float = _HeightOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Add_30485ad75da6dd8e9e1036d4537f114c_Out_2_Vector2;
            Unity_Add_float2(_Vector2_bf00af3771fe7882a94dd98123dc06eb_Out_0_Vector2, (_Property_d430dab1be180289a026a73080dc2a0d_Out_0_Float.xx), _Add_30485ad75da6dd8e9e1036d4537f114c_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_347bc01c0ddf72878c4eb9274baae4ff_Out_3_Float;
            Unity_Remap_float(_Split_2873060f5cfdf687b30bd679f8a5291e_B_3_Float, float2 (0, 1), _Add_30485ad75da6dd8e9e1036d4537f114c_Out_2_Vector2, _Remap_347bc01c0ddf72878c4eb9274baae4ff_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_99f7c3ef40e2a280b853a4806f4377cc_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_Base2ColorMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_391bce0a1bc4ae8a8574996dcfefab13_Out_0_Vector4 = _Base2TilingOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_b9b9b4cee220da8892912acbd91575dd_Out_0_Boolean = _Base2UsePlanarUV;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_8125b53543ccd48bb9175630cf7bbc44;
            _PlanarNM_8125b53543ccd48bb9175630cf7bbc44.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_8125b53543ccd48bb9175630cf7bbc44.uv0 = IN.uv0;
            _PlanarNM_8125b53543ccd48bb9175630cf7bbc44.uv2 = IN.uv2;
            float4 _PlanarNM_8125b53543ccd48bb9175630cf7bbc44_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_99f7c3ef40e2a280b853a4806f4377cc_Out_0_Texture2D, _Property_391bce0a1bc4ae8a8574996dcfefab13_Out_0_Vector4, _Property_b9b9b4cee220da8892912acbd91575dd_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), 1, _PlanarNM_8125b53543ccd48bb9175630cf7bbc44, _PlanarNM_8125b53543ccd48bb9175630cf7bbc44_XZ_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_a87fae0c6b1a0984b9ef7861ccc92da9_Out_0_Vector4 = _Base2Color;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Multiply_934c5505e5759286921bda248879c83f_Out_2_Vector4;
            Unity_Multiply_float4_float4(_PlanarNM_8125b53543ccd48bb9175630cf7bbc44_XZ_2_Vector4, _Property_a87fae0c6b1a0984b9ef7861ccc92da9_Out_0_Vector4, _Multiply_934c5505e5759286921bda248879c83f_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_bc8eb833b059c2879abda47a13239f66_R_1_Float = IN.VertexColor[0];
            float _Split_bc8eb833b059c2879abda47a13239f66_G_2_Float = IN.VertexColor[1];
            float _Split_bc8eb833b059c2879abda47a13239f66_B_3_Float = IN.VertexColor[2];
            float _Split_bc8eb833b059c2879abda47a13239f66_A_4_Float = IN.VertexColor[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_67acbc8108127387b3521a5887c8fd65_Out_0_Boolean = _Invert_Layer_Mask;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_ec66fdea21d60b889b53e96094a2bb5f_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_LayerMask);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _SampleTexture2D_1e04ec71d2a6c38aaa9df937b66dc947_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_ec66fdea21d60b889b53e96094a2bb5f_Out_0_Texture2D.tex, _Property_ec66fdea21d60b889b53e96094a2bb5f_Out_0_Texture2D.samplerstate, _Property_ec66fdea21d60b889b53e96094a2bb5f_Out_0_Texture2D.GetTransformedUV(IN.uv0.xy) );
            float _SampleTexture2D_1e04ec71d2a6c38aaa9df937b66dc947_R_4_Float = _SampleTexture2D_1e04ec71d2a6c38aaa9df937b66dc947_RGBA_0_Vector4.r;
            float _SampleTexture2D_1e04ec71d2a6c38aaa9df937b66dc947_G_5_Float = _SampleTexture2D_1e04ec71d2a6c38aaa9df937b66dc947_RGBA_0_Vector4.g;
            float _SampleTexture2D_1e04ec71d2a6c38aaa9df937b66dc947_B_6_Float = _SampleTexture2D_1e04ec71d2a6c38aaa9df937b66dc947_RGBA_0_Vector4.b;
            float _SampleTexture2D_1e04ec71d2a6c38aaa9df937b66dc947_A_7_Float = _SampleTexture2D_1e04ec71d2a6c38aaa9df937b66dc947_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_2ab824386c8b5f86a4f1baf709dea28e_Out_1_Float;
            Unity_OneMinus_float(_SampleTexture2D_1e04ec71d2a6c38aaa9df937b66dc947_R_4_Float, _OneMinus_2ab824386c8b5f86a4f1baf709dea28e_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Branch_6f5d54f970d03d8b8bfbf860a10aa6dc_Out_3_Float;
            Unity_Branch_float(_Property_67acbc8108127387b3521a5887c8fd65_Out_0_Boolean, _OneMinus_2ab824386c8b5f86a4f1baf709dea28e_Out_1_Float, _SampleTexture2D_1e04ec71d2a6c38aaa9df937b66dc947_R_4_Float, _Branch_6f5d54f970d03d8b8bfbf860a10aa6dc_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_312b7343c77e2a8eb60f73d6993817b8_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_Base2MaskMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_b5a5b9c7b16e58839fd9378c90580282;
            _PlanarNM_b5a5b9c7b16e58839fd9378c90580282.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_b5a5b9c7b16e58839fd9378c90580282.uv0 = IN.uv0;
            _PlanarNM_b5a5b9c7b16e58839fd9378c90580282.uv2 = IN.uv2;
            float4 _PlanarNM_b5a5b9c7b16e58839fd9378c90580282_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_312b7343c77e2a8eb60f73d6993817b8_Out_0_Texture2D, _Property_391bce0a1bc4ae8a8574996dcfefab13_Out_0_Vector4, _Property_b9b9b4cee220da8892912acbd91575dd_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), 1, _PlanarNM_b5a5b9c7b16e58839fd9378c90580282, _PlanarNM_b5a5b9c7b16e58839fd9378c90580282_XZ_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_b4d828c4dcef5489b007ef9d639c65c7_R_1_Float = _PlanarNM_b5a5b9c7b16e58839fd9378c90580282_XZ_2_Vector4[0];
            float _Split_b4d828c4dcef5489b007ef9d639c65c7_G_2_Float = _PlanarNM_b5a5b9c7b16e58839fd9378c90580282_XZ_2_Vector4[1];
            float _Split_b4d828c4dcef5489b007ef9d639c65c7_B_3_Float = _PlanarNM_b5a5b9c7b16e58839fd9378c90580282_XZ_2_Vector4[2];
            float _Split_b4d828c4dcef5489b007ef9d639c65c7_A_4_Float = _PlanarNM_b5a5b9c7b16e58839fd9378c90580282_XZ_2_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_6f4f0f0f513da587b5c0331584e50187_Out_0_Float = _HeightMin2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_a348a4abb5736887afa1734255606c10_Out_0_Float = _HeightMax2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_942eb4b05e4bd5808636661f3c5d2a5c_Out_0_Vector2 = float2(_Property_6f4f0f0f513da587b5c0331584e50187_Out_0_Float, _Property_a348a4abb5736887afa1734255606c10_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_5c92bca7a057e082a9ad31b6c041afbf_Out_0_Float = _HeightOffset2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Add_d827365fdb96108d96671f09a466ed5b_Out_2_Vector2;
            Unity_Add_float2(_Vector2_942eb4b05e4bd5808636661f3c5d2a5c_Out_0_Vector2, (_Property_5c92bca7a057e082a9ad31b6c041afbf_Out_0_Float.xx), _Add_d827365fdb96108d96671f09a466ed5b_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_76e4189c648f8389be05c05c248baa84_Out_3_Float;
            Unity_Remap_float(_Split_b4d828c4dcef5489b007ef9d639c65c7_B_3_Float, float2 (0, 1), _Add_d827365fdb96108d96671f09a466ed5b_Out_2_Vector2, _Remap_76e4189c648f8389be05c05c248baa84_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_b11faa069f3e798ab16c6246251d3f13_Out_2_Float;
            Unity_Multiply_float_float(_Branch_6f5d54f970d03d8b8bfbf860a10aa6dc_Out_3_Float, _Remap_76e4189c648f8389be05c05c248baa84_Out_3_Float, _Multiply_b11faa069f3e798ab16c6246251d3f13_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_1653ac275d976082acb8cc3cb2c7e0a9_Out_2_Float;
            Unity_Multiply_float_float(_Split_bc8eb833b059c2879abda47a13239f66_B_3_Float, _Multiply_b11faa069f3e798ab16c6246251d3f13_Out_2_Float, _Multiply_1653ac275d976082acb8cc3cb2c7e0a9_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_3fbe3f08ee2f5f8cb4e5ea37c77f429b_Out_0_Float = _Height_Transition;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float _HeightBlend_00a99a7141c28f80a07c77242fa96942;
            float3 _HeightBlend_00a99a7141c28f80a07c77242fa96942_OutVector4_1_Vector3;
            SG_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float((_Multiply_4dd3ecf3f3b38786bdcf91b238ffdbb2_Out_2_Vector4.xyz), _Remap_347bc01c0ddf72878c4eb9274baae4ff_Out_3_Float, (_Multiply_934c5505e5759286921bda248879c83f_Out_2_Vector4.xyz), _Multiply_1653ac275d976082acb8cc3cb2c7e0a9_Out_2_Float, _Property_3fbe3f08ee2f5f8cb4e5ea37c77f429b_Out_0_Float, _HeightBlend_00a99a7141c28f80a07c77242fa96942, _HeightBlend_00a99a7141c28f80a07c77242fa96942_OutVector4_1_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_11ef2dfbd610ec809f27f54da5f6d8eb_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverBaseColorMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_8229e2bff7eeb784bda5cb1a71007335_Out_0_Vector4 = _CoverTilingOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Divide_417e4c87f5de7b8abda7c05a2ef88056_Out_2_Vector4;
            Unity_Divide_float4(float4(1, 1, 0, 0), _Property_8229e2bff7eeb784bda5cb1a71007335_Out_0_Vector4, _Divide_417e4c87f5de7b8abda7c05a2ef88056_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_d62f7360b612d9809c3e73ad07243f08_Out_0_Float = _CoverTriplanarThreshold;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_7aa1ee497ef585889e9e6889c832028b;
            _TriplanarNM_7aa1ee497ef585889e9e6889c832028b.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_7aa1ee497ef585889e9e6889c832028b.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_7aa1ee497ef585889e9e6889c832028b_XYZ_1_Vector4;
            float4 _TriplanarNM_7aa1ee497ef585889e9e6889c832028b_XZ_2_Vector4;
            float4 _TriplanarNM_7aa1ee497ef585889e9e6889c832028b_YZ_3_Vector4;
            float4 _TriplanarNM_7aa1ee497ef585889e9e6889c832028b_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_11ef2dfbd610ec809f27f54da5f6d8eb_Out_0_Texture2D, (_Divide_417e4c87f5de7b8abda7c05a2ef88056_Out_2_Vector4).x, _Property_d62f7360b612d9809c3e73ad07243f08_Out_0_Float, _TriplanarNM_7aa1ee497ef585889e9e6889c832028b, _TriplanarNM_7aa1ee497ef585889e9e6889c832028b_XYZ_1_Vector4, _TriplanarNM_7aa1ee497ef585889e9e6889c832028b_XZ_2_Vector4, _TriplanarNM_7aa1ee497ef585889e9e6889c832028b_YZ_3_Vector4, _TriplanarNM_7aa1ee497ef585889e9e6889c832028b_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_6f1e31130250ca80aae786393f8e97e4_Out_0_Vector4 = _CoverBaseColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Multiply_14ce5f06524122898b5641da23fb0105_Out_2_Vector4;
            Unity_Multiply_float4_float4(_TriplanarNM_7aa1ee497ef585889e9e6889c832028b_XYZ_1_Vector4, _Property_6f1e31130250ca80aae786393f8e97e4_Out_0_Vector4, _Multiply_14ce5f06524122898b5641da23fb0105_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_9ff2eaae0dc74d9c9745b3fd09addcc9_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverBaseColorMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _UV_95a3b3f395e44d84a287ca09a90c4b36_Out_0_Vector4 = IN.uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _SampleTexture2D_1208d4f2cad47a8aa3dd7db5bdac6dbf_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_9ff2eaae0dc74d9c9745b3fd09addcc9_Out_0_Texture2D.tex, _Property_9ff2eaae0dc74d9c9745b3fd09addcc9_Out_0_Texture2D.samplerstate, _Property_9ff2eaae0dc74d9c9745b3fd09addcc9_Out_0_Texture2D.GetTransformedUV((_UV_95a3b3f395e44d84a287ca09a90c4b36_Out_0_Vector4.xy)) );
            float _SampleTexture2D_1208d4f2cad47a8aa3dd7db5bdac6dbf_R_4_Float = _SampleTexture2D_1208d4f2cad47a8aa3dd7db5bdac6dbf_RGBA_0_Vector4.r;
            float _SampleTexture2D_1208d4f2cad47a8aa3dd7db5bdac6dbf_G_5_Float = _SampleTexture2D_1208d4f2cad47a8aa3dd7db5bdac6dbf_RGBA_0_Vector4.g;
            float _SampleTexture2D_1208d4f2cad47a8aa3dd7db5bdac6dbf_B_6_Float = _SampleTexture2D_1208d4f2cad47a8aa3dd7db5bdac6dbf_RGBA_0_Vector4.b;
            float _SampleTexture2D_1208d4f2cad47a8aa3dd7db5bdac6dbf_A_7_Float = _SampleTexture2D_1208d4f2cad47a8aa3dd7db5bdac6dbf_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_39083fd581a9858f8617da21e8049448_Out_0_Float = _CoverMaskPower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_d719ca05fe62698aa94e1a1a45abb189_Out_2_Float;
            Unity_Multiply_float_float(_SampleTexture2D_1208d4f2cad47a8aa3dd7db5bdac6dbf_A_7_Float, _Property_39083fd581a9858f8617da21e8049448_Out_0_Float, _Multiply_d719ca05fe62698aa94e1a1a45abb189_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_237fdddd221902858486e07d232e016c_Out_3_Float;
            Unity_Clamp_float(_Multiply_d719ca05fe62698aa94e1a1a45abb189_Out_2_Float, float(0), float(1), _Clamp_237fdddd221902858486e07d232e016c_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Property_577e31e406d3dd8fb1a321606123ec09_Out_0_Vector3 = _CoverDirection;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_1d71aa77d4c8d8848d8a70a7494d504c_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseNormalMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float _PlanarNMn_7b0c7a6d68832f8499160064dd98697c;
            _PlanarNMn_7b0c7a6d68832f8499160064dd98697c.WorldSpaceNormal = IN.WorldSpaceNormal;
            _PlanarNMn_7b0c7a6d68832f8499160064dd98697c.WorldSpaceTangent = IN.WorldSpaceTangent;
            _PlanarNMn_7b0c7a6d68832f8499160064dd98697c.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _PlanarNMn_7b0c7a6d68832f8499160064dd98697c.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNMn_7b0c7a6d68832f8499160064dd98697c.uv0 = IN.uv0;
            _PlanarNMn_7b0c7a6d68832f8499160064dd98697c.uv2 = IN.uv2;
            float4 _PlanarNMn_7b0c7a6d68832f8499160064dd98697c_XZ_2_Vector4;
            SG_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float(_Property_1d71aa77d4c8d8848d8a70a7494d504c_Out_0_Texture2D, _Property_cdba86d1e85a37858062d83b2fa6392d_Out_0_Vector4, _Property_c4d58d2885325e85994407e8fe45e088_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), 1, _PlanarNMn_7b0c7a6d68832f8499160064dd98697c, _PlanarNMn_7b0c7a6d68832f8499160064dd98697c_XZ_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_087816ca8e015a8a9fb223d9087b4182_Out_0_Float = _BaseNormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _NormalStrength_37595aefbf2c5782a9e1ac3bf5c68089_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_7b0c7a6d68832f8499160064dd98697c_XZ_2_Vector4.xyz), _Property_087816ca8e015a8a9fb223d9087b4182_Out_0_Float, _NormalStrength_37595aefbf2c5782a9e1ac3bf5c68089_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_e5d4c2313e3f328eb3d72ab688d42df9_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_Base2NormalMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float _PlanarNMn_7c412fcb6bd3a782a5b9fa87a359b5e9;
            _PlanarNMn_7c412fcb6bd3a782a5b9fa87a359b5e9.WorldSpaceNormal = IN.WorldSpaceNormal;
            _PlanarNMn_7c412fcb6bd3a782a5b9fa87a359b5e9.WorldSpaceTangent = IN.WorldSpaceTangent;
            _PlanarNMn_7c412fcb6bd3a782a5b9fa87a359b5e9.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _PlanarNMn_7c412fcb6bd3a782a5b9fa87a359b5e9.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNMn_7c412fcb6bd3a782a5b9fa87a359b5e9.uv0 = IN.uv0;
            _PlanarNMn_7c412fcb6bd3a782a5b9fa87a359b5e9.uv2 = IN.uv2;
            float4 _PlanarNMn_7c412fcb6bd3a782a5b9fa87a359b5e9_XZ_2_Vector4;
            SG_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float(_Property_e5d4c2313e3f328eb3d72ab688d42df9_Out_0_Texture2D, _Property_391bce0a1bc4ae8a8574996dcfefab13_Out_0_Vector4, _Property_b9b9b4cee220da8892912acbd91575dd_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), 1, _PlanarNMn_7c412fcb6bd3a782a5b9fa87a359b5e9, _PlanarNMn_7c412fcb6bd3a782a5b9fa87a359b5e9_XZ_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_65daec252a065086889328ae1155bba3_Out_0_Float = _Base2NormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _NormalStrength_0db20ce64d0949819e7c8a183ae1ea63_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_7c412fcb6bd3a782a5b9fa87a359b5e9_XZ_2_Vector4.xyz), _Property_65daec252a065086889328ae1155bba3_Out_0_Float, _NormalStrength_0db20ce64d0949819e7c8a183ae1ea63_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float _HeightBlend_2aea92908228ec8dbdea2d76ee4c8bd4;
            float3 _HeightBlend_2aea92908228ec8dbdea2d76ee4c8bd4_OutVector4_1_Vector3;
            SG_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float(_NormalStrength_37595aefbf2c5782a9e1ac3bf5c68089_Out_2_Vector3, _Remap_347bc01c0ddf72878c4eb9274baae4ff_Out_3_Float, _NormalStrength_0db20ce64d0949819e7c8a183ae1ea63_Out_2_Vector3, _Multiply_1653ac275d976082acb8cc3cb2c7e0a9_Out_2_Float, _Property_3fbe3f08ee2f5f8cb4e5ea37c77f429b_Out_0_Float, _HeightBlend_2aea92908228ec8dbdea2d76ee4c8bd4, _HeightBlend_2aea92908228ec8dbdea2d76ee4c8bd4_OutVector4_1_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_57136e4b37c63b88b0458bbd6cf2f9cc_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverNormalMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNMn_059da9746584140498cd018db3c76047_float _TriplanarNMn_6714bba323a48182841b11d72f43ee6c;
            _TriplanarNMn_6714bba323a48182841b11d72f43ee6c.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNMn_6714bba323a48182841b11d72f43ee6c.WorldSpaceTangent = IN.WorldSpaceTangent;
            _TriplanarNMn_6714bba323a48182841b11d72f43ee6c.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _TriplanarNMn_6714bba323a48182841b11d72f43ee6c.WorldSpacePosition = IN.WorldSpacePosition;
            float4 _TriplanarNMn_6714bba323a48182841b11d72f43ee6c_XYZ_1_Vector4;
            float4 _TriplanarNMn_6714bba323a48182841b11d72f43ee6c_XZ_2_Vector4;
            float4 _TriplanarNMn_6714bba323a48182841b11d72f43ee6c_YZ_3_Vector4;
            float4 _TriplanarNMn_6714bba323a48182841b11d72f43ee6c_XY_4_Vector4;
            SG_TriplanarNMn_059da9746584140498cd018db3c76047_float(_Property_57136e4b37c63b88b0458bbd6cf2f9cc_Out_0_Texture2D, (_Divide_417e4c87f5de7b8abda7c05a2ef88056_Out_2_Vector4).x, _Property_d62f7360b612d9809c3e73ad07243f08_Out_0_Float, _TriplanarNMn_6714bba323a48182841b11d72f43ee6c, _TriplanarNMn_6714bba323a48182841b11d72f43ee6c_XYZ_1_Vector4, _TriplanarNMn_6714bba323a48182841b11d72f43ee6c_XZ_2_Vector4, _TriplanarNMn_6714bba323a48182841b11d72f43ee6c_YZ_3_Vector4, _TriplanarNMn_6714bba323a48182841b11d72f43ee6c_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_81149b236e506f8697e192ede27f3971_Out_0_Float = _CoverNormalBlendHardness;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _NormalStrength_b81b0d8a1b4c8d89ac37806f8964f442_Out_2_Vector3;
            Unity_NormalStrength_float((_TriplanarNMn_6714bba323a48182841b11d72f43ee6c_XYZ_1_Vector4.xyz), _Property_81149b236e506f8697e192ede27f3971_Out_0_Float, _NormalStrength_b81b0d8a1b4c8d89ac37806f8964f442_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Multiply_c6669a1338d35b8f935151fcb153d31a_Out_2_Vector3;
            Unity_Multiply_float3_float3(_Property_577e31e406d3dd8fb1a321606123ec09_Out_0_Vector3, IN.WorldSpaceNormal, _Multiply_c6669a1338d35b8f935151fcb153d31a_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_bfe793e2ad24488ab75574988e5fd48c_R_1_Float = _Multiply_c6669a1338d35b8f935151fcb153d31a_Out_2_Vector3[0];
            float _Split_bfe793e2ad24488ab75574988e5fd48c_G_2_Float = _Multiply_c6669a1338d35b8f935151fcb153d31a_Out_2_Vector3[1];
            float _Split_bfe793e2ad24488ab75574988e5fd48c_B_3_Float = _Multiply_c6669a1338d35b8f935151fcb153d31a_Out_2_Vector3[2];
            float _Split_bfe793e2ad24488ab75574988e5fd48c_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_ec8faba2956f458394b586f041c36885_Out_2_Float;
            Unity_Add_float(_Split_bfe793e2ad24488ab75574988e5fd48c_R_1_Float, _Split_bfe793e2ad24488ab75574988e5fd48c_G_2_Float, _Add_ec8faba2956f458394b586f041c36885_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_314959d6b3555188936bb9790f9181c8_Out_2_Float;
            Unity_Add_float(_Add_ec8faba2956f458394b586f041c36885_Out_2_Float, _Split_bfe793e2ad24488ab75574988e5fd48c_B_3_Float, _Add_314959d6b3555188936bb9790f9181c8_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_41f9e80571036b84980ab755a1cd2b8a_Out_0_Float = _Cover_Amount;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_b15b5b7f74ac668fae6ac756ac65860d_Out_0_Float = _Cover_Amount_Grow_Speed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Subtract_f2404bbb61f6e9898d6a04e2423218b2_Out_2_Float;
            Unity_Subtract_float(float(4), _Property_b15b5b7f74ac668fae6ac756ac65860d_Out_0_Float, _Subtract_f2404bbb61f6e9898d6a04e2423218b2_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_75c861c3d8dd338e811f59b0e389e75b_Out_2_Float;
            Unity_Divide_float(_Property_41f9e80571036b84980ab755a1cd2b8a_Out_0_Float, _Subtract_f2404bbb61f6e9898d6a04e2423218b2_Out_2_Float, _Divide_75c861c3d8dd338e811f59b0e389e75b_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Absolute_a4c9f15f226ae4878cd93d6ebf12a62e_Out_1_Float;
            Unity_Absolute_float(_Divide_75c861c3d8dd338e811f59b0e389e75b_Out_2_Float, _Absolute_a4c9f15f226ae4878cd93d6ebf12a62e_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Power_30e184dd6ca0ef868b0bce3265609949_Out_2_Float;
            Unity_Power_float(_Absolute_a4c9f15f226ae4878cd93d6ebf12a62e_Out_1_Float, _Subtract_f2404bbb61f6e9898d6a04e2423218b2_Out_2_Float, _Power_30e184dd6ca0ef868b0bce3265609949_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_30f12b6e93f7e08cb5a962e6b9f27ff2_Out_3_Float;
            Unity_Clamp_float(_Power_30e184dd6ca0ef868b0bce3265609949_Out_2_Float, float(0), float(2), _Clamp_30f12b6e93f7e08cb5a962e6b9f27ff2_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_2e58826b071117889ca7fab41db4b5cb_Out_2_Float;
            Unity_Multiply_float_float(_Add_314959d6b3555188936bb9790f9181c8_Out_2_Float, _Clamp_30f12b6e93f7e08cb5a962e6b9f27ff2_Out_3_Float, _Multiply_2e58826b071117889ca7fab41db4b5cb_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Saturate_746c9a45346e4b8d871894da64501f4f_Out_1_Float;
            Unity_Saturate_float(_Multiply_2e58826b071117889ca7fab41db4b5cb_Out_2_Float, _Saturate_746c9a45346e4b8d871894da64501f4f_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_833503f9746faf8f85a13d818f245d98_Out_3_Float;
            Unity_Clamp_float(_Add_314959d6b3555188936bb9790f9181c8_Out_2_Float, float(0), float(0.9999), _Clamp_833503f9746faf8f85a13d818f245d98_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_e9dfafaa9b18ad85938c76c7194739a2_Out_0_Float = _Cover_Max_Angle;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_1d0a578b9126a084837bf496f4134806_Out_2_Float;
            Unity_Divide_float(_Property_e9dfafaa9b18ad85938c76c7194739a2_Out_0_Float, float(45), _Divide_1d0a578b9126a084837bf496f4134806_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_f1935851a5f58984af13653d306d6189_Out_1_Float;
            Unity_OneMinus_float(_Divide_1d0a578b9126a084837bf496f4134806_Out_2_Float, _OneMinus_f1935851a5f58984af13653d306d6189_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Subtract_1269997e8c2b0f83ac902b1b23348c03_Out_2_Float;
            Unity_Subtract_float(_Clamp_833503f9746faf8f85a13d818f245d98_Out_3_Float, _OneMinus_f1935851a5f58984af13653d306d6189_Out_1_Float, _Subtract_1269997e8c2b0f83ac902b1b23348c03_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_f2a5e28fa01e468cbcafbbb0a26fb215_Out_3_Float;
            Unity_Clamp_float(_Subtract_1269997e8c2b0f83ac902b1b23348c03_Out_2_Float, float(0), float(2), _Clamp_f2a5e28fa01e468cbcafbbb0a26fb215_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_d765d4d25642de87aad736264e311fe3_Out_2_Float;
            Unity_Divide_float(float(1), _Divide_1d0a578b9126a084837bf496f4134806_Out_2_Float, _Divide_d765d4d25642de87aad736264e311fe3_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_530d3c7a368c90858bf313378f2045d6_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_f2a5e28fa01e468cbcafbbb0a26fb215_Out_3_Float, _Divide_d765d4d25642de87aad736264e311fe3_Out_2_Float, _Multiply_530d3c7a368c90858bf313378f2045d6_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Absolute_68cdb5b5fd7bc48e8abb6670b34f797a_Out_1_Float;
            Unity_Absolute_float(_Multiply_530d3c7a368c90858bf313378f2045d6_Out_2_Float, _Absolute_68cdb5b5fd7bc48e8abb6670b34f797a_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_6bc8be76ebefd081b09d70c3aa8f7e9a_Out_0_Float = _CoverHardness;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Power_d1d84226b1add48a96efc66cd5251277_Out_2_Float;
            Unity_Power_float(_Absolute_68cdb5b5fd7bc48e8abb6670b34f797a_Out_1_Float, _Property_6bc8be76ebefd081b09d70c3aa8f7e9a_Out_0_Float, _Power_d1d84226b1add48a96efc66cd5251277_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_36ce546f2e8c1683870a69c4b80b0056_Out_0_Float = _Cover_Min_Height;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_1bbfeb5150a7258fbce4159ef98004fa_Out_1_Float;
            Unity_OneMinus_float(_Property_36ce546f2e8c1683870a69c4b80b0056_Out_0_Float, _OneMinus_1bbfeb5150a7258fbce4159ef98004fa_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_8275b8a1f9b13a8ba2aab1effe981e24_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
            float _Split_8275b8a1f9b13a8ba2aab1effe981e24_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
            float _Split_8275b8a1f9b13a8ba2aab1effe981e24_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
            float _Split_8275b8a1f9b13a8ba2aab1effe981e24_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_d60e277443199583bf879c33a84040aa_Out_2_Float;
            Unity_Add_float(_OneMinus_1bbfeb5150a7258fbce4159ef98004fa_Out_1_Float, _Split_8275b8a1f9b13a8ba2aab1effe981e24_G_2_Float, _Add_d60e277443199583bf879c33a84040aa_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_d22c42648995508796312c1309a3e675_Out_2_Float;
            Unity_Add_float(_Add_d60e277443199583bf879c33a84040aa_Out_2_Float, float(1), _Add_d22c42648995508796312c1309a3e675_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_a9fafcac1555c785b00d2066da56c188_Out_3_Float;
            Unity_Clamp_float(_Add_d22c42648995508796312c1309a3e675_Out_2_Float, float(0), float(1), _Clamp_a9fafcac1555c785b00d2066da56c188_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_5efe9e928026f188bd7f2227f8a81665_Out_0_Float = _Cover_Min_Height_Blending;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_c8fe7b6f1cf6b4818c460afd271bf24f_Out_2_Float;
            Unity_Add_float(_Add_d60e277443199583bf879c33a84040aa_Out_2_Float, _Property_5efe9e928026f188bd7f2227f8a81665_Out_0_Float, _Add_c8fe7b6f1cf6b4818c460afd271bf24f_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_9a88520d364f4d839eae92761e805274_Out_2_Float;
            Unity_Divide_float(_Add_c8fe7b6f1cf6b4818c460afd271bf24f_Out_2_Float, _Add_d60e277443199583bf879c33a84040aa_Out_2_Float, _Divide_9a88520d364f4d839eae92761e805274_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_3f76521a462f978eae3dc15480703bf4_Out_1_Float;
            Unity_OneMinus_float(_Divide_9a88520d364f4d839eae92761e805274_Out_2_Float, _OneMinus_3f76521a462f978eae3dc15480703bf4_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_99637080d5a5318ea8891ba128076958_Out_2_Float;
            Unity_Add_float(_OneMinus_3f76521a462f978eae3dc15480703bf4_Out_1_Float, float(-0.5), _Add_99637080d5a5318ea8891ba128076958_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_d7e00ff03b780e8785aa0ba35cd32193_Out_3_Float;
            Unity_Clamp_float(_Add_99637080d5a5318ea8891ba128076958_Out_2_Float, float(0), float(1), _Clamp_d7e00ff03b780e8785aa0ba35cd32193_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_ff67eea748c00386b91058b2876cee40_Out_2_Float;
            Unity_Add_float(_Clamp_a9fafcac1555c785b00d2066da56c188_Out_3_Float, _Clamp_d7e00ff03b780e8785aa0ba35cd32193_Out_3_Float, _Add_ff67eea748c00386b91058b2876cee40_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_697ecf534f2574889ebd8b15de892826_Out_3_Float;
            Unity_Clamp_float(_Add_ff67eea748c00386b91058b2876cee40_Out_2_Float, float(0), float(1), _Clamp_697ecf534f2574889ebd8b15de892826_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_de11d28b9823c388af9dd6a504362c51_Out_2_Float;
            Unity_Multiply_float_float(_Power_d1d84226b1add48a96efc66cd5251277_Out_2_Float, _Clamp_697ecf534f2574889ebd8b15de892826_Out_3_Float, _Multiply_de11d28b9823c388af9dd6a504362c51_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_2d43633f93e4ee84aba21650c4f73a01_Out_2_Float;
            Unity_Multiply_float_float(_Saturate_746c9a45346e4b8d871894da64501f4f_Out_1_Float, _Multiply_de11d28b9823c388af9dd6a504362c51_Out_2_Float, _Multiply_2d43633f93e4ee84aba21650c4f73a01_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Lerp_807d7c05dc7fed88aa1ae547effba70e_Out_3_Vector3;
            Unity_Lerp_float3(_HeightBlend_2aea92908228ec8dbdea2d76ee4c8bd4_OutVector4_1_Vector3, _NormalStrength_b81b0d8a1b4c8d89ac37806f8964f442_Out_2_Vector3, (_Multiply_2d43633f93e4ee84aba21650c4f73a01_Out_2_Float.xxx), _Lerp_807d7c05dc7fed88aa1ae547effba70e_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Transform_654244b6738ef485b35a6c1ee581f307_Out_1_Vector3;
            {
                float3x3 tangentTransform = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
                _Transform_654244b6738ef485b35a6c1ee581f307_Out_1_Vector3 = TransformTangentToWorldDir(_Lerp_807d7c05dc7fed88aa1ae547effba70e_Out_3_Vector3.xyz, tangentTransform, true).xyz;
            }
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Multiply_e52384b35afef9818b65d43f1474b495_Out_2_Vector3;
            Unity_Multiply_float3_float3(_Property_577e31e406d3dd8fb1a321606123ec09_Out_0_Vector3, _Transform_654244b6738ef485b35a6c1ee581f307_Out_1_Vector3, _Multiply_e52384b35afef9818b65d43f1474b495_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_9eab4717084c17859a8e63f351c1711d_R_1_Float = _Multiply_e52384b35afef9818b65d43f1474b495_Out_2_Vector3[0];
            float _Split_9eab4717084c17859a8e63f351c1711d_G_2_Float = _Multiply_e52384b35afef9818b65d43f1474b495_Out_2_Vector3[1];
            float _Split_9eab4717084c17859a8e63f351c1711d_B_3_Float = _Multiply_e52384b35afef9818b65d43f1474b495_Out_2_Vector3[2];
            float _Split_9eab4717084c17859a8e63f351c1711d_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_da2b031a4805ce839d2c63184da7401e_Out_2_Float;
            Unity_Add_float(_Split_9eab4717084c17859a8e63f351c1711d_R_1_Float, _Split_9eab4717084c17859a8e63f351c1711d_G_2_Float, _Add_da2b031a4805ce839d2c63184da7401e_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_2dc170e840729981a3725f6afdd8f992_Out_2_Float;
            Unity_Add_float(_Add_da2b031a4805ce839d2c63184da7401e_Out_2_Float, _Split_9eab4717084c17859a8e63f351c1711d_B_3_Float, _Add_2dc170e840729981a3725f6afdd8f992_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_e5832320c3941e8ea5e26a4d0ca92908_Out_2_Float;
            Unity_Multiply_float_float(_Add_2dc170e840729981a3725f6afdd8f992_Out_2_Float, _Clamp_30f12b6e93f7e08cb5a962e6b9f27ff2_Out_3_Float, _Multiply_e5832320c3941e8ea5e26a4d0ca92908_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_08afa1de8ac2f18f857bbc71c64e8ceb_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_30f12b6e93f7e08cb5a962e6b9f27ff2_Out_3_Float, _Property_6bc8be76ebefd081b09d70c3aa8f7e9a_Out_0_Float, _Multiply_08afa1de8ac2f18f857bbc71c64e8ceb_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_09e51444a0b1e882aea42e6ef85919fb_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_08afa1de8ac2f18f857bbc71c64e8ceb_Out_2_Float, _Multiply_de11d28b9823c388af9dd6a504362c51_Out_2_Float, _Multiply_09e51444a0b1e882aea42e6ef85919fb_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_3649a34f052f1d89a3e555f2fd7a2622_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_e5832320c3941e8ea5e26a4d0ca92908_Out_2_Float, _Multiply_09e51444a0b1e882aea42e6ef85919fb_Out_2_Float, _Multiply_3649a34f052f1d89a3e555f2fd7a2622_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_1c1357d48e493e8089f5da7fa0727392_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverMaskMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e;
            _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_XYZ_1_Vector4;
            float4 _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_XZ_2_Vector4;
            float4 _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_YZ_3_Vector4;
            float4 _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_1c1357d48e493e8089f5da7fa0727392_Out_0_Texture2D, (_Divide_417e4c87f5de7b8abda7c05a2ef88056_Out_2_Vector4).x, _Property_d62f7360b612d9809c3e73ad07243f08_Out_0_Float, _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e, _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_XYZ_1_Vector4, _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_XZ_2_Vector4, _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_YZ_3_Vector4, _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_c4201edf3801a487849415809068865b_R_1_Float = _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_XYZ_1_Vector4[0];
            float _Split_c4201edf3801a487849415809068865b_G_2_Float = _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_XYZ_1_Vector4[1];
            float _Split_c4201edf3801a487849415809068865b_B_3_Float = _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_XYZ_1_Vector4[2];
            float _Split_c4201edf3801a487849415809068865b_A_4_Float = _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_XYZ_1_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_7d292a2f5737ad89aa4116a32a770401_Out_0_Float = _CoverHeightMapMin;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_b9485b720982198888701b70c808a574_Out_0_Float = _CoverHeightMapMax;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_be52d4e98cb63c8e899d455afac49761_Out_0_Vector2 = float2(_Property_7d292a2f5737ad89aa4116a32a770401_Out_0_Float, _Property_b9485b720982198888701b70c808a574_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_a028eb148d51f986846eb00dba5b8c21_Out_0_Float = _CoverHeightMapOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Add_36a89f63a185118a88e38098f08f30e7_Out_2_Vector2;
            Unity_Add_float2(_Vector2_be52d4e98cb63c8e899d455afac49761_Out_0_Vector2, (_Property_a028eb148d51f986846eb00dba5b8c21_Out_0_Float.xx), _Add_36a89f63a185118a88e38098f08f30e7_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_89daf117afa72e87b0e7a6b7b973a4b6_Out_3_Float;
            Unity_Remap_float(_Split_c4201edf3801a487849415809068865b_B_3_Float, float2 (0, 1), _Add_36a89f63a185118a88e38098f08f30e7_Out_2_Vector2, _Remap_89daf117afa72e87b0e7a6b7b973a4b6_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_91860731e65c2c878b131ffd43bf54a5_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_3649a34f052f1d89a3e555f2fd7a2622_Out_2_Float, _Remap_89daf117afa72e87b0e7a6b7b973a4b6_Out_3_Float, _Multiply_91860731e65c2c878b131ffd43bf54a5_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_a1e9d262d487f98ab3a94dd6fef22908_Out_2_Float;
            Unity_Multiply_float_float(_Split_bc8eb833b059c2879abda47a13239f66_G_2_Float, _Multiply_91860731e65c2c878b131ffd43bf54a5_Out_2_Float, _Multiply_a1e9d262d487f98ab3a94dd6fef22908_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Saturate_a73982c803e41e80bb2d82e77e4921db_Out_1_Float;
            Unity_Saturate_float(_Multiply_a1e9d262d487f98ab3a94dd6fef22908_Out_2_Float, _Saturate_a73982c803e41e80bb2d82e77e4921db_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_3b6375a3a8f3398eb5630bb0cc4abea6_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_237fdddd221902858486e07d232e016c_Out_3_Float, _Saturate_a73982c803e41e80bb2d82e77e4921db_Out_1_Float, _Multiply_3b6375a3a8f3398eb5630bb0cc4abea6_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            #if defined(_USEDYNAMICCOVERTSTATICMASKF_ON)
            float _UseDynamicCoverTStaticMaskF_8587b1680d796886bd267db30b112d6f_Out_0_Float = _Multiply_3b6375a3a8f3398eb5630bb0cc4abea6_Out_2_Float;
            #else
            float _UseDynamicCoverTStaticMaskF_8587b1680d796886bd267db30b112d6f_Out_0_Float = _Clamp_237fdddd221902858486e07d232e016c_Out_3_Float;
            #endif
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Lerp_4fca1aa155472b85bd876a8324386f37_Out_3_Vector3;
            Unity_Lerp_float3(_HeightBlend_00a99a7141c28f80a07c77242fa96942_OutVector4_1_Vector3, (_Multiply_14ce5f06524122898b5641da23fb0105_Out_2_Vector4.xyz), (_UseDynamicCoverTStaticMaskF_8587b1680d796886bd267db30b112d6f_Out_0_Float.xxx), _Lerp_4fca1aa155472b85bd876a8324386f37_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_31a17346fd9f4c848d23d733884e0a21_Out_0_Vector4 = _WetColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Multiply_cebc9c67173afa86af7299b1b4fddee1_Out_2_Vector3;
            Unity_Multiply_float3_float3((_Property_31a17346fd9f4c848d23d733884e0a21_Out_0_Vector4.xyz), _Lerp_4fca1aa155472b85bd876a8324386f37_Out_3_Vector3, _Multiply_cebc9c67173afa86af7299b1b4fddee1_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_98f57a743ea0c9899240fca6b106aaec_Out_1_Float;
            Unity_OneMinus_float(_Split_bc8eb833b059c2879abda47a13239f66_R_1_Float, _OneMinus_98f57a743ea0c9899240fca6b106aaec_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Lerp_c7df5e0362cf3b82b5fc62aee758f480_Out_3_Vector3;
            Unity_Lerp_float3(_Lerp_4fca1aa155472b85bd876a8324386f37_Out_3_Vector3, _Multiply_cebc9c67173afa86af7299b1b4fddee1_Out_2_Vector3, (_OneMinus_98f57a743ea0c9899240fca6b106aaec_Out_1_Float.xxx), _Lerp_c7df5e0362cf3b82b5fc62aee758f480_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_5d0494d42dd1358ba8e98a2561f73d5d_Out_0_Float = _CoverNormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _NormalStrength_e307c529ee67f888a39ef097cca48511_Out_2_Vector3;
            Unity_NormalStrength_float((_TriplanarNMn_6714bba323a48182841b11d72f43ee6c_XYZ_1_Vector4.xyz), _Property_5d0494d42dd1358ba8e98a2561f73d5d_Out_0_Float, _NormalStrength_e307c529ee67f888a39ef097cca48511_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Lerp_0fff104b2f78178ea3d3449b8610ead6_Out_3_Vector3;
            Unity_Lerp_float3(_HeightBlend_2aea92908228ec8dbdea2d76ee4c8bd4_OutVector4_1_Vector3, _NormalStrength_e307c529ee67f888a39ef097cca48511_Out_2_Vector3, (_UseDynamicCoverTStaticMaskF_8587b1680d796886bd267db30b112d6f_Out_0_Float.xxx), _Lerp_0fff104b2f78178ea3d3449b8610ead6_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_bddb7f0e467fae83bd30033562884a1f_Out_0_Float = _BaseMetallic;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_520a1f20f5851e8784f74c90958c759b_Out_2_Float;
            Unity_Multiply_float_float(_Split_2873060f5cfdf687b30bd679f8a5291e_R_1_Float, _Property_bddb7f0e467fae83bd30033562884a1f_Out_0_Float, _Multiply_520a1f20f5851e8784f74c90958c759b_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_365fcb6b42fbbf80b0ad1551f65d0d79_Out_0_Float = _BaseAORemapMin;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_7b9578c5167556858885b1052c521b82_Out_0_Float = _BaseAORemapMax;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_186923b985bed0889756a055aca45f77_Out_0_Vector2 = float2(_Property_365fcb6b42fbbf80b0ad1551f65d0d79_Out_0_Float, _Property_7b9578c5167556858885b1052c521b82_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_ab666a00bc3fa68fa731124a3496d2cb_Out_3_Float;
            Unity_Remap_float(_Split_2873060f5cfdf687b30bd679f8a5291e_G_2_Float, float2 (0, 1), _Vector2_186923b985bed0889756a055aca45f77_Out_0_Vector2, _Remap_ab666a00bc3fa68fa731124a3496d2cb_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_ffc0886b0bd8f683b7c260396a254f0d_Out_0_Float = _BaseSmoothnessRemapMin;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_ed1ed7534d5bbc8a812f4e2c91eb4d27_Out_0_Float = _BaseSmoothnessRemapMax;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_9f356451f28b418e9cc44004a78eb446_Out_0_Vector2 = float2(_Property_ffc0886b0bd8f683b7c260396a254f0d_Out_0_Float, _Property_ed1ed7534d5bbc8a812f4e2c91eb4d27_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_e70d59563b773082921c927223d0056b_Out_3_Float;
            Unity_Remap_float(_Split_2873060f5cfdf687b30bd679f8a5291e_A_4_Float, float2 (0, 1), _Vector2_9f356451f28b418e9cc44004a78eb446_Out_0_Vector2, _Remap_e70d59563b773082921c927223d0056b_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Vector3_dfc453344d7b688392a22f34c30d7ee6_Out_0_Vector3 = float3(_Multiply_520a1f20f5851e8784f74c90958c759b_Out_2_Float, _Remap_ab666a00bc3fa68fa731124a3496d2cb_Out_3_Float, _Remap_e70d59563b773082921c927223d0056b_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_49182bd63019538fabef6c0ac3737d33_Out_0_Float = Vector1_D38A0468;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_5d46838930c54c86b88f3afe5932862d_Out_2_Float;
            Unity_Multiply_float_float(_Split_b4d828c4dcef5489b007ef9d639c65c7_R_1_Float, _Property_49182bd63019538fabef6c0ac3737d33_Out_0_Float, _Multiply_5d46838930c54c86b88f3afe5932862d_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_f4951ef14a57b887b4b549bbd1a45728_Out_0_Float = _Base2AORemapMin;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_d805b60932adc489a0052e59316cbb10_Out_0_Float = _Base2AORemapMax;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_e1e3bdefc5d9278295461c92199a4fb6_Out_0_Vector2 = float2(_Property_f4951ef14a57b887b4b549bbd1a45728_Out_0_Float, _Property_d805b60932adc489a0052e59316cbb10_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_6dbae7a19e4e838989e4d44854c6441a_Out_3_Float;
            Unity_Remap_float(_Split_b4d828c4dcef5489b007ef9d639c65c7_G_2_Float, float2 (0, 1), _Vector2_e1e3bdefc5d9278295461c92199a4fb6_Out_0_Vector2, _Remap_6dbae7a19e4e838989e4d44854c6441a_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_bc02a3c78cb8f380b32a2780aeccba49_Out_0_Float = _Base2SmoothnessRemapMin;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_f2c0de3471b8a58b96284bd911d1ce7b_Out_0_Float = _Base2SmoothnessRemapMax;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_118158dff625d48c89694ef41adb8bcf_Out_0_Vector2 = float2(_Property_bc02a3c78cb8f380b32a2780aeccba49_Out_0_Float, _Property_f2c0de3471b8a58b96284bd911d1ce7b_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_0224ddc5750883828a786535b2f26496_Out_3_Float;
            Unity_Remap_float(_Split_b4d828c4dcef5489b007ef9d639c65c7_A_4_Float, float2 (0, 1), _Vector2_118158dff625d48c89694ef41adb8bcf_Out_0_Vector2, _Remap_0224ddc5750883828a786535b2f26496_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Vector3_a0b8ad478d83d489b924550da01c2a54_Out_0_Vector3 = float3(_Multiply_5d46838930c54c86b88f3afe5932862d_Out_2_Float, _Remap_6dbae7a19e4e838989e4d44854c6441a_Out_3_Float, _Remap_0224ddc5750883828a786535b2f26496_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float _HeightBlend_bc4e69186829ce8d8911633acc600be9;
            float3 _HeightBlend_bc4e69186829ce8d8911633acc600be9_OutVector4_1_Vector3;
            SG_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float(_Vector3_dfc453344d7b688392a22f34c30d7ee6_Out_0_Vector3, _Remap_347bc01c0ddf72878c4eb9274baae4ff_Out_3_Float, _Vector3_a0b8ad478d83d489b924550da01c2a54_Out_0_Vector3, _Multiply_1653ac275d976082acb8cc3cb2c7e0a9_Out_2_Float, _Property_3fbe3f08ee2f5f8cb4e5ea37c77f429b_Out_0_Float, _HeightBlend_bc4e69186829ce8d8911633acc600be9, _HeightBlend_bc4e69186829ce8d8911633acc600be9_OutVector4_1_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_c0a045a0dc4d5f87874d34f04188fd70_Out_0_Float = _CoverMetallic;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_a8b871073810d28d9bd8d3120e857702_Out_2_Float;
            Unity_Multiply_float_float(_Split_c4201edf3801a487849415809068865b_R_1_Float, _Property_c0a045a0dc4d5f87874d34f04188fd70_Out_0_Float, _Multiply_a8b871073810d28d9bd8d3120e857702_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_972767088651fd81a18710d4abed06bd_Out_0_Float = _CoverAORemapMin;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_c1f2a075f19c418a8de66773562aeac5_Out_0_Float = _CoverSmoothnessRemapMin;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_55d60e7a912b9586a1a4e0ab7ee9d63e_Out_0_Vector2 = float2(_Property_972767088651fd81a18710d4abed06bd_Out_0_Float, _Property_c1f2a075f19c418a8de66773562aeac5_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_f213189e6704968c9c351b22062f572a_Out_3_Float;
            Unity_Remap_float(_Split_c4201edf3801a487849415809068865b_G_2_Float, float2 (0, 1), _Vector2_55d60e7a912b9586a1a4e0ab7ee9d63e_Out_0_Vector2, _Remap_f213189e6704968c9c351b22062f572a_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_671df4578f70b5889e32d4d031e3325f_Out_0_Float = _CoverAORemapMax;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_81e665a4559e758f88b198b26d9d3d9d_Out_0_Float = _CoverSmoothnessRemapMax;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_a760bfaedfb6ed89929adc637d313d07_Out_0_Vector2 = float2(_Property_671df4578f70b5889e32d4d031e3325f_Out_0_Float, _Property_81e665a4559e758f88b198b26d9d3d9d_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_eaad94569cd3ce8db75f64a4d5f45c60_Out_3_Float;
            Unity_Remap_float(_Split_c4201edf3801a487849415809068865b_A_4_Float, float2 (0, 1), _Vector2_a760bfaedfb6ed89929adc637d313d07_Out_0_Vector2, _Remap_eaad94569cd3ce8db75f64a4d5f45c60_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Vector3_7b3197b44930698ca0c6b0edc5972259_Out_0_Vector3 = float3(_Multiply_a8b871073810d28d9bd8d3120e857702_Out_2_Float, _Remap_f213189e6704968c9c351b22062f572a_Out_3_Float, _Remap_eaad94569cd3ce8db75f64a4d5f45c60_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Lerp_a1b6048a7be83680bd6519ecf36ab33d_Out_3_Vector3;
            Unity_Lerp_float3(_HeightBlend_bc4e69186829ce8d8911633acc600be9_OutVector4_1_Vector3, _Vector3_7b3197b44930698ca0c6b0edc5972259_Out_0_Vector3, (_UseDynamicCoverTStaticMaskF_8587b1680d796886bd267db30b112d6f_Out_0_Float.xxx), _Lerp_a1b6048a7be83680bd6519ecf36ab33d_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_a706ba7c451da28d8a49835ea16f26df_R_1_Float = _Lerp_a1b6048a7be83680bd6519ecf36ab33d_Out_3_Vector3[0];
            float _Split_a706ba7c451da28d8a49835ea16f26df_G_2_Float = _Lerp_a1b6048a7be83680bd6519ecf36ab33d_Out_3_Vector3[1];
            float _Split_a706ba7c451da28d8a49835ea16f26df_B_3_Float = _Lerp_a1b6048a7be83680bd6519ecf36ab33d_Out_3_Vector3[2];
            float _Split_a706ba7c451da28d8a49835ea16f26df_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_6d180b9572284389bfceac29bb40560f_Out_0_Float = _WetSmoothness;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Lerp_91a91912ec11ff8c8626f233ef8403fb_Out_3_Float;
            Unity_Lerp_float(_Split_a706ba7c451da28d8a49835ea16f26df_B_3_Float, _Property_6d180b9572284389bfceac29bb40560f_Out_0_Float, _OneMinus_98f57a743ea0c9899240fca6b106aaec_Out_1_Float, _Lerp_91a91912ec11ff8c8626f233ef8403fb_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_208942f638bd09818be8a2afbf76c6e7_R_1_Float = _PlanarNM_939c16e3e51f06888092ac69b8f75998_XZ_2_Vector4[0];
            float _Split_208942f638bd09818be8a2afbf76c6e7_G_2_Float = _PlanarNM_939c16e3e51f06888092ac69b8f75998_XZ_2_Vector4[1];
            float _Split_208942f638bd09818be8a2afbf76c6e7_B_3_Float = _PlanarNM_939c16e3e51f06888092ac69b8f75998_XZ_2_Vector4[2];
            float _Split_208942f638bd09818be8a2afbf76c6e7_A_4_Float = _PlanarNM_939c16e3e51f06888092ac69b8f75998_XZ_2_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_fb2f800e35d50e84bc11a285a594a4cf_Out_0_Float = _AlphaCutoff;
            #endif
            surface.BaseColor = _Lerp_c7df5e0362cf3b82b5fc62aee758f480_Out_3_Vector3;
            surface.NormalTS = _Lerp_0fff104b2f78178ea3d3449b8610ead6_Out_3_Vector3;
            surface.Emission = float3(0, 0, 0);
            surface.Metallic = _Split_a706ba7c451da28d8a49835ea16f26df_R_1_Float;
            surface.Specular = IsGammaSpace() ? float3(0.5, 0.5, 0.5) : SRGBToLinear(float3(0.5, 0.5, 0.5));
            surface.Smoothness = _Lerp_91a91912ec11ff8c8626f233ef8403fb_Out_3_Float;
            surface.Occlusion = _Split_a706ba7c451da28d8a49835ea16f26df_G_2_Float;
            surface.Alpha = _Split_208942f638bd09818be8a2afbf76c6e7_A_4_Float;
            surface.AlphaClipThreshold = _Property_fb2f800e35d50e84bc11a285a594a4cf_Out_0_Float;
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
        float4 _Base2NormalMap_TexelSize;
        float _Base2NormalScale;
        float _Base2UsePlanarUV;
        float4 _Base2MaskMap_TexelSize;
        float Vector1_D38A0468;
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
        
        void Unity_Multiply_float_float(float A, float B, out float Out)
        {
            Out = A * B;
        }
        
        void Unity_Maximum_float(float A, float B, out float Out)
        {
            Out = max(A, B);
        }
        
        void Unity_Subtract_float(float A, float B, out float Out)
        {
            Out = A - B;
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
            UnityTexture2D _Property_9877f7d14ab03a82ac49746caa97aeb7_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseColorMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_cdba86d1e85a37858062d83b2fa6392d_Out_0_Vector4 = _BaseTilingOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_c4d58d2885325e85994407e8fe45e088_Out_0_Boolean = _BaseUsePlanarUV;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_939c16e3e51f06888092ac69b8f75998;
            _PlanarNM_939c16e3e51f06888092ac69b8f75998.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_939c16e3e51f06888092ac69b8f75998.uv0 = IN.uv0;
            _PlanarNM_939c16e3e51f06888092ac69b8f75998.uv2 = IN.uv2;
            float4 _PlanarNM_939c16e3e51f06888092ac69b8f75998_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_9877f7d14ab03a82ac49746caa97aeb7_Out_0_Texture2D, _Property_cdba86d1e85a37858062d83b2fa6392d_Out_0_Vector4, _Property_c4d58d2885325e85994407e8fe45e088_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), 1, _PlanarNM_939c16e3e51f06888092ac69b8f75998, _PlanarNM_939c16e3e51f06888092ac69b8f75998_XZ_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_2c84a3da85882688884fbe610ed37b04_Out_0_Vector4 = _BaseColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Multiply_4dd3ecf3f3b38786bdcf91b238ffdbb2_Out_2_Vector4;
            Unity_Multiply_float4_float4(_PlanarNM_939c16e3e51f06888092ac69b8f75998_XZ_2_Vector4, _Property_2c84a3da85882688884fbe610ed37b04_Out_0_Vector4, _Multiply_4dd3ecf3f3b38786bdcf91b238ffdbb2_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_75d5c7e24ff6e88ab1561e2a54e6463d_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseMaskMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_f82d57d4f65ad48d9435f5e38fd6ce0c;
            _PlanarNM_f82d57d4f65ad48d9435f5e38fd6ce0c.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_f82d57d4f65ad48d9435f5e38fd6ce0c.uv0 = IN.uv0;
            _PlanarNM_f82d57d4f65ad48d9435f5e38fd6ce0c.uv2 = IN.uv2;
            float4 _PlanarNM_f82d57d4f65ad48d9435f5e38fd6ce0c_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_75d5c7e24ff6e88ab1561e2a54e6463d_Out_0_Texture2D, _Property_cdba86d1e85a37858062d83b2fa6392d_Out_0_Vector4, _Property_c4d58d2885325e85994407e8fe45e088_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), 1, _PlanarNM_f82d57d4f65ad48d9435f5e38fd6ce0c, _PlanarNM_f82d57d4f65ad48d9435f5e38fd6ce0c_XZ_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_2873060f5cfdf687b30bd679f8a5291e_R_1_Float = _PlanarNM_f82d57d4f65ad48d9435f5e38fd6ce0c_XZ_2_Vector4[0];
            float _Split_2873060f5cfdf687b30bd679f8a5291e_G_2_Float = _PlanarNM_f82d57d4f65ad48d9435f5e38fd6ce0c_XZ_2_Vector4[1];
            float _Split_2873060f5cfdf687b30bd679f8a5291e_B_3_Float = _PlanarNM_f82d57d4f65ad48d9435f5e38fd6ce0c_XZ_2_Vector4[2];
            float _Split_2873060f5cfdf687b30bd679f8a5291e_A_4_Float = _PlanarNM_f82d57d4f65ad48d9435f5e38fd6ce0c_XZ_2_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_57489d8e60c5e48ebbd4e6f83cd04306_Out_0_Float = _HeightMin;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_b3c11986fefcb082abf933a1c5505d71_Out_0_Float = _HeightMax;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_bf00af3771fe7882a94dd98123dc06eb_Out_0_Vector2 = float2(_Property_57489d8e60c5e48ebbd4e6f83cd04306_Out_0_Float, _Property_b3c11986fefcb082abf933a1c5505d71_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_d430dab1be180289a026a73080dc2a0d_Out_0_Float = _HeightOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Add_30485ad75da6dd8e9e1036d4537f114c_Out_2_Vector2;
            Unity_Add_float2(_Vector2_bf00af3771fe7882a94dd98123dc06eb_Out_0_Vector2, (_Property_d430dab1be180289a026a73080dc2a0d_Out_0_Float.xx), _Add_30485ad75da6dd8e9e1036d4537f114c_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_347bc01c0ddf72878c4eb9274baae4ff_Out_3_Float;
            Unity_Remap_float(_Split_2873060f5cfdf687b30bd679f8a5291e_B_3_Float, float2 (0, 1), _Add_30485ad75da6dd8e9e1036d4537f114c_Out_2_Vector2, _Remap_347bc01c0ddf72878c4eb9274baae4ff_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_99f7c3ef40e2a280b853a4806f4377cc_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_Base2ColorMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_391bce0a1bc4ae8a8574996dcfefab13_Out_0_Vector4 = _Base2TilingOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_b9b9b4cee220da8892912acbd91575dd_Out_0_Boolean = _Base2UsePlanarUV;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_8125b53543ccd48bb9175630cf7bbc44;
            _PlanarNM_8125b53543ccd48bb9175630cf7bbc44.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_8125b53543ccd48bb9175630cf7bbc44.uv0 = IN.uv0;
            _PlanarNM_8125b53543ccd48bb9175630cf7bbc44.uv2 = IN.uv2;
            float4 _PlanarNM_8125b53543ccd48bb9175630cf7bbc44_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_99f7c3ef40e2a280b853a4806f4377cc_Out_0_Texture2D, _Property_391bce0a1bc4ae8a8574996dcfefab13_Out_0_Vector4, _Property_b9b9b4cee220da8892912acbd91575dd_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), 1, _PlanarNM_8125b53543ccd48bb9175630cf7bbc44, _PlanarNM_8125b53543ccd48bb9175630cf7bbc44_XZ_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_a87fae0c6b1a0984b9ef7861ccc92da9_Out_0_Vector4 = _Base2Color;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Multiply_934c5505e5759286921bda248879c83f_Out_2_Vector4;
            Unity_Multiply_float4_float4(_PlanarNM_8125b53543ccd48bb9175630cf7bbc44_XZ_2_Vector4, _Property_a87fae0c6b1a0984b9ef7861ccc92da9_Out_0_Vector4, _Multiply_934c5505e5759286921bda248879c83f_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_bc8eb833b059c2879abda47a13239f66_R_1_Float = IN.VertexColor[0];
            float _Split_bc8eb833b059c2879abda47a13239f66_G_2_Float = IN.VertexColor[1];
            float _Split_bc8eb833b059c2879abda47a13239f66_B_3_Float = IN.VertexColor[2];
            float _Split_bc8eb833b059c2879abda47a13239f66_A_4_Float = IN.VertexColor[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_67acbc8108127387b3521a5887c8fd65_Out_0_Boolean = _Invert_Layer_Mask;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_ec66fdea21d60b889b53e96094a2bb5f_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_LayerMask);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _SampleTexture2D_1e04ec71d2a6c38aaa9df937b66dc947_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_ec66fdea21d60b889b53e96094a2bb5f_Out_0_Texture2D.tex, _Property_ec66fdea21d60b889b53e96094a2bb5f_Out_0_Texture2D.samplerstate, _Property_ec66fdea21d60b889b53e96094a2bb5f_Out_0_Texture2D.GetTransformedUV(IN.uv0.xy) );
            float _SampleTexture2D_1e04ec71d2a6c38aaa9df937b66dc947_R_4_Float = _SampleTexture2D_1e04ec71d2a6c38aaa9df937b66dc947_RGBA_0_Vector4.r;
            float _SampleTexture2D_1e04ec71d2a6c38aaa9df937b66dc947_G_5_Float = _SampleTexture2D_1e04ec71d2a6c38aaa9df937b66dc947_RGBA_0_Vector4.g;
            float _SampleTexture2D_1e04ec71d2a6c38aaa9df937b66dc947_B_6_Float = _SampleTexture2D_1e04ec71d2a6c38aaa9df937b66dc947_RGBA_0_Vector4.b;
            float _SampleTexture2D_1e04ec71d2a6c38aaa9df937b66dc947_A_7_Float = _SampleTexture2D_1e04ec71d2a6c38aaa9df937b66dc947_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_2ab824386c8b5f86a4f1baf709dea28e_Out_1_Float;
            Unity_OneMinus_float(_SampleTexture2D_1e04ec71d2a6c38aaa9df937b66dc947_R_4_Float, _OneMinus_2ab824386c8b5f86a4f1baf709dea28e_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Branch_6f5d54f970d03d8b8bfbf860a10aa6dc_Out_3_Float;
            Unity_Branch_float(_Property_67acbc8108127387b3521a5887c8fd65_Out_0_Boolean, _OneMinus_2ab824386c8b5f86a4f1baf709dea28e_Out_1_Float, _SampleTexture2D_1e04ec71d2a6c38aaa9df937b66dc947_R_4_Float, _Branch_6f5d54f970d03d8b8bfbf860a10aa6dc_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_312b7343c77e2a8eb60f73d6993817b8_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_Base2MaskMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_b5a5b9c7b16e58839fd9378c90580282;
            _PlanarNM_b5a5b9c7b16e58839fd9378c90580282.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_b5a5b9c7b16e58839fd9378c90580282.uv0 = IN.uv0;
            _PlanarNM_b5a5b9c7b16e58839fd9378c90580282.uv2 = IN.uv2;
            float4 _PlanarNM_b5a5b9c7b16e58839fd9378c90580282_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_312b7343c77e2a8eb60f73d6993817b8_Out_0_Texture2D, _Property_391bce0a1bc4ae8a8574996dcfefab13_Out_0_Vector4, _Property_b9b9b4cee220da8892912acbd91575dd_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), 1, _PlanarNM_b5a5b9c7b16e58839fd9378c90580282, _PlanarNM_b5a5b9c7b16e58839fd9378c90580282_XZ_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_b4d828c4dcef5489b007ef9d639c65c7_R_1_Float = _PlanarNM_b5a5b9c7b16e58839fd9378c90580282_XZ_2_Vector4[0];
            float _Split_b4d828c4dcef5489b007ef9d639c65c7_G_2_Float = _PlanarNM_b5a5b9c7b16e58839fd9378c90580282_XZ_2_Vector4[1];
            float _Split_b4d828c4dcef5489b007ef9d639c65c7_B_3_Float = _PlanarNM_b5a5b9c7b16e58839fd9378c90580282_XZ_2_Vector4[2];
            float _Split_b4d828c4dcef5489b007ef9d639c65c7_A_4_Float = _PlanarNM_b5a5b9c7b16e58839fd9378c90580282_XZ_2_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_6f4f0f0f513da587b5c0331584e50187_Out_0_Float = _HeightMin2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_a348a4abb5736887afa1734255606c10_Out_0_Float = _HeightMax2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_942eb4b05e4bd5808636661f3c5d2a5c_Out_0_Vector2 = float2(_Property_6f4f0f0f513da587b5c0331584e50187_Out_0_Float, _Property_a348a4abb5736887afa1734255606c10_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_5c92bca7a057e082a9ad31b6c041afbf_Out_0_Float = _HeightOffset2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Add_d827365fdb96108d96671f09a466ed5b_Out_2_Vector2;
            Unity_Add_float2(_Vector2_942eb4b05e4bd5808636661f3c5d2a5c_Out_0_Vector2, (_Property_5c92bca7a057e082a9ad31b6c041afbf_Out_0_Float.xx), _Add_d827365fdb96108d96671f09a466ed5b_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_76e4189c648f8389be05c05c248baa84_Out_3_Float;
            Unity_Remap_float(_Split_b4d828c4dcef5489b007ef9d639c65c7_B_3_Float, float2 (0, 1), _Add_d827365fdb96108d96671f09a466ed5b_Out_2_Vector2, _Remap_76e4189c648f8389be05c05c248baa84_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_b11faa069f3e798ab16c6246251d3f13_Out_2_Float;
            Unity_Multiply_float_float(_Branch_6f5d54f970d03d8b8bfbf860a10aa6dc_Out_3_Float, _Remap_76e4189c648f8389be05c05c248baa84_Out_3_Float, _Multiply_b11faa069f3e798ab16c6246251d3f13_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_1653ac275d976082acb8cc3cb2c7e0a9_Out_2_Float;
            Unity_Multiply_float_float(_Split_bc8eb833b059c2879abda47a13239f66_B_3_Float, _Multiply_b11faa069f3e798ab16c6246251d3f13_Out_2_Float, _Multiply_1653ac275d976082acb8cc3cb2c7e0a9_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_3fbe3f08ee2f5f8cb4e5ea37c77f429b_Out_0_Float = _Height_Transition;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float _HeightBlend_00a99a7141c28f80a07c77242fa96942;
            float3 _HeightBlend_00a99a7141c28f80a07c77242fa96942_OutVector4_1_Vector3;
            SG_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float((_Multiply_4dd3ecf3f3b38786bdcf91b238ffdbb2_Out_2_Vector4.xyz), _Remap_347bc01c0ddf72878c4eb9274baae4ff_Out_3_Float, (_Multiply_934c5505e5759286921bda248879c83f_Out_2_Vector4.xyz), _Multiply_1653ac275d976082acb8cc3cb2c7e0a9_Out_2_Float, _Property_3fbe3f08ee2f5f8cb4e5ea37c77f429b_Out_0_Float, _HeightBlend_00a99a7141c28f80a07c77242fa96942, _HeightBlend_00a99a7141c28f80a07c77242fa96942_OutVector4_1_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_11ef2dfbd610ec809f27f54da5f6d8eb_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverBaseColorMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_8229e2bff7eeb784bda5cb1a71007335_Out_0_Vector4 = _CoverTilingOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Divide_417e4c87f5de7b8abda7c05a2ef88056_Out_2_Vector4;
            Unity_Divide_float4(float4(1, 1, 0, 0), _Property_8229e2bff7eeb784bda5cb1a71007335_Out_0_Vector4, _Divide_417e4c87f5de7b8abda7c05a2ef88056_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_d62f7360b612d9809c3e73ad07243f08_Out_0_Float = _CoverTriplanarThreshold;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_7aa1ee497ef585889e9e6889c832028b;
            _TriplanarNM_7aa1ee497ef585889e9e6889c832028b.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_7aa1ee497ef585889e9e6889c832028b.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_7aa1ee497ef585889e9e6889c832028b_XYZ_1_Vector4;
            float4 _TriplanarNM_7aa1ee497ef585889e9e6889c832028b_XZ_2_Vector4;
            float4 _TriplanarNM_7aa1ee497ef585889e9e6889c832028b_YZ_3_Vector4;
            float4 _TriplanarNM_7aa1ee497ef585889e9e6889c832028b_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_11ef2dfbd610ec809f27f54da5f6d8eb_Out_0_Texture2D, (_Divide_417e4c87f5de7b8abda7c05a2ef88056_Out_2_Vector4).x, _Property_d62f7360b612d9809c3e73ad07243f08_Out_0_Float, _TriplanarNM_7aa1ee497ef585889e9e6889c832028b, _TriplanarNM_7aa1ee497ef585889e9e6889c832028b_XYZ_1_Vector4, _TriplanarNM_7aa1ee497ef585889e9e6889c832028b_XZ_2_Vector4, _TriplanarNM_7aa1ee497ef585889e9e6889c832028b_YZ_3_Vector4, _TriplanarNM_7aa1ee497ef585889e9e6889c832028b_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_6f1e31130250ca80aae786393f8e97e4_Out_0_Vector4 = _CoverBaseColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Multiply_14ce5f06524122898b5641da23fb0105_Out_2_Vector4;
            Unity_Multiply_float4_float4(_TriplanarNM_7aa1ee497ef585889e9e6889c832028b_XYZ_1_Vector4, _Property_6f1e31130250ca80aae786393f8e97e4_Out_0_Vector4, _Multiply_14ce5f06524122898b5641da23fb0105_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_9ff2eaae0dc74d9c9745b3fd09addcc9_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverBaseColorMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _UV_95a3b3f395e44d84a287ca09a90c4b36_Out_0_Vector4 = IN.uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _SampleTexture2D_1208d4f2cad47a8aa3dd7db5bdac6dbf_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_9ff2eaae0dc74d9c9745b3fd09addcc9_Out_0_Texture2D.tex, _Property_9ff2eaae0dc74d9c9745b3fd09addcc9_Out_0_Texture2D.samplerstate, _Property_9ff2eaae0dc74d9c9745b3fd09addcc9_Out_0_Texture2D.GetTransformedUV((_UV_95a3b3f395e44d84a287ca09a90c4b36_Out_0_Vector4.xy)) );
            float _SampleTexture2D_1208d4f2cad47a8aa3dd7db5bdac6dbf_R_4_Float = _SampleTexture2D_1208d4f2cad47a8aa3dd7db5bdac6dbf_RGBA_0_Vector4.r;
            float _SampleTexture2D_1208d4f2cad47a8aa3dd7db5bdac6dbf_G_5_Float = _SampleTexture2D_1208d4f2cad47a8aa3dd7db5bdac6dbf_RGBA_0_Vector4.g;
            float _SampleTexture2D_1208d4f2cad47a8aa3dd7db5bdac6dbf_B_6_Float = _SampleTexture2D_1208d4f2cad47a8aa3dd7db5bdac6dbf_RGBA_0_Vector4.b;
            float _SampleTexture2D_1208d4f2cad47a8aa3dd7db5bdac6dbf_A_7_Float = _SampleTexture2D_1208d4f2cad47a8aa3dd7db5bdac6dbf_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_39083fd581a9858f8617da21e8049448_Out_0_Float = _CoverMaskPower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_d719ca05fe62698aa94e1a1a45abb189_Out_2_Float;
            Unity_Multiply_float_float(_SampleTexture2D_1208d4f2cad47a8aa3dd7db5bdac6dbf_A_7_Float, _Property_39083fd581a9858f8617da21e8049448_Out_0_Float, _Multiply_d719ca05fe62698aa94e1a1a45abb189_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_237fdddd221902858486e07d232e016c_Out_3_Float;
            Unity_Clamp_float(_Multiply_d719ca05fe62698aa94e1a1a45abb189_Out_2_Float, float(0), float(1), _Clamp_237fdddd221902858486e07d232e016c_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Property_577e31e406d3dd8fb1a321606123ec09_Out_0_Vector3 = _CoverDirection;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_1d71aa77d4c8d8848d8a70a7494d504c_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseNormalMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float _PlanarNMn_7b0c7a6d68832f8499160064dd98697c;
            _PlanarNMn_7b0c7a6d68832f8499160064dd98697c.WorldSpaceNormal = IN.WorldSpaceNormal;
            _PlanarNMn_7b0c7a6d68832f8499160064dd98697c.WorldSpaceTangent = IN.WorldSpaceTangent;
            _PlanarNMn_7b0c7a6d68832f8499160064dd98697c.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _PlanarNMn_7b0c7a6d68832f8499160064dd98697c.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNMn_7b0c7a6d68832f8499160064dd98697c.uv0 = IN.uv0;
            _PlanarNMn_7b0c7a6d68832f8499160064dd98697c.uv2 = IN.uv2;
            float4 _PlanarNMn_7b0c7a6d68832f8499160064dd98697c_XZ_2_Vector4;
            SG_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float(_Property_1d71aa77d4c8d8848d8a70a7494d504c_Out_0_Texture2D, _Property_cdba86d1e85a37858062d83b2fa6392d_Out_0_Vector4, _Property_c4d58d2885325e85994407e8fe45e088_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), 1, _PlanarNMn_7b0c7a6d68832f8499160064dd98697c, _PlanarNMn_7b0c7a6d68832f8499160064dd98697c_XZ_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_087816ca8e015a8a9fb223d9087b4182_Out_0_Float = _BaseNormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _NormalStrength_37595aefbf2c5782a9e1ac3bf5c68089_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_7b0c7a6d68832f8499160064dd98697c_XZ_2_Vector4.xyz), _Property_087816ca8e015a8a9fb223d9087b4182_Out_0_Float, _NormalStrength_37595aefbf2c5782a9e1ac3bf5c68089_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_e5d4c2313e3f328eb3d72ab688d42df9_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_Base2NormalMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float _PlanarNMn_7c412fcb6bd3a782a5b9fa87a359b5e9;
            _PlanarNMn_7c412fcb6bd3a782a5b9fa87a359b5e9.WorldSpaceNormal = IN.WorldSpaceNormal;
            _PlanarNMn_7c412fcb6bd3a782a5b9fa87a359b5e9.WorldSpaceTangent = IN.WorldSpaceTangent;
            _PlanarNMn_7c412fcb6bd3a782a5b9fa87a359b5e9.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _PlanarNMn_7c412fcb6bd3a782a5b9fa87a359b5e9.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNMn_7c412fcb6bd3a782a5b9fa87a359b5e9.uv0 = IN.uv0;
            _PlanarNMn_7c412fcb6bd3a782a5b9fa87a359b5e9.uv2 = IN.uv2;
            float4 _PlanarNMn_7c412fcb6bd3a782a5b9fa87a359b5e9_XZ_2_Vector4;
            SG_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float(_Property_e5d4c2313e3f328eb3d72ab688d42df9_Out_0_Texture2D, _Property_391bce0a1bc4ae8a8574996dcfefab13_Out_0_Vector4, _Property_b9b9b4cee220da8892912acbd91575dd_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), 1, _PlanarNMn_7c412fcb6bd3a782a5b9fa87a359b5e9, _PlanarNMn_7c412fcb6bd3a782a5b9fa87a359b5e9_XZ_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_65daec252a065086889328ae1155bba3_Out_0_Float = _Base2NormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _NormalStrength_0db20ce64d0949819e7c8a183ae1ea63_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_7c412fcb6bd3a782a5b9fa87a359b5e9_XZ_2_Vector4.xyz), _Property_65daec252a065086889328ae1155bba3_Out_0_Float, _NormalStrength_0db20ce64d0949819e7c8a183ae1ea63_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float _HeightBlend_2aea92908228ec8dbdea2d76ee4c8bd4;
            float3 _HeightBlend_2aea92908228ec8dbdea2d76ee4c8bd4_OutVector4_1_Vector3;
            SG_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float(_NormalStrength_37595aefbf2c5782a9e1ac3bf5c68089_Out_2_Vector3, _Remap_347bc01c0ddf72878c4eb9274baae4ff_Out_3_Float, _NormalStrength_0db20ce64d0949819e7c8a183ae1ea63_Out_2_Vector3, _Multiply_1653ac275d976082acb8cc3cb2c7e0a9_Out_2_Float, _Property_3fbe3f08ee2f5f8cb4e5ea37c77f429b_Out_0_Float, _HeightBlend_2aea92908228ec8dbdea2d76ee4c8bd4, _HeightBlend_2aea92908228ec8dbdea2d76ee4c8bd4_OutVector4_1_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_57136e4b37c63b88b0458bbd6cf2f9cc_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverNormalMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNMn_059da9746584140498cd018db3c76047_float _TriplanarNMn_6714bba323a48182841b11d72f43ee6c;
            _TriplanarNMn_6714bba323a48182841b11d72f43ee6c.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNMn_6714bba323a48182841b11d72f43ee6c.WorldSpaceTangent = IN.WorldSpaceTangent;
            _TriplanarNMn_6714bba323a48182841b11d72f43ee6c.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _TriplanarNMn_6714bba323a48182841b11d72f43ee6c.WorldSpacePosition = IN.WorldSpacePosition;
            float4 _TriplanarNMn_6714bba323a48182841b11d72f43ee6c_XYZ_1_Vector4;
            float4 _TriplanarNMn_6714bba323a48182841b11d72f43ee6c_XZ_2_Vector4;
            float4 _TriplanarNMn_6714bba323a48182841b11d72f43ee6c_YZ_3_Vector4;
            float4 _TriplanarNMn_6714bba323a48182841b11d72f43ee6c_XY_4_Vector4;
            SG_TriplanarNMn_059da9746584140498cd018db3c76047_float(_Property_57136e4b37c63b88b0458bbd6cf2f9cc_Out_0_Texture2D, (_Divide_417e4c87f5de7b8abda7c05a2ef88056_Out_2_Vector4).x, _Property_d62f7360b612d9809c3e73ad07243f08_Out_0_Float, _TriplanarNMn_6714bba323a48182841b11d72f43ee6c, _TriplanarNMn_6714bba323a48182841b11d72f43ee6c_XYZ_1_Vector4, _TriplanarNMn_6714bba323a48182841b11d72f43ee6c_XZ_2_Vector4, _TriplanarNMn_6714bba323a48182841b11d72f43ee6c_YZ_3_Vector4, _TriplanarNMn_6714bba323a48182841b11d72f43ee6c_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_81149b236e506f8697e192ede27f3971_Out_0_Float = _CoverNormalBlendHardness;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _NormalStrength_b81b0d8a1b4c8d89ac37806f8964f442_Out_2_Vector3;
            Unity_NormalStrength_float((_TriplanarNMn_6714bba323a48182841b11d72f43ee6c_XYZ_1_Vector4.xyz), _Property_81149b236e506f8697e192ede27f3971_Out_0_Float, _NormalStrength_b81b0d8a1b4c8d89ac37806f8964f442_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Multiply_c6669a1338d35b8f935151fcb153d31a_Out_2_Vector3;
            Unity_Multiply_float3_float3(_Property_577e31e406d3dd8fb1a321606123ec09_Out_0_Vector3, IN.WorldSpaceNormal, _Multiply_c6669a1338d35b8f935151fcb153d31a_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_bfe793e2ad24488ab75574988e5fd48c_R_1_Float = _Multiply_c6669a1338d35b8f935151fcb153d31a_Out_2_Vector3[0];
            float _Split_bfe793e2ad24488ab75574988e5fd48c_G_2_Float = _Multiply_c6669a1338d35b8f935151fcb153d31a_Out_2_Vector3[1];
            float _Split_bfe793e2ad24488ab75574988e5fd48c_B_3_Float = _Multiply_c6669a1338d35b8f935151fcb153d31a_Out_2_Vector3[2];
            float _Split_bfe793e2ad24488ab75574988e5fd48c_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_ec8faba2956f458394b586f041c36885_Out_2_Float;
            Unity_Add_float(_Split_bfe793e2ad24488ab75574988e5fd48c_R_1_Float, _Split_bfe793e2ad24488ab75574988e5fd48c_G_2_Float, _Add_ec8faba2956f458394b586f041c36885_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_314959d6b3555188936bb9790f9181c8_Out_2_Float;
            Unity_Add_float(_Add_ec8faba2956f458394b586f041c36885_Out_2_Float, _Split_bfe793e2ad24488ab75574988e5fd48c_B_3_Float, _Add_314959d6b3555188936bb9790f9181c8_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_41f9e80571036b84980ab755a1cd2b8a_Out_0_Float = _Cover_Amount;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_b15b5b7f74ac668fae6ac756ac65860d_Out_0_Float = _Cover_Amount_Grow_Speed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Subtract_f2404bbb61f6e9898d6a04e2423218b2_Out_2_Float;
            Unity_Subtract_float(float(4), _Property_b15b5b7f74ac668fae6ac756ac65860d_Out_0_Float, _Subtract_f2404bbb61f6e9898d6a04e2423218b2_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_75c861c3d8dd338e811f59b0e389e75b_Out_2_Float;
            Unity_Divide_float(_Property_41f9e80571036b84980ab755a1cd2b8a_Out_0_Float, _Subtract_f2404bbb61f6e9898d6a04e2423218b2_Out_2_Float, _Divide_75c861c3d8dd338e811f59b0e389e75b_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Absolute_a4c9f15f226ae4878cd93d6ebf12a62e_Out_1_Float;
            Unity_Absolute_float(_Divide_75c861c3d8dd338e811f59b0e389e75b_Out_2_Float, _Absolute_a4c9f15f226ae4878cd93d6ebf12a62e_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Power_30e184dd6ca0ef868b0bce3265609949_Out_2_Float;
            Unity_Power_float(_Absolute_a4c9f15f226ae4878cd93d6ebf12a62e_Out_1_Float, _Subtract_f2404bbb61f6e9898d6a04e2423218b2_Out_2_Float, _Power_30e184dd6ca0ef868b0bce3265609949_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_30f12b6e93f7e08cb5a962e6b9f27ff2_Out_3_Float;
            Unity_Clamp_float(_Power_30e184dd6ca0ef868b0bce3265609949_Out_2_Float, float(0), float(2), _Clamp_30f12b6e93f7e08cb5a962e6b9f27ff2_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_2e58826b071117889ca7fab41db4b5cb_Out_2_Float;
            Unity_Multiply_float_float(_Add_314959d6b3555188936bb9790f9181c8_Out_2_Float, _Clamp_30f12b6e93f7e08cb5a962e6b9f27ff2_Out_3_Float, _Multiply_2e58826b071117889ca7fab41db4b5cb_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Saturate_746c9a45346e4b8d871894da64501f4f_Out_1_Float;
            Unity_Saturate_float(_Multiply_2e58826b071117889ca7fab41db4b5cb_Out_2_Float, _Saturate_746c9a45346e4b8d871894da64501f4f_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_833503f9746faf8f85a13d818f245d98_Out_3_Float;
            Unity_Clamp_float(_Add_314959d6b3555188936bb9790f9181c8_Out_2_Float, float(0), float(0.9999), _Clamp_833503f9746faf8f85a13d818f245d98_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_e9dfafaa9b18ad85938c76c7194739a2_Out_0_Float = _Cover_Max_Angle;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_1d0a578b9126a084837bf496f4134806_Out_2_Float;
            Unity_Divide_float(_Property_e9dfafaa9b18ad85938c76c7194739a2_Out_0_Float, float(45), _Divide_1d0a578b9126a084837bf496f4134806_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_f1935851a5f58984af13653d306d6189_Out_1_Float;
            Unity_OneMinus_float(_Divide_1d0a578b9126a084837bf496f4134806_Out_2_Float, _OneMinus_f1935851a5f58984af13653d306d6189_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Subtract_1269997e8c2b0f83ac902b1b23348c03_Out_2_Float;
            Unity_Subtract_float(_Clamp_833503f9746faf8f85a13d818f245d98_Out_3_Float, _OneMinus_f1935851a5f58984af13653d306d6189_Out_1_Float, _Subtract_1269997e8c2b0f83ac902b1b23348c03_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_f2a5e28fa01e468cbcafbbb0a26fb215_Out_3_Float;
            Unity_Clamp_float(_Subtract_1269997e8c2b0f83ac902b1b23348c03_Out_2_Float, float(0), float(2), _Clamp_f2a5e28fa01e468cbcafbbb0a26fb215_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_d765d4d25642de87aad736264e311fe3_Out_2_Float;
            Unity_Divide_float(float(1), _Divide_1d0a578b9126a084837bf496f4134806_Out_2_Float, _Divide_d765d4d25642de87aad736264e311fe3_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_530d3c7a368c90858bf313378f2045d6_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_f2a5e28fa01e468cbcafbbb0a26fb215_Out_3_Float, _Divide_d765d4d25642de87aad736264e311fe3_Out_2_Float, _Multiply_530d3c7a368c90858bf313378f2045d6_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Absolute_68cdb5b5fd7bc48e8abb6670b34f797a_Out_1_Float;
            Unity_Absolute_float(_Multiply_530d3c7a368c90858bf313378f2045d6_Out_2_Float, _Absolute_68cdb5b5fd7bc48e8abb6670b34f797a_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_6bc8be76ebefd081b09d70c3aa8f7e9a_Out_0_Float = _CoverHardness;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Power_d1d84226b1add48a96efc66cd5251277_Out_2_Float;
            Unity_Power_float(_Absolute_68cdb5b5fd7bc48e8abb6670b34f797a_Out_1_Float, _Property_6bc8be76ebefd081b09d70c3aa8f7e9a_Out_0_Float, _Power_d1d84226b1add48a96efc66cd5251277_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_36ce546f2e8c1683870a69c4b80b0056_Out_0_Float = _Cover_Min_Height;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_1bbfeb5150a7258fbce4159ef98004fa_Out_1_Float;
            Unity_OneMinus_float(_Property_36ce546f2e8c1683870a69c4b80b0056_Out_0_Float, _OneMinus_1bbfeb5150a7258fbce4159ef98004fa_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_8275b8a1f9b13a8ba2aab1effe981e24_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
            float _Split_8275b8a1f9b13a8ba2aab1effe981e24_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
            float _Split_8275b8a1f9b13a8ba2aab1effe981e24_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
            float _Split_8275b8a1f9b13a8ba2aab1effe981e24_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_d60e277443199583bf879c33a84040aa_Out_2_Float;
            Unity_Add_float(_OneMinus_1bbfeb5150a7258fbce4159ef98004fa_Out_1_Float, _Split_8275b8a1f9b13a8ba2aab1effe981e24_G_2_Float, _Add_d60e277443199583bf879c33a84040aa_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_d22c42648995508796312c1309a3e675_Out_2_Float;
            Unity_Add_float(_Add_d60e277443199583bf879c33a84040aa_Out_2_Float, float(1), _Add_d22c42648995508796312c1309a3e675_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_a9fafcac1555c785b00d2066da56c188_Out_3_Float;
            Unity_Clamp_float(_Add_d22c42648995508796312c1309a3e675_Out_2_Float, float(0), float(1), _Clamp_a9fafcac1555c785b00d2066da56c188_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_5efe9e928026f188bd7f2227f8a81665_Out_0_Float = _Cover_Min_Height_Blending;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_c8fe7b6f1cf6b4818c460afd271bf24f_Out_2_Float;
            Unity_Add_float(_Add_d60e277443199583bf879c33a84040aa_Out_2_Float, _Property_5efe9e928026f188bd7f2227f8a81665_Out_0_Float, _Add_c8fe7b6f1cf6b4818c460afd271bf24f_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_9a88520d364f4d839eae92761e805274_Out_2_Float;
            Unity_Divide_float(_Add_c8fe7b6f1cf6b4818c460afd271bf24f_Out_2_Float, _Add_d60e277443199583bf879c33a84040aa_Out_2_Float, _Divide_9a88520d364f4d839eae92761e805274_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_3f76521a462f978eae3dc15480703bf4_Out_1_Float;
            Unity_OneMinus_float(_Divide_9a88520d364f4d839eae92761e805274_Out_2_Float, _OneMinus_3f76521a462f978eae3dc15480703bf4_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_99637080d5a5318ea8891ba128076958_Out_2_Float;
            Unity_Add_float(_OneMinus_3f76521a462f978eae3dc15480703bf4_Out_1_Float, float(-0.5), _Add_99637080d5a5318ea8891ba128076958_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_d7e00ff03b780e8785aa0ba35cd32193_Out_3_Float;
            Unity_Clamp_float(_Add_99637080d5a5318ea8891ba128076958_Out_2_Float, float(0), float(1), _Clamp_d7e00ff03b780e8785aa0ba35cd32193_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_ff67eea748c00386b91058b2876cee40_Out_2_Float;
            Unity_Add_float(_Clamp_a9fafcac1555c785b00d2066da56c188_Out_3_Float, _Clamp_d7e00ff03b780e8785aa0ba35cd32193_Out_3_Float, _Add_ff67eea748c00386b91058b2876cee40_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_697ecf534f2574889ebd8b15de892826_Out_3_Float;
            Unity_Clamp_float(_Add_ff67eea748c00386b91058b2876cee40_Out_2_Float, float(0), float(1), _Clamp_697ecf534f2574889ebd8b15de892826_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_de11d28b9823c388af9dd6a504362c51_Out_2_Float;
            Unity_Multiply_float_float(_Power_d1d84226b1add48a96efc66cd5251277_Out_2_Float, _Clamp_697ecf534f2574889ebd8b15de892826_Out_3_Float, _Multiply_de11d28b9823c388af9dd6a504362c51_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_2d43633f93e4ee84aba21650c4f73a01_Out_2_Float;
            Unity_Multiply_float_float(_Saturate_746c9a45346e4b8d871894da64501f4f_Out_1_Float, _Multiply_de11d28b9823c388af9dd6a504362c51_Out_2_Float, _Multiply_2d43633f93e4ee84aba21650c4f73a01_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Lerp_807d7c05dc7fed88aa1ae547effba70e_Out_3_Vector3;
            Unity_Lerp_float3(_HeightBlend_2aea92908228ec8dbdea2d76ee4c8bd4_OutVector4_1_Vector3, _NormalStrength_b81b0d8a1b4c8d89ac37806f8964f442_Out_2_Vector3, (_Multiply_2d43633f93e4ee84aba21650c4f73a01_Out_2_Float.xxx), _Lerp_807d7c05dc7fed88aa1ae547effba70e_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Transform_654244b6738ef485b35a6c1ee581f307_Out_1_Vector3;
            {
                float3x3 tangentTransform = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
                _Transform_654244b6738ef485b35a6c1ee581f307_Out_1_Vector3 = TransformTangentToWorldDir(_Lerp_807d7c05dc7fed88aa1ae547effba70e_Out_3_Vector3.xyz, tangentTransform, true).xyz;
            }
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Multiply_e52384b35afef9818b65d43f1474b495_Out_2_Vector3;
            Unity_Multiply_float3_float3(_Property_577e31e406d3dd8fb1a321606123ec09_Out_0_Vector3, _Transform_654244b6738ef485b35a6c1ee581f307_Out_1_Vector3, _Multiply_e52384b35afef9818b65d43f1474b495_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_9eab4717084c17859a8e63f351c1711d_R_1_Float = _Multiply_e52384b35afef9818b65d43f1474b495_Out_2_Vector3[0];
            float _Split_9eab4717084c17859a8e63f351c1711d_G_2_Float = _Multiply_e52384b35afef9818b65d43f1474b495_Out_2_Vector3[1];
            float _Split_9eab4717084c17859a8e63f351c1711d_B_3_Float = _Multiply_e52384b35afef9818b65d43f1474b495_Out_2_Vector3[2];
            float _Split_9eab4717084c17859a8e63f351c1711d_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_da2b031a4805ce839d2c63184da7401e_Out_2_Float;
            Unity_Add_float(_Split_9eab4717084c17859a8e63f351c1711d_R_1_Float, _Split_9eab4717084c17859a8e63f351c1711d_G_2_Float, _Add_da2b031a4805ce839d2c63184da7401e_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_2dc170e840729981a3725f6afdd8f992_Out_2_Float;
            Unity_Add_float(_Add_da2b031a4805ce839d2c63184da7401e_Out_2_Float, _Split_9eab4717084c17859a8e63f351c1711d_B_3_Float, _Add_2dc170e840729981a3725f6afdd8f992_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_e5832320c3941e8ea5e26a4d0ca92908_Out_2_Float;
            Unity_Multiply_float_float(_Add_2dc170e840729981a3725f6afdd8f992_Out_2_Float, _Clamp_30f12b6e93f7e08cb5a962e6b9f27ff2_Out_3_Float, _Multiply_e5832320c3941e8ea5e26a4d0ca92908_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_08afa1de8ac2f18f857bbc71c64e8ceb_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_30f12b6e93f7e08cb5a962e6b9f27ff2_Out_3_Float, _Property_6bc8be76ebefd081b09d70c3aa8f7e9a_Out_0_Float, _Multiply_08afa1de8ac2f18f857bbc71c64e8ceb_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_09e51444a0b1e882aea42e6ef85919fb_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_08afa1de8ac2f18f857bbc71c64e8ceb_Out_2_Float, _Multiply_de11d28b9823c388af9dd6a504362c51_Out_2_Float, _Multiply_09e51444a0b1e882aea42e6ef85919fb_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_3649a34f052f1d89a3e555f2fd7a2622_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_e5832320c3941e8ea5e26a4d0ca92908_Out_2_Float, _Multiply_09e51444a0b1e882aea42e6ef85919fb_Out_2_Float, _Multiply_3649a34f052f1d89a3e555f2fd7a2622_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_1c1357d48e493e8089f5da7fa0727392_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverMaskMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e;
            _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_XYZ_1_Vector4;
            float4 _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_XZ_2_Vector4;
            float4 _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_YZ_3_Vector4;
            float4 _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_1c1357d48e493e8089f5da7fa0727392_Out_0_Texture2D, (_Divide_417e4c87f5de7b8abda7c05a2ef88056_Out_2_Vector4).x, _Property_d62f7360b612d9809c3e73ad07243f08_Out_0_Float, _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e, _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_XYZ_1_Vector4, _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_XZ_2_Vector4, _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_YZ_3_Vector4, _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_c4201edf3801a487849415809068865b_R_1_Float = _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_XYZ_1_Vector4[0];
            float _Split_c4201edf3801a487849415809068865b_G_2_Float = _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_XYZ_1_Vector4[1];
            float _Split_c4201edf3801a487849415809068865b_B_3_Float = _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_XYZ_1_Vector4[2];
            float _Split_c4201edf3801a487849415809068865b_A_4_Float = _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_XYZ_1_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_7d292a2f5737ad89aa4116a32a770401_Out_0_Float = _CoverHeightMapMin;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_b9485b720982198888701b70c808a574_Out_0_Float = _CoverHeightMapMax;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_be52d4e98cb63c8e899d455afac49761_Out_0_Vector2 = float2(_Property_7d292a2f5737ad89aa4116a32a770401_Out_0_Float, _Property_b9485b720982198888701b70c808a574_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_a028eb148d51f986846eb00dba5b8c21_Out_0_Float = _CoverHeightMapOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Add_36a89f63a185118a88e38098f08f30e7_Out_2_Vector2;
            Unity_Add_float2(_Vector2_be52d4e98cb63c8e899d455afac49761_Out_0_Vector2, (_Property_a028eb148d51f986846eb00dba5b8c21_Out_0_Float.xx), _Add_36a89f63a185118a88e38098f08f30e7_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_89daf117afa72e87b0e7a6b7b973a4b6_Out_3_Float;
            Unity_Remap_float(_Split_c4201edf3801a487849415809068865b_B_3_Float, float2 (0, 1), _Add_36a89f63a185118a88e38098f08f30e7_Out_2_Vector2, _Remap_89daf117afa72e87b0e7a6b7b973a4b6_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_91860731e65c2c878b131ffd43bf54a5_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_3649a34f052f1d89a3e555f2fd7a2622_Out_2_Float, _Remap_89daf117afa72e87b0e7a6b7b973a4b6_Out_3_Float, _Multiply_91860731e65c2c878b131ffd43bf54a5_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_a1e9d262d487f98ab3a94dd6fef22908_Out_2_Float;
            Unity_Multiply_float_float(_Split_bc8eb833b059c2879abda47a13239f66_G_2_Float, _Multiply_91860731e65c2c878b131ffd43bf54a5_Out_2_Float, _Multiply_a1e9d262d487f98ab3a94dd6fef22908_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Saturate_a73982c803e41e80bb2d82e77e4921db_Out_1_Float;
            Unity_Saturate_float(_Multiply_a1e9d262d487f98ab3a94dd6fef22908_Out_2_Float, _Saturate_a73982c803e41e80bb2d82e77e4921db_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_3b6375a3a8f3398eb5630bb0cc4abea6_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_237fdddd221902858486e07d232e016c_Out_3_Float, _Saturate_a73982c803e41e80bb2d82e77e4921db_Out_1_Float, _Multiply_3b6375a3a8f3398eb5630bb0cc4abea6_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            #if defined(_USEDYNAMICCOVERTSTATICMASKF_ON)
            float _UseDynamicCoverTStaticMaskF_8587b1680d796886bd267db30b112d6f_Out_0_Float = _Multiply_3b6375a3a8f3398eb5630bb0cc4abea6_Out_2_Float;
            #else
            float _UseDynamicCoverTStaticMaskF_8587b1680d796886bd267db30b112d6f_Out_0_Float = _Clamp_237fdddd221902858486e07d232e016c_Out_3_Float;
            #endif
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Lerp_4fca1aa155472b85bd876a8324386f37_Out_3_Vector3;
            Unity_Lerp_float3(_HeightBlend_00a99a7141c28f80a07c77242fa96942_OutVector4_1_Vector3, (_Multiply_14ce5f06524122898b5641da23fb0105_Out_2_Vector4.xyz), (_UseDynamicCoverTStaticMaskF_8587b1680d796886bd267db30b112d6f_Out_0_Float.xxx), _Lerp_4fca1aa155472b85bd876a8324386f37_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_31a17346fd9f4c848d23d733884e0a21_Out_0_Vector4 = _WetColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Multiply_cebc9c67173afa86af7299b1b4fddee1_Out_2_Vector3;
            Unity_Multiply_float3_float3((_Property_31a17346fd9f4c848d23d733884e0a21_Out_0_Vector4.xyz), _Lerp_4fca1aa155472b85bd876a8324386f37_Out_3_Vector3, _Multiply_cebc9c67173afa86af7299b1b4fddee1_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_98f57a743ea0c9899240fca6b106aaec_Out_1_Float;
            Unity_OneMinus_float(_Split_bc8eb833b059c2879abda47a13239f66_R_1_Float, _OneMinus_98f57a743ea0c9899240fca6b106aaec_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Lerp_c7df5e0362cf3b82b5fc62aee758f480_Out_3_Vector3;
            Unity_Lerp_float3(_Lerp_4fca1aa155472b85bd876a8324386f37_Out_3_Vector3, _Multiply_cebc9c67173afa86af7299b1b4fddee1_Out_2_Vector3, (_OneMinus_98f57a743ea0c9899240fca6b106aaec_Out_1_Float.xxx), _Lerp_c7df5e0362cf3b82b5fc62aee758f480_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_5d0494d42dd1358ba8e98a2561f73d5d_Out_0_Float = _CoverNormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _NormalStrength_e307c529ee67f888a39ef097cca48511_Out_2_Vector3;
            Unity_NormalStrength_float((_TriplanarNMn_6714bba323a48182841b11d72f43ee6c_XYZ_1_Vector4.xyz), _Property_5d0494d42dd1358ba8e98a2561f73d5d_Out_0_Float, _NormalStrength_e307c529ee67f888a39ef097cca48511_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Lerp_0fff104b2f78178ea3d3449b8610ead6_Out_3_Vector3;
            Unity_Lerp_float3(_HeightBlend_2aea92908228ec8dbdea2d76ee4c8bd4_OutVector4_1_Vector3, _NormalStrength_e307c529ee67f888a39ef097cca48511_Out_2_Vector3, (_UseDynamicCoverTStaticMaskF_8587b1680d796886bd267db30b112d6f_Out_0_Float.xxx), _Lerp_0fff104b2f78178ea3d3449b8610ead6_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_bddb7f0e467fae83bd30033562884a1f_Out_0_Float = _BaseMetallic;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_520a1f20f5851e8784f74c90958c759b_Out_2_Float;
            Unity_Multiply_float_float(_Split_2873060f5cfdf687b30bd679f8a5291e_R_1_Float, _Property_bddb7f0e467fae83bd30033562884a1f_Out_0_Float, _Multiply_520a1f20f5851e8784f74c90958c759b_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_365fcb6b42fbbf80b0ad1551f65d0d79_Out_0_Float = _BaseAORemapMin;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_7b9578c5167556858885b1052c521b82_Out_0_Float = _BaseAORemapMax;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_186923b985bed0889756a055aca45f77_Out_0_Vector2 = float2(_Property_365fcb6b42fbbf80b0ad1551f65d0d79_Out_0_Float, _Property_7b9578c5167556858885b1052c521b82_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_ab666a00bc3fa68fa731124a3496d2cb_Out_3_Float;
            Unity_Remap_float(_Split_2873060f5cfdf687b30bd679f8a5291e_G_2_Float, float2 (0, 1), _Vector2_186923b985bed0889756a055aca45f77_Out_0_Vector2, _Remap_ab666a00bc3fa68fa731124a3496d2cb_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_ffc0886b0bd8f683b7c260396a254f0d_Out_0_Float = _BaseSmoothnessRemapMin;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_ed1ed7534d5bbc8a812f4e2c91eb4d27_Out_0_Float = _BaseSmoothnessRemapMax;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_9f356451f28b418e9cc44004a78eb446_Out_0_Vector2 = float2(_Property_ffc0886b0bd8f683b7c260396a254f0d_Out_0_Float, _Property_ed1ed7534d5bbc8a812f4e2c91eb4d27_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_e70d59563b773082921c927223d0056b_Out_3_Float;
            Unity_Remap_float(_Split_2873060f5cfdf687b30bd679f8a5291e_A_4_Float, float2 (0, 1), _Vector2_9f356451f28b418e9cc44004a78eb446_Out_0_Vector2, _Remap_e70d59563b773082921c927223d0056b_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Vector3_dfc453344d7b688392a22f34c30d7ee6_Out_0_Vector3 = float3(_Multiply_520a1f20f5851e8784f74c90958c759b_Out_2_Float, _Remap_ab666a00bc3fa68fa731124a3496d2cb_Out_3_Float, _Remap_e70d59563b773082921c927223d0056b_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_49182bd63019538fabef6c0ac3737d33_Out_0_Float = Vector1_D38A0468;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_5d46838930c54c86b88f3afe5932862d_Out_2_Float;
            Unity_Multiply_float_float(_Split_b4d828c4dcef5489b007ef9d639c65c7_R_1_Float, _Property_49182bd63019538fabef6c0ac3737d33_Out_0_Float, _Multiply_5d46838930c54c86b88f3afe5932862d_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_f4951ef14a57b887b4b549bbd1a45728_Out_0_Float = _Base2AORemapMin;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_d805b60932adc489a0052e59316cbb10_Out_0_Float = _Base2AORemapMax;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_e1e3bdefc5d9278295461c92199a4fb6_Out_0_Vector2 = float2(_Property_f4951ef14a57b887b4b549bbd1a45728_Out_0_Float, _Property_d805b60932adc489a0052e59316cbb10_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_6dbae7a19e4e838989e4d44854c6441a_Out_3_Float;
            Unity_Remap_float(_Split_b4d828c4dcef5489b007ef9d639c65c7_G_2_Float, float2 (0, 1), _Vector2_e1e3bdefc5d9278295461c92199a4fb6_Out_0_Vector2, _Remap_6dbae7a19e4e838989e4d44854c6441a_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_bc02a3c78cb8f380b32a2780aeccba49_Out_0_Float = _Base2SmoothnessRemapMin;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_f2c0de3471b8a58b96284bd911d1ce7b_Out_0_Float = _Base2SmoothnessRemapMax;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_118158dff625d48c89694ef41adb8bcf_Out_0_Vector2 = float2(_Property_bc02a3c78cb8f380b32a2780aeccba49_Out_0_Float, _Property_f2c0de3471b8a58b96284bd911d1ce7b_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_0224ddc5750883828a786535b2f26496_Out_3_Float;
            Unity_Remap_float(_Split_b4d828c4dcef5489b007ef9d639c65c7_A_4_Float, float2 (0, 1), _Vector2_118158dff625d48c89694ef41adb8bcf_Out_0_Vector2, _Remap_0224ddc5750883828a786535b2f26496_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Vector3_a0b8ad478d83d489b924550da01c2a54_Out_0_Vector3 = float3(_Multiply_5d46838930c54c86b88f3afe5932862d_Out_2_Float, _Remap_6dbae7a19e4e838989e4d44854c6441a_Out_3_Float, _Remap_0224ddc5750883828a786535b2f26496_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float _HeightBlend_bc4e69186829ce8d8911633acc600be9;
            float3 _HeightBlend_bc4e69186829ce8d8911633acc600be9_OutVector4_1_Vector3;
            SG_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float(_Vector3_dfc453344d7b688392a22f34c30d7ee6_Out_0_Vector3, _Remap_347bc01c0ddf72878c4eb9274baae4ff_Out_3_Float, _Vector3_a0b8ad478d83d489b924550da01c2a54_Out_0_Vector3, _Multiply_1653ac275d976082acb8cc3cb2c7e0a9_Out_2_Float, _Property_3fbe3f08ee2f5f8cb4e5ea37c77f429b_Out_0_Float, _HeightBlend_bc4e69186829ce8d8911633acc600be9, _HeightBlend_bc4e69186829ce8d8911633acc600be9_OutVector4_1_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_c0a045a0dc4d5f87874d34f04188fd70_Out_0_Float = _CoverMetallic;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_a8b871073810d28d9bd8d3120e857702_Out_2_Float;
            Unity_Multiply_float_float(_Split_c4201edf3801a487849415809068865b_R_1_Float, _Property_c0a045a0dc4d5f87874d34f04188fd70_Out_0_Float, _Multiply_a8b871073810d28d9bd8d3120e857702_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_972767088651fd81a18710d4abed06bd_Out_0_Float = _CoverAORemapMin;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_c1f2a075f19c418a8de66773562aeac5_Out_0_Float = _CoverSmoothnessRemapMin;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_55d60e7a912b9586a1a4e0ab7ee9d63e_Out_0_Vector2 = float2(_Property_972767088651fd81a18710d4abed06bd_Out_0_Float, _Property_c1f2a075f19c418a8de66773562aeac5_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_f213189e6704968c9c351b22062f572a_Out_3_Float;
            Unity_Remap_float(_Split_c4201edf3801a487849415809068865b_G_2_Float, float2 (0, 1), _Vector2_55d60e7a912b9586a1a4e0ab7ee9d63e_Out_0_Vector2, _Remap_f213189e6704968c9c351b22062f572a_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_671df4578f70b5889e32d4d031e3325f_Out_0_Float = _CoverAORemapMax;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_81e665a4559e758f88b198b26d9d3d9d_Out_0_Float = _CoverSmoothnessRemapMax;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_a760bfaedfb6ed89929adc637d313d07_Out_0_Vector2 = float2(_Property_671df4578f70b5889e32d4d031e3325f_Out_0_Float, _Property_81e665a4559e758f88b198b26d9d3d9d_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_eaad94569cd3ce8db75f64a4d5f45c60_Out_3_Float;
            Unity_Remap_float(_Split_c4201edf3801a487849415809068865b_A_4_Float, float2 (0, 1), _Vector2_a760bfaedfb6ed89929adc637d313d07_Out_0_Vector2, _Remap_eaad94569cd3ce8db75f64a4d5f45c60_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Vector3_7b3197b44930698ca0c6b0edc5972259_Out_0_Vector3 = float3(_Multiply_a8b871073810d28d9bd8d3120e857702_Out_2_Float, _Remap_f213189e6704968c9c351b22062f572a_Out_3_Float, _Remap_eaad94569cd3ce8db75f64a4d5f45c60_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Lerp_a1b6048a7be83680bd6519ecf36ab33d_Out_3_Vector3;
            Unity_Lerp_float3(_HeightBlend_bc4e69186829ce8d8911633acc600be9_OutVector4_1_Vector3, _Vector3_7b3197b44930698ca0c6b0edc5972259_Out_0_Vector3, (_UseDynamicCoverTStaticMaskF_8587b1680d796886bd267db30b112d6f_Out_0_Float.xxx), _Lerp_a1b6048a7be83680bd6519ecf36ab33d_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_a706ba7c451da28d8a49835ea16f26df_R_1_Float = _Lerp_a1b6048a7be83680bd6519ecf36ab33d_Out_3_Vector3[0];
            float _Split_a706ba7c451da28d8a49835ea16f26df_G_2_Float = _Lerp_a1b6048a7be83680bd6519ecf36ab33d_Out_3_Vector3[1];
            float _Split_a706ba7c451da28d8a49835ea16f26df_B_3_Float = _Lerp_a1b6048a7be83680bd6519ecf36ab33d_Out_3_Vector3[2];
            float _Split_a706ba7c451da28d8a49835ea16f26df_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_6d180b9572284389bfceac29bb40560f_Out_0_Float = _WetSmoothness;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Lerp_91a91912ec11ff8c8626f233ef8403fb_Out_3_Float;
            Unity_Lerp_float(_Split_a706ba7c451da28d8a49835ea16f26df_B_3_Float, _Property_6d180b9572284389bfceac29bb40560f_Out_0_Float, _OneMinus_98f57a743ea0c9899240fca6b106aaec_Out_1_Float, _Lerp_91a91912ec11ff8c8626f233ef8403fb_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_208942f638bd09818be8a2afbf76c6e7_R_1_Float = _PlanarNM_939c16e3e51f06888092ac69b8f75998_XZ_2_Vector4[0];
            float _Split_208942f638bd09818be8a2afbf76c6e7_G_2_Float = _PlanarNM_939c16e3e51f06888092ac69b8f75998_XZ_2_Vector4[1];
            float _Split_208942f638bd09818be8a2afbf76c6e7_B_3_Float = _PlanarNM_939c16e3e51f06888092ac69b8f75998_XZ_2_Vector4[2];
            float _Split_208942f638bd09818be8a2afbf76c6e7_A_4_Float = _PlanarNM_939c16e3e51f06888092ac69b8f75998_XZ_2_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_fb2f800e35d50e84bc11a285a594a4cf_Out_0_Float = _AlphaCutoff;
            #endif
            surface.BaseColor = _Lerp_c7df5e0362cf3b82b5fc62aee758f480_Out_3_Vector3;
            surface.NormalTS = _Lerp_0fff104b2f78178ea3d3449b8610ead6_Out_3_Vector3;
            surface.Emission = float3(0, 0, 0);
            surface.Metallic = _Split_a706ba7c451da28d8a49835ea16f26df_R_1_Float;
            surface.Specular = IsGammaSpace() ? float3(0.5, 0.5, 0.5) : SRGBToLinear(float3(0.5, 0.5, 0.5));
            surface.Smoothness = _Lerp_91a91912ec11ff8c8626f233ef8403fb_Out_3_Float;
            surface.Occlusion = _Split_a706ba7c451da28d8a49835ea16f26df_G_2_Float;
            surface.Alpha = _Split_208942f638bd09818be8a2afbf76c6e7_A_4_Float;
            surface.AlphaClipThreshold = _Property_fb2f800e35d50e84bc11a285a594a4cf_Out_0_Float;
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
        float4 _Base2NormalMap_TexelSize;
        float _Base2NormalScale;
        float _Base2UsePlanarUV;
        float4 _Base2MaskMap_TexelSize;
        float Vector1_D38A0468;
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
            UnityTexture2D _Property_9877f7d14ab03a82ac49746caa97aeb7_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseColorMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_cdba86d1e85a37858062d83b2fa6392d_Out_0_Vector4 = _BaseTilingOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_c4d58d2885325e85994407e8fe45e088_Out_0_Boolean = _BaseUsePlanarUV;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_939c16e3e51f06888092ac69b8f75998;
            _PlanarNM_939c16e3e51f06888092ac69b8f75998.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_939c16e3e51f06888092ac69b8f75998.uv0 = IN.uv0;
            _PlanarNM_939c16e3e51f06888092ac69b8f75998.uv2 = IN.uv2;
            float4 _PlanarNM_939c16e3e51f06888092ac69b8f75998_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_9877f7d14ab03a82ac49746caa97aeb7_Out_0_Texture2D, _Property_cdba86d1e85a37858062d83b2fa6392d_Out_0_Vector4, _Property_c4d58d2885325e85994407e8fe45e088_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), 1, _PlanarNM_939c16e3e51f06888092ac69b8f75998, _PlanarNM_939c16e3e51f06888092ac69b8f75998_XZ_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_208942f638bd09818be8a2afbf76c6e7_R_1_Float = _PlanarNM_939c16e3e51f06888092ac69b8f75998_XZ_2_Vector4[0];
            float _Split_208942f638bd09818be8a2afbf76c6e7_G_2_Float = _PlanarNM_939c16e3e51f06888092ac69b8f75998_XZ_2_Vector4[1];
            float _Split_208942f638bd09818be8a2afbf76c6e7_B_3_Float = _PlanarNM_939c16e3e51f06888092ac69b8f75998_XZ_2_Vector4[2];
            float _Split_208942f638bd09818be8a2afbf76c6e7_A_4_Float = _PlanarNM_939c16e3e51f06888092ac69b8f75998_XZ_2_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_fb2f800e35d50e84bc11a285a594a4cf_Out_0_Float = _AlphaCutoff;
            #endif
            surface.Alpha = _Split_208942f638bd09818be8a2afbf76c6e7_A_4_Float;
            surface.AlphaClipThreshold = _Property_fb2f800e35d50e84bc11a285a594a4cf_Out_0_Float;
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
        float4 _Base2NormalMap_TexelSize;
        float _Base2NormalScale;
        float _Base2UsePlanarUV;
        float4 _Base2MaskMap_TexelSize;
        float Vector1_D38A0468;
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
            UnityTexture2D _Property_9877f7d14ab03a82ac49746caa97aeb7_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseColorMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_cdba86d1e85a37858062d83b2fa6392d_Out_0_Vector4 = _BaseTilingOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_c4d58d2885325e85994407e8fe45e088_Out_0_Boolean = _BaseUsePlanarUV;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_939c16e3e51f06888092ac69b8f75998;
            _PlanarNM_939c16e3e51f06888092ac69b8f75998.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_939c16e3e51f06888092ac69b8f75998.uv0 = IN.uv0;
            _PlanarNM_939c16e3e51f06888092ac69b8f75998.uv2 = IN.uv2;
            float4 _PlanarNM_939c16e3e51f06888092ac69b8f75998_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_9877f7d14ab03a82ac49746caa97aeb7_Out_0_Texture2D, _Property_cdba86d1e85a37858062d83b2fa6392d_Out_0_Vector4, _Property_c4d58d2885325e85994407e8fe45e088_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), 1, _PlanarNM_939c16e3e51f06888092ac69b8f75998, _PlanarNM_939c16e3e51f06888092ac69b8f75998_XZ_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_208942f638bd09818be8a2afbf76c6e7_R_1_Float = _PlanarNM_939c16e3e51f06888092ac69b8f75998_XZ_2_Vector4[0];
            float _Split_208942f638bd09818be8a2afbf76c6e7_G_2_Float = _PlanarNM_939c16e3e51f06888092ac69b8f75998_XZ_2_Vector4[1];
            float _Split_208942f638bd09818be8a2afbf76c6e7_B_3_Float = _PlanarNM_939c16e3e51f06888092ac69b8f75998_XZ_2_Vector4[2];
            float _Split_208942f638bd09818be8a2afbf76c6e7_A_4_Float = _PlanarNM_939c16e3e51f06888092ac69b8f75998_XZ_2_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_fb2f800e35d50e84bc11a285a594a4cf_Out_0_Float = _AlphaCutoff;
            #endif
            surface.Alpha = _Split_208942f638bd09818be8a2afbf76c6e7_A_4_Float;
            surface.AlphaClipThreshold = _Property_fb2f800e35d50e84bc11a285a594a4cf_Out_0_Float;
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
        float4 _Base2NormalMap_TexelSize;
        float _Base2NormalScale;
        float _Base2UsePlanarUV;
        float4 _Base2MaskMap_TexelSize;
        float Vector1_D38A0468;
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
            UnityTexture2D _Property_9877f7d14ab03a82ac49746caa97aeb7_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseColorMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_cdba86d1e85a37858062d83b2fa6392d_Out_0_Vector4 = _BaseTilingOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_c4d58d2885325e85994407e8fe45e088_Out_0_Boolean = _BaseUsePlanarUV;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_939c16e3e51f06888092ac69b8f75998;
            _PlanarNM_939c16e3e51f06888092ac69b8f75998.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_939c16e3e51f06888092ac69b8f75998.uv0 = IN.uv0;
            _PlanarNM_939c16e3e51f06888092ac69b8f75998.uv2 = IN.uv2;
            float4 _PlanarNM_939c16e3e51f06888092ac69b8f75998_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_9877f7d14ab03a82ac49746caa97aeb7_Out_0_Texture2D, _Property_cdba86d1e85a37858062d83b2fa6392d_Out_0_Vector4, _Property_c4d58d2885325e85994407e8fe45e088_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), 1, _PlanarNM_939c16e3e51f06888092ac69b8f75998, _PlanarNM_939c16e3e51f06888092ac69b8f75998_XZ_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_208942f638bd09818be8a2afbf76c6e7_R_1_Float = _PlanarNM_939c16e3e51f06888092ac69b8f75998_XZ_2_Vector4[0];
            float _Split_208942f638bd09818be8a2afbf76c6e7_G_2_Float = _PlanarNM_939c16e3e51f06888092ac69b8f75998_XZ_2_Vector4[1];
            float _Split_208942f638bd09818be8a2afbf76c6e7_B_3_Float = _PlanarNM_939c16e3e51f06888092ac69b8f75998_XZ_2_Vector4[2];
            float _Split_208942f638bd09818be8a2afbf76c6e7_A_4_Float = _PlanarNM_939c16e3e51f06888092ac69b8f75998_XZ_2_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_fb2f800e35d50e84bc11a285a594a4cf_Out_0_Float = _AlphaCutoff;
            #endif
            surface.Alpha = _Split_208942f638bd09818be8a2afbf76c6e7_A_4_Float;
            surface.AlphaClipThreshold = _Property_fb2f800e35d50e84bc11a285a594a4cf_Out_0_Float;
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
        float4 _Base2NormalMap_TexelSize;
        float _Base2NormalScale;
        float _Base2UsePlanarUV;
        float4 _Base2MaskMap_TexelSize;
        float Vector1_D38A0468;
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
            UnityTexture2D _Property_1d71aa77d4c8d8848d8a70a7494d504c_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseNormalMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_cdba86d1e85a37858062d83b2fa6392d_Out_0_Vector4 = _BaseTilingOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_c4d58d2885325e85994407e8fe45e088_Out_0_Boolean = _BaseUsePlanarUV;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float _PlanarNMn_7b0c7a6d68832f8499160064dd98697c;
            _PlanarNMn_7b0c7a6d68832f8499160064dd98697c.WorldSpaceNormal = IN.WorldSpaceNormal;
            _PlanarNMn_7b0c7a6d68832f8499160064dd98697c.WorldSpaceTangent = IN.WorldSpaceTangent;
            _PlanarNMn_7b0c7a6d68832f8499160064dd98697c.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _PlanarNMn_7b0c7a6d68832f8499160064dd98697c.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNMn_7b0c7a6d68832f8499160064dd98697c.uv0 = IN.uv0;
            _PlanarNMn_7b0c7a6d68832f8499160064dd98697c.uv2 = IN.uv2;
            float4 _PlanarNMn_7b0c7a6d68832f8499160064dd98697c_XZ_2_Vector4;
            SG_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float(_Property_1d71aa77d4c8d8848d8a70a7494d504c_Out_0_Texture2D, _Property_cdba86d1e85a37858062d83b2fa6392d_Out_0_Vector4, _Property_c4d58d2885325e85994407e8fe45e088_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), 1, _PlanarNMn_7b0c7a6d68832f8499160064dd98697c, _PlanarNMn_7b0c7a6d68832f8499160064dd98697c_XZ_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_087816ca8e015a8a9fb223d9087b4182_Out_0_Float = _BaseNormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _NormalStrength_37595aefbf2c5782a9e1ac3bf5c68089_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_7b0c7a6d68832f8499160064dd98697c_XZ_2_Vector4.xyz), _Property_087816ca8e015a8a9fb223d9087b4182_Out_0_Float, _NormalStrength_37595aefbf2c5782a9e1ac3bf5c68089_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_75d5c7e24ff6e88ab1561e2a54e6463d_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseMaskMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_f82d57d4f65ad48d9435f5e38fd6ce0c;
            _PlanarNM_f82d57d4f65ad48d9435f5e38fd6ce0c.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_f82d57d4f65ad48d9435f5e38fd6ce0c.uv0 = IN.uv0;
            _PlanarNM_f82d57d4f65ad48d9435f5e38fd6ce0c.uv2 = IN.uv2;
            float4 _PlanarNM_f82d57d4f65ad48d9435f5e38fd6ce0c_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_75d5c7e24ff6e88ab1561e2a54e6463d_Out_0_Texture2D, _Property_cdba86d1e85a37858062d83b2fa6392d_Out_0_Vector4, _Property_c4d58d2885325e85994407e8fe45e088_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), 1, _PlanarNM_f82d57d4f65ad48d9435f5e38fd6ce0c, _PlanarNM_f82d57d4f65ad48d9435f5e38fd6ce0c_XZ_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_2873060f5cfdf687b30bd679f8a5291e_R_1_Float = _PlanarNM_f82d57d4f65ad48d9435f5e38fd6ce0c_XZ_2_Vector4[0];
            float _Split_2873060f5cfdf687b30bd679f8a5291e_G_2_Float = _PlanarNM_f82d57d4f65ad48d9435f5e38fd6ce0c_XZ_2_Vector4[1];
            float _Split_2873060f5cfdf687b30bd679f8a5291e_B_3_Float = _PlanarNM_f82d57d4f65ad48d9435f5e38fd6ce0c_XZ_2_Vector4[2];
            float _Split_2873060f5cfdf687b30bd679f8a5291e_A_4_Float = _PlanarNM_f82d57d4f65ad48d9435f5e38fd6ce0c_XZ_2_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_57489d8e60c5e48ebbd4e6f83cd04306_Out_0_Float = _HeightMin;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_b3c11986fefcb082abf933a1c5505d71_Out_0_Float = _HeightMax;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_bf00af3771fe7882a94dd98123dc06eb_Out_0_Vector2 = float2(_Property_57489d8e60c5e48ebbd4e6f83cd04306_Out_0_Float, _Property_b3c11986fefcb082abf933a1c5505d71_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_d430dab1be180289a026a73080dc2a0d_Out_0_Float = _HeightOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Add_30485ad75da6dd8e9e1036d4537f114c_Out_2_Vector2;
            Unity_Add_float2(_Vector2_bf00af3771fe7882a94dd98123dc06eb_Out_0_Vector2, (_Property_d430dab1be180289a026a73080dc2a0d_Out_0_Float.xx), _Add_30485ad75da6dd8e9e1036d4537f114c_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_347bc01c0ddf72878c4eb9274baae4ff_Out_3_Float;
            Unity_Remap_float(_Split_2873060f5cfdf687b30bd679f8a5291e_B_3_Float, float2 (0, 1), _Add_30485ad75da6dd8e9e1036d4537f114c_Out_2_Vector2, _Remap_347bc01c0ddf72878c4eb9274baae4ff_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_e5d4c2313e3f328eb3d72ab688d42df9_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_Base2NormalMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_391bce0a1bc4ae8a8574996dcfefab13_Out_0_Vector4 = _Base2TilingOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_b9b9b4cee220da8892912acbd91575dd_Out_0_Boolean = _Base2UsePlanarUV;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float _PlanarNMn_7c412fcb6bd3a782a5b9fa87a359b5e9;
            _PlanarNMn_7c412fcb6bd3a782a5b9fa87a359b5e9.WorldSpaceNormal = IN.WorldSpaceNormal;
            _PlanarNMn_7c412fcb6bd3a782a5b9fa87a359b5e9.WorldSpaceTangent = IN.WorldSpaceTangent;
            _PlanarNMn_7c412fcb6bd3a782a5b9fa87a359b5e9.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _PlanarNMn_7c412fcb6bd3a782a5b9fa87a359b5e9.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNMn_7c412fcb6bd3a782a5b9fa87a359b5e9.uv0 = IN.uv0;
            _PlanarNMn_7c412fcb6bd3a782a5b9fa87a359b5e9.uv2 = IN.uv2;
            float4 _PlanarNMn_7c412fcb6bd3a782a5b9fa87a359b5e9_XZ_2_Vector4;
            SG_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float(_Property_e5d4c2313e3f328eb3d72ab688d42df9_Out_0_Texture2D, _Property_391bce0a1bc4ae8a8574996dcfefab13_Out_0_Vector4, _Property_b9b9b4cee220da8892912acbd91575dd_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), 1, _PlanarNMn_7c412fcb6bd3a782a5b9fa87a359b5e9, _PlanarNMn_7c412fcb6bd3a782a5b9fa87a359b5e9_XZ_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_65daec252a065086889328ae1155bba3_Out_0_Float = _Base2NormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _NormalStrength_0db20ce64d0949819e7c8a183ae1ea63_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_7c412fcb6bd3a782a5b9fa87a359b5e9_XZ_2_Vector4.xyz), _Property_65daec252a065086889328ae1155bba3_Out_0_Float, _NormalStrength_0db20ce64d0949819e7c8a183ae1ea63_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_bc8eb833b059c2879abda47a13239f66_R_1_Float = IN.VertexColor[0];
            float _Split_bc8eb833b059c2879abda47a13239f66_G_2_Float = IN.VertexColor[1];
            float _Split_bc8eb833b059c2879abda47a13239f66_B_3_Float = IN.VertexColor[2];
            float _Split_bc8eb833b059c2879abda47a13239f66_A_4_Float = IN.VertexColor[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_67acbc8108127387b3521a5887c8fd65_Out_0_Boolean = _Invert_Layer_Mask;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_ec66fdea21d60b889b53e96094a2bb5f_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_LayerMask);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _SampleTexture2D_1e04ec71d2a6c38aaa9df937b66dc947_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_ec66fdea21d60b889b53e96094a2bb5f_Out_0_Texture2D.tex, _Property_ec66fdea21d60b889b53e96094a2bb5f_Out_0_Texture2D.samplerstate, _Property_ec66fdea21d60b889b53e96094a2bb5f_Out_0_Texture2D.GetTransformedUV(IN.uv0.xy) );
            float _SampleTexture2D_1e04ec71d2a6c38aaa9df937b66dc947_R_4_Float = _SampleTexture2D_1e04ec71d2a6c38aaa9df937b66dc947_RGBA_0_Vector4.r;
            float _SampleTexture2D_1e04ec71d2a6c38aaa9df937b66dc947_G_5_Float = _SampleTexture2D_1e04ec71d2a6c38aaa9df937b66dc947_RGBA_0_Vector4.g;
            float _SampleTexture2D_1e04ec71d2a6c38aaa9df937b66dc947_B_6_Float = _SampleTexture2D_1e04ec71d2a6c38aaa9df937b66dc947_RGBA_0_Vector4.b;
            float _SampleTexture2D_1e04ec71d2a6c38aaa9df937b66dc947_A_7_Float = _SampleTexture2D_1e04ec71d2a6c38aaa9df937b66dc947_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_2ab824386c8b5f86a4f1baf709dea28e_Out_1_Float;
            Unity_OneMinus_float(_SampleTexture2D_1e04ec71d2a6c38aaa9df937b66dc947_R_4_Float, _OneMinus_2ab824386c8b5f86a4f1baf709dea28e_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Branch_6f5d54f970d03d8b8bfbf860a10aa6dc_Out_3_Float;
            Unity_Branch_float(_Property_67acbc8108127387b3521a5887c8fd65_Out_0_Boolean, _OneMinus_2ab824386c8b5f86a4f1baf709dea28e_Out_1_Float, _SampleTexture2D_1e04ec71d2a6c38aaa9df937b66dc947_R_4_Float, _Branch_6f5d54f970d03d8b8bfbf860a10aa6dc_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_312b7343c77e2a8eb60f73d6993817b8_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_Base2MaskMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_b5a5b9c7b16e58839fd9378c90580282;
            _PlanarNM_b5a5b9c7b16e58839fd9378c90580282.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_b5a5b9c7b16e58839fd9378c90580282.uv0 = IN.uv0;
            _PlanarNM_b5a5b9c7b16e58839fd9378c90580282.uv2 = IN.uv2;
            float4 _PlanarNM_b5a5b9c7b16e58839fd9378c90580282_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_312b7343c77e2a8eb60f73d6993817b8_Out_0_Texture2D, _Property_391bce0a1bc4ae8a8574996dcfefab13_Out_0_Vector4, _Property_b9b9b4cee220da8892912acbd91575dd_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), 1, _PlanarNM_b5a5b9c7b16e58839fd9378c90580282, _PlanarNM_b5a5b9c7b16e58839fd9378c90580282_XZ_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_b4d828c4dcef5489b007ef9d639c65c7_R_1_Float = _PlanarNM_b5a5b9c7b16e58839fd9378c90580282_XZ_2_Vector4[0];
            float _Split_b4d828c4dcef5489b007ef9d639c65c7_G_2_Float = _PlanarNM_b5a5b9c7b16e58839fd9378c90580282_XZ_2_Vector4[1];
            float _Split_b4d828c4dcef5489b007ef9d639c65c7_B_3_Float = _PlanarNM_b5a5b9c7b16e58839fd9378c90580282_XZ_2_Vector4[2];
            float _Split_b4d828c4dcef5489b007ef9d639c65c7_A_4_Float = _PlanarNM_b5a5b9c7b16e58839fd9378c90580282_XZ_2_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_6f4f0f0f513da587b5c0331584e50187_Out_0_Float = _HeightMin2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_a348a4abb5736887afa1734255606c10_Out_0_Float = _HeightMax2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_942eb4b05e4bd5808636661f3c5d2a5c_Out_0_Vector2 = float2(_Property_6f4f0f0f513da587b5c0331584e50187_Out_0_Float, _Property_a348a4abb5736887afa1734255606c10_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_5c92bca7a057e082a9ad31b6c041afbf_Out_0_Float = _HeightOffset2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Add_d827365fdb96108d96671f09a466ed5b_Out_2_Vector2;
            Unity_Add_float2(_Vector2_942eb4b05e4bd5808636661f3c5d2a5c_Out_0_Vector2, (_Property_5c92bca7a057e082a9ad31b6c041afbf_Out_0_Float.xx), _Add_d827365fdb96108d96671f09a466ed5b_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_76e4189c648f8389be05c05c248baa84_Out_3_Float;
            Unity_Remap_float(_Split_b4d828c4dcef5489b007ef9d639c65c7_B_3_Float, float2 (0, 1), _Add_d827365fdb96108d96671f09a466ed5b_Out_2_Vector2, _Remap_76e4189c648f8389be05c05c248baa84_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_b11faa069f3e798ab16c6246251d3f13_Out_2_Float;
            Unity_Multiply_float_float(_Branch_6f5d54f970d03d8b8bfbf860a10aa6dc_Out_3_Float, _Remap_76e4189c648f8389be05c05c248baa84_Out_3_Float, _Multiply_b11faa069f3e798ab16c6246251d3f13_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_1653ac275d976082acb8cc3cb2c7e0a9_Out_2_Float;
            Unity_Multiply_float_float(_Split_bc8eb833b059c2879abda47a13239f66_B_3_Float, _Multiply_b11faa069f3e798ab16c6246251d3f13_Out_2_Float, _Multiply_1653ac275d976082acb8cc3cb2c7e0a9_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_3fbe3f08ee2f5f8cb4e5ea37c77f429b_Out_0_Float = _Height_Transition;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float _HeightBlend_2aea92908228ec8dbdea2d76ee4c8bd4;
            float3 _HeightBlend_2aea92908228ec8dbdea2d76ee4c8bd4_OutVector4_1_Vector3;
            SG_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float(_NormalStrength_37595aefbf2c5782a9e1ac3bf5c68089_Out_2_Vector3, _Remap_347bc01c0ddf72878c4eb9274baae4ff_Out_3_Float, _NormalStrength_0db20ce64d0949819e7c8a183ae1ea63_Out_2_Vector3, _Multiply_1653ac275d976082acb8cc3cb2c7e0a9_Out_2_Float, _Property_3fbe3f08ee2f5f8cb4e5ea37c77f429b_Out_0_Float, _HeightBlend_2aea92908228ec8dbdea2d76ee4c8bd4, _HeightBlend_2aea92908228ec8dbdea2d76ee4c8bd4_OutVector4_1_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_57136e4b37c63b88b0458bbd6cf2f9cc_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverNormalMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_8229e2bff7eeb784bda5cb1a71007335_Out_0_Vector4 = _CoverTilingOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Divide_417e4c87f5de7b8abda7c05a2ef88056_Out_2_Vector4;
            Unity_Divide_float4(float4(1, 1, 0, 0), _Property_8229e2bff7eeb784bda5cb1a71007335_Out_0_Vector4, _Divide_417e4c87f5de7b8abda7c05a2ef88056_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_d62f7360b612d9809c3e73ad07243f08_Out_0_Float = _CoverTriplanarThreshold;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNMn_059da9746584140498cd018db3c76047_float _TriplanarNMn_6714bba323a48182841b11d72f43ee6c;
            _TriplanarNMn_6714bba323a48182841b11d72f43ee6c.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNMn_6714bba323a48182841b11d72f43ee6c.WorldSpaceTangent = IN.WorldSpaceTangent;
            _TriplanarNMn_6714bba323a48182841b11d72f43ee6c.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _TriplanarNMn_6714bba323a48182841b11d72f43ee6c.WorldSpacePosition = IN.WorldSpacePosition;
            float4 _TriplanarNMn_6714bba323a48182841b11d72f43ee6c_XYZ_1_Vector4;
            float4 _TriplanarNMn_6714bba323a48182841b11d72f43ee6c_XZ_2_Vector4;
            float4 _TriplanarNMn_6714bba323a48182841b11d72f43ee6c_YZ_3_Vector4;
            float4 _TriplanarNMn_6714bba323a48182841b11d72f43ee6c_XY_4_Vector4;
            SG_TriplanarNMn_059da9746584140498cd018db3c76047_float(_Property_57136e4b37c63b88b0458bbd6cf2f9cc_Out_0_Texture2D, (_Divide_417e4c87f5de7b8abda7c05a2ef88056_Out_2_Vector4).x, _Property_d62f7360b612d9809c3e73ad07243f08_Out_0_Float, _TriplanarNMn_6714bba323a48182841b11d72f43ee6c, _TriplanarNMn_6714bba323a48182841b11d72f43ee6c_XYZ_1_Vector4, _TriplanarNMn_6714bba323a48182841b11d72f43ee6c_XZ_2_Vector4, _TriplanarNMn_6714bba323a48182841b11d72f43ee6c_YZ_3_Vector4, _TriplanarNMn_6714bba323a48182841b11d72f43ee6c_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_5d0494d42dd1358ba8e98a2561f73d5d_Out_0_Float = _CoverNormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _NormalStrength_e307c529ee67f888a39ef097cca48511_Out_2_Vector3;
            Unity_NormalStrength_float((_TriplanarNMn_6714bba323a48182841b11d72f43ee6c_XYZ_1_Vector4.xyz), _Property_5d0494d42dd1358ba8e98a2561f73d5d_Out_0_Float, _NormalStrength_e307c529ee67f888a39ef097cca48511_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_9ff2eaae0dc74d9c9745b3fd09addcc9_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverBaseColorMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _UV_95a3b3f395e44d84a287ca09a90c4b36_Out_0_Vector4 = IN.uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _SampleTexture2D_1208d4f2cad47a8aa3dd7db5bdac6dbf_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_9ff2eaae0dc74d9c9745b3fd09addcc9_Out_0_Texture2D.tex, _Property_9ff2eaae0dc74d9c9745b3fd09addcc9_Out_0_Texture2D.samplerstate, _Property_9ff2eaae0dc74d9c9745b3fd09addcc9_Out_0_Texture2D.GetTransformedUV((_UV_95a3b3f395e44d84a287ca09a90c4b36_Out_0_Vector4.xy)) );
            float _SampleTexture2D_1208d4f2cad47a8aa3dd7db5bdac6dbf_R_4_Float = _SampleTexture2D_1208d4f2cad47a8aa3dd7db5bdac6dbf_RGBA_0_Vector4.r;
            float _SampleTexture2D_1208d4f2cad47a8aa3dd7db5bdac6dbf_G_5_Float = _SampleTexture2D_1208d4f2cad47a8aa3dd7db5bdac6dbf_RGBA_0_Vector4.g;
            float _SampleTexture2D_1208d4f2cad47a8aa3dd7db5bdac6dbf_B_6_Float = _SampleTexture2D_1208d4f2cad47a8aa3dd7db5bdac6dbf_RGBA_0_Vector4.b;
            float _SampleTexture2D_1208d4f2cad47a8aa3dd7db5bdac6dbf_A_7_Float = _SampleTexture2D_1208d4f2cad47a8aa3dd7db5bdac6dbf_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_39083fd581a9858f8617da21e8049448_Out_0_Float = _CoverMaskPower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_d719ca05fe62698aa94e1a1a45abb189_Out_2_Float;
            Unity_Multiply_float_float(_SampleTexture2D_1208d4f2cad47a8aa3dd7db5bdac6dbf_A_7_Float, _Property_39083fd581a9858f8617da21e8049448_Out_0_Float, _Multiply_d719ca05fe62698aa94e1a1a45abb189_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_237fdddd221902858486e07d232e016c_Out_3_Float;
            Unity_Clamp_float(_Multiply_d719ca05fe62698aa94e1a1a45abb189_Out_2_Float, float(0), float(1), _Clamp_237fdddd221902858486e07d232e016c_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Property_577e31e406d3dd8fb1a321606123ec09_Out_0_Vector3 = _CoverDirection;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_81149b236e506f8697e192ede27f3971_Out_0_Float = _CoverNormalBlendHardness;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _NormalStrength_b81b0d8a1b4c8d89ac37806f8964f442_Out_2_Vector3;
            Unity_NormalStrength_float((_TriplanarNMn_6714bba323a48182841b11d72f43ee6c_XYZ_1_Vector4.xyz), _Property_81149b236e506f8697e192ede27f3971_Out_0_Float, _NormalStrength_b81b0d8a1b4c8d89ac37806f8964f442_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Multiply_c6669a1338d35b8f935151fcb153d31a_Out_2_Vector3;
            Unity_Multiply_float3_float3(_Property_577e31e406d3dd8fb1a321606123ec09_Out_0_Vector3, IN.WorldSpaceNormal, _Multiply_c6669a1338d35b8f935151fcb153d31a_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_bfe793e2ad24488ab75574988e5fd48c_R_1_Float = _Multiply_c6669a1338d35b8f935151fcb153d31a_Out_2_Vector3[0];
            float _Split_bfe793e2ad24488ab75574988e5fd48c_G_2_Float = _Multiply_c6669a1338d35b8f935151fcb153d31a_Out_2_Vector3[1];
            float _Split_bfe793e2ad24488ab75574988e5fd48c_B_3_Float = _Multiply_c6669a1338d35b8f935151fcb153d31a_Out_2_Vector3[2];
            float _Split_bfe793e2ad24488ab75574988e5fd48c_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_ec8faba2956f458394b586f041c36885_Out_2_Float;
            Unity_Add_float(_Split_bfe793e2ad24488ab75574988e5fd48c_R_1_Float, _Split_bfe793e2ad24488ab75574988e5fd48c_G_2_Float, _Add_ec8faba2956f458394b586f041c36885_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_314959d6b3555188936bb9790f9181c8_Out_2_Float;
            Unity_Add_float(_Add_ec8faba2956f458394b586f041c36885_Out_2_Float, _Split_bfe793e2ad24488ab75574988e5fd48c_B_3_Float, _Add_314959d6b3555188936bb9790f9181c8_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_41f9e80571036b84980ab755a1cd2b8a_Out_0_Float = _Cover_Amount;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_b15b5b7f74ac668fae6ac756ac65860d_Out_0_Float = _Cover_Amount_Grow_Speed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Subtract_f2404bbb61f6e9898d6a04e2423218b2_Out_2_Float;
            Unity_Subtract_float(float(4), _Property_b15b5b7f74ac668fae6ac756ac65860d_Out_0_Float, _Subtract_f2404bbb61f6e9898d6a04e2423218b2_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_75c861c3d8dd338e811f59b0e389e75b_Out_2_Float;
            Unity_Divide_float(_Property_41f9e80571036b84980ab755a1cd2b8a_Out_0_Float, _Subtract_f2404bbb61f6e9898d6a04e2423218b2_Out_2_Float, _Divide_75c861c3d8dd338e811f59b0e389e75b_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Absolute_a4c9f15f226ae4878cd93d6ebf12a62e_Out_1_Float;
            Unity_Absolute_float(_Divide_75c861c3d8dd338e811f59b0e389e75b_Out_2_Float, _Absolute_a4c9f15f226ae4878cd93d6ebf12a62e_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Power_30e184dd6ca0ef868b0bce3265609949_Out_2_Float;
            Unity_Power_float(_Absolute_a4c9f15f226ae4878cd93d6ebf12a62e_Out_1_Float, _Subtract_f2404bbb61f6e9898d6a04e2423218b2_Out_2_Float, _Power_30e184dd6ca0ef868b0bce3265609949_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_30f12b6e93f7e08cb5a962e6b9f27ff2_Out_3_Float;
            Unity_Clamp_float(_Power_30e184dd6ca0ef868b0bce3265609949_Out_2_Float, float(0), float(2), _Clamp_30f12b6e93f7e08cb5a962e6b9f27ff2_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_2e58826b071117889ca7fab41db4b5cb_Out_2_Float;
            Unity_Multiply_float_float(_Add_314959d6b3555188936bb9790f9181c8_Out_2_Float, _Clamp_30f12b6e93f7e08cb5a962e6b9f27ff2_Out_3_Float, _Multiply_2e58826b071117889ca7fab41db4b5cb_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Saturate_746c9a45346e4b8d871894da64501f4f_Out_1_Float;
            Unity_Saturate_float(_Multiply_2e58826b071117889ca7fab41db4b5cb_Out_2_Float, _Saturate_746c9a45346e4b8d871894da64501f4f_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_833503f9746faf8f85a13d818f245d98_Out_3_Float;
            Unity_Clamp_float(_Add_314959d6b3555188936bb9790f9181c8_Out_2_Float, float(0), float(0.9999), _Clamp_833503f9746faf8f85a13d818f245d98_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_e9dfafaa9b18ad85938c76c7194739a2_Out_0_Float = _Cover_Max_Angle;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_1d0a578b9126a084837bf496f4134806_Out_2_Float;
            Unity_Divide_float(_Property_e9dfafaa9b18ad85938c76c7194739a2_Out_0_Float, float(45), _Divide_1d0a578b9126a084837bf496f4134806_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_f1935851a5f58984af13653d306d6189_Out_1_Float;
            Unity_OneMinus_float(_Divide_1d0a578b9126a084837bf496f4134806_Out_2_Float, _OneMinus_f1935851a5f58984af13653d306d6189_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Subtract_1269997e8c2b0f83ac902b1b23348c03_Out_2_Float;
            Unity_Subtract_float(_Clamp_833503f9746faf8f85a13d818f245d98_Out_3_Float, _OneMinus_f1935851a5f58984af13653d306d6189_Out_1_Float, _Subtract_1269997e8c2b0f83ac902b1b23348c03_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_f2a5e28fa01e468cbcafbbb0a26fb215_Out_3_Float;
            Unity_Clamp_float(_Subtract_1269997e8c2b0f83ac902b1b23348c03_Out_2_Float, float(0), float(2), _Clamp_f2a5e28fa01e468cbcafbbb0a26fb215_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_d765d4d25642de87aad736264e311fe3_Out_2_Float;
            Unity_Divide_float(float(1), _Divide_1d0a578b9126a084837bf496f4134806_Out_2_Float, _Divide_d765d4d25642de87aad736264e311fe3_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_530d3c7a368c90858bf313378f2045d6_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_f2a5e28fa01e468cbcafbbb0a26fb215_Out_3_Float, _Divide_d765d4d25642de87aad736264e311fe3_Out_2_Float, _Multiply_530d3c7a368c90858bf313378f2045d6_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Absolute_68cdb5b5fd7bc48e8abb6670b34f797a_Out_1_Float;
            Unity_Absolute_float(_Multiply_530d3c7a368c90858bf313378f2045d6_Out_2_Float, _Absolute_68cdb5b5fd7bc48e8abb6670b34f797a_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_6bc8be76ebefd081b09d70c3aa8f7e9a_Out_0_Float = _CoverHardness;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Power_d1d84226b1add48a96efc66cd5251277_Out_2_Float;
            Unity_Power_float(_Absolute_68cdb5b5fd7bc48e8abb6670b34f797a_Out_1_Float, _Property_6bc8be76ebefd081b09d70c3aa8f7e9a_Out_0_Float, _Power_d1d84226b1add48a96efc66cd5251277_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_36ce546f2e8c1683870a69c4b80b0056_Out_0_Float = _Cover_Min_Height;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_1bbfeb5150a7258fbce4159ef98004fa_Out_1_Float;
            Unity_OneMinus_float(_Property_36ce546f2e8c1683870a69c4b80b0056_Out_0_Float, _OneMinus_1bbfeb5150a7258fbce4159ef98004fa_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_8275b8a1f9b13a8ba2aab1effe981e24_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
            float _Split_8275b8a1f9b13a8ba2aab1effe981e24_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
            float _Split_8275b8a1f9b13a8ba2aab1effe981e24_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
            float _Split_8275b8a1f9b13a8ba2aab1effe981e24_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_d60e277443199583bf879c33a84040aa_Out_2_Float;
            Unity_Add_float(_OneMinus_1bbfeb5150a7258fbce4159ef98004fa_Out_1_Float, _Split_8275b8a1f9b13a8ba2aab1effe981e24_G_2_Float, _Add_d60e277443199583bf879c33a84040aa_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_d22c42648995508796312c1309a3e675_Out_2_Float;
            Unity_Add_float(_Add_d60e277443199583bf879c33a84040aa_Out_2_Float, float(1), _Add_d22c42648995508796312c1309a3e675_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_a9fafcac1555c785b00d2066da56c188_Out_3_Float;
            Unity_Clamp_float(_Add_d22c42648995508796312c1309a3e675_Out_2_Float, float(0), float(1), _Clamp_a9fafcac1555c785b00d2066da56c188_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_5efe9e928026f188bd7f2227f8a81665_Out_0_Float = _Cover_Min_Height_Blending;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_c8fe7b6f1cf6b4818c460afd271bf24f_Out_2_Float;
            Unity_Add_float(_Add_d60e277443199583bf879c33a84040aa_Out_2_Float, _Property_5efe9e928026f188bd7f2227f8a81665_Out_0_Float, _Add_c8fe7b6f1cf6b4818c460afd271bf24f_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_9a88520d364f4d839eae92761e805274_Out_2_Float;
            Unity_Divide_float(_Add_c8fe7b6f1cf6b4818c460afd271bf24f_Out_2_Float, _Add_d60e277443199583bf879c33a84040aa_Out_2_Float, _Divide_9a88520d364f4d839eae92761e805274_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_3f76521a462f978eae3dc15480703bf4_Out_1_Float;
            Unity_OneMinus_float(_Divide_9a88520d364f4d839eae92761e805274_Out_2_Float, _OneMinus_3f76521a462f978eae3dc15480703bf4_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_99637080d5a5318ea8891ba128076958_Out_2_Float;
            Unity_Add_float(_OneMinus_3f76521a462f978eae3dc15480703bf4_Out_1_Float, float(-0.5), _Add_99637080d5a5318ea8891ba128076958_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_d7e00ff03b780e8785aa0ba35cd32193_Out_3_Float;
            Unity_Clamp_float(_Add_99637080d5a5318ea8891ba128076958_Out_2_Float, float(0), float(1), _Clamp_d7e00ff03b780e8785aa0ba35cd32193_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_ff67eea748c00386b91058b2876cee40_Out_2_Float;
            Unity_Add_float(_Clamp_a9fafcac1555c785b00d2066da56c188_Out_3_Float, _Clamp_d7e00ff03b780e8785aa0ba35cd32193_Out_3_Float, _Add_ff67eea748c00386b91058b2876cee40_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_697ecf534f2574889ebd8b15de892826_Out_3_Float;
            Unity_Clamp_float(_Add_ff67eea748c00386b91058b2876cee40_Out_2_Float, float(0), float(1), _Clamp_697ecf534f2574889ebd8b15de892826_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_de11d28b9823c388af9dd6a504362c51_Out_2_Float;
            Unity_Multiply_float_float(_Power_d1d84226b1add48a96efc66cd5251277_Out_2_Float, _Clamp_697ecf534f2574889ebd8b15de892826_Out_3_Float, _Multiply_de11d28b9823c388af9dd6a504362c51_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_2d43633f93e4ee84aba21650c4f73a01_Out_2_Float;
            Unity_Multiply_float_float(_Saturate_746c9a45346e4b8d871894da64501f4f_Out_1_Float, _Multiply_de11d28b9823c388af9dd6a504362c51_Out_2_Float, _Multiply_2d43633f93e4ee84aba21650c4f73a01_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Lerp_807d7c05dc7fed88aa1ae547effba70e_Out_3_Vector3;
            Unity_Lerp_float3(_HeightBlend_2aea92908228ec8dbdea2d76ee4c8bd4_OutVector4_1_Vector3, _NormalStrength_b81b0d8a1b4c8d89ac37806f8964f442_Out_2_Vector3, (_Multiply_2d43633f93e4ee84aba21650c4f73a01_Out_2_Float.xxx), _Lerp_807d7c05dc7fed88aa1ae547effba70e_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Transform_654244b6738ef485b35a6c1ee581f307_Out_1_Vector3;
            {
                float3x3 tangentTransform = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
                _Transform_654244b6738ef485b35a6c1ee581f307_Out_1_Vector3 = TransformTangentToWorldDir(_Lerp_807d7c05dc7fed88aa1ae547effba70e_Out_3_Vector3.xyz, tangentTransform, true).xyz;
            }
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Multiply_e52384b35afef9818b65d43f1474b495_Out_2_Vector3;
            Unity_Multiply_float3_float3(_Property_577e31e406d3dd8fb1a321606123ec09_Out_0_Vector3, _Transform_654244b6738ef485b35a6c1ee581f307_Out_1_Vector3, _Multiply_e52384b35afef9818b65d43f1474b495_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_9eab4717084c17859a8e63f351c1711d_R_1_Float = _Multiply_e52384b35afef9818b65d43f1474b495_Out_2_Vector3[0];
            float _Split_9eab4717084c17859a8e63f351c1711d_G_2_Float = _Multiply_e52384b35afef9818b65d43f1474b495_Out_2_Vector3[1];
            float _Split_9eab4717084c17859a8e63f351c1711d_B_3_Float = _Multiply_e52384b35afef9818b65d43f1474b495_Out_2_Vector3[2];
            float _Split_9eab4717084c17859a8e63f351c1711d_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_da2b031a4805ce839d2c63184da7401e_Out_2_Float;
            Unity_Add_float(_Split_9eab4717084c17859a8e63f351c1711d_R_1_Float, _Split_9eab4717084c17859a8e63f351c1711d_G_2_Float, _Add_da2b031a4805ce839d2c63184da7401e_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_2dc170e840729981a3725f6afdd8f992_Out_2_Float;
            Unity_Add_float(_Add_da2b031a4805ce839d2c63184da7401e_Out_2_Float, _Split_9eab4717084c17859a8e63f351c1711d_B_3_Float, _Add_2dc170e840729981a3725f6afdd8f992_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_e5832320c3941e8ea5e26a4d0ca92908_Out_2_Float;
            Unity_Multiply_float_float(_Add_2dc170e840729981a3725f6afdd8f992_Out_2_Float, _Clamp_30f12b6e93f7e08cb5a962e6b9f27ff2_Out_3_Float, _Multiply_e5832320c3941e8ea5e26a4d0ca92908_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_08afa1de8ac2f18f857bbc71c64e8ceb_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_30f12b6e93f7e08cb5a962e6b9f27ff2_Out_3_Float, _Property_6bc8be76ebefd081b09d70c3aa8f7e9a_Out_0_Float, _Multiply_08afa1de8ac2f18f857bbc71c64e8ceb_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_09e51444a0b1e882aea42e6ef85919fb_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_08afa1de8ac2f18f857bbc71c64e8ceb_Out_2_Float, _Multiply_de11d28b9823c388af9dd6a504362c51_Out_2_Float, _Multiply_09e51444a0b1e882aea42e6ef85919fb_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_3649a34f052f1d89a3e555f2fd7a2622_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_e5832320c3941e8ea5e26a4d0ca92908_Out_2_Float, _Multiply_09e51444a0b1e882aea42e6ef85919fb_Out_2_Float, _Multiply_3649a34f052f1d89a3e555f2fd7a2622_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_1c1357d48e493e8089f5da7fa0727392_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverMaskMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e;
            _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_XYZ_1_Vector4;
            float4 _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_XZ_2_Vector4;
            float4 _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_YZ_3_Vector4;
            float4 _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_1c1357d48e493e8089f5da7fa0727392_Out_0_Texture2D, (_Divide_417e4c87f5de7b8abda7c05a2ef88056_Out_2_Vector4).x, _Property_d62f7360b612d9809c3e73ad07243f08_Out_0_Float, _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e, _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_XYZ_1_Vector4, _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_XZ_2_Vector4, _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_YZ_3_Vector4, _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_c4201edf3801a487849415809068865b_R_1_Float = _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_XYZ_1_Vector4[0];
            float _Split_c4201edf3801a487849415809068865b_G_2_Float = _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_XYZ_1_Vector4[1];
            float _Split_c4201edf3801a487849415809068865b_B_3_Float = _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_XYZ_1_Vector4[2];
            float _Split_c4201edf3801a487849415809068865b_A_4_Float = _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_XYZ_1_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_7d292a2f5737ad89aa4116a32a770401_Out_0_Float = _CoverHeightMapMin;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_b9485b720982198888701b70c808a574_Out_0_Float = _CoverHeightMapMax;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_be52d4e98cb63c8e899d455afac49761_Out_0_Vector2 = float2(_Property_7d292a2f5737ad89aa4116a32a770401_Out_0_Float, _Property_b9485b720982198888701b70c808a574_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_a028eb148d51f986846eb00dba5b8c21_Out_0_Float = _CoverHeightMapOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Add_36a89f63a185118a88e38098f08f30e7_Out_2_Vector2;
            Unity_Add_float2(_Vector2_be52d4e98cb63c8e899d455afac49761_Out_0_Vector2, (_Property_a028eb148d51f986846eb00dba5b8c21_Out_0_Float.xx), _Add_36a89f63a185118a88e38098f08f30e7_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_89daf117afa72e87b0e7a6b7b973a4b6_Out_3_Float;
            Unity_Remap_float(_Split_c4201edf3801a487849415809068865b_B_3_Float, float2 (0, 1), _Add_36a89f63a185118a88e38098f08f30e7_Out_2_Vector2, _Remap_89daf117afa72e87b0e7a6b7b973a4b6_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_91860731e65c2c878b131ffd43bf54a5_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_3649a34f052f1d89a3e555f2fd7a2622_Out_2_Float, _Remap_89daf117afa72e87b0e7a6b7b973a4b6_Out_3_Float, _Multiply_91860731e65c2c878b131ffd43bf54a5_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_a1e9d262d487f98ab3a94dd6fef22908_Out_2_Float;
            Unity_Multiply_float_float(_Split_bc8eb833b059c2879abda47a13239f66_G_2_Float, _Multiply_91860731e65c2c878b131ffd43bf54a5_Out_2_Float, _Multiply_a1e9d262d487f98ab3a94dd6fef22908_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Saturate_a73982c803e41e80bb2d82e77e4921db_Out_1_Float;
            Unity_Saturate_float(_Multiply_a1e9d262d487f98ab3a94dd6fef22908_Out_2_Float, _Saturate_a73982c803e41e80bb2d82e77e4921db_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_3b6375a3a8f3398eb5630bb0cc4abea6_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_237fdddd221902858486e07d232e016c_Out_3_Float, _Saturate_a73982c803e41e80bb2d82e77e4921db_Out_1_Float, _Multiply_3b6375a3a8f3398eb5630bb0cc4abea6_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            #if defined(_USEDYNAMICCOVERTSTATICMASKF_ON)
            float _UseDynamicCoverTStaticMaskF_8587b1680d796886bd267db30b112d6f_Out_0_Float = _Multiply_3b6375a3a8f3398eb5630bb0cc4abea6_Out_2_Float;
            #else
            float _UseDynamicCoverTStaticMaskF_8587b1680d796886bd267db30b112d6f_Out_0_Float = _Clamp_237fdddd221902858486e07d232e016c_Out_3_Float;
            #endif
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Lerp_0fff104b2f78178ea3d3449b8610ead6_Out_3_Vector3;
            Unity_Lerp_float3(_HeightBlend_2aea92908228ec8dbdea2d76ee4c8bd4_OutVector4_1_Vector3, _NormalStrength_e307c529ee67f888a39ef097cca48511_Out_2_Vector3, (_UseDynamicCoverTStaticMaskF_8587b1680d796886bd267db30b112d6f_Out_0_Float.xxx), _Lerp_0fff104b2f78178ea3d3449b8610ead6_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_9877f7d14ab03a82ac49746caa97aeb7_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseColorMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_939c16e3e51f06888092ac69b8f75998;
            _PlanarNM_939c16e3e51f06888092ac69b8f75998.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_939c16e3e51f06888092ac69b8f75998.uv0 = IN.uv0;
            _PlanarNM_939c16e3e51f06888092ac69b8f75998.uv2 = IN.uv2;
            float4 _PlanarNM_939c16e3e51f06888092ac69b8f75998_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_9877f7d14ab03a82ac49746caa97aeb7_Out_0_Texture2D, _Property_cdba86d1e85a37858062d83b2fa6392d_Out_0_Vector4, _Property_c4d58d2885325e85994407e8fe45e088_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), 1, _PlanarNM_939c16e3e51f06888092ac69b8f75998, _PlanarNM_939c16e3e51f06888092ac69b8f75998_XZ_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_208942f638bd09818be8a2afbf76c6e7_R_1_Float = _PlanarNM_939c16e3e51f06888092ac69b8f75998_XZ_2_Vector4[0];
            float _Split_208942f638bd09818be8a2afbf76c6e7_G_2_Float = _PlanarNM_939c16e3e51f06888092ac69b8f75998_XZ_2_Vector4[1];
            float _Split_208942f638bd09818be8a2afbf76c6e7_B_3_Float = _PlanarNM_939c16e3e51f06888092ac69b8f75998_XZ_2_Vector4[2];
            float _Split_208942f638bd09818be8a2afbf76c6e7_A_4_Float = _PlanarNM_939c16e3e51f06888092ac69b8f75998_XZ_2_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_fb2f800e35d50e84bc11a285a594a4cf_Out_0_Float = _AlphaCutoff;
            #endif
            surface.NormalTS = _Lerp_0fff104b2f78178ea3d3449b8610ead6_Out_3_Vector3;
            surface.Alpha = _Split_208942f638bd09818be8a2afbf76c6e7_A_4_Float;
            surface.AlphaClipThreshold = _Property_fb2f800e35d50e84bc11a285a594a4cf_Out_0_Float;
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
        float4 _Base2NormalMap_TexelSize;
        float _Base2NormalScale;
        float _Base2UsePlanarUV;
        float4 _Base2MaskMap_TexelSize;
        float Vector1_D38A0468;
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
        
        void Unity_Multiply_float_float(float A, float B, out float Out)
        {
            Out = A * B;
        }
        
        void Unity_Maximum_float(float A, float B, out float Out)
        {
            Out = max(A, B);
        }
        
        void Unity_Subtract_float(float A, float B, out float Out)
        {
            Out = A - B;
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
            UnityTexture2D _Property_9877f7d14ab03a82ac49746caa97aeb7_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseColorMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_cdba86d1e85a37858062d83b2fa6392d_Out_0_Vector4 = _BaseTilingOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_c4d58d2885325e85994407e8fe45e088_Out_0_Boolean = _BaseUsePlanarUV;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_939c16e3e51f06888092ac69b8f75998;
            _PlanarNM_939c16e3e51f06888092ac69b8f75998.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_939c16e3e51f06888092ac69b8f75998.uv0 = IN.uv0;
            _PlanarNM_939c16e3e51f06888092ac69b8f75998.uv2 = IN.uv2;
            float4 _PlanarNM_939c16e3e51f06888092ac69b8f75998_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_9877f7d14ab03a82ac49746caa97aeb7_Out_0_Texture2D, _Property_cdba86d1e85a37858062d83b2fa6392d_Out_0_Vector4, _Property_c4d58d2885325e85994407e8fe45e088_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), 1, _PlanarNM_939c16e3e51f06888092ac69b8f75998, _PlanarNM_939c16e3e51f06888092ac69b8f75998_XZ_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_2c84a3da85882688884fbe610ed37b04_Out_0_Vector4 = _BaseColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Multiply_4dd3ecf3f3b38786bdcf91b238ffdbb2_Out_2_Vector4;
            Unity_Multiply_float4_float4(_PlanarNM_939c16e3e51f06888092ac69b8f75998_XZ_2_Vector4, _Property_2c84a3da85882688884fbe610ed37b04_Out_0_Vector4, _Multiply_4dd3ecf3f3b38786bdcf91b238ffdbb2_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_75d5c7e24ff6e88ab1561e2a54e6463d_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseMaskMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_f82d57d4f65ad48d9435f5e38fd6ce0c;
            _PlanarNM_f82d57d4f65ad48d9435f5e38fd6ce0c.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_f82d57d4f65ad48d9435f5e38fd6ce0c.uv0 = IN.uv0;
            _PlanarNM_f82d57d4f65ad48d9435f5e38fd6ce0c.uv2 = IN.uv2;
            float4 _PlanarNM_f82d57d4f65ad48d9435f5e38fd6ce0c_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_75d5c7e24ff6e88ab1561e2a54e6463d_Out_0_Texture2D, _Property_cdba86d1e85a37858062d83b2fa6392d_Out_0_Vector4, _Property_c4d58d2885325e85994407e8fe45e088_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), 1, _PlanarNM_f82d57d4f65ad48d9435f5e38fd6ce0c, _PlanarNM_f82d57d4f65ad48d9435f5e38fd6ce0c_XZ_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_2873060f5cfdf687b30bd679f8a5291e_R_1_Float = _PlanarNM_f82d57d4f65ad48d9435f5e38fd6ce0c_XZ_2_Vector4[0];
            float _Split_2873060f5cfdf687b30bd679f8a5291e_G_2_Float = _PlanarNM_f82d57d4f65ad48d9435f5e38fd6ce0c_XZ_2_Vector4[1];
            float _Split_2873060f5cfdf687b30bd679f8a5291e_B_3_Float = _PlanarNM_f82d57d4f65ad48d9435f5e38fd6ce0c_XZ_2_Vector4[2];
            float _Split_2873060f5cfdf687b30bd679f8a5291e_A_4_Float = _PlanarNM_f82d57d4f65ad48d9435f5e38fd6ce0c_XZ_2_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_57489d8e60c5e48ebbd4e6f83cd04306_Out_0_Float = _HeightMin;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_b3c11986fefcb082abf933a1c5505d71_Out_0_Float = _HeightMax;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_bf00af3771fe7882a94dd98123dc06eb_Out_0_Vector2 = float2(_Property_57489d8e60c5e48ebbd4e6f83cd04306_Out_0_Float, _Property_b3c11986fefcb082abf933a1c5505d71_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_d430dab1be180289a026a73080dc2a0d_Out_0_Float = _HeightOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Add_30485ad75da6dd8e9e1036d4537f114c_Out_2_Vector2;
            Unity_Add_float2(_Vector2_bf00af3771fe7882a94dd98123dc06eb_Out_0_Vector2, (_Property_d430dab1be180289a026a73080dc2a0d_Out_0_Float.xx), _Add_30485ad75da6dd8e9e1036d4537f114c_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_347bc01c0ddf72878c4eb9274baae4ff_Out_3_Float;
            Unity_Remap_float(_Split_2873060f5cfdf687b30bd679f8a5291e_B_3_Float, float2 (0, 1), _Add_30485ad75da6dd8e9e1036d4537f114c_Out_2_Vector2, _Remap_347bc01c0ddf72878c4eb9274baae4ff_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_99f7c3ef40e2a280b853a4806f4377cc_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_Base2ColorMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_391bce0a1bc4ae8a8574996dcfefab13_Out_0_Vector4 = _Base2TilingOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_b9b9b4cee220da8892912acbd91575dd_Out_0_Boolean = _Base2UsePlanarUV;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_8125b53543ccd48bb9175630cf7bbc44;
            _PlanarNM_8125b53543ccd48bb9175630cf7bbc44.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_8125b53543ccd48bb9175630cf7bbc44.uv0 = IN.uv0;
            _PlanarNM_8125b53543ccd48bb9175630cf7bbc44.uv2 = IN.uv2;
            float4 _PlanarNM_8125b53543ccd48bb9175630cf7bbc44_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_99f7c3ef40e2a280b853a4806f4377cc_Out_0_Texture2D, _Property_391bce0a1bc4ae8a8574996dcfefab13_Out_0_Vector4, _Property_b9b9b4cee220da8892912acbd91575dd_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), 1, _PlanarNM_8125b53543ccd48bb9175630cf7bbc44, _PlanarNM_8125b53543ccd48bb9175630cf7bbc44_XZ_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_a87fae0c6b1a0984b9ef7861ccc92da9_Out_0_Vector4 = _Base2Color;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Multiply_934c5505e5759286921bda248879c83f_Out_2_Vector4;
            Unity_Multiply_float4_float4(_PlanarNM_8125b53543ccd48bb9175630cf7bbc44_XZ_2_Vector4, _Property_a87fae0c6b1a0984b9ef7861ccc92da9_Out_0_Vector4, _Multiply_934c5505e5759286921bda248879c83f_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_bc8eb833b059c2879abda47a13239f66_R_1_Float = IN.VertexColor[0];
            float _Split_bc8eb833b059c2879abda47a13239f66_G_2_Float = IN.VertexColor[1];
            float _Split_bc8eb833b059c2879abda47a13239f66_B_3_Float = IN.VertexColor[2];
            float _Split_bc8eb833b059c2879abda47a13239f66_A_4_Float = IN.VertexColor[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_67acbc8108127387b3521a5887c8fd65_Out_0_Boolean = _Invert_Layer_Mask;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_ec66fdea21d60b889b53e96094a2bb5f_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_LayerMask);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _SampleTexture2D_1e04ec71d2a6c38aaa9df937b66dc947_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_ec66fdea21d60b889b53e96094a2bb5f_Out_0_Texture2D.tex, _Property_ec66fdea21d60b889b53e96094a2bb5f_Out_0_Texture2D.samplerstate, _Property_ec66fdea21d60b889b53e96094a2bb5f_Out_0_Texture2D.GetTransformedUV(IN.uv0.xy) );
            float _SampleTexture2D_1e04ec71d2a6c38aaa9df937b66dc947_R_4_Float = _SampleTexture2D_1e04ec71d2a6c38aaa9df937b66dc947_RGBA_0_Vector4.r;
            float _SampleTexture2D_1e04ec71d2a6c38aaa9df937b66dc947_G_5_Float = _SampleTexture2D_1e04ec71d2a6c38aaa9df937b66dc947_RGBA_0_Vector4.g;
            float _SampleTexture2D_1e04ec71d2a6c38aaa9df937b66dc947_B_6_Float = _SampleTexture2D_1e04ec71d2a6c38aaa9df937b66dc947_RGBA_0_Vector4.b;
            float _SampleTexture2D_1e04ec71d2a6c38aaa9df937b66dc947_A_7_Float = _SampleTexture2D_1e04ec71d2a6c38aaa9df937b66dc947_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_2ab824386c8b5f86a4f1baf709dea28e_Out_1_Float;
            Unity_OneMinus_float(_SampleTexture2D_1e04ec71d2a6c38aaa9df937b66dc947_R_4_Float, _OneMinus_2ab824386c8b5f86a4f1baf709dea28e_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Branch_6f5d54f970d03d8b8bfbf860a10aa6dc_Out_3_Float;
            Unity_Branch_float(_Property_67acbc8108127387b3521a5887c8fd65_Out_0_Boolean, _OneMinus_2ab824386c8b5f86a4f1baf709dea28e_Out_1_Float, _SampleTexture2D_1e04ec71d2a6c38aaa9df937b66dc947_R_4_Float, _Branch_6f5d54f970d03d8b8bfbf860a10aa6dc_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_312b7343c77e2a8eb60f73d6993817b8_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_Base2MaskMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_b5a5b9c7b16e58839fd9378c90580282;
            _PlanarNM_b5a5b9c7b16e58839fd9378c90580282.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_b5a5b9c7b16e58839fd9378c90580282.uv0 = IN.uv0;
            _PlanarNM_b5a5b9c7b16e58839fd9378c90580282.uv2 = IN.uv2;
            float4 _PlanarNM_b5a5b9c7b16e58839fd9378c90580282_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_312b7343c77e2a8eb60f73d6993817b8_Out_0_Texture2D, _Property_391bce0a1bc4ae8a8574996dcfefab13_Out_0_Vector4, _Property_b9b9b4cee220da8892912acbd91575dd_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), 1, _PlanarNM_b5a5b9c7b16e58839fd9378c90580282, _PlanarNM_b5a5b9c7b16e58839fd9378c90580282_XZ_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_b4d828c4dcef5489b007ef9d639c65c7_R_1_Float = _PlanarNM_b5a5b9c7b16e58839fd9378c90580282_XZ_2_Vector4[0];
            float _Split_b4d828c4dcef5489b007ef9d639c65c7_G_2_Float = _PlanarNM_b5a5b9c7b16e58839fd9378c90580282_XZ_2_Vector4[1];
            float _Split_b4d828c4dcef5489b007ef9d639c65c7_B_3_Float = _PlanarNM_b5a5b9c7b16e58839fd9378c90580282_XZ_2_Vector4[2];
            float _Split_b4d828c4dcef5489b007ef9d639c65c7_A_4_Float = _PlanarNM_b5a5b9c7b16e58839fd9378c90580282_XZ_2_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_6f4f0f0f513da587b5c0331584e50187_Out_0_Float = _HeightMin2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_a348a4abb5736887afa1734255606c10_Out_0_Float = _HeightMax2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_942eb4b05e4bd5808636661f3c5d2a5c_Out_0_Vector2 = float2(_Property_6f4f0f0f513da587b5c0331584e50187_Out_0_Float, _Property_a348a4abb5736887afa1734255606c10_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_5c92bca7a057e082a9ad31b6c041afbf_Out_0_Float = _HeightOffset2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Add_d827365fdb96108d96671f09a466ed5b_Out_2_Vector2;
            Unity_Add_float2(_Vector2_942eb4b05e4bd5808636661f3c5d2a5c_Out_0_Vector2, (_Property_5c92bca7a057e082a9ad31b6c041afbf_Out_0_Float.xx), _Add_d827365fdb96108d96671f09a466ed5b_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_76e4189c648f8389be05c05c248baa84_Out_3_Float;
            Unity_Remap_float(_Split_b4d828c4dcef5489b007ef9d639c65c7_B_3_Float, float2 (0, 1), _Add_d827365fdb96108d96671f09a466ed5b_Out_2_Vector2, _Remap_76e4189c648f8389be05c05c248baa84_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_b11faa069f3e798ab16c6246251d3f13_Out_2_Float;
            Unity_Multiply_float_float(_Branch_6f5d54f970d03d8b8bfbf860a10aa6dc_Out_3_Float, _Remap_76e4189c648f8389be05c05c248baa84_Out_3_Float, _Multiply_b11faa069f3e798ab16c6246251d3f13_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_1653ac275d976082acb8cc3cb2c7e0a9_Out_2_Float;
            Unity_Multiply_float_float(_Split_bc8eb833b059c2879abda47a13239f66_B_3_Float, _Multiply_b11faa069f3e798ab16c6246251d3f13_Out_2_Float, _Multiply_1653ac275d976082acb8cc3cb2c7e0a9_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_3fbe3f08ee2f5f8cb4e5ea37c77f429b_Out_0_Float = _Height_Transition;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float _HeightBlend_00a99a7141c28f80a07c77242fa96942;
            float3 _HeightBlend_00a99a7141c28f80a07c77242fa96942_OutVector4_1_Vector3;
            SG_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float((_Multiply_4dd3ecf3f3b38786bdcf91b238ffdbb2_Out_2_Vector4.xyz), _Remap_347bc01c0ddf72878c4eb9274baae4ff_Out_3_Float, (_Multiply_934c5505e5759286921bda248879c83f_Out_2_Vector4.xyz), _Multiply_1653ac275d976082acb8cc3cb2c7e0a9_Out_2_Float, _Property_3fbe3f08ee2f5f8cb4e5ea37c77f429b_Out_0_Float, _HeightBlend_00a99a7141c28f80a07c77242fa96942, _HeightBlend_00a99a7141c28f80a07c77242fa96942_OutVector4_1_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_11ef2dfbd610ec809f27f54da5f6d8eb_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverBaseColorMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_8229e2bff7eeb784bda5cb1a71007335_Out_0_Vector4 = _CoverTilingOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Divide_417e4c87f5de7b8abda7c05a2ef88056_Out_2_Vector4;
            Unity_Divide_float4(float4(1, 1, 0, 0), _Property_8229e2bff7eeb784bda5cb1a71007335_Out_0_Vector4, _Divide_417e4c87f5de7b8abda7c05a2ef88056_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_d62f7360b612d9809c3e73ad07243f08_Out_0_Float = _CoverTriplanarThreshold;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_7aa1ee497ef585889e9e6889c832028b;
            _TriplanarNM_7aa1ee497ef585889e9e6889c832028b.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_7aa1ee497ef585889e9e6889c832028b.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_7aa1ee497ef585889e9e6889c832028b_XYZ_1_Vector4;
            float4 _TriplanarNM_7aa1ee497ef585889e9e6889c832028b_XZ_2_Vector4;
            float4 _TriplanarNM_7aa1ee497ef585889e9e6889c832028b_YZ_3_Vector4;
            float4 _TriplanarNM_7aa1ee497ef585889e9e6889c832028b_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_11ef2dfbd610ec809f27f54da5f6d8eb_Out_0_Texture2D, (_Divide_417e4c87f5de7b8abda7c05a2ef88056_Out_2_Vector4).x, _Property_d62f7360b612d9809c3e73ad07243f08_Out_0_Float, _TriplanarNM_7aa1ee497ef585889e9e6889c832028b, _TriplanarNM_7aa1ee497ef585889e9e6889c832028b_XYZ_1_Vector4, _TriplanarNM_7aa1ee497ef585889e9e6889c832028b_XZ_2_Vector4, _TriplanarNM_7aa1ee497ef585889e9e6889c832028b_YZ_3_Vector4, _TriplanarNM_7aa1ee497ef585889e9e6889c832028b_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_6f1e31130250ca80aae786393f8e97e4_Out_0_Vector4 = _CoverBaseColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Multiply_14ce5f06524122898b5641da23fb0105_Out_2_Vector4;
            Unity_Multiply_float4_float4(_TriplanarNM_7aa1ee497ef585889e9e6889c832028b_XYZ_1_Vector4, _Property_6f1e31130250ca80aae786393f8e97e4_Out_0_Vector4, _Multiply_14ce5f06524122898b5641da23fb0105_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_9ff2eaae0dc74d9c9745b3fd09addcc9_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverBaseColorMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _UV_95a3b3f395e44d84a287ca09a90c4b36_Out_0_Vector4 = IN.uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _SampleTexture2D_1208d4f2cad47a8aa3dd7db5bdac6dbf_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_9ff2eaae0dc74d9c9745b3fd09addcc9_Out_0_Texture2D.tex, _Property_9ff2eaae0dc74d9c9745b3fd09addcc9_Out_0_Texture2D.samplerstate, _Property_9ff2eaae0dc74d9c9745b3fd09addcc9_Out_0_Texture2D.GetTransformedUV((_UV_95a3b3f395e44d84a287ca09a90c4b36_Out_0_Vector4.xy)) );
            float _SampleTexture2D_1208d4f2cad47a8aa3dd7db5bdac6dbf_R_4_Float = _SampleTexture2D_1208d4f2cad47a8aa3dd7db5bdac6dbf_RGBA_0_Vector4.r;
            float _SampleTexture2D_1208d4f2cad47a8aa3dd7db5bdac6dbf_G_5_Float = _SampleTexture2D_1208d4f2cad47a8aa3dd7db5bdac6dbf_RGBA_0_Vector4.g;
            float _SampleTexture2D_1208d4f2cad47a8aa3dd7db5bdac6dbf_B_6_Float = _SampleTexture2D_1208d4f2cad47a8aa3dd7db5bdac6dbf_RGBA_0_Vector4.b;
            float _SampleTexture2D_1208d4f2cad47a8aa3dd7db5bdac6dbf_A_7_Float = _SampleTexture2D_1208d4f2cad47a8aa3dd7db5bdac6dbf_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_39083fd581a9858f8617da21e8049448_Out_0_Float = _CoverMaskPower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_d719ca05fe62698aa94e1a1a45abb189_Out_2_Float;
            Unity_Multiply_float_float(_SampleTexture2D_1208d4f2cad47a8aa3dd7db5bdac6dbf_A_7_Float, _Property_39083fd581a9858f8617da21e8049448_Out_0_Float, _Multiply_d719ca05fe62698aa94e1a1a45abb189_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_237fdddd221902858486e07d232e016c_Out_3_Float;
            Unity_Clamp_float(_Multiply_d719ca05fe62698aa94e1a1a45abb189_Out_2_Float, float(0), float(1), _Clamp_237fdddd221902858486e07d232e016c_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Property_577e31e406d3dd8fb1a321606123ec09_Out_0_Vector3 = _CoverDirection;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_1d71aa77d4c8d8848d8a70a7494d504c_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseNormalMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float _PlanarNMn_7b0c7a6d68832f8499160064dd98697c;
            _PlanarNMn_7b0c7a6d68832f8499160064dd98697c.WorldSpaceNormal = IN.WorldSpaceNormal;
            _PlanarNMn_7b0c7a6d68832f8499160064dd98697c.WorldSpaceTangent = IN.WorldSpaceTangent;
            _PlanarNMn_7b0c7a6d68832f8499160064dd98697c.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _PlanarNMn_7b0c7a6d68832f8499160064dd98697c.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNMn_7b0c7a6d68832f8499160064dd98697c.uv0 = IN.uv0;
            _PlanarNMn_7b0c7a6d68832f8499160064dd98697c.uv2 = IN.uv2;
            float4 _PlanarNMn_7b0c7a6d68832f8499160064dd98697c_XZ_2_Vector4;
            SG_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float(_Property_1d71aa77d4c8d8848d8a70a7494d504c_Out_0_Texture2D, _Property_cdba86d1e85a37858062d83b2fa6392d_Out_0_Vector4, _Property_c4d58d2885325e85994407e8fe45e088_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), 1, _PlanarNMn_7b0c7a6d68832f8499160064dd98697c, _PlanarNMn_7b0c7a6d68832f8499160064dd98697c_XZ_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_087816ca8e015a8a9fb223d9087b4182_Out_0_Float = _BaseNormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _NormalStrength_37595aefbf2c5782a9e1ac3bf5c68089_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_7b0c7a6d68832f8499160064dd98697c_XZ_2_Vector4.xyz), _Property_087816ca8e015a8a9fb223d9087b4182_Out_0_Float, _NormalStrength_37595aefbf2c5782a9e1ac3bf5c68089_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_e5d4c2313e3f328eb3d72ab688d42df9_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_Base2NormalMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float _PlanarNMn_7c412fcb6bd3a782a5b9fa87a359b5e9;
            _PlanarNMn_7c412fcb6bd3a782a5b9fa87a359b5e9.WorldSpaceNormal = IN.WorldSpaceNormal;
            _PlanarNMn_7c412fcb6bd3a782a5b9fa87a359b5e9.WorldSpaceTangent = IN.WorldSpaceTangent;
            _PlanarNMn_7c412fcb6bd3a782a5b9fa87a359b5e9.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _PlanarNMn_7c412fcb6bd3a782a5b9fa87a359b5e9.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNMn_7c412fcb6bd3a782a5b9fa87a359b5e9.uv0 = IN.uv0;
            _PlanarNMn_7c412fcb6bd3a782a5b9fa87a359b5e9.uv2 = IN.uv2;
            float4 _PlanarNMn_7c412fcb6bd3a782a5b9fa87a359b5e9_XZ_2_Vector4;
            SG_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float(_Property_e5d4c2313e3f328eb3d72ab688d42df9_Out_0_Texture2D, _Property_391bce0a1bc4ae8a8574996dcfefab13_Out_0_Vector4, _Property_b9b9b4cee220da8892912acbd91575dd_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), 1, _PlanarNMn_7c412fcb6bd3a782a5b9fa87a359b5e9, _PlanarNMn_7c412fcb6bd3a782a5b9fa87a359b5e9_XZ_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_65daec252a065086889328ae1155bba3_Out_0_Float = _Base2NormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _NormalStrength_0db20ce64d0949819e7c8a183ae1ea63_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_7c412fcb6bd3a782a5b9fa87a359b5e9_XZ_2_Vector4.xyz), _Property_65daec252a065086889328ae1155bba3_Out_0_Float, _NormalStrength_0db20ce64d0949819e7c8a183ae1ea63_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float _HeightBlend_2aea92908228ec8dbdea2d76ee4c8bd4;
            float3 _HeightBlend_2aea92908228ec8dbdea2d76ee4c8bd4_OutVector4_1_Vector3;
            SG_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float(_NormalStrength_37595aefbf2c5782a9e1ac3bf5c68089_Out_2_Vector3, _Remap_347bc01c0ddf72878c4eb9274baae4ff_Out_3_Float, _NormalStrength_0db20ce64d0949819e7c8a183ae1ea63_Out_2_Vector3, _Multiply_1653ac275d976082acb8cc3cb2c7e0a9_Out_2_Float, _Property_3fbe3f08ee2f5f8cb4e5ea37c77f429b_Out_0_Float, _HeightBlend_2aea92908228ec8dbdea2d76ee4c8bd4, _HeightBlend_2aea92908228ec8dbdea2d76ee4c8bd4_OutVector4_1_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_57136e4b37c63b88b0458bbd6cf2f9cc_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverNormalMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNMn_059da9746584140498cd018db3c76047_float _TriplanarNMn_6714bba323a48182841b11d72f43ee6c;
            _TriplanarNMn_6714bba323a48182841b11d72f43ee6c.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNMn_6714bba323a48182841b11d72f43ee6c.WorldSpaceTangent = IN.WorldSpaceTangent;
            _TriplanarNMn_6714bba323a48182841b11d72f43ee6c.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _TriplanarNMn_6714bba323a48182841b11d72f43ee6c.WorldSpacePosition = IN.WorldSpacePosition;
            float4 _TriplanarNMn_6714bba323a48182841b11d72f43ee6c_XYZ_1_Vector4;
            float4 _TriplanarNMn_6714bba323a48182841b11d72f43ee6c_XZ_2_Vector4;
            float4 _TriplanarNMn_6714bba323a48182841b11d72f43ee6c_YZ_3_Vector4;
            float4 _TriplanarNMn_6714bba323a48182841b11d72f43ee6c_XY_4_Vector4;
            SG_TriplanarNMn_059da9746584140498cd018db3c76047_float(_Property_57136e4b37c63b88b0458bbd6cf2f9cc_Out_0_Texture2D, (_Divide_417e4c87f5de7b8abda7c05a2ef88056_Out_2_Vector4).x, _Property_d62f7360b612d9809c3e73ad07243f08_Out_0_Float, _TriplanarNMn_6714bba323a48182841b11d72f43ee6c, _TriplanarNMn_6714bba323a48182841b11d72f43ee6c_XYZ_1_Vector4, _TriplanarNMn_6714bba323a48182841b11d72f43ee6c_XZ_2_Vector4, _TriplanarNMn_6714bba323a48182841b11d72f43ee6c_YZ_3_Vector4, _TriplanarNMn_6714bba323a48182841b11d72f43ee6c_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_81149b236e506f8697e192ede27f3971_Out_0_Float = _CoverNormalBlendHardness;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _NormalStrength_b81b0d8a1b4c8d89ac37806f8964f442_Out_2_Vector3;
            Unity_NormalStrength_float((_TriplanarNMn_6714bba323a48182841b11d72f43ee6c_XYZ_1_Vector4.xyz), _Property_81149b236e506f8697e192ede27f3971_Out_0_Float, _NormalStrength_b81b0d8a1b4c8d89ac37806f8964f442_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Multiply_c6669a1338d35b8f935151fcb153d31a_Out_2_Vector3;
            Unity_Multiply_float3_float3(_Property_577e31e406d3dd8fb1a321606123ec09_Out_0_Vector3, IN.WorldSpaceNormal, _Multiply_c6669a1338d35b8f935151fcb153d31a_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_bfe793e2ad24488ab75574988e5fd48c_R_1_Float = _Multiply_c6669a1338d35b8f935151fcb153d31a_Out_2_Vector3[0];
            float _Split_bfe793e2ad24488ab75574988e5fd48c_G_2_Float = _Multiply_c6669a1338d35b8f935151fcb153d31a_Out_2_Vector3[1];
            float _Split_bfe793e2ad24488ab75574988e5fd48c_B_3_Float = _Multiply_c6669a1338d35b8f935151fcb153d31a_Out_2_Vector3[2];
            float _Split_bfe793e2ad24488ab75574988e5fd48c_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_ec8faba2956f458394b586f041c36885_Out_2_Float;
            Unity_Add_float(_Split_bfe793e2ad24488ab75574988e5fd48c_R_1_Float, _Split_bfe793e2ad24488ab75574988e5fd48c_G_2_Float, _Add_ec8faba2956f458394b586f041c36885_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_314959d6b3555188936bb9790f9181c8_Out_2_Float;
            Unity_Add_float(_Add_ec8faba2956f458394b586f041c36885_Out_2_Float, _Split_bfe793e2ad24488ab75574988e5fd48c_B_3_Float, _Add_314959d6b3555188936bb9790f9181c8_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_41f9e80571036b84980ab755a1cd2b8a_Out_0_Float = _Cover_Amount;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_b15b5b7f74ac668fae6ac756ac65860d_Out_0_Float = _Cover_Amount_Grow_Speed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Subtract_f2404bbb61f6e9898d6a04e2423218b2_Out_2_Float;
            Unity_Subtract_float(float(4), _Property_b15b5b7f74ac668fae6ac756ac65860d_Out_0_Float, _Subtract_f2404bbb61f6e9898d6a04e2423218b2_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_75c861c3d8dd338e811f59b0e389e75b_Out_2_Float;
            Unity_Divide_float(_Property_41f9e80571036b84980ab755a1cd2b8a_Out_0_Float, _Subtract_f2404bbb61f6e9898d6a04e2423218b2_Out_2_Float, _Divide_75c861c3d8dd338e811f59b0e389e75b_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Absolute_a4c9f15f226ae4878cd93d6ebf12a62e_Out_1_Float;
            Unity_Absolute_float(_Divide_75c861c3d8dd338e811f59b0e389e75b_Out_2_Float, _Absolute_a4c9f15f226ae4878cd93d6ebf12a62e_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Power_30e184dd6ca0ef868b0bce3265609949_Out_2_Float;
            Unity_Power_float(_Absolute_a4c9f15f226ae4878cd93d6ebf12a62e_Out_1_Float, _Subtract_f2404bbb61f6e9898d6a04e2423218b2_Out_2_Float, _Power_30e184dd6ca0ef868b0bce3265609949_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_30f12b6e93f7e08cb5a962e6b9f27ff2_Out_3_Float;
            Unity_Clamp_float(_Power_30e184dd6ca0ef868b0bce3265609949_Out_2_Float, float(0), float(2), _Clamp_30f12b6e93f7e08cb5a962e6b9f27ff2_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_2e58826b071117889ca7fab41db4b5cb_Out_2_Float;
            Unity_Multiply_float_float(_Add_314959d6b3555188936bb9790f9181c8_Out_2_Float, _Clamp_30f12b6e93f7e08cb5a962e6b9f27ff2_Out_3_Float, _Multiply_2e58826b071117889ca7fab41db4b5cb_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Saturate_746c9a45346e4b8d871894da64501f4f_Out_1_Float;
            Unity_Saturate_float(_Multiply_2e58826b071117889ca7fab41db4b5cb_Out_2_Float, _Saturate_746c9a45346e4b8d871894da64501f4f_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_833503f9746faf8f85a13d818f245d98_Out_3_Float;
            Unity_Clamp_float(_Add_314959d6b3555188936bb9790f9181c8_Out_2_Float, float(0), float(0.9999), _Clamp_833503f9746faf8f85a13d818f245d98_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_e9dfafaa9b18ad85938c76c7194739a2_Out_0_Float = _Cover_Max_Angle;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_1d0a578b9126a084837bf496f4134806_Out_2_Float;
            Unity_Divide_float(_Property_e9dfafaa9b18ad85938c76c7194739a2_Out_0_Float, float(45), _Divide_1d0a578b9126a084837bf496f4134806_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_f1935851a5f58984af13653d306d6189_Out_1_Float;
            Unity_OneMinus_float(_Divide_1d0a578b9126a084837bf496f4134806_Out_2_Float, _OneMinus_f1935851a5f58984af13653d306d6189_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Subtract_1269997e8c2b0f83ac902b1b23348c03_Out_2_Float;
            Unity_Subtract_float(_Clamp_833503f9746faf8f85a13d818f245d98_Out_3_Float, _OneMinus_f1935851a5f58984af13653d306d6189_Out_1_Float, _Subtract_1269997e8c2b0f83ac902b1b23348c03_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_f2a5e28fa01e468cbcafbbb0a26fb215_Out_3_Float;
            Unity_Clamp_float(_Subtract_1269997e8c2b0f83ac902b1b23348c03_Out_2_Float, float(0), float(2), _Clamp_f2a5e28fa01e468cbcafbbb0a26fb215_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_d765d4d25642de87aad736264e311fe3_Out_2_Float;
            Unity_Divide_float(float(1), _Divide_1d0a578b9126a084837bf496f4134806_Out_2_Float, _Divide_d765d4d25642de87aad736264e311fe3_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_530d3c7a368c90858bf313378f2045d6_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_f2a5e28fa01e468cbcafbbb0a26fb215_Out_3_Float, _Divide_d765d4d25642de87aad736264e311fe3_Out_2_Float, _Multiply_530d3c7a368c90858bf313378f2045d6_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Absolute_68cdb5b5fd7bc48e8abb6670b34f797a_Out_1_Float;
            Unity_Absolute_float(_Multiply_530d3c7a368c90858bf313378f2045d6_Out_2_Float, _Absolute_68cdb5b5fd7bc48e8abb6670b34f797a_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_6bc8be76ebefd081b09d70c3aa8f7e9a_Out_0_Float = _CoverHardness;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Power_d1d84226b1add48a96efc66cd5251277_Out_2_Float;
            Unity_Power_float(_Absolute_68cdb5b5fd7bc48e8abb6670b34f797a_Out_1_Float, _Property_6bc8be76ebefd081b09d70c3aa8f7e9a_Out_0_Float, _Power_d1d84226b1add48a96efc66cd5251277_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_36ce546f2e8c1683870a69c4b80b0056_Out_0_Float = _Cover_Min_Height;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_1bbfeb5150a7258fbce4159ef98004fa_Out_1_Float;
            Unity_OneMinus_float(_Property_36ce546f2e8c1683870a69c4b80b0056_Out_0_Float, _OneMinus_1bbfeb5150a7258fbce4159ef98004fa_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_8275b8a1f9b13a8ba2aab1effe981e24_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
            float _Split_8275b8a1f9b13a8ba2aab1effe981e24_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
            float _Split_8275b8a1f9b13a8ba2aab1effe981e24_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
            float _Split_8275b8a1f9b13a8ba2aab1effe981e24_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_d60e277443199583bf879c33a84040aa_Out_2_Float;
            Unity_Add_float(_OneMinus_1bbfeb5150a7258fbce4159ef98004fa_Out_1_Float, _Split_8275b8a1f9b13a8ba2aab1effe981e24_G_2_Float, _Add_d60e277443199583bf879c33a84040aa_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_d22c42648995508796312c1309a3e675_Out_2_Float;
            Unity_Add_float(_Add_d60e277443199583bf879c33a84040aa_Out_2_Float, float(1), _Add_d22c42648995508796312c1309a3e675_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_a9fafcac1555c785b00d2066da56c188_Out_3_Float;
            Unity_Clamp_float(_Add_d22c42648995508796312c1309a3e675_Out_2_Float, float(0), float(1), _Clamp_a9fafcac1555c785b00d2066da56c188_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_5efe9e928026f188bd7f2227f8a81665_Out_0_Float = _Cover_Min_Height_Blending;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_c8fe7b6f1cf6b4818c460afd271bf24f_Out_2_Float;
            Unity_Add_float(_Add_d60e277443199583bf879c33a84040aa_Out_2_Float, _Property_5efe9e928026f188bd7f2227f8a81665_Out_0_Float, _Add_c8fe7b6f1cf6b4818c460afd271bf24f_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_9a88520d364f4d839eae92761e805274_Out_2_Float;
            Unity_Divide_float(_Add_c8fe7b6f1cf6b4818c460afd271bf24f_Out_2_Float, _Add_d60e277443199583bf879c33a84040aa_Out_2_Float, _Divide_9a88520d364f4d839eae92761e805274_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_3f76521a462f978eae3dc15480703bf4_Out_1_Float;
            Unity_OneMinus_float(_Divide_9a88520d364f4d839eae92761e805274_Out_2_Float, _OneMinus_3f76521a462f978eae3dc15480703bf4_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_99637080d5a5318ea8891ba128076958_Out_2_Float;
            Unity_Add_float(_OneMinus_3f76521a462f978eae3dc15480703bf4_Out_1_Float, float(-0.5), _Add_99637080d5a5318ea8891ba128076958_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_d7e00ff03b780e8785aa0ba35cd32193_Out_3_Float;
            Unity_Clamp_float(_Add_99637080d5a5318ea8891ba128076958_Out_2_Float, float(0), float(1), _Clamp_d7e00ff03b780e8785aa0ba35cd32193_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_ff67eea748c00386b91058b2876cee40_Out_2_Float;
            Unity_Add_float(_Clamp_a9fafcac1555c785b00d2066da56c188_Out_3_Float, _Clamp_d7e00ff03b780e8785aa0ba35cd32193_Out_3_Float, _Add_ff67eea748c00386b91058b2876cee40_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_697ecf534f2574889ebd8b15de892826_Out_3_Float;
            Unity_Clamp_float(_Add_ff67eea748c00386b91058b2876cee40_Out_2_Float, float(0), float(1), _Clamp_697ecf534f2574889ebd8b15de892826_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_de11d28b9823c388af9dd6a504362c51_Out_2_Float;
            Unity_Multiply_float_float(_Power_d1d84226b1add48a96efc66cd5251277_Out_2_Float, _Clamp_697ecf534f2574889ebd8b15de892826_Out_3_Float, _Multiply_de11d28b9823c388af9dd6a504362c51_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_2d43633f93e4ee84aba21650c4f73a01_Out_2_Float;
            Unity_Multiply_float_float(_Saturate_746c9a45346e4b8d871894da64501f4f_Out_1_Float, _Multiply_de11d28b9823c388af9dd6a504362c51_Out_2_Float, _Multiply_2d43633f93e4ee84aba21650c4f73a01_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Lerp_807d7c05dc7fed88aa1ae547effba70e_Out_3_Vector3;
            Unity_Lerp_float3(_HeightBlend_2aea92908228ec8dbdea2d76ee4c8bd4_OutVector4_1_Vector3, _NormalStrength_b81b0d8a1b4c8d89ac37806f8964f442_Out_2_Vector3, (_Multiply_2d43633f93e4ee84aba21650c4f73a01_Out_2_Float.xxx), _Lerp_807d7c05dc7fed88aa1ae547effba70e_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Transform_654244b6738ef485b35a6c1ee581f307_Out_1_Vector3;
            {
                float3x3 tangentTransform = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
                _Transform_654244b6738ef485b35a6c1ee581f307_Out_1_Vector3 = TransformTangentToWorldDir(_Lerp_807d7c05dc7fed88aa1ae547effba70e_Out_3_Vector3.xyz, tangentTransform, true).xyz;
            }
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Multiply_e52384b35afef9818b65d43f1474b495_Out_2_Vector3;
            Unity_Multiply_float3_float3(_Property_577e31e406d3dd8fb1a321606123ec09_Out_0_Vector3, _Transform_654244b6738ef485b35a6c1ee581f307_Out_1_Vector3, _Multiply_e52384b35afef9818b65d43f1474b495_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_9eab4717084c17859a8e63f351c1711d_R_1_Float = _Multiply_e52384b35afef9818b65d43f1474b495_Out_2_Vector3[0];
            float _Split_9eab4717084c17859a8e63f351c1711d_G_2_Float = _Multiply_e52384b35afef9818b65d43f1474b495_Out_2_Vector3[1];
            float _Split_9eab4717084c17859a8e63f351c1711d_B_3_Float = _Multiply_e52384b35afef9818b65d43f1474b495_Out_2_Vector3[2];
            float _Split_9eab4717084c17859a8e63f351c1711d_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_da2b031a4805ce839d2c63184da7401e_Out_2_Float;
            Unity_Add_float(_Split_9eab4717084c17859a8e63f351c1711d_R_1_Float, _Split_9eab4717084c17859a8e63f351c1711d_G_2_Float, _Add_da2b031a4805ce839d2c63184da7401e_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_2dc170e840729981a3725f6afdd8f992_Out_2_Float;
            Unity_Add_float(_Add_da2b031a4805ce839d2c63184da7401e_Out_2_Float, _Split_9eab4717084c17859a8e63f351c1711d_B_3_Float, _Add_2dc170e840729981a3725f6afdd8f992_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_e5832320c3941e8ea5e26a4d0ca92908_Out_2_Float;
            Unity_Multiply_float_float(_Add_2dc170e840729981a3725f6afdd8f992_Out_2_Float, _Clamp_30f12b6e93f7e08cb5a962e6b9f27ff2_Out_3_Float, _Multiply_e5832320c3941e8ea5e26a4d0ca92908_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_08afa1de8ac2f18f857bbc71c64e8ceb_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_30f12b6e93f7e08cb5a962e6b9f27ff2_Out_3_Float, _Property_6bc8be76ebefd081b09d70c3aa8f7e9a_Out_0_Float, _Multiply_08afa1de8ac2f18f857bbc71c64e8ceb_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_09e51444a0b1e882aea42e6ef85919fb_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_08afa1de8ac2f18f857bbc71c64e8ceb_Out_2_Float, _Multiply_de11d28b9823c388af9dd6a504362c51_Out_2_Float, _Multiply_09e51444a0b1e882aea42e6ef85919fb_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_3649a34f052f1d89a3e555f2fd7a2622_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_e5832320c3941e8ea5e26a4d0ca92908_Out_2_Float, _Multiply_09e51444a0b1e882aea42e6ef85919fb_Out_2_Float, _Multiply_3649a34f052f1d89a3e555f2fd7a2622_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_1c1357d48e493e8089f5da7fa0727392_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverMaskMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e;
            _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_XYZ_1_Vector4;
            float4 _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_XZ_2_Vector4;
            float4 _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_YZ_3_Vector4;
            float4 _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_1c1357d48e493e8089f5da7fa0727392_Out_0_Texture2D, (_Divide_417e4c87f5de7b8abda7c05a2ef88056_Out_2_Vector4).x, _Property_d62f7360b612d9809c3e73ad07243f08_Out_0_Float, _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e, _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_XYZ_1_Vector4, _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_XZ_2_Vector4, _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_YZ_3_Vector4, _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_c4201edf3801a487849415809068865b_R_1_Float = _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_XYZ_1_Vector4[0];
            float _Split_c4201edf3801a487849415809068865b_G_2_Float = _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_XYZ_1_Vector4[1];
            float _Split_c4201edf3801a487849415809068865b_B_3_Float = _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_XYZ_1_Vector4[2];
            float _Split_c4201edf3801a487849415809068865b_A_4_Float = _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_XYZ_1_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_7d292a2f5737ad89aa4116a32a770401_Out_0_Float = _CoverHeightMapMin;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_b9485b720982198888701b70c808a574_Out_0_Float = _CoverHeightMapMax;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_be52d4e98cb63c8e899d455afac49761_Out_0_Vector2 = float2(_Property_7d292a2f5737ad89aa4116a32a770401_Out_0_Float, _Property_b9485b720982198888701b70c808a574_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_a028eb148d51f986846eb00dba5b8c21_Out_0_Float = _CoverHeightMapOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Add_36a89f63a185118a88e38098f08f30e7_Out_2_Vector2;
            Unity_Add_float2(_Vector2_be52d4e98cb63c8e899d455afac49761_Out_0_Vector2, (_Property_a028eb148d51f986846eb00dba5b8c21_Out_0_Float.xx), _Add_36a89f63a185118a88e38098f08f30e7_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_89daf117afa72e87b0e7a6b7b973a4b6_Out_3_Float;
            Unity_Remap_float(_Split_c4201edf3801a487849415809068865b_B_3_Float, float2 (0, 1), _Add_36a89f63a185118a88e38098f08f30e7_Out_2_Vector2, _Remap_89daf117afa72e87b0e7a6b7b973a4b6_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_91860731e65c2c878b131ffd43bf54a5_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_3649a34f052f1d89a3e555f2fd7a2622_Out_2_Float, _Remap_89daf117afa72e87b0e7a6b7b973a4b6_Out_3_Float, _Multiply_91860731e65c2c878b131ffd43bf54a5_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_a1e9d262d487f98ab3a94dd6fef22908_Out_2_Float;
            Unity_Multiply_float_float(_Split_bc8eb833b059c2879abda47a13239f66_G_2_Float, _Multiply_91860731e65c2c878b131ffd43bf54a5_Out_2_Float, _Multiply_a1e9d262d487f98ab3a94dd6fef22908_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Saturate_a73982c803e41e80bb2d82e77e4921db_Out_1_Float;
            Unity_Saturate_float(_Multiply_a1e9d262d487f98ab3a94dd6fef22908_Out_2_Float, _Saturate_a73982c803e41e80bb2d82e77e4921db_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_3b6375a3a8f3398eb5630bb0cc4abea6_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_237fdddd221902858486e07d232e016c_Out_3_Float, _Saturate_a73982c803e41e80bb2d82e77e4921db_Out_1_Float, _Multiply_3b6375a3a8f3398eb5630bb0cc4abea6_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            #if defined(_USEDYNAMICCOVERTSTATICMASKF_ON)
            float _UseDynamicCoverTStaticMaskF_8587b1680d796886bd267db30b112d6f_Out_0_Float = _Multiply_3b6375a3a8f3398eb5630bb0cc4abea6_Out_2_Float;
            #else
            float _UseDynamicCoverTStaticMaskF_8587b1680d796886bd267db30b112d6f_Out_0_Float = _Clamp_237fdddd221902858486e07d232e016c_Out_3_Float;
            #endif
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Lerp_4fca1aa155472b85bd876a8324386f37_Out_3_Vector3;
            Unity_Lerp_float3(_HeightBlend_00a99a7141c28f80a07c77242fa96942_OutVector4_1_Vector3, (_Multiply_14ce5f06524122898b5641da23fb0105_Out_2_Vector4.xyz), (_UseDynamicCoverTStaticMaskF_8587b1680d796886bd267db30b112d6f_Out_0_Float.xxx), _Lerp_4fca1aa155472b85bd876a8324386f37_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_31a17346fd9f4c848d23d733884e0a21_Out_0_Vector4 = _WetColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Multiply_cebc9c67173afa86af7299b1b4fddee1_Out_2_Vector3;
            Unity_Multiply_float3_float3((_Property_31a17346fd9f4c848d23d733884e0a21_Out_0_Vector4.xyz), _Lerp_4fca1aa155472b85bd876a8324386f37_Out_3_Vector3, _Multiply_cebc9c67173afa86af7299b1b4fddee1_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_98f57a743ea0c9899240fca6b106aaec_Out_1_Float;
            Unity_OneMinus_float(_Split_bc8eb833b059c2879abda47a13239f66_R_1_Float, _OneMinus_98f57a743ea0c9899240fca6b106aaec_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Lerp_c7df5e0362cf3b82b5fc62aee758f480_Out_3_Vector3;
            Unity_Lerp_float3(_Lerp_4fca1aa155472b85bd876a8324386f37_Out_3_Vector3, _Multiply_cebc9c67173afa86af7299b1b4fddee1_Out_2_Vector3, (_OneMinus_98f57a743ea0c9899240fca6b106aaec_Out_1_Float.xxx), _Lerp_c7df5e0362cf3b82b5fc62aee758f480_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_208942f638bd09818be8a2afbf76c6e7_R_1_Float = _PlanarNM_939c16e3e51f06888092ac69b8f75998_XZ_2_Vector4[0];
            float _Split_208942f638bd09818be8a2afbf76c6e7_G_2_Float = _PlanarNM_939c16e3e51f06888092ac69b8f75998_XZ_2_Vector4[1];
            float _Split_208942f638bd09818be8a2afbf76c6e7_B_3_Float = _PlanarNM_939c16e3e51f06888092ac69b8f75998_XZ_2_Vector4[2];
            float _Split_208942f638bd09818be8a2afbf76c6e7_A_4_Float = _PlanarNM_939c16e3e51f06888092ac69b8f75998_XZ_2_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_fb2f800e35d50e84bc11a285a594a4cf_Out_0_Float = _AlphaCutoff;
            #endif
            surface.BaseColor = _Lerp_c7df5e0362cf3b82b5fc62aee758f480_Out_3_Vector3;
            surface.Emission = float3(0, 0, 0);
            surface.Alpha = _Split_208942f638bd09818be8a2afbf76c6e7_A_4_Float;
            surface.AlphaClipThreshold = _Property_fb2f800e35d50e84bc11a285a594a4cf_Out_0_Float;
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
        float4 _Base2NormalMap_TexelSize;
        float _Base2NormalScale;
        float _Base2UsePlanarUV;
        float4 _Base2MaskMap_TexelSize;
        float Vector1_D38A0468;
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
            UnityTexture2D _Property_9877f7d14ab03a82ac49746caa97aeb7_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseColorMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_cdba86d1e85a37858062d83b2fa6392d_Out_0_Vector4 = _BaseTilingOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_c4d58d2885325e85994407e8fe45e088_Out_0_Boolean = _BaseUsePlanarUV;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_939c16e3e51f06888092ac69b8f75998;
            _PlanarNM_939c16e3e51f06888092ac69b8f75998.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_939c16e3e51f06888092ac69b8f75998.uv0 = IN.uv0;
            _PlanarNM_939c16e3e51f06888092ac69b8f75998.uv2 = IN.uv2;
            float4 _PlanarNM_939c16e3e51f06888092ac69b8f75998_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_9877f7d14ab03a82ac49746caa97aeb7_Out_0_Texture2D, _Property_cdba86d1e85a37858062d83b2fa6392d_Out_0_Vector4, _Property_c4d58d2885325e85994407e8fe45e088_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), 1, _PlanarNM_939c16e3e51f06888092ac69b8f75998, _PlanarNM_939c16e3e51f06888092ac69b8f75998_XZ_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_208942f638bd09818be8a2afbf76c6e7_R_1_Float = _PlanarNM_939c16e3e51f06888092ac69b8f75998_XZ_2_Vector4[0];
            float _Split_208942f638bd09818be8a2afbf76c6e7_G_2_Float = _PlanarNM_939c16e3e51f06888092ac69b8f75998_XZ_2_Vector4[1];
            float _Split_208942f638bd09818be8a2afbf76c6e7_B_3_Float = _PlanarNM_939c16e3e51f06888092ac69b8f75998_XZ_2_Vector4[2];
            float _Split_208942f638bd09818be8a2afbf76c6e7_A_4_Float = _PlanarNM_939c16e3e51f06888092ac69b8f75998_XZ_2_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_fb2f800e35d50e84bc11a285a594a4cf_Out_0_Float = _AlphaCutoff;
            #endif
            surface.Alpha = _Split_208942f638bd09818be8a2afbf76c6e7_A_4_Float;
            surface.AlphaClipThreshold = _Property_fb2f800e35d50e84bc11a285a594a4cf_Out_0_Float;
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
        float4 _Base2NormalMap_TexelSize;
        float _Base2NormalScale;
        float _Base2UsePlanarUV;
        float4 _Base2MaskMap_TexelSize;
        float Vector1_D38A0468;
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
        
        void Unity_Multiply_float_float(float A, float B, out float Out)
        {
            Out = A * B;
        }
        
        void Unity_Maximum_float(float A, float B, out float Out)
        {
            Out = max(A, B);
        }
        
        void Unity_Subtract_float(float A, float B, out float Out)
        {
            Out = A - B;
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
            UnityTexture2D _Property_9877f7d14ab03a82ac49746caa97aeb7_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseColorMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_cdba86d1e85a37858062d83b2fa6392d_Out_0_Vector4 = _BaseTilingOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_c4d58d2885325e85994407e8fe45e088_Out_0_Boolean = _BaseUsePlanarUV;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_939c16e3e51f06888092ac69b8f75998;
            _PlanarNM_939c16e3e51f06888092ac69b8f75998.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_939c16e3e51f06888092ac69b8f75998.uv0 = IN.uv0;
            _PlanarNM_939c16e3e51f06888092ac69b8f75998.uv2 = IN.uv2;
            float4 _PlanarNM_939c16e3e51f06888092ac69b8f75998_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_9877f7d14ab03a82ac49746caa97aeb7_Out_0_Texture2D, _Property_cdba86d1e85a37858062d83b2fa6392d_Out_0_Vector4, _Property_c4d58d2885325e85994407e8fe45e088_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), 1, _PlanarNM_939c16e3e51f06888092ac69b8f75998, _PlanarNM_939c16e3e51f06888092ac69b8f75998_XZ_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_2c84a3da85882688884fbe610ed37b04_Out_0_Vector4 = _BaseColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Multiply_4dd3ecf3f3b38786bdcf91b238ffdbb2_Out_2_Vector4;
            Unity_Multiply_float4_float4(_PlanarNM_939c16e3e51f06888092ac69b8f75998_XZ_2_Vector4, _Property_2c84a3da85882688884fbe610ed37b04_Out_0_Vector4, _Multiply_4dd3ecf3f3b38786bdcf91b238ffdbb2_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_75d5c7e24ff6e88ab1561e2a54e6463d_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseMaskMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_f82d57d4f65ad48d9435f5e38fd6ce0c;
            _PlanarNM_f82d57d4f65ad48d9435f5e38fd6ce0c.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_f82d57d4f65ad48d9435f5e38fd6ce0c.uv0 = IN.uv0;
            _PlanarNM_f82d57d4f65ad48d9435f5e38fd6ce0c.uv2 = IN.uv2;
            float4 _PlanarNM_f82d57d4f65ad48d9435f5e38fd6ce0c_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_75d5c7e24ff6e88ab1561e2a54e6463d_Out_0_Texture2D, _Property_cdba86d1e85a37858062d83b2fa6392d_Out_0_Vector4, _Property_c4d58d2885325e85994407e8fe45e088_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), 1, _PlanarNM_f82d57d4f65ad48d9435f5e38fd6ce0c, _PlanarNM_f82d57d4f65ad48d9435f5e38fd6ce0c_XZ_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_2873060f5cfdf687b30bd679f8a5291e_R_1_Float = _PlanarNM_f82d57d4f65ad48d9435f5e38fd6ce0c_XZ_2_Vector4[0];
            float _Split_2873060f5cfdf687b30bd679f8a5291e_G_2_Float = _PlanarNM_f82d57d4f65ad48d9435f5e38fd6ce0c_XZ_2_Vector4[1];
            float _Split_2873060f5cfdf687b30bd679f8a5291e_B_3_Float = _PlanarNM_f82d57d4f65ad48d9435f5e38fd6ce0c_XZ_2_Vector4[2];
            float _Split_2873060f5cfdf687b30bd679f8a5291e_A_4_Float = _PlanarNM_f82d57d4f65ad48d9435f5e38fd6ce0c_XZ_2_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_57489d8e60c5e48ebbd4e6f83cd04306_Out_0_Float = _HeightMin;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_b3c11986fefcb082abf933a1c5505d71_Out_0_Float = _HeightMax;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_bf00af3771fe7882a94dd98123dc06eb_Out_0_Vector2 = float2(_Property_57489d8e60c5e48ebbd4e6f83cd04306_Out_0_Float, _Property_b3c11986fefcb082abf933a1c5505d71_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_d430dab1be180289a026a73080dc2a0d_Out_0_Float = _HeightOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Add_30485ad75da6dd8e9e1036d4537f114c_Out_2_Vector2;
            Unity_Add_float2(_Vector2_bf00af3771fe7882a94dd98123dc06eb_Out_0_Vector2, (_Property_d430dab1be180289a026a73080dc2a0d_Out_0_Float.xx), _Add_30485ad75da6dd8e9e1036d4537f114c_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_347bc01c0ddf72878c4eb9274baae4ff_Out_3_Float;
            Unity_Remap_float(_Split_2873060f5cfdf687b30bd679f8a5291e_B_3_Float, float2 (0, 1), _Add_30485ad75da6dd8e9e1036d4537f114c_Out_2_Vector2, _Remap_347bc01c0ddf72878c4eb9274baae4ff_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_99f7c3ef40e2a280b853a4806f4377cc_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_Base2ColorMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_391bce0a1bc4ae8a8574996dcfefab13_Out_0_Vector4 = _Base2TilingOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_b9b9b4cee220da8892912acbd91575dd_Out_0_Boolean = _Base2UsePlanarUV;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_8125b53543ccd48bb9175630cf7bbc44;
            _PlanarNM_8125b53543ccd48bb9175630cf7bbc44.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_8125b53543ccd48bb9175630cf7bbc44.uv0 = IN.uv0;
            _PlanarNM_8125b53543ccd48bb9175630cf7bbc44.uv2 = IN.uv2;
            float4 _PlanarNM_8125b53543ccd48bb9175630cf7bbc44_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_99f7c3ef40e2a280b853a4806f4377cc_Out_0_Texture2D, _Property_391bce0a1bc4ae8a8574996dcfefab13_Out_0_Vector4, _Property_b9b9b4cee220da8892912acbd91575dd_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), 1, _PlanarNM_8125b53543ccd48bb9175630cf7bbc44, _PlanarNM_8125b53543ccd48bb9175630cf7bbc44_XZ_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_a87fae0c6b1a0984b9ef7861ccc92da9_Out_0_Vector4 = _Base2Color;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Multiply_934c5505e5759286921bda248879c83f_Out_2_Vector4;
            Unity_Multiply_float4_float4(_PlanarNM_8125b53543ccd48bb9175630cf7bbc44_XZ_2_Vector4, _Property_a87fae0c6b1a0984b9ef7861ccc92da9_Out_0_Vector4, _Multiply_934c5505e5759286921bda248879c83f_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_bc8eb833b059c2879abda47a13239f66_R_1_Float = IN.VertexColor[0];
            float _Split_bc8eb833b059c2879abda47a13239f66_G_2_Float = IN.VertexColor[1];
            float _Split_bc8eb833b059c2879abda47a13239f66_B_3_Float = IN.VertexColor[2];
            float _Split_bc8eb833b059c2879abda47a13239f66_A_4_Float = IN.VertexColor[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_67acbc8108127387b3521a5887c8fd65_Out_0_Boolean = _Invert_Layer_Mask;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_ec66fdea21d60b889b53e96094a2bb5f_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_LayerMask);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _SampleTexture2D_1e04ec71d2a6c38aaa9df937b66dc947_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_ec66fdea21d60b889b53e96094a2bb5f_Out_0_Texture2D.tex, _Property_ec66fdea21d60b889b53e96094a2bb5f_Out_0_Texture2D.samplerstate, _Property_ec66fdea21d60b889b53e96094a2bb5f_Out_0_Texture2D.GetTransformedUV(IN.uv0.xy) );
            float _SampleTexture2D_1e04ec71d2a6c38aaa9df937b66dc947_R_4_Float = _SampleTexture2D_1e04ec71d2a6c38aaa9df937b66dc947_RGBA_0_Vector4.r;
            float _SampleTexture2D_1e04ec71d2a6c38aaa9df937b66dc947_G_5_Float = _SampleTexture2D_1e04ec71d2a6c38aaa9df937b66dc947_RGBA_0_Vector4.g;
            float _SampleTexture2D_1e04ec71d2a6c38aaa9df937b66dc947_B_6_Float = _SampleTexture2D_1e04ec71d2a6c38aaa9df937b66dc947_RGBA_0_Vector4.b;
            float _SampleTexture2D_1e04ec71d2a6c38aaa9df937b66dc947_A_7_Float = _SampleTexture2D_1e04ec71d2a6c38aaa9df937b66dc947_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_2ab824386c8b5f86a4f1baf709dea28e_Out_1_Float;
            Unity_OneMinus_float(_SampleTexture2D_1e04ec71d2a6c38aaa9df937b66dc947_R_4_Float, _OneMinus_2ab824386c8b5f86a4f1baf709dea28e_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Branch_6f5d54f970d03d8b8bfbf860a10aa6dc_Out_3_Float;
            Unity_Branch_float(_Property_67acbc8108127387b3521a5887c8fd65_Out_0_Boolean, _OneMinus_2ab824386c8b5f86a4f1baf709dea28e_Out_1_Float, _SampleTexture2D_1e04ec71d2a6c38aaa9df937b66dc947_R_4_Float, _Branch_6f5d54f970d03d8b8bfbf860a10aa6dc_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_312b7343c77e2a8eb60f73d6993817b8_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_Base2MaskMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_b5a5b9c7b16e58839fd9378c90580282;
            _PlanarNM_b5a5b9c7b16e58839fd9378c90580282.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_b5a5b9c7b16e58839fd9378c90580282.uv0 = IN.uv0;
            _PlanarNM_b5a5b9c7b16e58839fd9378c90580282.uv2 = IN.uv2;
            float4 _PlanarNM_b5a5b9c7b16e58839fd9378c90580282_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_312b7343c77e2a8eb60f73d6993817b8_Out_0_Texture2D, _Property_391bce0a1bc4ae8a8574996dcfefab13_Out_0_Vector4, _Property_b9b9b4cee220da8892912acbd91575dd_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), 1, _PlanarNM_b5a5b9c7b16e58839fd9378c90580282, _PlanarNM_b5a5b9c7b16e58839fd9378c90580282_XZ_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_b4d828c4dcef5489b007ef9d639c65c7_R_1_Float = _PlanarNM_b5a5b9c7b16e58839fd9378c90580282_XZ_2_Vector4[0];
            float _Split_b4d828c4dcef5489b007ef9d639c65c7_G_2_Float = _PlanarNM_b5a5b9c7b16e58839fd9378c90580282_XZ_2_Vector4[1];
            float _Split_b4d828c4dcef5489b007ef9d639c65c7_B_3_Float = _PlanarNM_b5a5b9c7b16e58839fd9378c90580282_XZ_2_Vector4[2];
            float _Split_b4d828c4dcef5489b007ef9d639c65c7_A_4_Float = _PlanarNM_b5a5b9c7b16e58839fd9378c90580282_XZ_2_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_6f4f0f0f513da587b5c0331584e50187_Out_0_Float = _HeightMin2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_a348a4abb5736887afa1734255606c10_Out_0_Float = _HeightMax2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_942eb4b05e4bd5808636661f3c5d2a5c_Out_0_Vector2 = float2(_Property_6f4f0f0f513da587b5c0331584e50187_Out_0_Float, _Property_a348a4abb5736887afa1734255606c10_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_5c92bca7a057e082a9ad31b6c041afbf_Out_0_Float = _HeightOffset2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Add_d827365fdb96108d96671f09a466ed5b_Out_2_Vector2;
            Unity_Add_float2(_Vector2_942eb4b05e4bd5808636661f3c5d2a5c_Out_0_Vector2, (_Property_5c92bca7a057e082a9ad31b6c041afbf_Out_0_Float.xx), _Add_d827365fdb96108d96671f09a466ed5b_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_76e4189c648f8389be05c05c248baa84_Out_3_Float;
            Unity_Remap_float(_Split_b4d828c4dcef5489b007ef9d639c65c7_B_3_Float, float2 (0, 1), _Add_d827365fdb96108d96671f09a466ed5b_Out_2_Vector2, _Remap_76e4189c648f8389be05c05c248baa84_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_b11faa069f3e798ab16c6246251d3f13_Out_2_Float;
            Unity_Multiply_float_float(_Branch_6f5d54f970d03d8b8bfbf860a10aa6dc_Out_3_Float, _Remap_76e4189c648f8389be05c05c248baa84_Out_3_Float, _Multiply_b11faa069f3e798ab16c6246251d3f13_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_1653ac275d976082acb8cc3cb2c7e0a9_Out_2_Float;
            Unity_Multiply_float_float(_Split_bc8eb833b059c2879abda47a13239f66_B_3_Float, _Multiply_b11faa069f3e798ab16c6246251d3f13_Out_2_Float, _Multiply_1653ac275d976082acb8cc3cb2c7e0a9_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_3fbe3f08ee2f5f8cb4e5ea37c77f429b_Out_0_Float = _Height_Transition;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float _HeightBlend_00a99a7141c28f80a07c77242fa96942;
            float3 _HeightBlend_00a99a7141c28f80a07c77242fa96942_OutVector4_1_Vector3;
            SG_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float((_Multiply_4dd3ecf3f3b38786bdcf91b238ffdbb2_Out_2_Vector4.xyz), _Remap_347bc01c0ddf72878c4eb9274baae4ff_Out_3_Float, (_Multiply_934c5505e5759286921bda248879c83f_Out_2_Vector4.xyz), _Multiply_1653ac275d976082acb8cc3cb2c7e0a9_Out_2_Float, _Property_3fbe3f08ee2f5f8cb4e5ea37c77f429b_Out_0_Float, _HeightBlend_00a99a7141c28f80a07c77242fa96942, _HeightBlend_00a99a7141c28f80a07c77242fa96942_OutVector4_1_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_11ef2dfbd610ec809f27f54da5f6d8eb_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverBaseColorMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_8229e2bff7eeb784bda5cb1a71007335_Out_0_Vector4 = _CoverTilingOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Divide_417e4c87f5de7b8abda7c05a2ef88056_Out_2_Vector4;
            Unity_Divide_float4(float4(1, 1, 0, 0), _Property_8229e2bff7eeb784bda5cb1a71007335_Out_0_Vector4, _Divide_417e4c87f5de7b8abda7c05a2ef88056_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_d62f7360b612d9809c3e73ad07243f08_Out_0_Float = _CoverTriplanarThreshold;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_7aa1ee497ef585889e9e6889c832028b;
            _TriplanarNM_7aa1ee497ef585889e9e6889c832028b.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_7aa1ee497ef585889e9e6889c832028b.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_7aa1ee497ef585889e9e6889c832028b_XYZ_1_Vector4;
            float4 _TriplanarNM_7aa1ee497ef585889e9e6889c832028b_XZ_2_Vector4;
            float4 _TriplanarNM_7aa1ee497ef585889e9e6889c832028b_YZ_3_Vector4;
            float4 _TriplanarNM_7aa1ee497ef585889e9e6889c832028b_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_11ef2dfbd610ec809f27f54da5f6d8eb_Out_0_Texture2D, (_Divide_417e4c87f5de7b8abda7c05a2ef88056_Out_2_Vector4).x, _Property_d62f7360b612d9809c3e73ad07243f08_Out_0_Float, _TriplanarNM_7aa1ee497ef585889e9e6889c832028b, _TriplanarNM_7aa1ee497ef585889e9e6889c832028b_XYZ_1_Vector4, _TriplanarNM_7aa1ee497ef585889e9e6889c832028b_XZ_2_Vector4, _TriplanarNM_7aa1ee497ef585889e9e6889c832028b_YZ_3_Vector4, _TriplanarNM_7aa1ee497ef585889e9e6889c832028b_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_6f1e31130250ca80aae786393f8e97e4_Out_0_Vector4 = _CoverBaseColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Multiply_14ce5f06524122898b5641da23fb0105_Out_2_Vector4;
            Unity_Multiply_float4_float4(_TriplanarNM_7aa1ee497ef585889e9e6889c832028b_XYZ_1_Vector4, _Property_6f1e31130250ca80aae786393f8e97e4_Out_0_Vector4, _Multiply_14ce5f06524122898b5641da23fb0105_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_9ff2eaae0dc74d9c9745b3fd09addcc9_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverBaseColorMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _UV_95a3b3f395e44d84a287ca09a90c4b36_Out_0_Vector4 = IN.uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _SampleTexture2D_1208d4f2cad47a8aa3dd7db5bdac6dbf_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_9ff2eaae0dc74d9c9745b3fd09addcc9_Out_0_Texture2D.tex, _Property_9ff2eaae0dc74d9c9745b3fd09addcc9_Out_0_Texture2D.samplerstate, _Property_9ff2eaae0dc74d9c9745b3fd09addcc9_Out_0_Texture2D.GetTransformedUV((_UV_95a3b3f395e44d84a287ca09a90c4b36_Out_0_Vector4.xy)) );
            float _SampleTexture2D_1208d4f2cad47a8aa3dd7db5bdac6dbf_R_4_Float = _SampleTexture2D_1208d4f2cad47a8aa3dd7db5bdac6dbf_RGBA_0_Vector4.r;
            float _SampleTexture2D_1208d4f2cad47a8aa3dd7db5bdac6dbf_G_5_Float = _SampleTexture2D_1208d4f2cad47a8aa3dd7db5bdac6dbf_RGBA_0_Vector4.g;
            float _SampleTexture2D_1208d4f2cad47a8aa3dd7db5bdac6dbf_B_6_Float = _SampleTexture2D_1208d4f2cad47a8aa3dd7db5bdac6dbf_RGBA_0_Vector4.b;
            float _SampleTexture2D_1208d4f2cad47a8aa3dd7db5bdac6dbf_A_7_Float = _SampleTexture2D_1208d4f2cad47a8aa3dd7db5bdac6dbf_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_39083fd581a9858f8617da21e8049448_Out_0_Float = _CoverMaskPower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_d719ca05fe62698aa94e1a1a45abb189_Out_2_Float;
            Unity_Multiply_float_float(_SampleTexture2D_1208d4f2cad47a8aa3dd7db5bdac6dbf_A_7_Float, _Property_39083fd581a9858f8617da21e8049448_Out_0_Float, _Multiply_d719ca05fe62698aa94e1a1a45abb189_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_237fdddd221902858486e07d232e016c_Out_3_Float;
            Unity_Clamp_float(_Multiply_d719ca05fe62698aa94e1a1a45abb189_Out_2_Float, float(0), float(1), _Clamp_237fdddd221902858486e07d232e016c_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Property_577e31e406d3dd8fb1a321606123ec09_Out_0_Vector3 = _CoverDirection;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_1d71aa77d4c8d8848d8a70a7494d504c_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseNormalMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float _PlanarNMn_7b0c7a6d68832f8499160064dd98697c;
            _PlanarNMn_7b0c7a6d68832f8499160064dd98697c.WorldSpaceNormal = IN.WorldSpaceNormal;
            _PlanarNMn_7b0c7a6d68832f8499160064dd98697c.WorldSpaceTangent = IN.WorldSpaceTangent;
            _PlanarNMn_7b0c7a6d68832f8499160064dd98697c.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _PlanarNMn_7b0c7a6d68832f8499160064dd98697c.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNMn_7b0c7a6d68832f8499160064dd98697c.uv0 = IN.uv0;
            _PlanarNMn_7b0c7a6d68832f8499160064dd98697c.uv2 = IN.uv2;
            float4 _PlanarNMn_7b0c7a6d68832f8499160064dd98697c_XZ_2_Vector4;
            SG_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float(_Property_1d71aa77d4c8d8848d8a70a7494d504c_Out_0_Texture2D, _Property_cdba86d1e85a37858062d83b2fa6392d_Out_0_Vector4, _Property_c4d58d2885325e85994407e8fe45e088_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), 1, _PlanarNMn_7b0c7a6d68832f8499160064dd98697c, _PlanarNMn_7b0c7a6d68832f8499160064dd98697c_XZ_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_087816ca8e015a8a9fb223d9087b4182_Out_0_Float = _BaseNormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _NormalStrength_37595aefbf2c5782a9e1ac3bf5c68089_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_7b0c7a6d68832f8499160064dd98697c_XZ_2_Vector4.xyz), _Property_087816ca8e015a8a9fb223d9087b4182_Out_0_Float, _NormalStrength_37595aefbf2c5782a9e1ac3bf5c68089_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_e5d4c2313e3f328eb3d72ab688d42df9_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_Base2NormalMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float _PlanarNMn_7c412fcb6bd3a782a5b9fa87a359b5e9;
            _PlanarNMn_7c412fcb6bd3a782a5b9fa87a359b5e9.WorldSpaceNormal = IN.WorldSpaceNormal;
            _PlanarNMn_7c412fcb6bd3a782a5b9fa87a359b5e9.WorldSpaceTangent = IN.WorldSpaceTangent;
            _PlanarNMn_7c412fcb6bd3a782a5b9fa87a359b5e9.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _PlanarNMn_7c412fcb6bd3a782a5b9fa87a359b5e9.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNMn_7c412fcb6bd3a782a5b9fa87a359b5e9.uv0 = IN.uv0;
            _PlanarNMn_7c412fcb6bd3a782a5b9fa87a359b5e9.uv2 = IN.uv2;
            float4 _PlanarNMn_7c412fcb6bd3a782a5b9fa87a359b5e9_XZ_2_Vector4;
            SG_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float(_Property_e5d4c2313e3f328eb3d72ab688d42df9_Out_0_Texture2D, _Property_391bce0a1bc4ae8a8574996dcfefab13_Out_0_Vector4, _Property_b9b9b4cee220da8892912acbd91575dd_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), 1, _PlanarNMn_7c412fcb6bd3a782a5b9fa87a359b5e9, _PlanarNMn_7c412fcb6bd3a782a5b9fa87a359b5e9_XZ_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_65daec252a065086889328ae1155bba3_Out_0_Float = _Base2NormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _NormalStrength_0db20ce64d0949819e7c8a183ae1ea63_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_7c412fcb6bd3a782a5b9fa87a359b5e9_XZ_2_Vector4.xyz), _Property_65daec252a065086889328ae1155bba3_Out_0_Float, _NormalStrength_0db20ce64d0949819e7c8a183ae1ea63_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float _HeightBlend_2aea92908228ec8dbdea2d76ee4c8bd4;
            float3 _HeightBlend_2aea92908228ec8dbdea2d76ee4c8bd4_OutVector4_1_Vector3;
            SG_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float(_NormalStrength_37595aefbf2c5782a9e1ac3bf5c68089_Out_2_Vector3, _Remap_347bc01c0ddf72878c4eb9274baae4ff_Out_3_Float, _NormalStrength_0db20ce64d0949819e7c8a183ae1ea63_Out_2_Vector3, _Multiply_1653ac275d976082acb8cc3cb2c7e0a9_Out_2_Float, _Property_3fbe3f08ee2f5f8cb4e5ea37c77f429b_Out_0_Float, _HeightBlend_2aea92908228ec8dbdea2d76ee4c8bd4, _HeightBlend_2aea92908228ec8dbdea2d76ee4c8bd4_OutVector4_1_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_57136e4b37c63b88b0458bbd6cf2f9cc_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverNormalMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNMn_059da9746584140498cd018db3c76047_float _TriplanarNMn_6714bba323a48182841b11d72f43ee6c;
            _TriplanarNMn_6714bba323a48182841b11d72f43ee6c.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNMn_6714bba323a48182841b11d72f43ee6c.WorldSpaceTangent = IN.WorldSpaceTangent;
            _TriplanarNMn_6714bba323a48182841b11d72f43ee6c.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _TriplanarNMn_6714bba323a48182841b11d72f43ee6c.WorldSpacePosition = IN.WorldSpacePosition;
            float4 _TriplanarNMn_6714bba323a48182841b11d72f43ee6c_XYZ_1_Vector4;
            float4 _TriplanarNMn_6714bba323a48182841b11d72f43ee6c_XZ_2_Vector4;
            float4 _TriplanarNMn_6714bba323a48182841b11d72f43ee6c_YZ_3_Vector4;
            float4 _TriplanarNMn_6714bba323a48182841b11d72f43ee6c_XY_4_Vector4;
            SG_TriplanarNMn_059da9746584140498cd018db3c76047_float(_Property_57136e4b37c63b88b0458bbd6cf2f9cc_Out_0_Texture2D, (_Divide_417e4c87f5de7b8abda7c05a2ef88056_Out_2_Vector4).x, _Property_d62f7360b612d9809c3e73ad07243f08_Out_0_Float, _TriplanarNMn_6714bba323a48182841b11d72f43ee6c, _TriplanarNMn_6714bba323a48182841b11d72f43ee6c_XYZ_1_Vector4, _TriplanarNMn_6714bba323a48182841b11d72f43ee6c_XZ_2_Vector4, _TriplanarNMn_6714bba323a48182841b11d72f43ee6c_YZ_3_Vector4, _TriplanarNMn_6714bba323a48182841b11d72f43ee6c_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_81149b236e506f8697e192ede27f3971_Out_0_Float = _CoverNormalBlendHardness;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _NormalStrength_b81b0d8a1b4c8d89ac37806f8964f442_Out_2_Vector3;
            Unity_NormalStrength_float((_TriplanarNMn_6714bba323a48182841b11d72f43ee6c_XYZ_1_Vector4.xyz), _Property_81149b236e506f8697e192ede27f3971_Out_0_Float, _NormalStrength_b81b0d8a1b4c8d89ac37806f8964f442_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Multiply_c6669a1338d35b8f935151fcb153d31a_Out_2_Vector3;
            Unity_Multiply_float3_float3(_Property_577e31e406d3dd8fb1a321606123ec09_Out_0_Vector3, IN.WorldSpaceNormal, _Multiply_c6669a1338d35b8f935151fcb153d31a_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_bfe793e2ad24488ab75574988e5fd48c_R_1_Float = _Multiply_c6669a1338d35b8f935151fcb153d31a_Out_2_Vector3[0];
            float _Split_bfe793e2ad24488ab75574988e5fd48c_G_2_Float = _Multiply_c6669a1338d35b8f935151fcb153d31a_Out_2_Vector3[1];
            float _Split_bfe793e2ad24488ab75574988e5fd48c_B_3_Float = _Multiply_c6669a1338d35b8f935151fcb153d31a_Out_2_Vector3[2];
            float _Split_bfe793e2ad24488ab75574988e5fd48c_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_ec8faba2956f458394b586f041c36885_Out_2_Float;
            Unity_Add_float(_Split_bfe793e2ad24488ab75574988e5fd48c_R_1_Float, _Split_bfe793e2ad24488ab75574988e5fd48c_G_2_Float, _Add_ec8faba2956f458394b586f041c36885_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_314959d6b3555188936bb9790f9181c8_Out_2_Float;
            Unity_Add_float(_Add_ec8faba2956f458394b586f041c36885_Out_2_Float, _Split_bfe793e2ad24488ab75574988e5fd48c_B_3_Float, _Add_314959d6b3555188936bb9790f9181c8_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_41f9e80571036b84980ab755a1cd2b8a_Out_0_Float = _Cover_Amount;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_b15b5b7f74ac668fae6ac756ac65860d_Out_0_Float = _Cover_Amount_Grow_Speed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Subtract_f2404bbb61f6e9898d6a04e2423218b2_Out_2_Float;
            Unity_Subtract_float(float(4), _Property_b15b5b7f74ac668fae6ac756ac65860d_Out_0_Float, _Subtract_f2404bbb61f6e9898d6a04e2423218b2_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_75c861c3d8dd338e811f59b0e389e75b_Out_2_Float;
            Unity_Divide_float(_Property_41f9e80571036b84980ab755a1cd2b8a_Out_0_Float, _Subtract_f2404bbb61f6e9898d6a04e2423218b2_Out_2_Float, _Divide_75c861c3d8dd338e811f59b0e389e75b_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Absolute_a4c9f15f226ae4878cd93d6ebf12a62e_Out_1_Float;
            Unity_Absolute_float(_Divide_75c861c3d8dd338e811f59b0e389e75b_Out_2_Float, _Absolute_a4c9f15f226ae4878cd93d6ebf12a62e_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Power_30e184dd6ca0ef868b0bce3265609949_Out_2_Float;
            Unity_Power_float(_Absolute_a4c9f15f226ae4878cd93d6ebf12a62e_Out_1_Float, _Subtract_f2404bbb61f6e9898d6a04e2423218b2_Out_2_Float, _Power_30e184dd6ca0ef868b0bce3265609949_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_30f12b6e93f7e08cb5a962e6b9f27ff2_Out_3_Float;
            Unity_Clamp_float(_Power_30e184dd6ca0ef868b0bce3265609949_Out_2_Float, float(0), float(2), _Clamp_30f12b6e93f7e08cb5a962e6b9f27ff2_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_2e58826b071117889ca7fab41db4b5cb_Out_2_Float;
            Unity_Multiply_float_float(_Add_314959d6b3555188936bb9790f9181c8_Out_2_Float, _Clamp_30f12b6e93f7e08cb5a962e6b9f27ff2_Out_3_Float, _Multiply_2e58826b071117889ca7fab41db4b5cb_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Saturate_746c9a45346e4b8d871894da64501f4f_Out_1_Float;
            Unity_Saturate_float(_Multiply_2e58826b071117889ca7fab41db4b5cb_Out_2_Float, _Saturate_746c9a45346e4b8d871894da64501f4f_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_833503f9746faf8f85a13d818f245d98_Out_3_Float;
            Unity_Clamp_float(_Add_314959d6b3555188936bb9790f9181c8_Out_2_Float, float(0), float(0.9999), _Clamp_833503f9746faf8f85a13d818f245d98_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_e9dfafaa9b18ad85938c76c7194739a2_Out_0_Float = _Cover_Max_Angle;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_1d0a578b9126a084837bf496f4134806_Out_2_Float;
            Unity_Divide_float(_Property_e9dfafaa9b18ad85938c76c7194739a2_Out_0_Float, float(45), _Divide_1d0a578b9126a084837bf496f4134806_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_f1935851a5f58984af13653d306d6189_Out_1_Float;
            Unity_OneMinus_float(_Divide_1d0a578b9126a084837bf496f4134806_Out_2_Float, _OneMinus_f1935851a5f58984af13653d306d6189_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Subtract_1269997e8c2b0f83ac902b1b23348c03_Out_2_Float;
            Unity_Subtract_float(_Clamp_833503f9746faf8f85a13d818f245d98_Out_3_Float, _OneMinus_f1935851a5f58984af13653d306d6189_Out_1_Float, _Subtract_1269997e8c2b0f83ac902b1b23348c03_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_f2a5e28fa01e468cbcafbbb0a26fb215_Out_3_Float;
            Unity_Clamp_float(_Subtract_1269997e8c2b0f83ac902b1b23348c03_Out_2_Float, float(0), float(2), _Clamp_f2a5e28fa01e468cbcafbbb0a26fb215_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_d765d4d25642de87aad736264e311fe3_Out_2_Float;
            Unity_Divide_float(float(1), _Divide_1d0a578b9126a084837bf496f4134806_Out_2_Float, _Divide_d765d4d25642de87aad736264e311fe3_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_530d3c7a368c90858bf313378f2045d6_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_f2a5e28fa01e468cbcafbbb0a26fb215_Out_3_Float, _Divide_d765d4d25642de87aad736264e311fe3_Out_2_Float, _Multiply_530d3c7a368c90858bf313378f2045d6_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Absolute_68cdb5b5fd7bc48e8abb6670b34f797a_Out_1_Float;
            Unity_Absolute_float(_Multiply_530d3c7a368c90858bf313378f2045d6_Out_2_Float, _Absolute_68cdb5b5fd7bc48e8abb6670b34f797a_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_6bc8be76ebefd081b09d70c3aa8f7e9a_Out_0_Float = _CoverHardness;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Power_d1d84226b1add48a96efc66cd5251277_Out_2_Float;
            Unity_Power_float(_Absolute_68cdb5b5fd7bc48e8abb6670b34f797a_Out_1_Float, _Property_6bc8be76ebefd081b09d70c3aa8f7e9a_Out_0_Float, _Power_d1d84226b1add48a96efc66cd5251277_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_36ce546f2e8c1683870a69c4b80b0056_Out_0_Float = _Cover_Min_Height;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_1bbfeb5150a7258fbce4159ef98004fa_Out_1_Float;
            Unity_OneMinus_float(_Property_36ce546f2e8c1683870a69c4b80b0056_Out_0_Float, _OneMinus_1bbfeb5150a7258fbce4159ef98004fa_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_8275b8a1f9b13a8ba2aab1effe981e24_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
            float _Split_8275b8a1f9b13a8ba2aab1effe981e24_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
            float _Split_8275b8a1f9b13a8ba2aab1effe981e24_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
            float _Split_8275b8a1f9b13a8ba2aab1effe981e24_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_d60e277443199583bf879c33a84040aa_Out_2_Float;
            Unity_Add_float(_OneMinus_1bbfeb5150a7258fbce4159ef98004fa_Out_1_Float, _Split_8275b8a1f9b13a8ba2aab1effe981e24_G_2_Float, _Add_d60e277443199583bf879c33a84040aa_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_d22c42648995508796312c1309a3e675_Out_2_Float;
            Unity_Add_float(_Add_d60e277443199583bf879c33a84040aa_Out_2_Float, float(1), _Add_d22c42648995508796312c1309a3e675_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_a9fafcac1555c785b00d2066da56c188_Out_3_Float;
            Unity_Clamp_float(_Add_d22c42648995508796312c1309a3e675_Out_2_Float, float(0), float(1), _Clamp_a9fafcac1555c785b00d2066da56c188_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_5efe9e928026f188bd7f2227f8a81665_Out_0_Float = _Cover_Min_Height_Blending;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_c8fe7b6f1cf6b4818c460afd271bf24f_Out_2_Float;
            Unity_Add_float(_Add_d60e277443199583bf879c33a84040aa_Out_2_Float, _Property_5efe9e928026f188bd7f2227f8a81665_Out_0_Float, _Add_c8fe7b6f1cf6b4818c460afd271bf24f_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_9a88520d364f4d839eae92761e805274_Out_2_Float;
            Unity_Divide_float(_Add_c8fe7b6f1cf6b4818c460afd271bf24f_Out_2_Float, _Add_d60e277443199583bf879c33a84040aa_Out_2_Float, _Divide_9a88520d364f4d839eae92761e805274_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_3f76521a462f978eae3dc15480703bf4_Out_1_Float;
            Unity_OneMinus_float(_Divide_9a88520d364f4d839eae92761e805274_Out_2_Float, _OneMinus_3f76521a462f978eae3dc15480703bf4_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_99637080d5a5318ea8891ba128076958_Out_2_Float;
            Unity_Add_float(_OneMinus_3f76521a462f978eae3dc15480703bf4_Out_1_Float, float(-0.5), _Add_99637080d5a5318ea8891ba128076958_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_d7e00ff03b780e8785aa0ba35cd32193_Out_3_Float;
            Unity_Clamp_float(_Add_99637080d5a5318ea8891ba128076958_Out_2_Float, float(0), float(1), _Clamp_d7e00ff03b780e8785aa0ba35cd32193_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_ff67eea748c00386b91058b2876cee40_Out_2_Float;
            Unity_Add_float(_Clamp_a9fafcac1555c785b00d2066da56c188_Out_3_Float, _Clamp_d7e00ff03b780e8785aa0ba35cd32193_Out_3_Float, _Add_ff67eea748c00386b91058b2876cee40_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_697ecf534f2574889ebd8b15de892826_Out_3_Float;
            Unity_Clamp_float(_Add_ff67eea748c00386b91058b2876cee40_Out_2_Float, float(0), float(1), _Clamp_697ecf534f2574889ebd8b15de892826_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_de11d28b9823c388af9dd6a504362c51_Out_2_Float;
            Unity_Multiply_float_float(_Power_d1d84226b1add48a96efc66cd5251277_Out_2_Float, _Clamp_697ecf534f2574889ebd8b15de892826_Out_3_Float, _Multiply_de11d28b9823c388af9dd6a504362c51_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_2d43633f93e4ee84aba21650c4f73a01_Out_2_Float;
            Unity_Multiply_float_float(_Saturate_746c9a45346e4b8d871894da64501f4f_Out_1_Float, _Multiply_de11d28b9823c388af9dd6a504362c51_Out_2_Float, _Multiply_2d43633f93e4ee84aba21650c4f73a01_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Lerp_807d7c05dc7fed88aa1ae547effba70e_Out_3_Vector3;
            Unity_Lerp_float3(_HeightBlend_2aea92908228ec8dbdea2d76ee4c8bd4_OutVector4_1_Vector3, _NormalStrength_b81b0d8a1b4c8d89ac37806f8964f442_Out_2_Vector3, (_Multiply_2d43633f93e4ee84aba21650c4f73a01_Out_2_Float.xxx), _Lerp_807d7c05dc7fed88aa1ae547effba70e_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Transform_654244b6738ef485b35a6c1ee581f307_Out_1_Vector3;
            {
                float3x3 tangentTransform = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
                _Transform_654244b6738ef485b35a6c1ee581f307_Out_1_Vector3 = TransformTangentToWorldDir(_Lerp_807d7c05dc7fed88aa1ae547effba70e_Out_3_Vector3.xyz, tangentTransform, true).xyz;
            }
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Multiply_e52384b35afef9818b65d43f1474b495_Out_2_Vector3;
            Unity_Multiply_float3_float3(_Property_577e31e406d3dd8fb1a321606123ec09_Out_0_Vector3, _Transform_654244b6738ef485b35a6c1ee581f307_Out_1_Vector3, _Multiply_e52384b35afef9818b65d43f1474b495_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_9eab4717084c17859a8e63f351c1711d_R_1_Float = _Multiply_e52384b35afef9818b65d43f1474b495_Out_2_Vector3[0];
            float _Split_9eab4717084c17859a8e63f351c1711d_G_2_Float = _Multiply_e52384b35afef9818b65d43f1474b495_Out_2_Vector3[1];
            float _Split_9eab4717084c17859a8e63f351c1711d_B_3_Float = _Multiply_e52384b35afef9818b65d43f1474b495_Out_2_Vector3[2];
            float _Split_9eab4717084c17859a8e63f351c1711d_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_da2b031a4805ce839d2c63184da7401e_Out_2_Float;
            Unity_Add_float(_Split_9eab4717084c17859a8e63f351c1711d_R_1_Float, _Split_9eab4717084c17859a8e63f351c1711d_G_2_Float, _Add_da2b031a4805ce839d2c63184da7401e_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_2dc170e840729981a3725f6afdd8f992_Out_2_Float;
            Unity_Add_float(_Add_da2b031a4805ce839d2c63184da7401e_Out_2_Float, _Split_9eab4717084c17859a8e63f351c1711d_B_3_Float, _Add_2dc170e840729981a3725f6afdd8f992_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_e5832320c3941e8ea5e26a4d0ca92908_Out_2_Float;
            Unity_Multiply_float_float(_Add_2dc170e840729981a3725f6afdd8f992_Out_2_Float, _Clamp_30f12b6e93f7e08cb5a962e6b9f27ff2_Out_3_Float, _Multiply_e5832320c3941e8ea5e26a4d0ca92908_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_08afa1de8ac2f18f857bbc71c64e8ceb_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_30f12b6e93f7e08cb5a962e6b9f27ff2_Out_3_Float, _Property_6bc8be76ebefd081b09d70c3aa8f7e9a_Out_0_Float, _Multiply_08afa1de8ac2f18f857bbc71c64e8ceb_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_09e51444a0b1e882aea42e6ef85919fb_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_08afa1de8ac2f18f857bbc71c64e8ceb_Out_2_Float, _Multiply_de11d28b9823c388af9dd6a504362c51_Out_2_Float, _Multiply_09e51444a0b1e882aea42e6ef85919fb_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_3649a34f052f1d89a3e555f2fd7a2622_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_e5832320c3941e8ea5e26a4d0ca92908_Out_2_Float, _Multiply_09e51444a0b1e882aea42e6ef85919fb_Out_2_Float, _Multiply_3649a34f052f1d89a3e555f2fd7a2622_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_1c1357d48e493e8089f5da7fa0727392_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverMaskMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e;
            _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_XYZ_1_Vector4;
            float4 _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_XZ_2_Vector4;
            float4 _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_YZ_3_Vector4;
            float4 _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_1c1357d48e493e8089f5da7fa0727392_Out_0_Texture2D, (_Divide_417e4c87f5de7b8abda7c05a2ef88056_Out_2_Vector4).x, _Property_d62f7360b612d9809c3e73ad07243f08_Out_0_Float, _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e, _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_XYZ_1_Vector4, _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_XZ_2_Vector4, _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_YZ_3_Vector4, _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_c4201edf3801a487849415809068865b_R_1_Float = _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_XYZ_1_Vector4[0];
            float _Split_c4201edf3801a487849415809068865b_G_2_Float = _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_XYZ_1_Vector4[1];
            float _Split_c4201edf3801a487849415809068865b_B_3_Float = _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_XYZ_1_Vector4[2];
            float _Split_c4201edf3801a487849415809068865b_A_4_Float = _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_XYZ_1_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_7d292a2f5737ad89aa4116a32a770401_Out_0_Float = _CoverHeightMapMin;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_b9485b720982198888701b70c808a574_Out_0_Float = _CoverHeightMapMax;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_be52d4e98cb63c8e899d455afac49761_Out_0_Vector2 = float2(_Property_7d292a2f5737ad89aa4116a32a770401_Out_0_Float, _Property_b9485b720982198888701b70c808a574_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_a028eb148d51f986846eb00dba5b8c21_Out_0_Float = _CoverHeightMapOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Add_36a89f63a185118a88e38098f08f30e7_Out_2_Vector2;
            Unity_Add_float2(_Vector2_be52d4e98cb63c8e899d455afac49761_Out_0_Vector2, (_Property_a028eb148d51f986846eb00dba5b8c21_Out_0_Float.xx), _Add_36a89f63a185118a88e38098f08f30e7_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_89daf117afa72e87b0e7a6b7b973a4b6_Out_3_Float;
            Unity_Remap_float(_Split_c4201edf3801a487849415809068865b_B_3_Float, float2 (0, 1), _Add_36a89f63a185118a88e38098f08f30e7_Out_2_Vector2, _Remap_89daf117afa72e87b0e7a6b7b973a4b6_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_91860731e65c2c878b131ffd43bf54a5_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_3649a34f052f1d89a3e555f2fd7a2622_Out_2_Float, _Remap_89daf117afa72e87b0e7a6b7b973a4b6_Out_3_Float, _Multiply_91860731e65c2c878b131ffd43bf54a5_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_a1e9d262d487f98ab3a94dd6fef22908_Out_2_Float;
            Unity_Multiply_float_float(_Split_bc8eb833b059c2879abda47a13239f66_G_2_Float, _Multiply_91860731e65c2c878b131ffd43bf54a5_Out_2_Float, _Multiply_a1e9d262d487f98ab3a94dd6fef22908_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Saturate_a73982c803e41e80bb2d82e77e4921db_Out_1_Float;
            Unity_Saturate_float(_Multiply_a1e9d262d487f98ab3a94dd6fef22908_Out_2_Float, _Saturate_a73982c803e41e80bb2d82e77e4921db_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_3b6375a3a8f3398eb5630bb0cc4abea6_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_237fdddd221902858486e07d232e016c_Out_3_Float, _Saturate_a73982c803e41e80bb2d82e77e4921db_Out_1_Float, _Multiply_3b6375a3a8f3398eb5630bb0cc4abea6_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            #if defined(_USEDYNAMICCOVERTSTATICMASKF_ON)
            float _UseDynamicCoverTStaticMaskF_8587b1680d796886bd267db30b112d6f_Out_0_Float = _Multiply_3b6375a3a8f3398eb5630bb0cc4abea6_Out_2_Float;
            #else
            float _UseDynamicCoverTStaticMaskF_8587b1680d796886bd267db30b112d6f_Out_0_Float = _Clamp_237fdddd221902858486e07d232e016c_Out_3_Float;
            #endif
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Lerp_4fca1aa155472b85bd876a8324386f37_Out_3_Vector3;
            Unity_Lerp_float3(_HeightBlend_00a99a7141c28f80a07c77242fa96942_OutVector4_1_Vector3, (_Multiply_14ce5f06524122898b5641da23fb0105_Out_2_Vector4.xyz), (_UseDynamicCoverTStaticMaskF_8587b1680d796886bd267db30b112d6f_Out_0_Float.xxx), _Lerp_4fca1aa155472b85bd876a8324386f37_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_31a17346fd9f4c848d23d733884e0a21_Out_0_Vector4 = _WetColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Multiply_cebc9c67173afa86af7299b1b4fddee1_Out_2_Vector3;
            Unity_Multiply_float3_float3((_Property_31a17346fd9f4c848d23d733884e0a21_Out_0_Vector4.xyz), _Lerp_4fca1aa155472b85bd876a8324386f37_Out_3_Vector3, _Multiply_cebc9c67173afa86af7299b1b4fddee1_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_98f57a743ea0c9899240fca6b106aaec_Out_1_Float;
            Unity_OneMinus_float(_Split_bc8eb833b059c2879abda47a13239f66_R_1_Float, _OneMinus_98f57a743ea0c9899240fca6b106aaec_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Lerp_c7df5e0362cf3b82b5fc62aee758f480_Out_3_Vector3;
            Unity_Lerp_float3(_Lerp_4fca1aa155472b85bd876a8324386f37_Out_3_Vector3, _Multiply_cebc9c67173afa86af7299b1b4fddee1_Out_2_Vector3, (_OneMinus_98f57a743ea0c9899240fca6b106aaec_Out_1_Float.xxx), _Lerp_c7df5e0362cf3b82b5fc62aee758f480_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_208942f638bd09818be8a2afbf76c6e7_R_1_Float = _PlanarNM_939c16e3e51f06888092ac69b8f75998_XZ_2_Vector4[0];
            float _Split_208942f638bd09818be8a2afbf76c6e7_G_2_Float = _PlanarNM_939c16e3e51f06888092ac69b8f75998_XZ_2_Vector4[1];
            float _Split_208942f638bd09818be8a2afbf76c6e7_B_3_Float = _PlanarNM_939c16e3e51f06888092ac69b8f75998_XZ_2_Vector4[2];
            float _Split_208942f638bd09818be8a2afbf76c6e7_A_4_Float = _PlanarNM_939c16e3e51f06888092ac69b8f75998_XZ_2_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_fb2f800e35d50e84bc11a285a594a4cf_Out_0_Float = _AlphaCutoff;
            #endif
            surface.BaseColor = _Lerp_c7df5e0362cf3b82b5fc62aee758f480_Out_3_Vector3;
            surface.Alpha = _Split_208942f638bd09818be8a2afbf76c6e7_A_4_Float;
            surface.AlphaClipThreshold = _Property_fb2f800e35d50e84bc11a285a594a4cf_Out_0_Float;
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
        float4 _Base2NormalMap_TexelSize;
        float _Base2NormalScale;
        float _Base2UsePlanarUV;
        float4 _Base2MaskMap_TexelSize;
        float Vector1_D38A0468;
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
        
        void Unity_Multiply_float_float(float A, float B, out float Out)
        {
            Out = A * B;
        }
        
        void Unity_Maximum_float(float A, float B, out float Out)
        {
            Out = max(A, B);
        }
        
        void Unity_Subtract_float(float A, float B, out float Out)
        {
            Out = A - B;
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
            UnityTexture2D _Property_9877f7d14ab03a82ac49746caa97aeb7_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseColorMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_cdba86d1e85a37858062d83b2fa6392d_Out_0_Vector4 = _BaseTilingOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_c4d58d2885325e85994407e8fe45e088_Out_0_Boolean = _BaseUsePlanarUV;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_939c16e3e51f06888092ac69b8f75998;
            _PlanarNM_939c16e3e51f06888092ac69b8f75998.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_939c16e3e51f06888092ac69b8f75998.uv0 = IN.uv0;
            _PlanarNM_939c16e3e51f06888092ac69b8f75998.uv2 = IN.uv2;
            float4 _PlanarNM_939c16e3e51f06888092ac69b8f75998_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_9877f7d14ab03a82ac49746caa97aeb7_Out_0_Texture2D, _Property_cdba86d1e85a37858062d83b2fa6392d_Out_0_Vector4, _Property_c4d58d2885325e85994407e8fe45e088_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), 1, _PlanarNM_939c16e3e51f06888092ac69b8f75998, _PlanarNM_939c16e3e51f06888092ac69b8f75998_XZ_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_2c84a3da85882688884fbe610ed37b04_Out_0_Vector4 = _BaseColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Multiply_4dd3ecf3f3b38786bdcf91b238ffdbb2_Out_2_Vector4;
            Unity_Multiply_float4_float4(_PlanarNM_939c16e3e51f06888092ac69b8f75998_XZ_2_Vector4, _Property_2c84a3da85882688884fbe610ed37b04_Out_0_Vector4, _Multiply_4dd3ecf3f3b38786bdcf91b238ffdbb2_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_75d5c7e24ff6e88ab1561e2a54e6463d_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseMaskMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_f82d57d4f65ad48d9435f5e38fd6ce0c;
            _PlanarNM_f82d57d4f65ad48d9435f5e38fd6ce0c.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_f82d57d4f65ad48d9435f5e38fd6ce0c.uv0 = IN.uv0;
            _PlanarNM_f82d57d4f65ad48d9435f5e38fd6ce0c.uv2 = IN.uv2;
            float4 _PlanarNM_f82d57d4f65ad48d9435f5e38fd6ce0c_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_75d5c7e24ff6e88ab1561e2a54e6463d_Out_0_Texture2D, _Property_cdba86d1e85a37858062d83b2fa6392d_Out_0_Vector4, _Property_c4d58d2885325e85994407e8fe45e088_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), 1, _PlanarNM_f82d57d4f65ad48d9435f5e38fd6ce0c, _PlanarNM_f82d57d4f65ad48d9435f5e38fd6ce0c_XZ_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_2873060f5cfdf687b30bd679f8a5291e_R_1_Float = _PlanarNM_f82d57d4f65ad48d9435f5e38fd6ce0c_XZ_2_Vector4[0];
            float _Split_2873060f5cfdf687b30bd679f8a5291e_G_2_Float = _PlanarNM_f82d57d4f65ad48d9435f5e38fd6ce0c_XZ_2_Vector4[1];
            float _Split_2873060f5cfdf687b30bd679f8a5291e_B_3_Float = _PlanarNM_f82d57d4f65ad48d9435f5e38fd6ce0c_XZ_2_Vector4[2];
            float _Split_2873060f5cfdf687b30bd679f8a5291e_A_4_Float = _PlanarNM_f82d57d4f65ad48d9435f5e38fd6ce0c_XZ_2_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_57489d8e60c5e48ebbd4e6f83cd04306_Out_0_Float = _HeightMin;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_b3c11986fefcb082abf933a1c5505d71_Out_0_Float = _HeightMax;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_bf00af3771fe7882a94dd98123dc06eb_Out_0_Vector2 = float2(_Property_57489d8e60c5e48ebbd4e6f83cd04306_Out_0_Float, _Property_b3c11986fefcb082abf933a1c5505d71_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_d430dab1be180289a026a73080dc2a0d_Out_0_Float = _HeightOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Add_30485ad75da6dd8e9e1036d4537f114c_Out_2_Vector2;
            Unity_Add_float2(_Vector2_bf00af3771fe7882a94dd98123dc06eb_Out_0_Vector2, (_Property_d430dab1be180289a026a73080dc2a0d_Out_0_Float.xx), _Add_30485ad75da6dd8e9e1036d4537f114c_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_347bc01c0ddf72878c4eb9274baae4ff_Out_3_Float;
            Unity_Remap_float(_Split_2873060f5cfdf687b30bd679f8a5291e_B_3_Float, float2 (0, 1), _Add_30485ad75da6dd8e9e1036d4537f114c_Out_2_Vector2, _Remap_347bc01c0ddf72878c4eb9274baae4ff_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_99f7c3ef40e2a280b853a4806f4377cc_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_Base2ColorMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_391bce0a1bc4ae8a8574996dcfefab13_Out_0_Vector4 = _Base2TilingOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_b9b9b4cee220da8892912acbd91575dd_Out_0_Boolean = _Base2UsePlanarUV;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_8125b53543ccd48bb9175630cf7bbc44;
            _PlanarNM_8125b53543ccd48bb9175630cf7bbc44.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_8125b53543ccd48bb9175630cf7bbc44.uv0 = IN.uv0;
            _PlanarNM_8125b53543ccd48bb9175630cf7bbc44.uv2 = IN.uv2;
            float4 _PlanarNM_8125b53543ccd48bb9175630cf7bbc44_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_99f7c3ef40e2a280b853a4806f4377cc_Out_0_Texture2D, _Property_391bce0a1bc4ae8a8574996dcfefab13_Out_0_Vector4, _Property_b9b9b4cee220da8892912acbd91575dd_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), 1, _PlanarNM_8125b53543ccd48bb9175630cf7bbc44, _PlanarNM_8125b53543ccd48bb9175630cf7bbc44_XZ_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_a87fae0c6b1a0984b9ef7861ccc92da9_Out_0_Vector4 = _Base2Color;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Multiply_934c5505e5759286921bda248879c83f_Out_2_Vector4;
            Unity_Multiply_float4_float4(_PlanarNM_8125b53543ccd48bb9175630cf7bbc44_XZ_2_Vector4, _Property_a87fae0c6b1a0984b9ef7861ccc92da9_Out_0_Vector4, _Multiply_934c5505e5759286921bda248879c83f_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_bc8eb833b059c2879abda47a13239f66_R_1_Float = IN.VertexColor[0];
            float _Split_bc8eb833b059c2879abda47a13239f66_G_2_Float = IN.VertexColor[1];
            float _Split_bc8eb833b059c2879abda47a13239f66_B_3_Float = IN.VertexColor[2];
            float _Split_bc8eb833b059c2879abda47a13239f66_A_4_Float = IN.VertexColor[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_67acbc8108127387b3521a5887c8fd65_Out_0_Boolean = _Invert_Layer_Mask;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_ec66fdea21d60b889b53e96094a2bb5f_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_LayerMask);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _SampleTexture2D_1e04ec71d2a6c38aaa9df937b66dc947_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_ec66fdea21d60b889b53e96094a2bb5f_Out_0_Texture2D.tex, _Property_ec66fdea21d60b889b53e96094a2bb5f_Out_0_Texture2D.samplerstate, _Property_ec66fdea21d60b889b53e96094a2bb5f_Out_0_Texture2D.GetTransformedUV(IN.uv0.xy) );
            float _SampleTexture2D_1e04ec71d2a6c38aaa9df937b66dc947_R_4_Float = _SampleTexture2D_1e04ec71d2a6c38aaa9df937b66dc947_RGBA_0_Vector4.r;
            float _SampleTexture2D_1e04ec71d2a6c38aaa9df937b66dc947_G_5_Float = _SampleTexture2D_1e04ec71d2a6c38aaa9df937b66dc947_RGBA_0_Vector4.g;
            float _SampleTexture2D_1e04ec71d2a6c38aaa9df937b66dc947_B_6_Float = _SampleTexture2D_1e04ec71d2a6c38aaa9df937b66dc947_RGBA_0_Vector4.b;
            float _SampleTexture2D_1e04ec71d2a6c38aaa9df937b66dc947_A_7_Float = _SampleTexture2D_1e04ec71d2a6c38aaa9df937b66dc947_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_2ab824386c8b5f86a4f1baf709dea28e_Out_1_Float;
            Unity_OneMinus_float(_SampleTexture2D_1e04ec71d2a6c38aaa9df937b66dc947_R_4_Float, _OneMinus_2ab824386c8b5f86a4f1baf709dea28e_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Branch_6f5d54f970d03d8b8bfbf860a10aa6dc_Out_3_Float;
            Unity_Branch_float(_Property_67acbc8108127387b3521a5887c8fd65_Out_0_Boolean, _OneMinus_2ab824386c8b5f86a4f1baf709dea28e_Out_1_Float, _SampleTexture2D_1e04ec71d2a6c38aaa9df937b66dc947_R_4_Float, _Branch_6f5d54f970d03d8b8bfbf860a10aa6dc_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_312b7343c77e2a8eb60f73d6993817b8_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_Base2MaskMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float _PlanarNM_b5a5b9c7b16e58839fd9378c90580282;
            _PlanarNM_b5a5b9c7b16e58839fd9378c90580282.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNM_b5a5b9c7b16e58839fd9378c90580282.uv0 = IN.uv0;
            _PlanarNM_b5a5b9c7b16e58839fd9378c90580282.uv2 = IN.uv2;
            float4 _PlanarNM_b5a5b9c7b16e58839fd9378c90580282_XZ_2_Vector4;
            SG_PlanarNM_c0f081da9c567704ea36e7dd38cedcf6_float(_Property_312b7343c77e2a8eb60f73d6993817b8_Out_0_Texture2D, _Property_391bce0a1bc4ae8a8574996dcfefab13_Out_0_Vector4, _Property_b9b9b4cee220da8892912acbd91575dd_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), 1, _PlanarNM_b5a5b9c7b16e58839fd9378c90580282, _PlanarNM_b5a5b9c7b16e58839fd9378c90580282_XZ_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_b4d828c4dcef5489b007ef9d639c65c7_R_1_Float = _PlanarNM_b5a5b9c7b16e58839fd9378c90580282_XZ_2_Vector4[0];
            float _Split_b4d828c4dcef5489b007ef9d639c65c7_G_2_Float = _PlanarNM_b5a5b9c7b16e58839fd9378c90580282_XZ_2_Vector4[1];
            float _Split_b4d828c4dcef5489b007ef9d639c65c7_B_3_Float = _PlanarNM_b5a5b9c7b16e58839fd9378c90580282_XZ_2_Vector4[2];
            float _Split_b4d828c4dcef5489b007ef9d639c65c7_A_4_Float = _PlanarNM_b5a5b9c7b16e58839fd9378c90580282_XZ_2_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_6f4f0f0f513da587b5c0331584e50187_Out_0_Float = _HeightMin2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_a348a4abb5736887afa1734255606c10_Out_0_Float = _HeightMax2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_942eb4b05e4bd5808636661f3c5d2a5c_Out_0_Vector2 = float2(_Property_6f4f0f0f513da587b5c0331584e50187_Out_0_Float, _Property_a348a4abb5736887afa1734255606c10_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_5c92bca7a057e082a9ad31b6c041afbf_Out_0_Float = _HeightOffset2;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Add_d827365fdb96108d96671f09a466ed5b_Out_2_Vector2;
            Unity_Add_float2(_Vector2_942eb4b05e4bd5808636661f3c5d2a5c_Out_0_Vector2, (_Property_5c92bca7a057e082a9ad31b6c041afbf_Out_0_Float.xx), _Add_d827365fdb96108d96671f09a466ed5b_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_76e4189c648f8389be05c05c248baa84_Out_3_Float;
            Unity_Remap_float(_Split_b4d828c4dcef5489b007ef9d639c65c7_B_3_Float, float2 (0, 1), _Add_d827365fdb96108d96671f09a466ed5b_Out_2_Vector2, _Remap_76e4189c648f8389be05c05c248baa84_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_b11faa069f3e798ab16c6246251d3f13_Out_2_Float;
            Unity_Multiply_float_float(_Branch_6f5d54f970d03d8b8bfbf860a10aa6dc_Out_3_Float, _Remap_76e4189c648f8389be05c05c248baa84_Out_3_Float, _Multiply_b11faa069f3e798ab16c6246251d3f13_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_1653ac275d976082acb8cc3cb2c7e0a9_Out_2_Float;
            Unity_Multiply_float_float(_Split_bc8eb833b059c2879abda47a13239f66_B_3_Float, _Multiply_b11faa069f3e798ab16c6246251d3f13_Out_2_Float, _Multiply_1653ac275d976082acb8cc3cb2c7e0a9_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_3fbe3f08ee2f5f8cb4e5ea37c77f429b_Out_0_Float = _Height_Transition;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float _HeightBlend_00a99a7141c28f80a07c77242fa96942;
            float3 _HeightBlend_00a99a7141c28f80a07c77242fa96942_OutVector4_1_Vector3;
            SG_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float((_Multiply_4dd3ecf3f3b38786bdcf91b238ffdbb2_Out_2_Vector4.xyz), _Remap_347bc01c0ddf72878c4eb9274baae4ff_Out_3_Float, (_Multiply_934c5505e5759286921bda248879c83f_Out_2_Vector4.xyz), _Multiply_1653ac275d976082acb8cc3cb2c7e0a9_Out_2_Float, _Property_3fbe3f08ee2f5f8cb4e5ea37c77f429b_Out_0_Float, _HeightBlend_00a99a7141c28f80a07c77242fa96942, _HeightBlend_00a99a7141c28f80a07c77242fa96942_OutVector4_1_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_11ef2dfbd610ec809f27f54da5f6d8eb_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverBaseColorMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_8229e2bff7eeb784bda5cb1a71007335_Out_0_Vector4 = _CoverTilingOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Divide_417e4c87f5de7b8abda7c05a2ef88056_Out_2_Vector4;
            Unity_Divide_float4(float4(1, 1, 0, 0), _Property_8229e2bff7eeb784bda5cb1a71007335_Out_0_Vector4, _Divide_417e4c87f5de7b8abda7c05a2ef88056_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_d62f7360b612d9809c3e73ad07243f08_Out_0_Float = _CoverTriplanarThreshold;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_7aa1ee497ef585889e9e6889c832028b;
            _TriplanarNM_7aa1ee497ef585889e9e6889c832028b.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_7aa1ee497ef585889e9e6889c832028b.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_7aa1ee497ef585889e9e6889c832028b_XYZ_1_Vector4;
            float4 _TriplanarNM_7aa1ee497ef585889e9e6889c832028b_XZ_2_Vector4;
            float4 _TriplanarNM_7aa1ee497ef585889e9e6889c832028b_YZ_3_Vector4;
            float4 _TriplanarNM_7aa1ee497ef585889e9e6889c832028b_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_11ef2dfbd610ec809f27f54da5f6d8eb_Out_0_Texture2D, (_Divide_417e4c87f5de7b8abda7c05a2ef88056_Out_2_Vector4).x, _Property_d62f7360b612d9809c3e73ad07243f08_Out_0_Float, _TriplanarNM_7aa1ee497ef585889e9e6889c832028b, _TriplanarNM_7aa1ee497ef585889e9e6889c832028b_XYZ_1_Vector4, _TriplanarNM_7aa1ee497ef585889e9e6889c832028b_XZ_2_Vector4, _TriplanarNM_7aa1ee497ef585889e9e6889c832028b_YZ_3_Vector4, _TriplanarNM_7aa1ee497ef585889e9e6889c832028b_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_6f1e31130250ca80aae786393f8e97e4_Out_0_Vector4 = _CoverBaseColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Multiply_14ce5f06524122898b5641da23fb0105_Out_2_Vector4;
            Unity_Multiply_float4_float4(_TriplanarNM_7aa1ee497ef585889e9e6889c832028b_XYZ_1_Vector4, _Property_6f1e31130250ca80aae786393f8e97e4_Out_0_Vector4, _Multiply_14ce5f06524122898b5641da23fb0105_Out_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_9ff2eaae0dc74d9c9745b3fd09addcc9_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverBaseColorMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _UV_95a3b3f395e44d84a287ca09a90c4b36_Out_0_Vector4 = IN.uv0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _SampleTexture2D_1208d4f2cad47a8aa3dd7db5bdac6dbf_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_9ff2eaae0dc74d9c9745b3fd09addcc9_Out_0_Texture2D.tex, _Property_9ff2eaae0dc74d9c9745b3fd09addcc9_Out_0_Texture2D.samplerstate, _Property_9ff2eaae0dc74d9c9745b3fd09addcc9_Out_0_Texture2D.GetTransformedUV((_UV_95a3b3f395e44d84a287ca09a90c4b36_Out_0_Vector4.xy)) );
            float _SampleTexture2D_1208d4f2cad47a8aa3dd7db5bdac6dbf_R_4_Float = _SampleTexture2D_1208d4f2cad47a8aa3dd7db5bdac6dbf_RGBA_0_Vector4.r;
            float _SampleTexture2D_1208d4f2cad47a8aa3dd7db5bdac6dbf_G_5_Float = _SampleTexture2D_1208d4f2cad47a8aa3dd7db5bdac6dbf_RGBA_0_Vector4.g;
            float _SampleTexture2D_1208d4f2cad47a8aa3dd7db5bdac6dbf_B_6_Float = _SampleTexture2D_1208d4f2cad47a8aa3dd7db5bdac6dbf_RGBA_0_Vector4.b;
            float _SampleTexture2D_1208d4f2cad47a8aa3dd7db5bdac6dbf_A_7_Float = _SampleTexture2D_1208d4f2cad47a8aa3dd7db5bdac6dbf_RGBA_0_Vector4.a;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_39083fd581a9858f8617da21e8049448_Out_0_Float = _CoverMaskPower;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_d719ca05fe62698aa94e1a1a45abb189_Out_2_Float;
            Unity_Multiply_float_float(_SampleTexture2D_1208d4f2cad47a8aa3dd7db5bdac6dbf_A_7_Float, _Property_39083fd581a9858f8617da21e8049448_Out_0_Float, _Multiply_d719ca05fe62698aa94e1a1a45abb189_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_237fdddd221902858486e07d232e016c_Out_3_Float;
            Unity_Clamp_float(_Multiply_d719ca05fe62698aa94e1a1a45abb189_Out_2_Float, float(0), float(1), _Clamp_237fdddd221902858486e07d232e016c_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Property_577e31e406d3dd8fb1a321606123ec09_Out_0_Vector3 = _CoverDirection;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_1d71aa77d4c8d8848d8a70a7494d504c_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseNormalMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float _PlanarNMn_7b0c7a6d68832f8499160064dd98697c;
            _PlanarNMn_7b0c7a6d68832f8499160064dd98697c.WorldSpaceNormal = IN.WorldSpaceNormal;
            _PlanarNMn_7b0c7a6d68832f8499160064dd98697c.WorldSpaceTangent = IN.WorldSpaceTangent;
            _PlanarNMn_7b0c7a6d68832f8499160064dd98697c.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _PlanarNMn_7b0c7a6d68832f8499160064dd98697c.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNMn_7b0c7a6d68832f8499160064dd98697c.uv0 = IN.uv0;
            _PlanarNMn_7b0c7a6d68832f8499160064dd98697c.uv2 = IN.uv2;
            float4 _PlanarNMn_7b0c7a6d68832f8499160064dd98697c_XZ_2_Vector4;
            SG_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float(_Property_1d71aa77d4c8d8848d8a70a7494d504c_Out_0_Texture2D, _Property_cdba86d1e85a37858062d83b2fa6392d_Out_0_Vector4, _Property_c4d58d2885325e85994407e8fe45e088_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), 1, _PlanarNMn_7b0c7a6d68832f8499160064dd98697c, _PlanarNMn_7b0c7a6d68832f8499160064dd98697c_XZ_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_087816ca8e015a8a9fb223d9087b4182_Out_0_Float = _BaseNormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _NormalStrength_37595aefbf2c5782a9e1ac3bf5c68089_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_7b0c7a6d68832f8499160064dd98697c_XZ_2_Vector4.xyz), _Property_087816ca8e015a8a9fb223d9087b4182_Out_0_Float, _NormalStrength_37595aefbf2c5782a9e1ac3bf5c68089_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_e5d4c2313e3f328eb3d72ab688d42df9_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_Base2NormalMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float _PlanarNMn_7c412fcb6bd3a782a5b9fa87a359b5e9;
            _PlanarNMn_7c412fcb6bd3a782a5b9fa87a359b5e9.WorldSpaceNormal = IN.WorldSpaceNormal;
            _PlanarNMn_7c412fcb6bd3a782a5b9fa87a359b5e9.WorldSpaceTangent = IN.WorldSpaceTangent;
            _PlanarNMn_7c412fcb6bd3a782a5b9fa87a359b5e9.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _PlanarNMn_7c412fcb6bd3a782a5b9fa87a359b5e9.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            _PlanarNMn_7c412fcb6bd3a782a5b9fa87a359b5e9.uv0 = IN.uv0;
            _PlanarNMn_7c412fcb6bd3a782a5b9fa87a359b5e9.uv2 = IN.uv2;
            float4 _PlanarNMn_7c412fcb6bd3a782a5b9fa87a359b5e9_XZ_2_Vector4;
            SG_PlanarNMn_1b93a87456f9d4c419321d0cd92bd6c8_float(_Property_e5d4c2313e3f328eb3d72ab688d42df9_Out_0_Texture2D, _Property_391bce0a1bc4ae8a8574996dcfefab13_Out_0_Vector4, _Property_b9b9b4cee220da8892912acbd91575dd_Out_0_Boolean, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8), 1, _PlanarNMn_7c412fcb6bd3a782a5b9fa87a359b5e9, _PlanarNMn_7c412fcb6bd3a782a5b9fa87a359b5e9_XZ_2_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_65daec252a065086889328ae1155bba3_Out_0_Float = _Base2NormalScale;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _NormalStrength_0db20ce64d0949819e7c8a183ae1ea63_Out_2_Vector3;
            Unity_NormalStrength_float((_PlanarNMn_7c412fcb6bd3a782a5b9fa87a359b5e9_XZ_2_Vector4.xyz), _Property_65daec252a065086889328ae1155bba3_Out_0_Float, _NormalStrength_0db20ce64d0949819e7c8a183ae1ea63_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float _HeightBlend_2aea92908228ec8dbdea2d76ee4c8bd4;
            float3 _HeightBlend_2aea92908228ec8dbdea2d76ee4c8bd4_OutVector4_1_Vector3;
            SG_HeightBlend_d15b6fb865d3b6d4ebc1fd476c3ad135_float(_NormalStrength_37595aefbf2c5782a9e1ac3bf5c68089_Out_2_Vector3, _Remap_347bc01c0ddf72878c4eb9274baae4ff_Out_3_Float, _NormalStrength_0db20ce64d0949819e7c8a183ae1ea63_Out_2_Vector3, _Multiply_1653ac275d976082acb8cc3cb2c7e0a9_Out_2_Float, _Property_3fbe3f08ee2f5f8cb4e5ea37c77f429b_Out_0_Float, _HeightBlend_2aea92908228ec8dbdea2d76ee4c8bd4, _HeightBlend_2aea92908228ec8dbdea2d76ee4c8bd4_OutVector4_1_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_57136e4b37c63b88b0458bbd6cf2f9cc_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverNormalMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNMn_059da9746584140498cd018db3c76047_float _TriplanarNMn_6714bba323a48182841b11d72f43ee6c;
            _TriplanarNMn_6714bba323a48182841b11d72f43ee6c.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNMn_6714bba323a48182841b11d72f43ee6c.WorldSpaceTangent = IN.WorldSpaceTangent;
            _TriplanarNMn_6714bba323a48182841b11d72f43ee6c.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _TriplanarNMn_6714bba323a48182841b11d72f43ee6c.WorldSpacePosition = IN.WorldSpacePosition;
            float4 _TriplanarNMn_6714bba323a48182841b11d72f43ee6c_XYZ_1_Vector4;
            float4 _TriplanarNMn_6714bba323a48182841b11d72f43ee6c_XZ_2_Vector4;
            float4 _TriplanarNMn_6714bba323a48182841b11d72f43ee6c_YZ_3_Vector4;
            float4 _TriplanarNMn_6714bba323a48182841b11d72f43ee6c_XY_4_Vector4;
            SG_TriplanarNMn_059da9746584140498cd018db3c76047_float(_Property_57136e4b37c63b88b0458bbd6cf2f9cc_Out_0_Texture2D, (_Divide_417e4c87f5de7b8abda7c05a2ef88056_Out_2_Vector4).x, _Property_d62f7360b612d9809c3e73ad07243f08_Out_0_Float, _TriplanarNMn_6714bba323a48182841b11d72f43ee6c, _TriplanarNMn_6714bba323a48182841b11d72f43ee6c_XYZ_1_Vector4, _TriplanarNMn_6714bba323a48182841b11d72f43ee6c_XZ_2_Vector4, _TriplanarNMn_6714bba323a48182841b11d72f43ee6c_YZ_3_Vector4, _TriplanarNMn_6714bba323a48182841b11d72f43ee6c_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_81149b236e506f8697e192ede27f3971_Out_0_Float = _CoverNormalBlendHardness;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _NormalStrength_b81b0d8a1b4c8d89ac37806f8964f442_Out_2_Vector3;
            Unity_NormalStrength_float((_TriplanarNMn_6714bba323a48182841b11d72f43ee6c_XYZ_1_Vector4.xyz), _Property_81149b236e506f8697e192ede27f3971_Out_0_Float, _NormalStrength_b81b0d8a1b4c8d89ac37806f8964f442_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Multiply_c6669a1338d35b8f935151fcb153d31a_Out_2_Vector3;
            Unity_Multiply_float3_float3(_Property_577e31e406d3dd8fb1a321606123ec09_Out_0_Vector3, IN.WorldSpaceNormal, _Multiply_c6669a1338d35b8f935151fcb153d31a_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_bfe793e2ad24488ab75574988e5fd48c_R_1_Float = _Multiply_c6669a1338d35b8f935151fcb153d31a_Out_2_Vector3[0];
            float _Split_bfe793e2ad24488ab75574988e5fd48c_G_2_Float = _Multiply_c6669a1338d35b8f935151fcb153d31a_Out_2_Vector3[1];
            float _Split_bfe793e2ad24488ab75574988e5fd48c_B_3_Float = _Multiply_c6669a1338d35b8f935151fcb153d31a_Out_2_Vector3[2];
            float _Split_bfe793e2ad24488ab75574988e5fd48c_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_ec8faba2956f458394b586f041c36885_Out_2_Float;
            Unity_Add_float(_Split_bfe793e2ad24488ab75574988e5fd48c_R_1_Float, _Split_bfe793e2ad24488ab75574988e5fd48c_G_2_Float, _Add_ec8faba2956f458394b586f041c36885_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_314959d6b3555188936bb9790f9181c8_Out_2_Float;
            Unity_Add_float(_Add_ec8faba2956f458394b586f041c36885_Out_2_Float, _Split_bfe793e2ad24488ab75574988e5fd48c_B_3_Float, _Add_314959d6b3555188936bb9790f9181c8_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_41f9e80571036b84980ab755a1cd2b8a_Out_0_Float = _Cover_Amount;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_b15b5b7f74ac668fae6ac756ac65860d_Out_0_Float = _Cover_Amount_Grow_Speed;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Subtract_f2404bbb61f6e9898d6a04e2423218b2_Out_2_Float;
            Unity_Subtract_float(float(4), _Property_b15b5b7f74ac668fae6ac756ac65860d_Out_0_Float, _Subtract_f2404bbb61f6e9898d6a04e2423218b2_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_75c861c3d8dd338e811f59b0e389e75b_Out_2_Float;
            Unity_Divide_float(_Property_41f9e80571036b84980ab755a1cd2b8a_Out_0_Float, _Subtract_f2404bbb61f6e9898d6a04e2423218b2_Out_2_Float, _Divide_75c861c3d8dd338e811f59b0e389e75b_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Absolute_a4c9f15f226ae4878cd93d6ebf12a62e_Out_1_Float;
            Unity_Absolute_float(_Divide_75c861c3d8dd338e811f59b0e389e75b_Out_2_Float, _Absolute_a4c9f15f226ae4878cd93d6ebf12a62e_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Power_30e184dd6ca0ef868b0bce3265609949_Out_2_Float;
            Unity_Power_float(_Absolute_a4c9f15f226ae4878cd93d6ebf12a62e_Out_1_Float, _Subtract_f2404bbb61f6e9898d6a04e2423218b2_Out_2_Float, _Power_30e184dd6ca0ef868b0bce3265609949_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_30f12b6e93f7e08cb5a962e6b9f27ff2_Out_3_Float;
            Unity_Clamp_float(_Power_30e184dd6ca0ef868b0bce3265609949_Out_2_Float, float(0), float(2), _Clamp_30f12b6e93f7e08cb5a962e6b9f27ff2_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_2e58826b071117889ca7fab41db4b5cb_Out_2_Float;
            Unity_Multiply_float_float(_Add_314959d6b3555188936bb9790f9181c8_Out_2_Float, _Clamp_30f12b6e93f7e08cb5a962e6b9f27ff2_Out_3_Float, _Multiply_2e58826b071117889ca7fab41db4b5cb_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Saturate_746c9a45346e4b8d871894da64501f4f_Out_1_Float;
            Unity_Saturate_float(_Multiply_2e58826b071117889ca7fab41db4b5cb_Out_2_Float, _Saturate_746c9a45346e4b8d871894da64501f4f_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_833503f9746faf8f85a13d818f245d98_Out_3_Float;
            Unity_Clamp_float(_Add_314959d6b3555188936bb9790f9181c8_Out_2_Float, float(0), float(0.9999), _Clamp_833503f9746faf8f85a13d818f245d98_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_e9dfafaa9b18ad85938c76c7194739a2_Out_0_Float = _Cover_Max_Angle;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_1d0a578b9126a084837bf496f4134806_Out_2_Float;
            Unity_Divide_float(_Property_e9dfafaa9b18ad85938c76c7194739a2_Out_0_Float, float(45), _Divide_1d0a578b9126a084837bf496f4134806_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_f1935851a5f58984af13653d306d6189_Out_1_Float;
            Unity_OneMinus_float(_Divide_1d0a578b9126a084837bf496f4134806_Out_2_Float, _OneMinus_f1935851a5f58984af13653d306d6189_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Subtract_1269997e8c2b0f83ac902b1b23348c03_Out_2_Float;
            Unity_Subtract_float(_Clamp_833503f9746faf8f85a13d818f245d98_Out_3_Float, _OneMinus_f1935851a5f58984af13653d306d6189_Out_1_Float, _Subtract_1269997e8c2b0f83ac902b1b23348c03_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_f2a5e28fa01e468cbcafbbb0a26fb215_Out_3_Float;
            Unity_Clamp_float(_Subtract_1269997e8c2b0f83ac902b1b23348c03_Out_2_Float, float(0), float(2), _Clamp_f2a5e28fa01e468cbcafbbb0a26fb215_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_d765d4d25642de87aad736264e311fe3_Out_2_Float;
            Unity_Divide_float(float(1), _Divide_1d0a578b9126a084837bf496f4134806_Out_2_Float, _Divide_d765d4d25642de87aad736264e311fe3_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_530d3c7a368c90858bf313378f2045d6_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_f2a5e28fa01e468cbcafbbb0a26fb215_Out_3_Float, _Divide_d765d4d25642de87aad736264e311fe3_Out_2_Float, _Multiply_530d3c7a368c90858bf313378f2045d6_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Absolute_68cdb5b5fd7bc48e8abb6670b34f797a_Out_1_Float;
            Unity_Absolute_float(_Multiply_530d3c7a368c90858bf313378f2045d6_Out_2_Float, _Absolute_68cdb5b5fd7bc48e8abb6670b34f797a_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_6bc8be76ebefd081b09d70c3aa8f7e9a_Out_0_Float = _CoverHardness;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Power_d1d84226b1add48a96efc66cd5251277_Out_2_Float;
            Unity_Power_float(_Absolute_68cdb5b5fd7bc48e8abb6670b34f797a_Out_1_Float, _Property_6bc8be76ebefd081b09d70c3aa8f7e9a_Out_0_Float, _Power_d1d84226b1add48a96efc66cd5251277_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_36ce546f2e8c1683870a69c4b80b0056_Out_0_Float = _Cover_Min_Height;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_1bbfeb5150a7258fbce4159ef98004fa_Out_1_Float;
            Unity_OneMinus_float(_Property_36ce546f2e8c1683870a69c4b80b0056_Out_0_Float, _OneMinus_1bbfeb5150a7258fbce4159ef98004fa_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_8275b8a1f9b13a8ba2aab1effe981e24_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
            float _Split_8275b8a1f9b13a8ba2aab1effe981e24_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
            float _Split_8275b8a1f9b13a8ba2aab1effe981e24_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
            float _Split_8275b8a1f9b13a8ba2aab1effe981e24_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_d60e277443199583bf879c33a84040aa_Out_2_Float;
            Unity_Add_float(_OneMinus_1bbfeb5150a7258fbce4159ef98004fa_Out_1_Float, _Split_8275b8a1f9b13a8ba2aab1effe981e24_G_2_Float, _Add_d60e277443199583bf879c33a84040aa_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_d22c42648995508796312c1309a3e675_Out_2_Float;
            Unity_Add_float(_Add_d60e277443199583bf879c33a84040aa_Out_2_Float, float(1), _Add_d22c42648995508796312c1309a3e675_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_a9fafcac1555c785b00d2066da56c188_Out_3_Float;
            Unity_Clamp_float(_Add_d22c42648995508796312c1309a3e675_Out_2_Float, float(0), float(1), _Clamp_a9fafcac1555c785b00d2066da56c188_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_5efe9e928026f188bd7f2227f8a81665_Out_0_Float = _Cover_Min_Height_Blending;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_c8fe7b6f1cf6b4818c460afd271bf24f_Out_2_Float;
            Unity_Add_float(_Add_d60e277443199583bf879c33a84040aa_Out_2_Float, _Property_5efe9e928026f188bd7f2227f8a81665_Out_0_Float, _Add_c8fe7b6f1cf6b4818c460afd271bf24f_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Divide_9a88520d364f4d839eae92761e805274_Out_2_Float;
            Unity_Divide_float(_Add_c8fe7b6f1cf6b4818c460afd271bf24f_Out_2_Float, _Add_d60e277443199583bf879c33a84040aa_Out_2_Float, _Divide_9a88520d364f4d839eae92761e805274_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_3f76521a462f978eae3dc15480703bf4_Out_1_Float;
            Unity_OneMinus_float(_Divide_9a88520d364f4d839eae92761e805274_Out_2_Float, _OneMinus_3f76521a462f978eae3dc15480703bf4_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_99637080d5a5318ea8891ba128076958_Out_2_Float;
            Unity_Add_float(_OneMinus_3f76521a462f978eae3dc15480703bf4_Out_1_Float, float(-0.5), _Add_99637080d5a5318ea8891ba128076958_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_d7e00ff03b780e8785aa0ba35cd32193_Out_3_Float;
            Unity_Clamp_float(_Add_99637080d5a5318ea8891ba128076958_Out_2_Float, float(0), float(1), _Clamp_d7e00ff03b780e8785aa0ba35cd32193_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_ff67eea748c00386b91058b2876cee40_Out_2_Float;
            Unity_Add_float(_Clamp_a9fafcac1555c785b00d2066da56c188_Out_3_Float, _Clamp_d7e00ff03b780e8785aa0ba35cd32193_Out_3_Float, _Add_ff67eea748c00386b91058b2876cee40_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Clamp_697ecf534f2574889ebd8b15de892826_Out_3_Float;
            Unity_Clamp_float(_Add_ff67eea748c00386b91058b2876cee40_Out_2_Float, float(0), float(1), _Clamp_697ecf534f2574889ebd8b15de892826_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_de11d28b9823c388af9dd6a504362c51_Out_2_Float;
            Unity_Multiply_float_float(_Power_d1d84226b1add48a96efc66cd5251277_Out_2_Float, _Clamp_697ecf534f2574889ebd8b15de892826_Out_3_Float, _Multiply_de11d28b9823c388af9dd6a504362c51_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_2d43633f93e4ee84aba21650c4f73a01_Out_2_Float;
            Unity_Multiply_float_float(_Saturate_746c9a45346e4b8d871894da64501f4f_Out_1_Float, _Multiply_de11d28b9823c388af9dd6a504362c51_Out_2_Float, _Multiply_2d43633f93e4ee84aba21650c4f73a01_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Lerp_807d7c05dc7fed88aa1ae547effba70e_Out_3_Vector3;
            Unity_Lerp_float3(_HeightBlend_2aea92908228ec8dbdea2d76ee4c8bd4_OutVector4_1_Vector3, _NormalStrength_b81b0d8a1b4c8d89ac37806f8964f442_Out_2_Vector3, (_Multiply_2d43633f93e4ee84aba21650c4f73a01_Out_2_Float.xxx), _Lerp_807d7c05dc7fed88aa1ae547effba70e_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Transform_654244b6738ef485b35a6c1ee581f307_Out_1_Vector3;
            {
                float3x3 tangentTransform = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
                _Transform_654244b6738ef485b35a6c1ee581f307_Out_1_Vector3 = TransformTangentToWorldDir(_Lerp_807d7c05dc7fed88aa1ae547effba70e_Out_3_Vector3.xyz, tangentTransform, true).xyz;
            }
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Multiply_e52384b35afef9818b65d43f1474b495_Out_2_Vector3;
            Unity_Multiply_float3_float3(_Property_577e31e406d3dd8fb1a321606123ec09_Out_0_Vector3, _Transform_654244b6738ef485b35a6c1ee581f307_Out_1_Vector3, _Multiply_e52384b35afef9818b65d43f1474b495_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_9eab4717084c17859a8e63f351c1711d_R_1_Float = _Multiply_e52384b35afef9818b65d43f1474b495_Out_2_Vector3[0];
            float _Split_9eab4717084c17859a8e63f351c1711d_G_2_Float = _Multiply_e52384b35afef9818b65d43f1474b495_Out_2_Vector3[1];
            float _Split_9eab4717084c17859a8e63f351c1711d_B_3_Float = _Multiply_e52384b35afef9818b65d43f1474b495_Out_2_Vector3[2];
            float _Split_9eab4717084c17859a8e63f351c1711d_A_4_Float = 0;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_da2b031a4805ce839d2c63184da7401e_Out_2_Float;
            Unity_Add_float(_Split_9eab4717084c17859a8e63f351c1711d_R_1_Float, _Split_9eab4717084c17859a8e63f351c1711d_G_2_Float, _Add_da2b031a4805ce839d2c63184da7401e_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Add_2dc170e840729981a3725f6afdd8f992_Out_2_Float;
            Unity_Add_float(_Add_da2b031a4805ce839d2c63184da7401e_Out_2_Float, _Split_9eab4717084c17859a8e63f351c1711d_B_3_Float, _Add_2dc170e840729981a3725f6afdd8f992_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_e5832320c3941e8ea5e26a4d0ca92908_Out_2_Float;
            Unity_Multiply_float_float(_Add_2dc170e840729981a3725f6afdd8f992_Out_2_Float, _Clamp_30f12b6e93f7e08cb5a962e6b9f27ff2_Out_3_Float, _Multiply_e5832320c3941e8ea5e26a4d0ca92908_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_08afa1de8ac2f18f857bbc71c64e8ceb_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_30f12b6e93f7e08cb5a962e6b9f27ff2_Out_3_Float, _Property_6bc8be76ebefd081b09d70c3aa8f7e9a_Out_0_Float, _Multiply_08afa1de8ac2f18f857bbc71c64e8ceb_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_09e51444a0b1e882aea42e6ef85919fb_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_08afa1de8ac2f18f857bbc71c64e8ceb_Out_2_Float, _Multiply_de11d28b9823c388af9dd6a504362c51_Out_2_Float, _Multiply_09e51444a0b1e882aea42e6ef85919fb_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_3649a34f052f1d89a3e555f2fd7a2622_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_e5832320c3941e8ea5e26a4d0ca92908_Out_2_Float, _Multiply_09e51444a0b1e882aea42e6ef85919fb_Out_2_Float, _Multiply_3649a34f052f1d89a3e555f2fd7a2622_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            UnityTexture2D _Property_1c1357d48e493e8089f5da7fa0727392_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverMaskMap);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e;
            _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_XYZ_1_Vector4;
            float4 _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_XZ_2_Vector4;
            float4 _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_YZ_3_Vector4;
            float4 _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_1c1357d48e493e8089f5da7fa0727392_Out_0_Texture2D, (_Divide_417e4c87f5de7b8abda7c05a2ef88056_Out_2_Vector4).x, _Property_d62f7360b612d9809c3e73ad07243f08_Out_0_Float, _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e, _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_XYZ_1_Vector4, _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_XZ_2_Vector4, _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_YZ_3_Vector4, _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_XY_4_Vector4);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_c4201edf3801a487849415809068865b_R_1_Float = _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_XYZ_1_Vector4[0];
            float _Split_c4201edf3801a487849415809068865b_G_2_Float = _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_XYZ_1_Vector4[1];
            float _Split_c4201edf3801a487849415809068865b_B_3_Float = _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_XYZ_1_Vector4[2];
            float _Split_c4201edf3801a487849415809068865b_A_4_Float = _TriplanarNM_de0bf6c56768c884965bb2b78b534b4e_XYZ_1_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_7d292a2f5737ad89aa4116a32a770401_Out_0_Float = _CoverHeightMapMin;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_b9485b720982198888701b70c808a574_Out_0_Float = _CoverHeightMapMax;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Vector2_be52d4e98cb63c8e899d455afac49761_Out_0_Vector2 = float2(_Property_7d292a2f5737ad89aa4116a32a770401_Out_0_Float, _Property_b9485b720982198888701b70c808a574_Out_0_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_a028eb148d51f986846eb00dba5b8c21_Out_0_Float = _CoverHeightMapOffset;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float2 _Add_36a89f63a185118a88e38098f08f30e7_Out_2_Vector2;
            Unity_Add_float2(_Vector2_be52d4e98cb63c8e899d455afac49761_Out_0_Vector2, (_Property_a028eb148d51f986846eb00dba5b8c21_Out_0_Float.xx), _Add_36a89f63a185118a88e38098f08f30e7_Out_2_Vector2);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Remap_89daf117afa72e87b0e7a6b7b973a4b6_Out_3_Float;
            Unity_Remap_float(_Split_c4201edf3801a487849415809068865b_B_3_Float, float2 (0, 1), _Add_36a89f63a185118a88e38098f08f30e7_Out_2_Vector2, _Remap_89daf117afa72e87b0e7a6b7b973a4b6_Out_3_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_91860731e65c2c878b131ffd43bf54a5_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_3649a34f052f1d89a3e555f2fd7a2622_Out_2_Float, _Remap_89daf117afa72e87b0e7a6b7b973a4b6_Out_3_Float, _Multiply_91860731e65c2c878b131ffd43bf54a5_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_a1e9d262d487f98ab3a94dd6fef22908_Out_2_Float;
            Unity_Multiply_float_float(_Split_bc8eb833b059c2879abda47a13239f66_G_2_Float, _Multiply_91860731e65c2c878b131ffd43bf54a5_Out_2_Float, _Multiply_a1e9d262d487f98ab3a94dd6fef22908_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Saturate_a73982c803e41e80bb2d82e77e4921db_Out_1_Float;
            Unity_Saturate_float(_Multiply_a1e9d262d487f98ab3a94dd6fef22908_Out_2_Float, _Saturate_a73982c803e41e80bb2d82e77e4921db_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Multiply_3b6375a3a8f3398eb5630bb0cc4abea6_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_237fdddd221902858486e07d232e016c_Out_3_Float, _Saturate_a73982c803e41e80bb2d82e77e4921db_Out_1_Float, _Multiply_3b6375a3a8f3398eb5630bb0cc4abea6_Out_2_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            #if defined(_USEDYNAMICCOVERTSTATICMASKF_ON)
            float _UseDynamicCoverTStaticMaskF_8587b1680d796886bd267db30b112d6f_Out_0_Float = _Multiply_3b6375a3a8f3398eb5630bb0cc4abea6_Out_2_Float;
            #else
            float _UseDynamicCoverTStaticMaskF_8587b1680d796886bd267db30b112d6f_Out_0_Float = _Clamp_237fdddd221902858486e07d232e016c_Out_3_Float;
            #endif
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Lerp_4fca1aa155472b85bd876a8324386f37_Out_3_Vector3;
            Unity_Lerp_float3(_HeightBlend_00a99a7141c28f80a07c77242fa96942_OutVector4_1_Vector3, (_Multiply_14ce5f06524122898b5641da23fb0105_Out_2_Vector4.xyz), (_UseDynamicCoverTStaticMaskF_8587b1680d796886bd267db30b112d6f_Out_0_Float.xxx), _Lerp_4fca1aa155472b85bd876a8324386f37_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float4 _Property_31a17346fd9f4c848d23d733884e0a21_Out_0_Vector4 = _WetColor;
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Multiply_cebc9c67173afa86af7299b1b4fddee1_Out_2_Vector3;
            Unity_Multiply_float3_float3((_Property_31a17346fd9f4c848d23d733884e0a21_Out_0_Vector4.xyz), _Lerp_4fca1aa155472b85bd876a8324386f37_Out_3_Vector3, _Multiply_cebc9c67173afa86af7299b1b4fddee1_Out_2_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _OneMinus_98f57a743ea0c9899240fca6b106aaec_Out_1_Float;
            Unity_OneMinus_float(_Split_bc8eb833b059c2879abda47a13239f66_R_1_Float, _OneMinus_98f57a743ea0c9899240fca6b106aaec_Out_1_Float);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float3 _Lerp_c7df5e0362cf3b82b5fc62aee758f480_Out_3_Vector3;
            Unity_Lerp_float3(_Lerp_4fca1aa155472b85bd876a8324386f37_Out_3_Vector3, _Multiply_cebc9c67173afa86af7299b1b4fddee1_Out_2_Vector3, (_OneMinus_98f57a743ea0c9899240fca6b106aaec_Out_1_Float.xxx), _Lerp_c7df5e0362cf3b82b5fc62aee758f480_Out_3_Vector3);
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Split_208942f638bd09818be8a2afbf76c6e7_R_1_Float = _PlanarNM_939c16e3e51f06888092ac69b8f75998_XZ_2_Vector4[0];
            float _Split_208942f638bd09818be8a2afbf76c6e7_G_2_Float = _PlanarNM_939c16e3e51f06888092ac69b8f75998_XZ_2_Vector4[1];
            float _Split_208942f638bd09818be8a2afbf76c6e7_B_3_Float = _PlanarNM_939c16e3e51f06888092ac69b8f75998_XZ_2_Vector4[2];
            float _Split_208942f638bd09818be8a2afbf76c6e7_A_4_Float = _PlanarNM_939c16e3e51f06888092ac69b8f75998_XZ_2_Vector4[3];
            #endif
            #if defined(KEYWORD_PERMUTATION_0) || defined(KEYWORD_PERMUTATION_1)
            float _Property_fb2f800e35d50e84bc11a285a594a4cf_Out_0_Float = _AlphaCutoff;
            #endif
            surface.BaseColor = _Lerp_c7df5e0362cf3b82b5fc62aee758f480_Out_3_Vector3;
            surface.Alpha = _Split_208942f638bd09818be8a2afbf76c6e7_A_4_Float;
            surface.AlphaClipThreshold = _Property_fb2f800e35d50e84bc11a285a594a4cf_Out_0_Float;
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