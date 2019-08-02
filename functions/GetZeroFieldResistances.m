function [R0_xx, R0_yy] = GetZeroFieldResistances(B, Rxx, Ryy)
    n = ZeroFieldIndex(B);
    R0_xx = Rxx(n);
    R0_yy = Ryy(n);
end