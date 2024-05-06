% Use this program to reproduce Fig. 3.8 of text
close all
clear all
eps = 0.000001;
%Enter pulse width and bandwidth
B = 200.0e6; %200 MHZ bandwidth
T = 10.e-6; %10 micro second pulse;
% Compute alpha
mu = 2. * pi * B / T;
% Determine sampling times
delt = linspace(-T/2., T/2., 10001); % 1 nano sceond sampling interval
% Compute the complex LFM representation
Ichannal = cos(mu .* delt.^2 / 2.); % Real part
Qchannal = sin(mu .* delt.^2 / 2.); % Imaginary Part
LFM = Ichannal + sqrt(-1) .* Qchannal; % complex signal
%Compute the FFT of the LFM waveform
LFMFFT = fftshift(fft(LFM));
% Plot the real and Immaginary parts and the spectrum
freqlimit = 0.5 / 1.e-9;% the sampling interval 1 nano-second
freq = linspace(-freqlimit/1.e6,freqlimit/1.e6,10001);
figure(1)
plot(delt*1e6,Ichannal,'k');
axis([-1 1 -1 1])
grid
xlabel('Time - microsecs')
ylabel('Real part')
title('T = 10 Microsecond, B = 200 MHz')
figure(2)
plot(delt*1e6,Qchannal,'k');
axis([-1 1 -1 1])
grid
xlabel('Time - microsecs')
ylabel('Imaginary part')
title('T = 10 Microsecond, B = 200 MHz')
figure(3)
plot(freq, abs(LFMFFT),'k');
%axis tight
grid
xlabel('Frequency - MHz')
ylabel('Amplitude spectrum')
title('Spectrum for an LFM waveform and T = 10 Microsecond, B = 200 MHZ')