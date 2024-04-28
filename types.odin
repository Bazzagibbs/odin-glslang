package glslang

import "core:c"

// ========================================= glslang_c_shader_types.h

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

Messages_Flags :: bit_set[Messages_Flag; c.int]

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

Shader_Options_Flags :: bit_set[Shader_Options_Flag; c.int]

Resource_Type :: enum {
    SAMPLER,
    TEXTURE,
    IMAGE,
    UBO,
    SSBO,
    UAV,
    // COUNT,
}

// ============================================ glslang_c_interface.h

Opaque_Struct :: distinct rawptr
Shader  :: distinct Opaque_Struct
Program :: distinct Opaque_Struct

Limits :: struct {
    non_inductive_for_loops                  : c.bool,
    while_loops                              : c.bool,
    do_while_loops                           : c.bool,
    general_uniform_indexing                 : c.bool,
    general_attribute_matrix_vector_indexing : c.bool,
    general_varying_indexing                 : c.bool,
    general_sampler_indexing                 : c.bool,
    general_variable_indexing                : c.bool,
    general_constant_matrix_vector_indexing  : c.bool,
}

Resource :: struct {
    max_lights                                    : c.int,
    max_clip_planes                               : c.int,
    max_texture_units                             : c.int,
    max_texture_coords                            : c.int,
    max_vertex_attribs                            : c.int,
    max_vertex_uniform_components                 : c.int,
    max_varying_floats                            : c.int,
    max_vertex_texture_image_units                : c.int,
    max_combined_texture_image_units              : c.int,
    max_texture_image_units                       : c.int,
    max_fragment_uniform_components               : c.int,
    max_draw_buffers                              : c.int,
    max_vertex_uniform_vectors                    : c.int,
    max_varying_vectors                           : c.int,
    max_fragment_uniform_vectors                  : c.int,
    max_vertex_output_vectors                     : c.int,
    max_fragment_input_vectors                    : c.int,
    min_program_texel_offset                      : c.int,
    max_program_texel_offset                      : c.int,
    max_clip_distances                            : c.int,
    max_compute_work_group_count_x                : c.int,
    max_compute_work_group_count_y                : c.int,
    max_compute_work_group_count_z                : c.int,
    max_compute_work_group_size_x                 : c.int,
    max_compute_work_group_size_y                 : c.int,
    max_compute_work_group_size_z                 : c.int,
    max_compute_uniform_components                : c.int,
    max_compute_texture_image_units               : c.int,
    max_compute_image_uniforms                    : c.int,
    max_compute_atomic_counters                   : c.int,
    max_compute_atomic_counter_buffers            : c.int,
    max_varying_components                        : c.int,
    max_vertex_output_components                  : c.int,
    max_geometry_input_components                 : c.int,
    max_geometry_output_components                : c.int,
    max_fragment_input_components                 : c.int,
    max_image_units                               : c.int,
    max_combined_image_units_and_fragment_outputs : c.int,
    max_combined_shader_output_resources          : c.int,
    max_image_samples                             : c.int,
    max_vertex_image_uniforms                     : c.int,
    max_tess_control_image_uniforms               : c.int,
    max_tess_evaluation_image_uniforms            : c.int,
    max_geometry_image_uniforms                   : c.int,
    max_fragment_image_uniforms                   : c.int,
    max_combined_image_uniforms                   : c.int,
    max_geometry_texture_image_units              : c.int,
    max_geometry_output_vertices                  : c.int,
    max_geometry_total_output_components          : c.int,
    max_geometry_uniform_components               : c.int,
    max_geometry_varying_components               : c.int,
    max_tess_control_input_components             : c.int,
    max_tess_control_output_components            : c.int,
    max_tess_control_texture_image_units          : c.int,
    max_tess_control_uniform_components           : c.int,
    max_tess_control_total_output_components      : c.int,
    max_tess_evaluation_input_components          : c.int,
    max_tess_evaluation_output_components         : c.int,
    max_tess_evaluation_texture_image_units       : c.int,
    max_tess_evaluation_uniform_components        : c.int,
    max_tess_patch_components                     : c.int,
    max_patch_vertices                            : c.int,
    max_tess_gen_level                            : c.int,
    max_viewports                                 : c.int,
    max_vertex_atomic_counters                    : c.int,
    max_tess_control_atomic_counters              : c.int,
    max_tess_evaluation_atomic_counters           : c.int,
    max_geometry_atomic_counters                  : c.int,
    max_fragment_atomic_counters                  : c.int,
    max_combined_atomic_counters                  : c.int,
    max_atomic_counter_bindings                   : c.int,
    max_vertex_atomic_counter_buffers             : c.int,
    max_tess_control_atomic_counter_buffers       : c.int,
    max_tess_evaluation_atomic_counter_buffers    : c.int,
    max_geometry_atomic_counter_buffers           : c.int,
    max_fragment_atomic_counter_buffers           : c.int,
    max_combined_atomic_counter_buffers           : c.int,
    max_atomic_counter_buffer_size                : c.int,
    max_transform_feedback_buffers                : c.int,
    max_transform_feedback_interleaved_components : c.int,
    max_cull_distances                            : c.int,
    max_combined_clip_and_cull_distances          : c.int,
    max_samples                                   : c.int,
    max_mesh_output_vertices_nv                   : c.int,
    max_mesh_output_primitives_nv                 : c.int,
    max_mesh_work_group_size_x_nv                 : c.int,
    max_mesh_work_group_size_y_nv                 : c.int,
    max_mesh_work_group_size_z_nv                 : c.int,
    max_task_work_group_size_x_nv                 : c.int,
    max_task_work_group_size_y_nv                 : c.int,
    max_task_work_group_size_z_nv                 : c.int,
    max_mesh_view_count_nv                        : c.int,
    max_mesh_output_vertices_ext                  : c.int,
    max_mesh_output_primitives_ext                : c.int,
    max_mesh_work_group_size_x_ext                : c.int,
    max_mesh_work_group_size_y_ext                : c.int,
    max_mesh_work_group_size_z_ext                : c.int,
    max_task_work_group_size_x_ext                : c.int,
    max_task_work_group_size_y_ext                : c.int,
    max_task_work_group_size_z_ext                : c.int,
    max_mesh_view_count_ext                       : c.int,
    max_dual_source_draw_buffers_ext              : c.int,
    limits                                        : Limits,
}

