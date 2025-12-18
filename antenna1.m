dataH = readtable('group11_Ant1_Hpol_2.441GHz.csv');

dataH.ScanAxis = deg2rad(dataH.ScanAxis);
dataH.Amplitude  = dataH.Amplitude + 50 + 5.15;

dataV = readtable('group11_Ant1_Vpol_2.441GHz.csv');

dataV.ScanAxis = deg2rad(dataV.ScanAxis);
dataV.Amplitude  = dataV.Amplitude + 50 + 5.15;


figure;
polarplot(dataH.ScanAxis, dataH.Amplitude)
rlim([-50,10]);
thetalim([-90, 90]);
ax = gca;
ax.ThetaZeroLocation = 'top';
ax.ThetaDir = 'clockwise'; % Or 'counterclockwise' depending on your setup

% figure;
% polarplot(dataV.ScanAxis, dataV.Amplitude)
% rlim([-50, 5]);
% thetalim([-90, 90]);
% ax = gca;
% ax.ThetaZeroLocation = 'top';
% ax.ThetaDir = 'clockwise'; % Or 'counterclockwise' depending on your setup

