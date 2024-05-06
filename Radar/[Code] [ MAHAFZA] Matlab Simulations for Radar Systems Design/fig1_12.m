% Use this program to reproduce Fig. 1.12 of text.
close all
clear all
pt = 1.5e+6; % peak power in Watts
freq = 5.6e+9; % radar operating frequency in Hz
g = 45.0; % antenna gain in dB
sigma = 0.1; % radar cross section in m squared
te = 290.0; % effective noise temperature in Kelvins
b = 5.0e+6; % radar operating bandwidth in Hz
nf = 3.0; %noise figure in dB
loss = 6.0; % radar losses in dB
range = linspace(25e3,165e3,1000); % range to target from 25 Km 165 Km, 1000 points
snr1 = radar_eq(pt, freq, g, sigma, te, b, nf, loss, range);
snr2 = radar_eq(pt, freq, g, sigma/10, te, b, nf, loss, range);
snr3 = radar_eq(pt, freq, g, sigma*10, te, b, nf, loss, range);
% plot SNR versus range
figure(1)
rangekm  = range ./ 1000;
plot(rangekm,snr3,'k',rangekm,snr1,'k -.',rangekm,snr2,'k:')
grid
legend('\sigma = 0 dBsm','\sigma = -10dBsm','\sigma = -20 dBsm')
xlabel ('Detection range - Km');
ylabel ('SNR - dB');
snr1 = radar_eq(pt, freq, g, sigma, te, b, nf, loss, range);
snr2 = radar_eq(pt*.4, freq, g, sigma, te, b, nf, loss, range);
snr3 = radar_eq(pt*1.8, freq, g, sigma, te, b, nf, loss, range);
figure (2)
plot(rangekm,snr3,'k',rangekm,snr1,'k -.',rangekm,snr2,'k:')
grid
legend('Pt = 2.16 MW','Pt = 1.5 MW','Pt = 0.6 MW')
xlabel ('Detection range - Km');
ylabel ('SNR - dB');



% % Use this program to reproduce Fig. 1.27 of text.
% close all
% clear all
% pt = 874.32e3; % peak power in Watts
% freq = 3e+9; % radar operating frequency in Hz
% g = 34.50; % antenna gain in dB
% sigmam = 0.5; % missile RCS m squared
% sigmaa = 4; % missile RCS m squared
% te = 290.0; % effective noise temperature in Kelvins
% b = 1.0e+6; % radar operating bandwidth in Hz
% nf = 6.0; %noise figure in dB
% loss = 8.0; % radar losses in dB
% range = linspace(2e3,150e3,1000); % range to target from 25 Km 165 Km, 1000 points
% snrm = radar_eq(pt, freq, g, sigmam, te, b, nf, loss, range);
% snra = radar_eq(pt, freq, g, sigmaa, te, b, nf, loss, range);
% % plot SNR versus range
% figure(1)
% rangekm  = range ./ 1000;
% plot(rangekm,snrm,'k',rangekm,snra,'k -.')
% grid
% legend('Missile','Aircraft')
% xlabel ('Detection range - Km');
% ylabel ('Single pulse SNR - dB');
% 



