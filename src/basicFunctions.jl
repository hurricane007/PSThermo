
"return the heat capacity of substance, kJ/mol*K"
function CpNIST(T, p)
    return (p[1] + p[2]*T+p[3]*T^2+p[4]*T^3+p[5]/T^2)*1E-3
end

"return the enthalpy of substance, '[KJ/mol]"
function EnthalpyNIST(T, p)
    p[1]*T + p[2]*T^2/2+p[3]*T^3/3 + p[4]*T^4/4 -p[5]/T + p[6]
end

" return the entropy of substance, [kJ/mol*K]"
function EntropyNIST(T, p)
    return (p[1]*log(T)+p[2]*T+p[3]*t^2/2+p[4]*T^3/3-p[5]/2/T^2+p[7])*1E-3
end
