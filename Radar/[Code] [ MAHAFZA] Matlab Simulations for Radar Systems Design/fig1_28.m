% Use this program to reproduce Fig. 1.28 a and b 
close all
clear all
snr = 13.0 ; % SNR
sigmaM = .5; % missile RCS
sigmaA = 4; % aircraft CS
te = 290.0; % effective noise temperature in Kelvins
b = 1e+6; % radar operating bandwidth in Hz
nf = 6.0; % noise figure in dB
loss = 8.0; % radar losses in dB
tsc = 2; % scan time in seconds
thetae = 11.01; % elevation sezch angle in degrees
thetaa = 360; % azimuth search angle in degrees
range = linspace(15.e3,125e3,10000); % range to target from 1. Km 12 Km, 1000 points
% power_aperture(snr,tsc,sigma,range,te,nf,loss,,el_angle)
PAPm1 = power_aperture(snr,tsc,sigmaM,55e3,te,nf,loss,thetaa,thetae)
PAPa1 = power_aperture(snr,tsc,sigmaA,90e3,te,nf,loss,thetaa,thetae)
PAPm = power_aperture(snr,tsc,sigmaM,range,te,nf,loss,thetaa,thetae);
PAPa = power_aperture(snr,tsc,sigmaA,range,te,nf,loss,thetaa,thetae);
figure(1)
rangekm  = range ./ 1000;
plot(rangekm,PAPm,'k',rangekm,PAPa,'k-.')
grid
legend('Missile case', 'Aircraft case')
xlabel ('Detection range - Km');
ylabel ('Power perture product - dB');

