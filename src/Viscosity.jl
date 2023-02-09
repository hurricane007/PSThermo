function Viscosity(subName::String, Temp::Real)
    try
        Trange = viscosityData["Temp"]
        coeff = viscosityData[subName]
        loc = findlast(x -> x<=Temp, Trange)
        if isnothing(loc)
            printstyled(color=:red,@sprintf("T = %0.3goC out fo range .\n",Temp))
            return NaN
        elseif loc == length(Trange)
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

function getViscosityData(subName::String)
    try
        Trange = viscosityData["Temp"]
        viscovisity_array = viscosityData[subName]
        return Trange, viscovisity_array
    catch
        printstyled(color=:red,@sprintf("%s not found in database.\n",subName))
        return NaN
    end
end
    
function getViscosityData()
    println(keys(viscosityData))
end
