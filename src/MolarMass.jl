function Mm(subName::String)
    try
        return molarMassData[subName]
    catch
        println("Cannot find $subName")
    end
end

function Mm()
    println("Availabel species are $(keys(molarMassData))")
end
