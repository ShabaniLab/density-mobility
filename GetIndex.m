function [n] = GetIndex(x, x0)
    [~, n] = min(abs(x - x0));
end