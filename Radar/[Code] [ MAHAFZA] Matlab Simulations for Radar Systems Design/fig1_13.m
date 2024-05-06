% Use this program to reproduce Fig. 1.13 of text.
close all
clear all
pt = 1.e+6; % peak power in Watts
freq = 5.6e+9; % radar operating frequency in Hz
g = 40.0; % antenna gain in dB
sigma = 0.1; % radar cross section in m squared
te =300.0; % effective noise temperature in Kelvins
nf = 5.0; %noise figure in dB
loss = 6.0; % radar losses in dB
range = [75e3,100e3,150e3]; % three range values
snr_db = linspace(5,20,200); % SNR values from 5 dB to 20 dB 200 points
snr = 10.^(0.1.*snr_db); % convert snr into base 10
gain = 10^(0.1*g); %convert antenna gain into base 10
loss = 10^(0.1*loss); % convert losses into base 10
F = 10^(0.1*nf); % convert noise figure into base 10
lambda = 3.e8 / freq; % compute wavelength
% Implement Eq.(1.57)
den = pt * gain * gain * sigma * lambda^2;
num1 = (4*pi)^3 * 1.38e-23 * te * F * loss * range(1)^4 .* snr;
num2 = (4*pi)^3 * 1.38e-23 * te * F * loss * range(2)^4 .* snr;
num3 = (4*pi)^3 * 1.38e-23 * te * F * loss * range(3)^4 .* snr;
tau1 = num1 ./ den ;
tau2 = num2 ./ den;
tau3 = num3 ./ den;
% plot tau versus snr
figure(1)
semilogy(snr_db,1e6*tau1,'k',snr_db,1e6*tau2,'k -.',snr_db,1e6*tau3,'k:')
grid
legend('R = 75 Km','R = 100 Km','R = 150 Km')
xlabel ('Minimum required SNR - dB');
ylabel ('\tau (pulse width) in \mu sec');




