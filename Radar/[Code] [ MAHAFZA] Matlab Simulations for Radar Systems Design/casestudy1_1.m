% This program is used to generate Fig. 1.17 
% It implements the search radar equation defined in Eq. 1.67
clear all
close all
snr = 15.0;          % Sensitivity SNR in dB
tsc = 2.;            % Antenna scan time in seconds
sigma_tgtm = -10;    % Missile RCS in dBsm
sigma_tgta = 6;      % Aircraft RCS in dBsm
range = 60.0;       % Sensitivity range in Km, 
te = 290.0;         % Effective noise temprature in Kelvins
nf = 8;             % Noise figure in dB
loss = 10.0;         % Radar losses in dB
az_angle = 360.0;   % Search volume azimuth extent in degrees
el_angle = 10.0;    % Search volume elevation extent in degrees
c = 3.0e+8;         % Speed of light
% Compute Omega in steradians
omega = (az_angle / 57.296) * (el_angle /57.296);
omega_db = 10.0*log10(omega); % Convert Omega to dBs
k_db = 10.*log10(1.38e-23);
te_db = 10*log10(te);
tsc_db = 10*log10(tsc);
factor = 10*log10(4*pi);
rangemdb = 10*log10(range * 1000.);
rangeadb = 10*log10(range * 1000.);
PAP_Missile = snr - sigma_tgtm - tsc_db + factor + 4.0 * rangemdb + ...
   k_db + te_db + nf + loss + omega_db
PAP_Aircraft = snr - sigma_tgta - tsc_db + factor + 4.0 * rangeadb + ...
   k_db + te_db + nf + loss + omega_db
index = 0;
% vary rnage from 2Km to 90 Km 
for rangevar = 2 : 1 : 90
   index = index + 1;
   rangedb = 10*log10(rangevar * 1000.0);
   papm(index) = snr - sigma_tgtm - tsc_db + factor + 4.0 * rangedb + ...
      k_db + te_db + nf + loss + omega_db;
  missile_PAP(index) = PAP_Missile;
  aircraft_PAP(index) = PAP_Aircraft;
   papa(index) = snr - sigma_tgta - tsc_db + factor + 4.0 * rangedb + ...
      k_db + te_db + nf + loss +omega_db;
end
var = 2 : 1 : 90;
figure (1)
plot (var,papm,'k',var,papa,'k-.')
legend ('Missile','Aircraft')
xlabel ('Range - Km');
ylabel ('Power Aperture Product - dB');
hold on
plot(var,missile_PAP,'k:',var,aircraft_PAP,'k:')
grid
hold off