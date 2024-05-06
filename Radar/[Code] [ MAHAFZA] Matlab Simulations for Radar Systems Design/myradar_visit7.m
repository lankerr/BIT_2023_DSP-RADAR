clear all
close all
clutter_attenuation = 28.24;
thetaA= 1.33; % antenna azimuth beamwidth in degrees
thetaE = 11; % antenna elevation beamwidth in degrees
hr = 5.; % radar height to center of antenna (phase reference) in meters
htm = 2000.; % target (missile) height in meters
hta = 10000.; % target (aircraft) height in meters
SL = -20; % radar rms sidelobes in volts
sigma0 = -15; % clutter backscatter coefficient 
b = 1.0e6; %1-MHz bandwidth 
t0 = 290; % noise temperature 290 degrees Kelvin
f0 = 3e9; % 3 GHz center frequency
pt = 20; % radar peak power in KW
f = 6; % 6 dB noise figure
l = 8; % 8 dB radar losses
range = linspace(10,120,500); % radar slant range 25 to 120 Km, 500 points
% calculate the clutter RCS and the associated CNR for both targets
[sigmaCa,CNRa] = clutter_rcs(sigma0, thetaE, thetaA, SL, range, hr, hta, pt, f0, b, t0, f, l,2);
[sigmaCm,CNRm] = clutter_rcs(sigma0, thetaE, thetaA, SL, range, hr, htm, pt, f0, b, t0, f, l,2);
close all
%%%%%%%%%%%%%%%%%%%%%%%%
taup = 20e-6; %uncompressed pulewidth
np = 1;
pfa = 1e-7;
pdm = 0.99945;
pda = 0.99812;
% calculate the improvement factor
Im = improv_fac(np,pfa, pdm);
Ia = improv_fac(np, pfa, pda);
% caculate the integration loss
Lm = 10*log10(np) - Im;
La = 10*log10(np) - Ia;
pt = pt * 1000; % peak power in watts
range_m = 1000 .* range; % range in meters
g = 34.5139; % antenna gain in dB
sigmam = 0.5; % missile RCS m squared
sigmaa = 4; % aircraft RCS m squared
nf = f; %noise figure in dB
loss = l; % radar losses in dB
losstm = loss + Lm; % total loss for missile
lossta = loss + La; % total loss for aircraft
% modify pt by np*pt to account for pulse integration
SNRm = radar_eq(taup*pt, f0, g, sigmam, t0, 1, nf, losstm, range_m);
SNRa = radar_eq(taup*pt, f0, g, sigmaa, t0, 1, nf, lossta, range_m);
snrm = 10.^(SNRm./10);
snra = 10.^(SNRa./10);
CNRm = CNRm - clutter_attenuation;
CNRa = CNRa - clutter_attenuation;
cnrm = 10.^(CNRm./10);
cnra = 10.^(CNRa./10);
SIRm = 10*log10(snrm ./ (1+cnrm));
SIRa = 10*log10(snra ./ (1+cnra));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(3)
plot(range, SNRm,'k', range, CNRm,'k :', range,SIRm,'k -.')
grid
legend('Desired SNR; from Chapter 5','CNR','SIR with 2-pulse','MTI filter')
xlabel('Slant Range in Km')
ylabel('dB')
title('Missile case; 21-frame cumulative detection')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(4)
plot(range, SNRa,'k', range, CNRa,'k :', range,SIRa,'k -.')
grid
legend('Desired SNR; from Chapter 5','CNR','SIR with 2-pulse','MTI filter')
xlabel('Slant Range in Km')
ylabel('dB')
title('Aircraft case; 21-frame cumulative detection')
