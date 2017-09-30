%Determine velocity and pressure for for 5 sec and 10 sec waves in water 
%depths of 3 m and 20 m.  In all cases, you may assume the wave height is 2 m. 
%Plot a 20 second time series at the free surface (z=0), midway through the water column  
%(z=-d/2) and at the seafloor (z=-d) for the following variables: horizontal velocity, vertical velocity, pressure
clear all;
close all;

%Constants and prescribed parameters
g = 9.81; %m/(s^2), the acceleration of gravity
Depth = [3 20]; %meters, water depth
Period = [5 10]; %seconds, wave period
WaveHeight = 2; %meters, wave height measured trough to peak
WaveAmplitude = WaveHeight/2; %meters, wave amplitude
z = [0 -Depth/2 -Depth]; %vertical position of "measurement point"
time = linspace(0,20); %seconds, time series to make plot over
costheta5 = cos(linspace(0,8*pi));
costheta10 = cos(linspace(0,4*pi));
sintheta5 = sin(linspace(0,8*pi));
sintheta10 = sin(linspace(0,4*pi));
rho = 1027; %kg/m^3 the density of sea water

%solving for wavelengths - both depths, one wave period at a time
[WaveLength5,~,WaveNumber5,AngularFrequency5] = arrayfun(@(z) find_L_disper(z,Period(1)), Depth); %first number is water depth (m), second number is wave time (s)
[WaveLength10,~,WaveNumber10,AngularFrequency10] = arrayfun(@(z) find_L_disper(z,Period(2)), Depth); %first number is water depth (m), second number is wave time (s)

