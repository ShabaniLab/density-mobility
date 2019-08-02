function [scaleFactor, scalePrefix] = GetScale(x)
    scale = floor(log10(x)/3);
    scaleFactor = 10^(3*scale);        
    if scale == 0
        scalePrefix = '';
    elseif scale > 0
        scalePrefix = ['k','M','G','T'];
        scalePrefix = scalePrefix(scale);
    else
        scalePrefix = ['m','\mu','n','p'];
        scalePrefix = scalePrefix(abs(scale));
    end
end
