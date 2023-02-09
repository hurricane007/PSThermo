module PSThermo
    import Printf.@sprintf
    include("data.jl")
    include("basicFunctions.jl")
    include("SolidThermo.jl")
    include("GasThermo.jl")
    include("MolarMass.jl")
    include("Viscosity.jl")
    export GasEntropy, GasEnthalpy, GasCp, Viscosity
    export SolidsCp, SolidsEntropy, SolidsEnthalpy
end # module
