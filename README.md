# `pocl_jll.jl` (v6.0.0+4)

[![deps](https://juliahub.com/docs/pocl_jll/deps.svg)](https://juliahub.com/ui/Packages/General/pocl_jll/)

This is an autogenerated package constructed using [`BinaryBuilder.jl`](https://github.com/JuliaPackaging/BinaryBuilder.jl).

The originating [`build_tarballs.jl`](https://github.com/JuliaPackaging/Yggdrasil/blob/c883c8b5cc5a798865a5ccd510aca451a0c50bb9/P/pocl/build_tarballs.jl) script can be found on [`Yggdrasil`](https://github.com/JuliaPackaging/Yggdrasil/), the community build tree.

## Bug Reports

If you have any issue, please report it to the Yggdrasil [bug tracker](https://github.com/JuliaPackaging/Yggdrasil/issues).

## Documentation

For more details about JLL packages and how to use them, see `BinaryBuilder.jl` [documentation](https://docs.binarybuilder.org/stable/jll/).

## Sources

The tarballs for `pocl_jll.jl` have been built from these sources:

* files in directory, relative to originating `build_tarballs.jl`: [`./bundled`](https://github.com/JuliaPackaging/Yggdrasil/tree/c883c8b5cc5a798865a5ccd510aca451a0c50bb9/P/pocl/bundled)
* git repository: https://github.com/pocl/pocl (revision: `952bc559f790e5deb5ae48692c4a19619b53fcdc`)

## Platforms

`pocl_jll.jl` is available for the following platforms:

* `FreeBSD x86_64 {llvm_version=18.asserts}` (`x86_64-unknown-freebsd-llvm_version+18.asserts`)

## Dependencies

The following JLL packages are required by `pocl_jll.jl`:

* [`Clang_unified_jll`](https://github.com/JuliaBinaryWrappers/Clang_unified_jll.jl)
* [`Hwloc_jll`](https://github.com/JuliaBinaryWrappers/Hwloc_jll.jl)
* [`OpenCL_jll`](https://github.com/JuliaBinaryWrappers/OpenCL_jll.jl)
* [`SPIRV_LLVM_Translator_unified_jll`](https://github.com/JuliaBinaryWrappers/SPIRV_LLVM_Translator_unified_jll.jl)
* [`SPIRV_Tools_jll`](https://github.com/JuliaBinaryWrappers/SPIRV_Tools_jll.jl)

## Products

The code bindings within this package are autogenerated from the following `Products`:

* `LibraryProduct`: `libpocl`
* `ExecutableProduct`: `poclcc`
