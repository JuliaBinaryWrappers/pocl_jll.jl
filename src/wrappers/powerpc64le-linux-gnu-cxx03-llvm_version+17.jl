# Autogenerated wrapper script for pocl_jll for powerpc64le-linux-gnu-cxx03-llvm_version+17
export libpocl, poclcc

using OpenCL_jll
using Hwloc_jll
using SPIRV_LLVM_Translator_unified_jll
using SPIRV_Tools_jll
JLLWrappers.@generate_wrapper_header("pocl")
JLLWrappers.@declare_library_product(libpocl, "libpocl.so.2")
JLLWrappers.@declare_executable_product(poclcc)
function __init__()
    JLLWrappers.@generate_init_header(OpenCL_jll, Hwloc_jll, SPIRV_LLVM_Translator_unified_jll, SPIRV_Tools_jll)
    JLLWrappers.@init_library_product(
        libpocl,
        "lib/libpocl.so",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@init_executable_product(
        poclcc,
        "bin/poclcc",
    )

    JLLWrappers.@generate_init_footer()
end  # __init__()
