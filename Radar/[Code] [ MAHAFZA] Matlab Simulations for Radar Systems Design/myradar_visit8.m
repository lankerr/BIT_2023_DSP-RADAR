% Myradar design case study visit8
close all
clear all
pfa = 1e-7;
pd = 0.995;
np = 5;
tau = 20e-6;
pt = 2e3; % peak power in Watts
freq = 9e+9; % radar operating frequency in Hz
g = 44; % antenna gain in dB
sigmam = 0.5; % missile RCS m squared
sigmaa = 4; % aircraft RCS m squared
te = 290.0; % effective noise temperature in Kelvins
b = 1.0e+6; % radar operating bandwidth in Hz
nf = 6.0; %noise figure in dB
loss = 8.0; % radar losses in dB
rangem = 55e3;
rangea = 90e3;
SNR_single_pulse_missile = radar_eq_PC(np,pt, freq, g, sigmam, te, tau, nf, loss, rangem)
SNR_single_pulse_aircraft = radar_eq_PC(np,pt, freq, g, sigmaa, te, tau, nf, loss, rangea)
