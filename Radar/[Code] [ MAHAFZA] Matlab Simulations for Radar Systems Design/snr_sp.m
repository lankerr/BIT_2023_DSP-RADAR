% Use this program to calculate the single pulse SNR for each target type.
close all
clear all
pt = 874.32e3; % peak power in Watts
pt1 = pt /5;
freq = 3e+9; % radar operating frequency in Hz
g = 34.52; % antenna gain in dB
sigmam = 0.5; % missile RCS m squared
sigmaa = 4; % aircraft RCS m squared
te = 290.0; % effective noise temperature in Kelvins
b = 1.0e+6; % radar operating bandwidth in Hz
nf = 6.0; %noise figure in dB
loss = 8.0; % radar losses in dB
range = linspace(15e3,100e3,1000); % range to target from 15 Km 100 Km, 1000 points
snrmnci = radar_eq(pt, freq, g, sigmam, te, b, nf, loss, range);
snrm = radar_eq(pt1, freq, g, sigmam, te, b, nf, loss, range);
snranci = radar_eq(pt, freq, g, sigmaa, te, b, nf, loss, range);
snra = radar_eq(pt1, freq, g, sigmaa, te, b, nf, loss, range);
% plot SNR versus range
rangekm  = range ./ 1000;
figure(1)
subplot(2,1,1)
plot(rangekm,snrmnci,'k',rangekm,snrm,'k -.')
grid
legend('With 5-pulse NCI','Single pulse')
ylabel ('Single pulse SNR - dB');
title('Missile case')
subplot(2,1,2)
plot(rangekm,snranci,'k',rangekm,snra,'k -.')
grid
legend('With 5-pulse NCI','Single pulse')
ylabel ('Single pulse SNR - dB');
title('Aircraft case case')
xlabel('Detection range - km')
