% Use this program to reproduce Fig. 1.19 and Fig. 120 of text.
close all
clear all
pt = 4; % peak power in Watts
freq = 94e+9; % radar operating frequency in Hz
g = 47.0; % antenna gain in dB
sigma = 20; % radar cross section in m squared
te = 293.0; % effective noise temperature in Kelvins
b = 20e+6; % radar operating bandwidth in Hz
nf = 7.0; %noise figure in dB
loss = 10.0; % radar losses in dB
range = linspace(1.e3,12e3,10000); % range to target from 1. Km 12 Km, 1000 points
snr1 = radar_eq(pt, freq, g, sigma, te, b, nf, loss, range);
index = find(snr1>9.99999 & snr1<10.0099);
test = isempty(index);
if(test==1)
    'Error; Tighten values in line 14, and re-run again'
    break
else
end
snr_ref = snr1(index);
r_ref = range(index);
R_ref_ci = (94^0.25) .* r_ref;
snrCI = snr_ref + 40*log10(R_ref_ci ./ range); %Eq. (1.60)
% plot SNR versus range
figure(1)
rangekm  = range ./ 1000;
plot(rangekm,snr1,'k',rangekm,snrCI,'k -.')
axis tight
grid
legend('single pulse','94 pulse CI')
xlabel ('Detection range - Km');
ylabel ('SNR - dB');
% Generate Figure 1.20
% first find the new reference range
snr_b10 = 10.^(10/10);
SNR_1 = 10/(2*94) + sqrt(((10^2) / (4*94*94)) + (10 / 94)); % Equation 1.80 of text
LNCI = (1+SNR_1) / SNR_1; % Equation 1.78 of text
%snrnci_ref = snrCI -10*log10(LNCI);
NCIgain = 10*log10(94) - 10*log10(LNCI);
R_ref_nci = ((10^(0.1*NCIgain))^0.25) * 2.245e3;
snrNCI = snr_ref + 40*log10(R_ref_nci ./ range); %Eq. (1.60)
figure (2)
plot(rangekm,snr1,'k',rangekm,snrNCI,'k -.', rangekm,snrCI,'k:')
axis tight
grid
legend('single pulse','94 pulse NCI','94 pulse CI')
xlabel ('Detection range - Km');
ylabel ('SNR - dB');

