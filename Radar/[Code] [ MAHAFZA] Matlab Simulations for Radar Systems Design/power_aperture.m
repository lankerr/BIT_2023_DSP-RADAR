function PAP = power_aperture(snr,tsc,sigma,range,te,nf,loss,az_angle,el_angle)
% This program implements Eq. (1.67)
Tsc = 10*log10(tsc); % convert Tsc into dB
Sigma = 10*log10(sigma); % convert sigma to dB
four_pi = 10*log10(4.0 * pi); % (4pi) in dB
k_db = 10*log10(1.38e-23); % Boltzman's constant in dB
Te = 10*log10(te); % noise temp. in dB
range_pwr4_db = 10*log10(range.^4); % target range^4 in dB
omega = (az_angle/57.296) * (el_angle / 57.296); % compute search volume in steraradians
Omega = 10*log10(omega); % search volume in dB
% implement Eq. (1.67)
PAP = snr + four_pi + k_db + Te + nf + loss + range_pwr4_db + Omega ...
    - Sigma - Tsc;
return
