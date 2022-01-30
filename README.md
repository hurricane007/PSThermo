# PSThermo
# PSThermo.jl
This is a simple package to calculate the thermo properties of pure substances.
Data are from nist webBook (http://webbook.nist.gov/)
## method

Heat capacity, Enthalpy, Entropy are calculated by

    Cp° = (A + B*t + C*t2 + D*t3 + E/t2)*1E-3

    H° − H°298.15= A*t + B*t2/2 + C*t3/3 + D*t4/4 − E/t + F − H

    S° = A*ln(t) + B*t + C*t2/2 + D*t3/3 − E/(2*t2) + G

    Cp = heat capacity (KJ/mol*K)

    H° = standard enthalpy (kJ/mol)

    S° = standard entropy (J/mol*K)

    t = temperature (K) / 1000.
