function Viscosity(subName::String, Temp::Real)
    try
        Trange = viscosityData["Temp"]
        coeff = viscosityData[subName]
        loc = findlast(x -> x<=Temp, Trange)
        if loc == length(Trange)
            return coeff[loc] + (Temp-Trange[loc])*(coeff[loc]-coeff[loc-1])/
                (Trange[loc]-Trange[loc-1])
        else
            return coeff[loc]+ (Temp-Trange[loc])*(coeff[loc+1]-coeff[loc])/
                (Trange[loc+1]-Trange[loc])
        end
    catch
        printstyled(color=:red,@sprintf("%s not found in database.\n",subName))
        return NaN
    end
end

function Viscosity()
    println(keys(viscosityData))
end
