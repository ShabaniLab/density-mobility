function [n] = PlotLinearFit(x, y, cutoffs)
    cutoffStart = cutoffs(1);
    cutoffEnd   = cutoffs(2);
    
    x = x(cutoffStart : cutoffEnd);
    y = y(cutoffStart : cutoffEnd);
    
    e = 1.602176e-19;
    p = polyfit(x, y, 1);
    n = 1 / p(1) / e;
    
    X = linspace(min(x), max(x), length(x));
    Y = p(1) * X + p(2);
    
    figure(100);
    hold on;
    plot(x, y, 'r');
    plot(X, Y, 'k--');
    l = length(x);
    xlim([x(1), x(l)]);
    legend('data', 'fit', 'Location', 'best');
    hold off;
end