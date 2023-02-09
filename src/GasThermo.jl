# Thermodynamic data of gas

"return the enthalpy of substance, '[KJ/mol]"
function GasEnthalpy(subName::String, Temp::Real)
    try
        Trange, coeff = gasThermoData[subName]
        if Temp > Trange[end] || Temp < Trange[1]
            printstyled(color=:red,
                @sprintf("%4.4f K is out of range, %4.2f K - %4.2f K \n",
                Temp, Trange[1], Trange[end]))
            return NaN
        else
            T = Temp*1E-3
            loc = findlast(x -> x<=Temp, Trange)
            return EnthalpyNIST(T, coeff[loc,:]) 
            # return sum( [T, T^2/2, T^3/3, T^4/4, -1/T, 1, 0, -1] .* coeff[loc,:]) + coeff[loc, end]
        end
    catch
        printstyled(color=:red,@sprintf("%s not found in database.\n",subName))
        return NaN
    end
end

function GasEnthalpy()
    println("Availabel gases are $(keys(gasThermoData))")
end

function EnthalpyNIST(T, p)
    p[1]*T + p[2]*T^2/2+p[3]*T^3/3 + p[4]*T^4/4 -p[5]/T + p[6]
end

" return the entropy of substance, [kJ/mol*K]"
function GasEntropy(subName::String, Temp::Real)
    try
        Trange, coeff = gasThermoData[subName]
        if Temp > Trange[end] || Temp < Trange[1]
            printstyled(color=:red,
                @sprintf("%4.4f K is out of range, %4.2f K - %4.2f K \n",
                Temp, Trange[1], Trange[end]))
            return NaN
        else
            T = Temp*1E-3
            loc = findlast(x -> x<=Temp, Trange)
            return EntropyNIST(T, coeff[loc,:]) 
            # return sum( [log(T), T, T^2/2, T^3/3, -1/(2*T^2), 0, 1, 0] .* coeff[loc,:])*1E-3
        end
    catch
        printstyled(color=:red,@sprintf("%s not found in database.\n",subName))
        return NaN
    end
end

function GasEntropy()
    println("Availabel gases are $(keys(gasThermoData))")
end

function EntropyNIST(T, p)
    return p[1]*log(T)+p[2]*T+p[3]*t^2/2+p[4]*T^3/3-p[5]/2/T^2+p[7]
end

"return the heat capacity of substance, kJ/mol*K"

function GasCp(subName::String, Temp::Real)
    try
        Trange, coeff = gasThermoData[subName]
        if Temp > Trange[end] || Temp < Trange[1]
            printstyled(color=:red,
                @sprintf("%4.4f K is out of range, %4.2f K - %4.2f K \n",
                Temp, Trange[1], Trange[end]))
            return NaN
        else
            T = Temp*1E-3
            loc = findlast(x -> x<=Temp, Trange)
            return CpNIST(T, coeff[loc,:]) 
            # return sum( [1, T, T^2, T^3, 1/T^2, 0, 0, 0] .* coeff[loc,:])*1E-3
        end
    catch
        printstyled(color=:red,@sprintf("%s not found in database.\n",subName))
        return NaN
    end
end

function GasCp()
    println("Availabel gases are $(keys(gasThermoData))")
end

function CpNIST(T, p)
    return p[1] + p[2]*T+p[3]*T^2+p[4]*T^3+p[5]/T^2
end
