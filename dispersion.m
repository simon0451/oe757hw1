clear all;
close all;

Depth = 200:-1:2; %depth ranges from 200 m to 2.5m
WaveTimeShort = 5; %seconds, period of wave, T
WaveTimeMedium = 10; %seconds, period of wave, T
WaveTimeLong = 15; %seconds, period of wave, T

[WavelengthShort,~,WaveNumberShort,AngularFrequencyShort] = arrayfun(@(z) find_L_disper(z,WaveTimeShort), Depth); %first number is water depth (m), second number is wave time (s)
[WavelengthMedium,~,WaveNumberMedium,AngularFrequencyMedium] = arrayfun(@(z) find_L_disper(z,WaveTimeMedium), Depth); %first number is water depth (m), second number is wave time (s)
[WavelengthLong,~,WaveNumberLong,AngularFrequencyLong] = arrayfun(@(z) find_L_disper(z,WaveTimeLong), Depth); %first number is water depth (m), second number is wave time (s)

CelerityShort = WavelengthShort/WaveTimeShort;
CelerityMedium = WavelengthMedium/WaveTimeMedium;
CelerityLong = WavelengthLong/WaveTimeLong;

wt = num2str(WaveTimeMedium);
text = strcat('Wave Period: ',wt,' s');

figure (1)
plot(Depth,WavelengthShort,Depth,WavelengthMedium,Depth,WavelengthLong)
title('Wavelength as a Function of Water Depth for Constant Period Waves')
legend ('Period: 5 s','Period: 10 s','Period: 15 s','location','northwest')
xlabel('Depth (m)')
ylabel('Wavelength (m)')
grid on

figure (2)
plot(Depth,CelerityShort,Depth,CelerityMedium,Depth,CelerityLong)
title('Celerity as a Function of Water Depth for Constant Period Waves')
legend ('Period: 5 s','Period: 10 s','Period: 15 s','location','northwest')
xlabel('Depth (m)')
ylabel('Celerity (m/s)')
grid on



