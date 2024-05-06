% Use this program to reproduce Fig. 2.20 of text.
close all
clear all
np = 4;
pfa = 1e-7;
pdm = 0.99945;
pda = 0.99812;
% calculate the improvement factor
Im = improv_fac(np,pfa, pdm);
Ia = improv_fac(np, pfa, pda);
% caculate the integration loss
Lm = 10*log10(np) - Im;
La = 10*log10(np) - Ia;
pt = 114.7e3; % peak power in Watts
freq = 3e+9; % radar operating frequency in Hz
g = 34.5139; % antenna gain in dB
sigmam = 0.5; % missile RCS m squared
sigmaa = 4; % aircraft RCS m squared
te = 290.0; % effective noise temperature in Kelvins
b = 1.0e+6; % radar operating bandwidth in Hz
nf = 6.0; %noise figure in dB
loss = 8.0; % radar losses in dB
losstm = loss + Lm; % total loss for missile
lossta = loss + La; % total loss for aircraft
range = linspace(20e3,120e3,1000); % range to target from 20 to 120 Km, 1000 points
% modify pt by np*pt to account for pulse integration
snrmnci = radar_eq(np*pt, freq, g, sigmam, te, b, nf, losstm, range);
snrm = radar_eq(pt, freq, g, sigmam, te, b, nf, loss, range);
snranci = radar_eq(np*pt, freq, g, sigmaa, te, b, nf, lossta, range);
snra = radar_eq(pt, freq, g, sigmaa, te, b, nf, loss, range);
% plot SNR versus range
rangekm  = range ./ 1000;
figure(1)
subplot(2,1,1)
plot(rangekm,snrmnci,'k',rangekm,snrm,'k -.')
grid
legend('With 4-pulse NCI','Single pulse')
ylabel ('SNR - dB');
title('Missile case')
subplot(2,1,2)
plot(rangekm,snranci,'k',rangekm,snra,'k -.')
grid
legend('With 4-pulse NCI','Single pulse')
ylabel ('SNR - dB');
title('Aircraft case')
xlabel('Detection range - Km')






