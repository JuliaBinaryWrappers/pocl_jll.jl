# Autogenerated wrapper script for pocl_jll for armv7l-linux-gnueabihf-cxx11-llvm_version+15
export libpocl, poclcc

using OpenCL_jll
using Hwloc_jll
using SPIRV_LLVM_Translator_unified_jll
using SPIRV_Tools_jll
using Clang_unified_jll
using LLD_unified_jll
JLLWrappers.@generate_wrapper_header("pocl")
JLLWrappers.@declare_library_product(libpocl, "libpocl.so.2")
JLLWrappers.@declare_executable_product(poclcc)
function __init__()
    JLLWrappers.@generate_init_header(OpenCL_jll, Hwloc_jll, SPIRV_LLVM_Translator_unified_jll, SPIRV_Tools_jll, Clang_unified_jll, LLD_unified_jll)
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

        # XXX: Clang_jll does not have a functional clang binary on macOS,
        #      as it's configured without a default sdkroot (see #9221)
        if Sys.isapple()
            ENV["SDKROOT"] = "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk"
        end
    end

    # expose JLL binaries to the library
    # XXX: Scratch.jl is unusably slow with JLLWrapper-emitted @compiler_options
    #bindir = @get_scratch!("bin")
    bindir = abspath(first(Base.DEPOT_PATH), "scratchspaces", string(Base.PkgId(@__MODULE__).uuid), "bin")
    mkpath(bindir)
    function generate_wrapper_script(name, path, LIBPATH, PATH)
        if Sys.iswindows()
            LIBPATH_env = "PATH"
            LIBPATH_default = ""
            pathsep = ';'
        elseif Sys.isapple()
            LIBPATH_env = "DYLD_FALLBACK_LIBRARY_PATH"
            LIBPATH_default = "~/lib:/usr/local/lib:/lib:/usr/lib"
            pathsep = ':'
        else
            LIBPATH_env = "LD_LIBRARY_PATH"
            LIBPATH_default = ""
            pathsep = ':'
        end

        # XXX: cache, but invalidate when deps change
        script = joinpath(bindir, name)
        if Sys.isunix()
            open(script, "w") do io
                println(io, "#!/bin/bash")

                LIBPATH_base = get(ENV, LIBPATH_env, expanduser(LIBPATH_default))
                LIBPATH_value = if !isempty(LIBPATH_base)
                    string(LIBPATH, pathsep, LIBPATH_base)
                else
                    LIBPATH
                end
                println(io, "export $LIBPATH_env=\"$LIBPATH_value\"")

                if LIBPATH_env != "PATH"
                    PATH_base = get(ENV, "PATH", "")
                    PATH_value = if !isempty(PATH_base)
                        string(PATH, pathsep, ENV["PATH"])
                    else
                        PATH
                    end
                    println(io, "export PATH=\"$PATH_value\"")
                end

                println(io, "exec \"$path\" \"\$@\"")
            end
            chmod(script, 0o755)
        else
            error("Unsupported platform")
        end
        return script
    end
    ENV["POCL_PATH_SPIRV_LINK"] =
        generate_wrapper_script("spirv_link", SPIRV_Tools_jll.spirv_link_path,
                                SPIRV_Tools_jll.LIBPATH[], SPIRV_Tools_jll.PATH[])
    ENV["POCL_PATH_CLANG"] =
        generate_wrapper_script("clang", Clang_unified_jll.clang_path,
                                Clang_unified_jll.LIBPATH[], Clang_unified_jll.PATH[])
    ENV["POCL_PATH_LLVM_SPIRV"] =
        generate_wrapper_script("llvm-spirv",
                                SPIRV_LLVM_Translator_unified_jll.llvm_spirv_path,
                                SPIRV_LLVM_Translator_unified_jll.LIBPATH[],
                                SPIRV_LLVM_Translator_unified_jll.PATH[])
    ld_path = if Sys.islinux()
            LLD_unified_jll.ld_lld_path
        elseif Sys.isapple()
            LLD_unified_jll.ld64_lld_path
        elseif Sys.iswindows()
            LLD_unified_jll.lld_link_path
        else
            error("Unsupported platform")
        end
    ld_wrapper = generate_wrapper_script("lld", ld_path,
                                         LLD_unified_jll.LIBPATH[],
                                         LLD_unified_jll.PATH[])
    ENV["POCL_ARGS_CLANG"] = join([
            "-fuse-ld=lld", "--ld-path=$ld_wrapper",
            "-L" * joinpath(artifact_dir, "share", "lib")
        ], ";")

end  # __init__()
