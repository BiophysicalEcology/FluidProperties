module FluidProperties

function __init__()\
    Unitful.register(FluidProperties)
end

using Unitful, UnitfulMoles

using PhysicalConstants.CODATA2022: g_n, σ, atm, R

using Unitful: ustrip, uconvert

export vapour_pressure, wet_air, dry_air, get_pressure, get_λ_evap

include("fluid_properties.jl")

end
