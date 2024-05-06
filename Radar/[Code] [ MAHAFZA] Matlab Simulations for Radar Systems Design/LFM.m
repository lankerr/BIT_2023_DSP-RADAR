function LFM(B,T);
time_B_product = B * T;
if(time_B_product < 5 )
    fprintf('************ Time Bandwidth product is TOO SMALL ***************')
    fprintf('\n Change B and or T')
    return
else
end
% Compute alpha
mu = 2. * pi * B / T;
npoints = 5 * B * T + 1;
% Determine sampling times
delt = linspace(-T/2., T/2., npoints); % 
% Compute the complex LFM representation
Ichannal = cos(mu .* delt.^2 / 2.); % Real part
Qchannal = sin(mu .* delt.^2 / 2.); % Imaginary Part
LFM = Ichannal + sqrt(-1) .* Qchannal; % complex signal
%Compute the FFT of the LFM waveform
LFMFFT = fftshift(fft(LFM));
% Plot the real and Inginary parts and the spectrum
sampling_interval = T / npoints;
freqlimit = 0.5 / sampling_interval;
freq = linspace(-freqlimit,freqlimit,npoints);
figure(1)
plot(delt,Ichannal,'k');
axis([-T/2 T/2 -1 1])
grid
xlabel('Time - seconds')
ylabel('Units of Waveform')
title('Real part of an LFM waveform')
figure(2)
plot(delt,Qchannal,'k');
axis([-T/2 T/2 -1 1])
grid
xlabel('Time - seconds')
ylabel('Units of Waveform')
title('Imaginary part of LFM waveform')
figure(3)
plot(freq, abs(LFMFFT),'k');
%axis tight
grid
xlabel('Frequency - Hz')
ylabel('Amplitude spectrum')
title('Spectrum for an LFM waveform')