% Use this program to reproduce Fig. 1.27 of text.
close all
clear all
np = 7;
pt = 165.8e3; % peak power in Watts
freq = 3e+9; % radar operating frequency in Hz
g = 34.5139; % antenna gain in dB
sigmam = 0.5; % missile RCS m squared
sigmaa = 4; % aircraft RCS m squared
te = 290.0; % effective noise temperature in Kelvins
b = 1.0e+6; % radar operating bandwidth in Hz
nf = 6.0; %noise figure in dB
loss = 8.0; % radar losses in dB
% compute the single pulse SNR when 7-pulse NCI is used
SNR_1 = (10^1.3)/(2*7) + sqrt((((10^1.3)^2) / (4*7*7)) + ((10^1.3) / 7));
% compute the integration loss
LNCI = 10*log10((1+SNR_1)/SNR_1);
loss_total = loss + LNCI;
range = linspace(15e3,100e3,1000); % range to target from 15 Km to 100 Km, 1000 points
% modify pt by np*pt to account for pulse integration
snrmnci = radar_eq(np*pt, freq, g, sigmam, te, b, nf, loss_total, range);
snrm = radar_eq(pt, freq, g, sigmam, te, b, nf, loss, range);
snranci = radar_eq(np*pt, freq, g, sigmaa, te, b, nf, loss_total, range);
snra = radar_eq(pt, freq, g, sigmaa, te, b, nf, loss, range);
% plot SNR versus range
rangekm  = range ./ 1000;
figure(1)
subplot(2,1,1)
plot(rangekm,snrmnci,'k',rangekm,snrm,'k -.')
grid
legend('With 7-pulse NCI','Single pulse')
ylabel ('SNR - dB');
title('Missile case')
subplot(2,1,2)
plot(rangekm,snranci,'k',rangekm,snra,'k -.')
grid
legend('With 7-pulse NCI','Single pulse')
ylabel ('SNR - dB');
title('Aircraft case')
xlabel('Detection range - Km')



