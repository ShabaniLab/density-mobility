function [f] = PlotRxxRyyRxy(B, Rxx, Ryy, Rxy, geometricFactor, ...
                             sampleName, linearRxyRangeBounds, ...
                             textDataLocation)
    [scaleXX, scalePrefixXX] = GetScale(max(max(Rxx), max(Ryy)));
    [scaleXY, scalePrefixXY] = GetScale(max(Rxy));
    n = GetDensity(B, Rxy, linearRxyRangeBounds);
%     GetDensity(B, Rxy, linearRxyRangeBounds);
    [muXX, muYY] = GetMobility(B, Rxx, Ryy, n, geometricFactor);
    % add density and mobility
    f = figure();
    hold on;
    title(sampleName);
    xlim([min(B), max(B)]);
    xText = textDataLocation(1);
    yText = textDataLocation(2);
    n    = num2str(n, '%1.1e');
    muXX = num2str(muXX, '%1.1e');
    muYY = num2str(muYY, '%1.1e');
    info = sprintf(['n = ' n 'cm^{-2}\n\\mu_{xx} = ' muXX 'cm^2/Vs\n\\mu_{yy} = ' muYY 'cm^2/Vs\n']);
    text(xText, yText / scaleXX, info);
    p1 = plot(B, Rxx / scaleXX, 'k', 'DisplayName', 'R_{xx}');
    p2 = plot(B, Ryy / scaleXX, 'r', 'DisplayName', 'R_{yy}');
    xlabel('B [T]');
    ylabel(['R_{xx,yy} [' scalePrefixXX '\Omega]']);
    yyaxis right;
    p3 = plot(B, Rxy / scaleXY, 'DisplayName', 'R_{xy}');
    ylabel(['R_{xy} [' scalePrefixXY '\Omega]']);
    yyaxis left;
    lgd = legend([p1, p2, p3], {'R_{xx}', 'R_{yy}', 'R_{xy}'});
    lgd.Location = 'best';
    saveas(f, [sampleName '.jpg'], 'jpg');
    saveas(f, [sampleName '.eps'], 'eps');
    hold off;
end