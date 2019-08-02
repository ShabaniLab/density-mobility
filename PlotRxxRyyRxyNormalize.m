function PlotRxxRyyRxyNormalize(B, Rxx, Ryy, Rxy, sampleName, ...
                                linearRxyRangeBounds, textDataLocation)
    n = GetDensity(B, Rxy, linearRxyRangeBounds);
    [muXX, muYY] = GetMobility(B, Rxx, Ryy, n);
    zeroIdx = ZeroFieldIndex(B);
    % add density and mobility
    f = figure(123);
    hold on;
    title([sampleName ' with normalized R_{xx,yy} resistances']);
    xBounds = [min(B), max(B)];
    xlim(xBounds);
    xText = textDataLocation(1);
    yText = textDataLocation(2);
    n    = num2str(n, '%1.1e');
    muXX = num2str(muXX, '%1.1e');
    muYY = num2str(muYY, '%1.1e');
    info = sprintf(['n = ' n 'cm^{-2}\n\\mu_{xx} = ' muXX 'cm^2/Vs\n\\mu_{yy} = ' muYY 'cm^2/Vs\n']);
    text(xText, yText, info);
    plot(B, Rxx / Rxx(zeroIdx), 'k', 'DisplayName', 'R_{xx}');
    plot(B, Ryy / Ryy(zeroIdx) + 1, 'r', 'DisplayName', 'R_{yy}');
    plot(xBounds, [1, 1], 'Color', [.8, 0, 0], 'LineStyle', '--', ...
         'DisplayName', 'R_{yy} zero line');
    xlabel('B [T]');
    ylabel('R_{xx,yy} [normalized by R_{B=0}]');
    yyaxis right;
    plot(B, Rxy, 'DisplayName', 'R_{xy}');
    ylabel('R_{xy} [\Omega]');
    yyaxis left;
%     lgd = legend(gca,'show');
%     lgd.Location = 'best';

    output_dir = 'output/';
    MakeDir(output_dir);
    saveas(f, [output_dir sampleName '.jpg'], 'jpg');
    hold off;
end