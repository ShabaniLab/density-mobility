function [n] = ZeroFieldIndex(B)
    [~, n] = min(abs(B));
end