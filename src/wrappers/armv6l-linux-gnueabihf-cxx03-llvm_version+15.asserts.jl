# Autogenerated wrapper script for pocl_jll for armv6l-linux-gnueabihf-cxx03-llvm_version+15.asserts
export libpocl, poclcc

using OpenCL_jll
using Hwloc_jll
using SPIRV_LLVM_Translator_unified_jll
using SPIRV_Tools_jll
using Clang_unified_jll
JLLWrappers.@generate_wrapper_header("pocl")
JLLWrappers.@declare_library_product(libpocl, "libpocl.so.2")
JLLWrappers.@declare_executable_product(poclcc)
function __init__()
    JLLWrappers.@generate_init_header(OpenCL_jll, Hwloc_jll, SPIRV_LLVM_Translator_unified_jll, SPIRV_Tools_jll, Clang_unified_jll)
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
        # Register this driver with OpenCL_jll
    if OpenCL_jll.is_available()
        push!(OpenCL_jll.drivers, libpocl)
    end

end  # __init__()
