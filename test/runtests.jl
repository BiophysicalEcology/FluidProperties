using Aqua, DataFrames, CSV, FluidProperties, Test, SafeTestsets, Unitful, UnitfulMoles

@testset "Aqua.jl quality assurance" begin
    Aqua.test_all(FluidProperties)
end

@testset "FluidProperties" begin
    elevation = 100.0u"m"
    @test atmospheric_pressure(elevation) == 100128.83927387102u"Pa"
end

@safetestset "dry_air, wet_air, water_properties" begin include("NMR_test.jl") end
