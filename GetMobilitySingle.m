function [mu] = GetMobilitySingle(B,R,n,geometricFactor)
    e = 1.602176e-19;
    R0 = GetZeroFieldResistance(B,R);
    rho0 = R0*geometricFactor;
    mu = (1/e/n)./rho0;
end