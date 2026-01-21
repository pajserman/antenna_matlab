clear; clc;

dataH = readtable('group11_Ant2_Hpol_2.4GHz.csv');
dataH.ScanAxis = deg2rad(dataH.ScanAxis);
dataH.Amplitude  = dataH.Amplitude + 50;

dataV = readtable('group11_Ant2_Vpol_2.4GHz.csv');
dataV.ScanAxis = deg2rad(dataV.ScanAxis);
dataV.Amplitude  = dataV.Amplitude + 50;

dataH.Amplitude = 10.^(dataH.Amplitude/10);
dataV.Amplitude = 10.^(dataV.Amplitude/10);

dataH.Amplitude = dataH.Amplitude + flip(dataV.Amplitude);

out  = dataH.Amplitude(61:181,1)./dataH.Amplitude(307:427,1);


figure;
plot(dataH.ScanAxis(61:181), 10*log10(out));


data.gain = dataH.Amplitude(61:181,1) + dataH.Amplitude(307:427,1);

figure;
plot(dataH.ScanAxis(61:181), 10*log(data.gain))



figure;
polarplot(dataH.ScanAxis(61:181), 10*log(data.gain))
rlim([-20, 5]);
thetalim([-90, 90]);
ax = gca;
ax.ThetaZeroLocation = 'top';
ax.ThetaDir = 'clockwise'; % Or 'counterclockwise' depending on your setup

