function [n] = GetMinimumIndexInRange(x, y, x0, x1)
    a = GetIndex(x, x0);
    b = GetIndex(x, x1);
    
    [miny, n] = min(y(a : b));
    n = a + n;
end