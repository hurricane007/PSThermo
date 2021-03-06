# return the entropy of substance, [kJ/mol*K]
function SolidsEntropy(subName::String, Temp::Real)
    try
        Trange, coeff = solidThermoData[subName]
        if Temp > Trange[end] || Temp < Trange[1]
            printstyled(color=:red,
                @sprintf("For %s, %4.4f K is out of range, %4.2f K - %4.2f K \n",
                subName, Temp, Trange[1], Trange[end]))
            return NaN
        else
            T = Temp*1E-3
            loc = findlast(x -> x<=Temp, Trange)
            return sum( [log(T), T, T^2/2, T^3/3, -1/(2*T^2), 0, 1, 0] .* coeff[loc,:])*1E-3
        end
    catch
        printstyled(color=:red,@sprintf("%s not found in database.\n",subName))
        return NaN
    end
end

function SolidsEntropy()
    println("Availabel solids are $(keys(solidThermoData))")
end
