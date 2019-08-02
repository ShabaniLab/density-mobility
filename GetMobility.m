function [muXX, muYY] = GetMobility(B, Rxx, Ryy, n, geometricFactor)
    e = 1.602176e-19;
    [R0_xx, R0_yy] = GetZeroFieldResistances(B, Rxx, Ryy);
    R0 = [R0_xx, R0_yy];
    rho0 = R0 * geometricFactor;
    mu = (1 / e / n) ./ rho0;
    muXX = mu(1);
    muYY = mu(2);
end