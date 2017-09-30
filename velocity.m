%Water particle velocity
clear all;
close all;

g = 9.81; %m/(s^2), the acceleration of gravity
H = 2; %Wave height, can be found
T = [5 10]; %5, 10 second waves
d = 3; %meters, water depth
z = 0; %zero for still water level
theta = 0;
[L,~,WaveNumber,AngularFrequency] = arrayfun(@(z) find_L_disper(d,z), T); %first number is water depth (m), second number is wave time (s)

%Horizontal water particle velocity
GTL = g.*T./L;
disp('GTL')
disp(GTL)
cosh2 = (cosh(2*pi*(z+d)./L))./(cosh(2*pi*d./L));
disp('cosh')
disp(GTL)
cosTheta = cos(theta);
WaveAmplitude = H/2;
disp('Wave Amplitude')
disp(WaveAmplitude)
u = WaveAmplitude.*GTL.*cosh2.*cosTheta;

%Vertical water perticle velocity
%identical portions of the equation are not recalculated
sinhcosh = (sinh(2*pi*(z+d)./L))./(cosh(2*pi*d./L));
disp('sinhcosh')
disp(sinhcosh)
sinTheta = sin(pi/2);
w = WaveAmplitude.*GTL.*sinhcosh.*cosTheta;



