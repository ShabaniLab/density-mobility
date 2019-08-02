function [n] = GetDensity(B, rxy, cutoffs)
    if B(1) > B(length(B))
        B   = fliplr(B);
        rxy = fliplr(B);
    end
    cutoffLow  = cutoffs(1);
    cutoffHigh = cutoffs(2);
    X = B(cutoffLow : cutoffHigh);
    Y = rxy(cutoffLow : cutoffHigh);
    e = 1.602176e-19;
    p = polyfit(X, Y, 1);
    n = 1 / p(1) / e / 1e4; % cm^-2
end