GTL5 = g.*Period(1)./WaveLength5; %solving for the gT/L term of the 5 second wave for both depths (first number is 3 m second number is 20 m)
GTL10 = g.*Period(2)./WaveLength10; %solving for the ten second wave, both depths
%cosh terms for 5 second wave shallow water
cosh5z1shal = (cosh(2*pi*(z(1)+Depth)./WaveLength5))./(cosh(2*pi*Depth./WaveLength5)); %at still water level - z=0
cosh5z2shal = (cosh(2*pi*(z(2)+Depth)./WaveLength5))./(cosh(2*pi*Depth./WaveLength5)); %at half depth
cosh5z3shal = (cosh(2*pi*(z(4)+Depth)./WaveLength5))./(cosh(2*pi*Depth./WaveLength5)); %at seafloor
%cosh terms for 10 second wave shallow water
cosh10z1shal = (cosh(2*pi*(z(1)+Depth)./WaveLength10))./(cosh(2*pi*Depth./WaveLength10)); %at still water level - z=0
cosh10z2shal = (cosh(2*pi*(z(2)+Depth)./WaveLength10))./(cosh(2*pi*Depth./WaveLength10)); %at half depth
cosh10z3shal = (cosh(2*pi*(z(4)+Depth)./WaveLength10))./(cosh(2*pi*Depth./WaveLength10)); %at seafloor
%sinh/cosh terms for 5 second wave shallow water
sinhcosh5z1shal = (sinh(2*pi*(z(1)+Depth)./WaveLength5))./(cosh(2*pi*Depth./WaveLength5)); %at still water level
sinhcosh5z2shal = (sinh(2*pi*(z(2)+Depth)./WaveLength5))./(cosh(2*pi*Depth./WaveLength5)); %at half depth
sinhcosh5z3shal = (sinh(2*pi*(z(4)+Depth)./WaveLength5))./(cosh(2*pi*Depth./WaveLength5)); %at seafloor
%sinh/cosh terms for 10 second wave shallow water
sinhcosh10z1shal = (sinh(2*pi*(z(1)+Depth)./WaveLength10))./(cosh(2*pi*Depth./WaveLength10)); %at still water level
sinhcosh10z2shal = (sinh(2*pi*(z(2)+Depth)./WaveLength10))./(cosh(2*pi*Depth./WaveLength10)); %at half depth
sinhcosh10z3shal = (sinh(2*pi*(z(4)+Depth)./WaveLength10))./(cosh(2*pi*Depth./WaveLength10)); %at seafloor
%cosh terms for 5 second wave deep water
cosh5z1deep = (cosh(2*pi*(z(1)+Depth)./WaveLength5))./(cosh(2*pi*Depth./WaveLength5)); %at still water level - z=0
cosh5z2deep = (cosh(2*pi*(z(3)+Depth)./WaveLength5))./(cosh(2*pi*Depth./WaveLength5)); %at half depth
cosh5z3deep = (cosh(2*pi*(z(5)+Depth)./WaveLength5))./(cosh(2*pi*Depth./WaveLength5)); %at seafloor
%cosh terms for 10 second wave deep water
cosh10z1deep = (cosh(2*pi*(z(1)+Depth)./WaveLength10))./(cosh(2*pi*Depth./WaveLength10)); %at still water level - z=0
cosh10z2deep = (cosh(2*pi*(z(3)+Depth)./WaveLength10))./(cosh(2*pi*Depth./WaveLength10)); %at half depth
cosh10z3deep = (cosh(2*pi*(z(5)+Depth)./WaveLength10))./(cosh(2*pi*Depth./WaveLength10)); %at seafloor
%sinh/cosh terms for 5 second wave deep water
sinhcosh5z1deep = (sinh(2*pi*(z(1)+Depth)./WaveLength5))./(cosh(2*pi*Depth./WaveLength5)); %at still water level
sinhcosh5z2deep = (sinh(2*pi*(z(3)+Depth)./WaveLength5))./(cosh(2*pi*Depth./WaveLength5)); %at half depth
sinhcosh5z3deep = (sinh(2*pi*(z(5)+Depth)./WaveLength5))./(cosh(2*pi*Depth./WaveLength5)); %at seafloor
%sinh/cosh terms for 10 second wave deep water
sinhcosh10z1deep = (sinh(2*pi*(z(1)+Depth)./WaveLength10))./(cosh(2*pi*Depth./WaveLength10)); %at still water level
sinhcosh10z2deep = (sinh(2*pi*(z(3)+Depth)./WaveLength10))./(cosh(2*pi*Depth./WaveLength10)); %at half depth
sinhcosh10z3deep = (sinh(2*pi*(z(5)+Depth)./WaveLength10))./(cosh(2*pi*Depth./WaveLength10)); %at seafloor
%Horizontal velocity for 5 second wave
uz51s = WaveAmplitude.*GTL5.*cosh5z1shal;
uz51d = WaveAmplitude.*GTL5.*cosh5z1deep;
uz51shal = uz51s(1)*costheta5;
uz51deep = uz51d(2)*costheta5;
uz52s = WaveAmplitude.*GTL5.*cosh5z2shal;
uz52d = WaveAmplitude.*GTL5.*cosh5z2deep;
uz52shal = uz52s(1)*costheta5;
uz52deep = uz52d(2)*costheta5;
uz53s = WaveAmplitude.*GTL5.*cosh5z3shal;
uz53d = WaveAmplitude.*GTL5.*cosh5z3deep;
uz53shal = uz53s(1)*costheta5;
uz53deep = uz53d(2)*costheta5;
%Horizontal velocity for 10 second wave
uz101s = WaveAmplitude.*GTL10.*cosh10z1shal;
uz101d = WaveAmplitude.*GTL10.*cosh10z1deep;
uz101shal = uz101s(1)*costheta10;
uz101deep = uz101d(2)*costheta10;
uz102s = WaveAmplitude.*GTL10.*cosh10z2shal;
uz102d = WaveAmplitude.*GTL10.*cosh10z2deep;
uz102shal = uz102s(1)*costheta10;
uz102deep = uz102d(2)*costheta10;
uz103s = WaveAmplitude.*GTL10.*cosh10z3shal;
uz103d = WaveAmplitude.*GTL10.*cosh10z3deep;
uz103shal = uz103s(1)*costheta10;
uz103deep = uz103d(2)*costheta10;
%Vertical velocity for the 5 second wave
wz51s = WaveAmplitude.*GTL5.*sinhcosh5z1shal;
wz51d = WaveAmplitude.*GTL5.*sinhcosh5z1deep;
wz51shal = wz51s(1)*sintheta5;
wz51deep = wz51d(2)*sintheta5;
wz52s = WaveAmplitude.*GTL5.*sinhcosh5z2shal;
wz52d = WaveAmplitude.*GTL5.*sinhcosh5z2deep;
wz52shal = wz52s(1)*sintheta5;
wz52deep = wz52d(2)*sintheta5;
wz53s = WaveAmplitude.*GTL5.*sinhcosh5z3shal;
wz53d = WaveAmplitude.*GTL5.*sinhcosh5z3deep;
wz53shal = wz53s(1)*sintheta5;
wz53deep = wz53d(2)*sintheta5;
%Vertical velocity for the 10 second wave
wz101s = WaveAmplitude.*GTL10.*sinhcosh10z1shal;
wz101d = WaveAmplitude.*GTL10.*sinhcosh10z1deep;
wz101shal = wz101s(1)*sintheta10;
wz101deep = wz101d(2)*sintheta10;
wz102s = WaveAmplitude.*GTL10.*sinhcosh10z2shal;
wz102d = WaveAmplitude.*GTL10.*sinhcosh10z2deep;
wz102shal = wz102s(1)*sintheta10;
wz102deep = wz102d(2)*sintheta10;
wz103s = WaveAmplitude.*GTL10.*sinhcosh10z3shal;
wz103d = WaveAmplitude.*GTL10.*sinhcosh10z3deep;
wz103shal = wz103s(1)*sintheta10;
wz103deep = wz103d(2)*sintheta10;

%Subsurface Pressures
nu5 = WaveAmplitude*costheta5;
nu10 = WaveAmplitude*costheta10;

