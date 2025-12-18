clear; clc;

dataH = readtable('group11_Ant2_Hpol_2.4GHz.csv');
dataH.ScanAxis = deg2rad(dataH.ScanAxis);
dataH.Amplitude  = dataH.Amplitude + 50 + 5.15;

dataV = readtable('group11_Ant2_Vpol_2.4GHz.csv');
dataV.ScanAxis = deg2rad(dataV.ScanAxis);
dataV.Amplitude  = dataV.Amplitude + 50 + 5.15;

dataH.Amplitude = 10.^(dataH.Amplitude/10);
dataV.Amplitude = 10.^(dataV.Amplitude/10);

dataH.Amplitude = dataH.Amplitude + flip(dataV.Amplitude);

out  = dataH.Amplitude(61:181,1)./dataH.Amplitude(307:427,1);

figure;
plot(dataH.ScanAxis(61:181), 10*log10(out));

dataH.Amplitude = 10 * log10(dataH.Amplitude);


figure;
polarplot(dataH.ScanAxis, dataH.Amplitude)
rlim([-50, 5]);
thetalim([-90, 90]);
ax = gca;
ax.ThetaZeroLocation = 'top';
ax.ThetaDir = 'clockwise'; % Or 'counterclockwise' depending on your setup