Include_Result :: struct {
    /* Header file name or nil if inclusion failed */
    header_name : cstring,
    /* Header contents or nil */
    header_data : cstring,
    header_length : c.size_t,
}

Include_Local_Proc  :: #type proc "c" (ctx: rawptr, header_name: cstring, includer_name: cstring, include_depth: c.size_t) -> ^Include_Result
Include_System_Proc :: #type proc "c" (ctx: rawptr, header_name: cstring, includer_name: cstring, include_depth: c.size_t) -> ^Include_Result
Free_Include_Result_Proc :: #type proc "c" (ctx: rawptr, result: ^Include_Result) -> c.int

Include_Callbacks :: struct {
    include_system      : Include_System_Proc,
    include_local       : Include_Local_Proc,
    free_include_result : Free_Include_Result_Proc,
}

Input :: struct {
    language                          : Source,
    stage                             : Stage,
    client                            : Client,
    client_version                    : Target_Client_Version,
    target_language                   : Target_Language,
    target_language_version           : Target_Language_Version,
    /* Shader source code */
    code                              : cstring,
    default_version                   : c.int,
    default_profile                   : Profile,
    force_default_version_and_profile : c.int,
    forward_compatible                : c.int,
    messages                          : Messages_Flags,
    resource                          : ^Resource,
    callbacks                         : Include_Callbacks,
    callbacks_ctx                     : rawptr,
}

Spv_Options :: struct {
    generate_debug_info                  : c.bool,
    strip_debug_info                     : c.bool,
    disable_optimizer                    : c.bool,
    optimize_size                        : c.bool,
    disassemble                          : c.bool,
    validate                             : c.bool,
    emit_nonsemantic_shader_debug_info   : c.bool,
    emit_nonsemantic_shader_debug_source : c.bool,
    compile_only                         : c.bool,
}
