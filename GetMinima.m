function minima = GetMinima(R,bounds)
    minima = zeros(1,length(bounds)-1);
    for i = 0 : length(bounds)-1
        minima(i) = min(R(bounds(i):bounds(i+1)));
    end
end