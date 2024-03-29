close all; clc; clear all;

% path to the directory containing the data files
dataDir = '';

% common prefix of the data filenames
prefix = '';

% name of the sample to be used in the plot titles
sampleName = '';

dataXX = load([dataDir prefix '_xx.mat']);
dataXX = dataXX.Data;
dataYY = load([dataDir prefix '_yy.mat']);
dataYY = dataYY.Data;
dataXY = load([dataDir prefix '_xy.mat']);
dataXY = dataXY.Data;

x_xx = dataXX.cX;
y_xx = dataXX.cY;
x_yy = dataYY.cX;
y_yy = dataYY.cY;
x_xy = dataXY.cX;
y_xy = dataXY.cY;

% lockin current (in Amperes) used to take the data
I = 0;

% depending on the direction of the field sweep, use fliplr() to ensure
% data is oriented with R(min(B)) as the first point and R(max(B)) as the
% last point
B   = x_xx{1};
Rxx = (y_xx{1} / I);
Ryy = (y_yy{1} / I);
Rxy = (y_xy{1} / I);

% Uncomment the two lines below variable definition to decide these bounds
linearFitRange = [140, 1000];
PlotLinearFit(B, Rxy, linearFitRange)
% return

% Location of density and mobility numbers
% [x, y] coordinate in units of the data
% plot once and iterate to find a nice location (text is centered
% vertically, but aligned left horizontally)
% ...All is for the plot with Rxx, Ryy, Rxy
% ...XX  is for the plot with Rxx, Rxy
% ...YY  is for the plot with Ryy, Rxy
textInfoLocationAll = [1, max(Rxx) - ((max(Rxx) - min(Rxx)) / 10)];
textInfoLocationXX  = [1, max(Rxx) - ((max(Rxx) - min(Rxx)) / 10)];
textInfoLocationYY  = [1, max(Ryy) - ((max(Ryy) - min(Ryy)) / 10)];

% this should be .75 for our L-shaped hallbar, or 4.5 for van der Pauw
geometricFactor = 0;

PlotAll(B, Rxx, Ryy, Rxy, geometricFactor, sampleName, linearFitRange, ...
        textInfoLocationAll, textInfoLocationXX, textInfoLocationYY);