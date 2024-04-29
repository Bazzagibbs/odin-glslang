package glslang

import "core:c"

when ODIN_OS == .Windows do foreign import glslang {
    "lib/windows/GenericCodeGen.lib",
    "lib/windows/glslang-default-resource-limits.lib",
    "lib/windows/glslang.lib",
    "lib/windows/MachineIndependent.lib",
    "lib/windows/OSDependent.lib",
    "lib/windows/SPIRV-Tools-opt.lib",
    "lib/windows/SPIRV-Tools.lib",
    "lib/windows/SPIRV.lib",
    "lib/windows/SPVRemapper.lib",
}
when ODIN_OS == .Linux do foreign import glslang {
    "lib/linux/libGenericCodeGen.a",
    "lib/linux/libglslang-default-resource-limits.a",
    "lib/linux/libglslang.a",
    "lib/linux/libMachineIndependent.a",
    "lib/linux/libOSDependent.a",
    "lib/linux/libSPIRV-Tools-opt.a",
    "lib/linux/libSPIRV-Tools.a",
    "lib/linux/libSPIRV.a",
    "lib/linux/libSPVRemapper.a",
}
when ODIN_OS == .Darwin do foreign import glslang {
    "lib/darwin/libGenericCodeGen.a",
    "lib/darwin/libglslang-default-resource-limits.a",
    "lib/darwin/libglslang.a",
    "lib/darwin/libMachineIndependent.a",
    "lib/darwin/libOSDependent.a",
    "lib/darwin/libSPIRV-Tools-opt.a",
    "lib/darwin/libSPIRV-Tools.a",
    "lib/darwin/libSPIRV.a",
    "lib/darwin/libSPVRemapper.a",
}

@(default_calling_convention="c", link_prefix="glslang")
foreign glslang {
    // ===================================== glslang_c_interface.h
    initialize_process                  :: proc() -> b32 ---
    finalize_process                    :: proc() ---

    shader_create                       :: proc(input: ^Input) -> Shader ---
    shader_delete                       :: proc(shader: Shader) ---
    shader_set_preamble                 :: proc(shader: Shader, s: cstring) ---
    shader_shift_binding                :: proc(shader: Shader, res: Resource_Type, base: c.uint) ---
    shader_shift_binding_for_set        :: proc(shader: Shader, res: Resource_Type, base: c.uint, set: c.uint) ---
    shader_set_options                  :: proc(shader: Shader, options: Shader_Options_Flags) ---
    shader_set_glsl_version             :: proc(shader: Shader, version: c.int) ---
    shader_preprocess                   :: proc(shader: Shader, input: ^Input) -> b32 ---
    shader_parse                        :: proc(shader: Shader, input: ^Input) -> b32 ---
    shader_get_preprocessed_code        :: proc(shader: Shader) -> cstring ---
    shader_get_info_log                 :: proc(shader: Shader) -> cstring ---
    shader_get_info_debug_log           :: proc(shader: Shader) -> cstring ---

    program_create                      :: proc() -> Program ---
    program_delete                      :: proc(program: Program) ---
    program_add_shader                  :: proc(program: Program, shader: Shader) ---
    program_link                        :: proc(program: Program, messages: Messages_Flags) -> b32 ---
    program_add_source_text             :: proc(program: Program, stage: Stage, text: cstring, len: c.size_t) ---
    program_set_source_file             :: proc(program: Program, stage: Stage, file: cstring) ---
    program_map_io                      :: proc(program: Program) -> b32 ---
    program_SPIRV_generate              :: proc(program: Program, stage: Stage) ---
    program_SPIRV_generate_with_options :: proc(program: Program, stage: Stage, spv_options: ^Spv_Options) ---
    program_SPIRV_get_size              :: proc(program: Program) -> c.size_t ---
    program_SPIRV_get                   :: proc(program: Program, spirv: [^]c.uint) ---
    program_SPIRV_get_ptr               :: proc(program: Program) -> [^]c.uint ---
    program_SPIRV_get_messages          :: proc(program: Program) -> cstring ---
    program_get_info_log                :: proc(program: Program) -> cstring ---
    program_get_info_debug_log          :: proc(program: Program) -> cstring ---

    // ========================================== resource_limits_c.h
    resource                            :: proc() -> ^Resource ---
    default_resource                    :: proc() -> ^Resource ---
    default_resource_string             :: proc() -> cstring ---
    decode_resource_limits              :: proc(resources: ^Resource, config: cstring) ---
}
