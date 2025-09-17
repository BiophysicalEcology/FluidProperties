abstract type VaporPressureEquation end

"""
    Tetens <: VaporPressureEquation

Tetens equations for [`vapor_pressure`](@ref).

Low accuracy but very fast, with only a single `exp` call.
"""
struct Teten <: VaporPressureEquation end

function vapor_pressure(::Teten, T)
    Tc = ustrip(u"°C", T)
    return 6.1078 * exp((17.269 * Tc) / (237.3 + Tc)) * 100u"Pa"
end

"""
    GoffGratch <: VaporPressureEquation

Widely used Goff-Gratch equations for [`vapor_pressure`](@ref).
"""
struct GoffGratch <: VaporPressureEquation end

function vapor_pressure(::GoffGratch, T)
    Tc = ustrip(u"°C", T)
    T = ustrip(u"K", T) + 0.01 # triple point of water is 273.16
    if T <= 273.16
        # TODO name some of these magic numbers
        logP_vap = -9.09718 * (273.16 / T - 1) + 
                    -3.56654 * log10(273.16 / T) + 
                    0.876793 * (1 - T / 273.16) + 
                    log10(6.1071)
    else
        logP_vap = -7.90298 * (373.16 / T - 1) + 
                    5.02808 * log10(373.16 / T) +
                    -1.3816E-07 * (exp10(11.344 * (1 - T / 373.16)) - 1) + 
                    8.1328E-03 * (exp10(-3.49149 * (373.16 / T - 1)) - 1) + 
                    log10(1013.246)
    end
    # Note: exp10 is faster than 10^x
    result = exp10(logP_vap) * 100u"Pa"

    return  result
end

"""
    Huang <: VaporPressureEquation

Huang (2018) equations for [`vapor_pressure`](@ref).

High accuracy from -100 to 100 °C and reasonable performance.
"""
struct Huang <: VaporPressureEquation end

function vapor_pressure(::Huang, Tk)
    t = ustrip(u"°C", Tk)
    if t > 0.0
        # Huang (2018), water over liquid surface
        return exp((34.494 - 4924.99 / (t + 237.1)) / ((t + 105.0)^1.57)) * 100u"Pa"
    else
        # Huang (2018), water over ice surface
        return exp((43.494 - 6545.8 / (t + 278.0)) / ((t + 868.0)^2)) * 100u"Pa"
    end
end

"""
    vapor_pressure(T)
    vapor_pressure(formulation, T)

Calculates saturation vapor pressure (Pa) for a given air temperature.

# Arguments
- `T`: air temperature in K.

The `GoffGratch` formulation is used by default.
"""
vapor_pressure(Tk) = vapor_pressure(Huang(), Tk)


