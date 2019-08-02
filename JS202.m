close all; clc;clear all;

% sample name
sampleName = 'JS202';

dataXX = load([sampleName '_xx.mat']);
dataXX = dataXX.Data;
dataYY = load([sampleName '_yy.mat']);
dataYY = dataYY.Data;
dataXY = load([sampleName '_xy.mat']);
dataXY = dataXY.Data;

x_xx = dataXX.cX;
y_xx = dataXX.cY;
x_yy = dataYY.cX;
y_yy = dataYY.cY;
x_xy = dataXY.cX;
y_xy = dataXY.cY;

% Current used to take the data
I = 1e-9;

% ensure all the Data is oriented with B at the low value as the first
% point and B at the high value at the last point
B   = x_xx{1};
Rxx = -(y_xx{1}/I);
Ryy = fliplr(y_yy{1}/I);
Rxy = fliplr(y_xy{1}/I);

% Uncomment the two lines below variable definition to decide these bounds
linearFitRange = [900 3000];
% PlotLinearFit(B,Rxy,linearFitRange)
% return

% Location of density and mobility numbers
% [x y] coordinate in units of the data
% plot once and iterate to find a nice location (text is centered
% vertically, but aligned left horizontally)
% ...All is for the plot with Rxx,Ryy,Rxy
% ...XX  is for the plot with Rxx,Rxy
% ...YY  is for the plot with Ryy,Rxy
textInfoLocationAll = [0 200];
textInfoLocationXX  = [0 100];
textInfoLocationYY  = [0 300];

% Geometric factor (.75 for our L-shaped hallbar, 4.5 for van Der Pauw)
geometricFactor = 4.5;

PlotAll(B,Rxx,Ryy,Rxy,geometricFactor,sampleName,linearFitRange,...
       textInfoLocationAll,textInfoLocationXX,textInfoLocationYY);