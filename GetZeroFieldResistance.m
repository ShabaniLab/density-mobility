function [R0] = GetZeroFieldResistance(B,R)
    R0 = R(ZeroFieldIndex(B));
end