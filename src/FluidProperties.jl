module FluidProperties

using Unitful, UnitfulMoles

using PhysicalConstants.CODATA2022: g_n, σ, atm, R

using Unitful: ustrip, uconvert

export atmospheric_pressure, dry_air_properties, enthalpy_of_vaporisation
export vapour_pressure, water_properties, wet_air_properties

@compound H2O
@compound O2
@compound CO2
@compound N2

include("vapour_pressure.jl")
include("fluid_properties.jl")

function __init__()\
    Unitful.register(FluidProperties)
end

end
