function [R0] = GetMinimumZeroFieldResistance(B,Rxx,Ryy)
    n = ZeroFieldIndex(B);
    R0 = min(Rxx(n+1),Ryy(n+1));
end