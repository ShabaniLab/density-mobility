close all; clc; clear;
scan_number = '024';
folder_name = ['Scan_' scan_number '_images'];
if 7 == exist(folder_name, 'dir')
else
    mkdir(folder_name);
end
Data24 = readtable(['JS129A_JS139A.' scan_number '.txt'], 'HeaderLines', 6);
Data24 = table2array(Data24);

I = 50e-9;

B = Data24(:, 2);
YSR1 = Data24(:, 7) / I / 1000; % kOhm
YSR2 = Data24(:, 9) / I / 1000; % kOhm
YSR3 = Data24(:, 11) / I / 1000; % kOhm
YSR4 = Data24(:, 13) / I / 1000; % kOhm
YSR5 = Data24(:, 15) / I / 1000; % kOhm
YSR6 = Data24(:, 17) / I / 1000; % kOhm
YSR7 = Data24(:, 19) / I / 1000; % kOhm
YSR8 = Data24(:, 21) / I / 1000; % kOhm

% Plotting JS139A (Hallbar) data %
f1 = figure(1);
xlabel('B [T]');
hold on;
title('JS139A (Hallbar)');
cutoff = length(B);
plot(B(1 : cutoff), YSR1(1 : cutoff), 'k', 'DisplayName', 'R_{xx}');
cutoff = length(B);
plot(B(1 : cutoff), YSR2(1 : cutoff), 'r', 'DisplayName', 'R_{yy}');
ylabel('R_{xx/yy} [k\Omega]');
yyaxis right;
cutoff = length(B);
plot(B, -YSR7(1 : cutoff), 'DisplayName', 'R_{xy}');
ylabel('R_{xy} [k\Omega]');
lgd = legend(gca, 'show');
lgd.Location = 'northwest';
saveas(f1, [folder_name '/Scan_' scan_number '_JS139A_Hallbar.eps'], 'epsc');
saveas(f1, [folder_name '/Scan_' scan_number '_JS139A_Hallbar.jpg']);
hold off;

% Plotting JS139VDP1 (van der Pauw) data %
f2 = figure(2);
xlabel('B [T]');
hold on;
title('JS139VDP1 (van der Pauw)');
cutoff = 6787;
plot(B(1 : cutoff), -YSR3(1 : cutoff), 'k', 'DisplayName', 'R_{xy}');
ylabel('R_{xy} [k\Omega]');
lgd = legend(gca, 'show');
lgd.Location = 'northwest';
saveas(f2, [folder_name '/Scan_' scan_number '_JS139VPD1_VDP.eps'], 'epsc');
saveas(f2, [folder_name '/Scan_' scan_number '_JS139VPD1_VDP.jpg']);
hold off;

% Plotting JS129A (Hallbar) data %
f3 = figure(3);
xlabel('B [T]');
hold on;
title('JS129A (Hallbar)');
cutoff = length(B);
plot(B(1 : cutoff), YSR5(1 : cutoff), 'k', 'DisplayName', 'R_{xx}');
plot(B(1 : cutoff), YSR4(1 : cutoff), 'r', 'DisplayName', 'R_{yy}');
ylabel('R_{xx/yy} [k\Omega]');
yyaxis right;
plot(B(1 : cutoff), -YSR8(1 : cutoff), 'DisplayName', 'R_{xy}');
ylabel('R_{xy} [k\Omega]');
lgd = legend(gca, 'show');
lgd.Location = 'northwest';
saveas(f3, [folder_name '/Scan_' scan_number '_JS129HB1_Hallbar.eps'], 'epsc');
saveas(f3, [folder_name '/Scan_' scan_number '_JS129HB1_Hallbar.jpg']);
hold off;

% Plotting JS129VDP1 (van der Pauw) data %
f4 = figure(4);
xlabel('B [T]');
hold on;
title('JS129VDP1 (van der Pauw)');
cutoff = length(B);
plot(B(1 : cutoff), -YSR6(1 : cutoff), 'k', 'DisplayName', 'R_{xy}');
ylabel('R_{xy} [k\Omega]');
lgd = legend(gca, 'show');
lgd.Location = 'northwest';
saveas(f4, [folder_name '/Scan_' scan_number '_JS129VPD1_VDP.eps'], 'epsc');
saveas(f4, [folder_name '/Scan_' scan_number '_JS129VPD1_VDP.jpg']);
hold off;