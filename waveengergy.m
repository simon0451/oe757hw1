%calculating wave energy and wave power
clear all;
close all;

H = 2; %m
g = 9.81; %m/(ss)
rho = 1027; %kg/(mmm)

Etotal = .125*rho*g*(H*H); %W, wave energy - does not depend on period or water depth

[WaveLength35,~,WaveNumber35,~] = find_L_disper(3,5); %3 meter depth, 5 second wave
[WaveLength205,~,WaveNumber205,~] = find_L_disper(20,5); %20 meter depth, 5 second wave
[WaveLength310,~,WaveNumber310,~] = find_L_disper(3,10); %3 meter depth, 10 second wave
[WaveLength2010,~,WaveNumber2010,~] = find_L_disper(20,10); %20 meter depth, 10 second wave

power35 = Etotal*(2*pi/5)/WaveNumber35*(.5*(1+(2*WaveNumber35*3/(sinh(2*WaveNumber35*3))))); %shallow, short period wave
power205 = Etotal*(2*pi/5)/WaveNumber205*(.5*(1+(2*WaveNumber205*20/(sinh(2*WaveNumber205*20))))); %deep, short period wave
power310 = Etotal*(2*pi/10)/WaveNumber310*(.5*(1+(2*WaveNumber310*3/(sinh(2*WaveNumber310*3))))); %shallow, long period wave
power2010 = Etotal*(2*pi/10)/WaveNumber2010*(.5*(1+(2*WaveNumber2010*20/(sinh(2*WaveNumber2010*20))))); %deep, long period wave