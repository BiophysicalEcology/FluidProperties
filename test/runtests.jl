using Aqua
using FluidProperties
using Test
using Unitful

@testset "Aqua.jl quality assurance" begin
    Aqua.test_all(FluidProperties)
end

@testset "FluidProperties" begin
    elevation = 100.0u"m"
    @test get_pressure(elevation) == 100128.83927387102u"Pa"
    # TODO: test everything else
end
