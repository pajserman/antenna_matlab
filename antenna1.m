clear; clc;

dataH = readtable('group11_Ant1_Hpol_2.441GHz.csv');
dataH.ScanAxis = deg2rad(dataH.ScanAxis);
dataH.Amplitude  = dataH.Amplitude + 50;

dataV = readtable('group11_Ant1_Vpol_2.441GHz.csv');
dataV.ScanAxis = deg2rad(dataV.ScanAxis);
dataV.Amplitude  = dataV.Amplitude + 50;

dataH.Amplitude = 10.^(dataH.Amplitude/10);
dataV.Amplitude = 10.^(dataV.Amplitude/10);

dataH.Amplitude = dataH.Amplitude + flip(dataV.Amplitude);


dataH.Amplitude = 10 * log10(dataH.Amplitude);


figure;
% plot(dataH.ScanAxis, dataH.Amplitude);
plot(dataH.ScanAxis(307:427,1), dataH.Amplitude(307:427,1))
hold on;
plot(dataH.ScanAxis(61:181,1), dataH.Amplitude(61:181,1))
legend('E-plane','H-plane')


figure;
polarplot(dataH.ScanAxis(307:427,1), dataH.Amplitude(307:427,1))
hold on;
polarplot(dataH.ScanAxis(61:181,1), dataH.Amplitude(61:181,1))
rlim([-50, 12]);
thetalim([-90, 90]);
legend('E-plane','H-plane')
ax = gca;
ax.ThetaZeroLocation = 'top';
ax.ThetaDir = 'clockwise'; % Or 'counterclockwise' depending on your setup

