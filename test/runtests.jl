using Aqua
using FluidProperties
using Test
using Unitful

Aqua.test_all(FluidProperties)

@testset "FluidProperties" begin
    elevation = 100.0u"m"
    @test get_pressure(elevation) == 100128.83927387102u"Pa"
    # TODO: test everything else
end
