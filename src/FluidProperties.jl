module FluidProperties

using Unitful, UnitfulMoles

using Unitful: ustrip, uconvert

export vapour_pressure, wet_air, dry_air, get_pressure, get_λ_evap

@compound H2O
@compound O2
@compound CO2
@compound N2

include("vapor_pressure.jl")
include("fluid_properties.jl")

function __init__()\
    Unitful.register(FluidProperties)
end

end