p51deep = rho.*g.*nu5.*cosh5z1deep(2)-rho.*g.*z(1);
p52deep = rho*g*nu5*cosh5z2deep(2)-rho*g*z(3);
p53deep = rho*g*nu5*cosh5z3deep(2)-rho*g*z(5);
p101deep = rho*g*nu10*cosh10z1deep(2)-rho*g*z(1);
p102deep = rho*g*nu10*cosh10z2deep(2)-rho*g*z(3);
p103deep = rho*g*nu10*cosh10z3deep(2)-rho*g*z(5);
p51shal = rho*g*nu5*cosh5z1shal(1)-rho*g*z(1);
p52shal = rho*g*nu5*cosh5z2shal(1)-rho*g*z(2);
p53shal = rho*g*nu5*cosh5z3shal(1)-rho*g*z(4);
p101shal = rho*g*nu10*cosh10z1shal(1)-rho*g*z(1);
p102shal = rho*g*nu10*cosh10z2shal(1)-rho*g*z(2);
p103shal = rho*g*nu10*cosh10z3shal(1)-rho*g*z(4);


%Plotting 5 second wave, still water level
figure (1)
subplot(3,1,1)
plot(time,uz51shal,time,uz51deep)
title('5 Second Wave, Still Water Level')
ylabel('u (m/s)')
xlabel('Time (s)')
legend('3 m','20 m','location','southwest')
subplot(3,1,2)
plot(time,wz51shal,time,wz51deep,'--')
ylabel('w (m/s)')
xlabel('Time (s)')
legend('3 m','20 m','location','southwest')
subplot(3,1,3)
plot(time,p51shal,time,p51deep,'--')
ylabel('Pressure (Pa)')
xlabel('Time (s)')
legend('3 m','20 m','location','southwest')

%Plotting 10 second wave, still water level
figure (2)
subplot(3,1,1)
plot(time,uz101shal,time,uz101deep)
title('10 Second Wave, Still Water Level')
ylabel('u (m/s)')
xlabel('Time (s)')
legend('3 m','20 m','location','southwest')
subplot(3,1,2)
plot(time,wz101shal,time,wz101deep,'--')
ylabel('w (m/s)')
xlabel('Time (s)')
legend('3 m','20 m','location','southwest')
subplot(3,1,3)
plot(time,p101shal,time,p101deep,'--')
ylabel('Pressure (Pa)')
xlabel('Time (s)')
legend('3 m','20 m','location','southwest')

%Plotting 5 second wave, half depth
figure (3)
subplot(3,1,1)
plot(time,uz52shal,time,uz52deep)
title('5 Second Wave, Half Depth')
ylabel('u (m/s)')
xlabel('Time (s)')
legend('3 m','20 m','location','southwest')
subplot(3,1,2)
plot(time,wz52shal,time,wz52deep)
ylabel('w (m/s)')
xlabel('Time (s)')
legend('3 m','20 m','location','southwest')
subplot(3,1,3)
plot(time,p52shal,time,p52deep)
ylabel('Pressure (Pa)')
xlabel('Time (s)')
legend('3 m','20 m','location','southwest')

%Plotting 10 second wave, half depth
figure (4)
subplot(3,1,1)
plot(time,uz102shal,time,uz102deep)
title('10 Second Wave, Half Depth')
ylabel('u (m/s)')
xlabel('Time (s)')
legend('3 m','20 m','location','southwest')
subplot(3,1,2)
plot(time,wz102shal,time,wz102deep)
ylabel('w (m/s)')
xlabel('Time (s)')
legend('3 m','20 m','location','southwest')
subplot(3,1,3)
plot(time,p102shal,time,p102deep)
ylabel('Pressure (Pa)')
xlabel('Time (s)')
legend('3 m','20 m','location','southwest')

%Plotting 5 second wave, sea floor
figure (5)
subplot(3,1,1)
plot(time,uz53shal,time,uz53deep)
title('5 Second Wave, Sea Floor')
ylabel('u (m/s)')
xlabel('Time (s)')
legend('3 m','20 m','location','southwest')
subplot(3,1,2)
plot(time,wz53shal,time,wz53deep,'--')
ylabel('w (m/s)')
xlabel('Time (s)')
legend('3 m','20 m','location','southwest')
subplot(3,1,3)
plot(time,p53shal,time,p53deep)
ylabel('Pressure (Pa)')
xlabel('Time (s)')
legend('3 m','20 m','location','southwest')

%Plotting 10 second wave, sea floor
figure (6)
subplot(3,1,1)
plot(time,uz103shal,time,uz103deep)
title('10 Second Wave, Sea Floor')
ylabel('u (m/s)')
xlabel('Time (s)')
legend('3 m','20 m','location','southwest')
subplot(3,1,2)
plot(time,wz103shal,time,wz103deep,'--')
ylabel('w (m/s)')
xlabel('Time (s)')
legend('3 m','20 m','location','southwest')
subplot(3,1,3)
plot(time,p103shal,time,p103deep)
ylabel('Pressure (Pa)')
xlabel('Time (s)')
legend('3 m','20 m','location','southwest')








