function PlotAll(B,Rxx,Ryy,Rxy,geometricFactor,sampleName,linearFitRange,textInfoLocationAll,textInfoLocationXX,textInfoLocationYY)
    PlotRxxRyyRxy(B,Rxx,Ryy,Rxy,geometricFactor,sampleName,linearFitRange,textInfoLocationAll);
    PlotR_Rxy(B,Rxx,Rxy,geometricFactor,sampleName,linearFitRange,textInfoLocationXX,'xx');
    PlotR_Rxy(B,Ryy,Rxy,geometricFactor,sampleName,linearFitRange,textInfoLocationYY,'yy');
end
