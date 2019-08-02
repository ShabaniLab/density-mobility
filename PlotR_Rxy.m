function [f] = PlotR_Rxy(B, R, Rxy, geometricFactor, sampleName, ...
                         linearRxyRangeBounds, textDataLocation, ...
                         directionName)
    [scaleXX, scalePrefixXX] = GetScale(max(R));
    [scaleXY, scalePrefixXY] = GetScale(max(Rxy));
    n = GetDensity(B, Rxy, linearRxyRangeBounds);
    mu = GetMobilitySingle(B, R, n, geometricFactor);
    % add density and mobility
    f = figure();
    hold on;
    title(sampleName);
    xlim([min(B), max(B)]);
    xText = textDataLocation(1);
    yText = textDataLocation(2);
    n  = num2str(n, '%1.1e');
    mu = num2str(mu, '%1.1e');
    info = sprintf(['n = ' n 'cm^{-2}\n\\mu_{' directionName '} = ' mu 'cm^2/Vs']);
    text(xText, yText / scaleXX, info);
    plot(B, R / scaleXX, 'k', 'DisplayName', ['R_{' directionName '}']);
    xlabel('B [T]');
    ylabel(['R_{' directionName '} [' scalePrefixXX '\Omega]']);
    yyaxis right;
    plot(B, Rxy / scaleXY, 'DisplayName', 'R_{xy}');
    ylabel(['R_{xy} [' scalePrefixXY '\Omega]']);
    hold off;
    saveas(f, [sampleName '_' directionName '.jpg'], 'jpg');
    saveas(f, [sampleName '_' directionName '.eps'], 'eps');
end