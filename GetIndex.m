function [n] = GetIndex(x,x0)
    [xmin,n] = min(abs(x-x0));
end