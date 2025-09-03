module FluidProperties

function __init__()\
    Unitful.register(FluidProperties)
end

using Unitful, UnitfulMoles

using Unitful: °, rad, °C#, K, Pa, kPa, MPa, J, kJ, W, L, g, kg, cm, m, s, hr, d, mol, mmol, μmol, σ, R

export vapour_pressure, wet_air, dry_air, get_pressure, get_λ_evap, water_prop

include("fluid_properties.jl")

end
