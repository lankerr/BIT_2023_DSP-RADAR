% Use this program to reproduce Fig. 1.27 of text.
close all
clear all
pt = 1.2e+3; % peak power in Watts
freq = 800e6; % radar operating frequency in Hz
g = 22.0; % antenna gain in dB
sigmam = 0.5; % missile RCS in m squared
sigmaa = 4.0; % aircraft RCS in m squared
te = 290.0; % effective noise temperature in Kelvins
b = 1.0e+6; % radar operating bandwidth in Hz
nf = 8.0; %noise figure in dB
loss = 10.0; % radar losses in dB
range = linspace(5e3,125e3,1000); % range to target from 25 Km 165 Km, 1000 points
snr1 = radar_eq(pt, freq, g, sigmam, te, b, nf, loss, range);
snr2 = radar_eq(pt, freq, g, sigmaa, te, b, nf, loss, range);
% plot SNR versus range
figure(1)
rangekm  = range ./ 1000;
plot(rangekm,snr1,'k',rangekm,snr2,'k:')
grid
legend('Misssile','Aircraft')
xlabel ('Detection range - Km');
ylabel ('SNR - dB');





