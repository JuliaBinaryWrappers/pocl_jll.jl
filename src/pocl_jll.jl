# Use baremodule to shave off a few KB from the serialized `.ji` file
baremodule pocl_jll
using Base
using Base: UUID
using LazyArtifacts
Base.include(@__MODULE__, joinpath("..", ".pkg", "platform_augmentation.jl"))
import JLLWrappers

JLLWrappers.@generate_main_file_header("pocl")
JLLWrappers.@generate_main_file("pocl", UUID("627d6b7a-bbe6-5189-83e7-98cc0a5aeadd"))
end  # module pocl_jll
