package glslang

import "core:c"

Stage :: enum {
    VERTEX,
    TESSCONTROL,
    TESSEVALUATION,
    GEOMETRY,
    FRAGMENT,
    COMPUTE,
    RAYGEN,
    RAYGEN_NV     = RAYGEN,
    INTERSECT,
    INTERSECT_NV  = INTERSECT,
    ANYHIT,
    ANYHIT_NV     = ANYHIT,
    CLOSESTHIT,
    CLOSESTHIT_NV = CLOSESTHIT,
    MISS,
    MISS_NV       = MISS,
    CALLABLE,
    CALLABLE_NV   = CALLABLE,
    TASK,
    TASK_NV       = TASK,
    MESH,
    MESH_NV       = MESH,
    // COUNT,     // Last element marker
}

Stage_Mask :: bit_set[Stage]

Source :: enum {
    NONE,
    GLSL,
    HLSL,
    // COUNT,
}

Client :: enum {
    NONE,
    VULKAN,
    OPENGL,
    // COUNT,
}

Target_Language :: enum {
    NONE,
    SPV,
    // COUNT,
}

Target_Client_Version :: enum {
    VULKAN_1_0 = (1 << 22),
    VULKAN_1_1 = (1 << 22) | (1 << 12),
    VULKAN_1_2 = (1 << 22) | (2 << 12),
    VULKAN_1_3 = (1 << 22) | (3 << 12),
    OPENGL_450 = 450,
    // COUNT = 5,
}

Target_Language_Version :: enum {
    GLSLANG_TARGET_SPV_1_0 = (1 << 16),
    GLSLANG_TARGET_SPV_1_1 = (1 << 16) | (1 << 8),
    GLSLANG_TARGET_SPV_1_2 = (1 << 16) | (2 << 8),
    GLSLANG_TARGET_SPV_1_3 = (1 << 16) | (3 << 8),
    GLSLANG_TARGET_SPV_1_4 = (1 << 16) | (4 << 8),
    GLSLANG_TARGET_SPV_1_5 = (1 << 16) | (5 << 8),
    GLSLANG_TARGET_SPV_1_6 = (1 << 16) | (6 << 8),
    // COUNT = 7,
}

Executable :: enum {
    VERTEX_FRAGMENT,
    FRAGMENT,
}

Optimization_Level :: enum {
    NO_GENERATION,
    NONE,
    SIMPLE,
    FULL,
    // COUNT,
}

Texture_Sampler_Transform_Mode :: enum {
    KEEP,
    UPGRADE_TEXTURE_REMOVE_SAMPLER,
    // COUNT,
}

Messages_Flag :: enum {
    // DEFAULT,
    RELAXED_ERRORS,
    SUPPRESS_WARNINGS,
    AST,
    SPV_RULES,
    VULKAN_RULES,
    ONLY_PREPROCESSOR,
    READ_HLSL,
    CASCADING_ERRORS,
    KEEP_UNCALLED,
    HLSL_OFFSETS,
    DEBUG_INFO,
    HLSL_ENABLE_16BIT_TYPES,
    HLSL_LEGALIZATION,
    HLSL_DX9_COMPATIBLE,
    BUILTIN_SYMBOL_TABLE,
    ENHANCED,
    ABSOLUTE_PATH,
    // COUNT,
}

Messages_Flags :: bit_set[Messages_Flag]

Reflection_Options_Flag :: enum {
    // DEFAULT,
    STRICT_ARRAY_SUFFIX,
    BASIC_ARRAY_SUFFIX,
    INTERMEDIATE_IOO,
    SEPARATE_BUFFERS,
    ALL_BLOCK_VARIABLES,
    UNWRAP_IO_BLOCKS,
    ALL_IO_VARIABLES,
    SHARED_STD140_SSBO,
    SHARED_STD140_UBO,
    // COUNT,
}

Reflection_Options_Flags :: bit_set[Reflection_Options_Flag]

Profile_Flag :: enum {
    // BAD_PROFILE,
    NO_PROFILE,
    CORE_PROFILE,
    COMPATIBILITY_PROFILE,
    ES_PROFILE,
    // COUNT,
}

Profile :: bit_set[Profile_Flag]

Shader_Options_Flag :: enum {
    // DEFAULT,
    AUTO_MAP_BINDINGS,
    AUTO_MAP_LOCATIONS,
    VULKAN_RULES_RELAXED,
    // COUNT,
}

Shader_Options_Flags :: bit_set[Shader_Options_Flag]

Resource_Type :: enum {
    SAMPLER,
    TEXTURE,
    IMAGE,
    UBO,
    SSBO,
    UAV,
    // COUNT,
}
