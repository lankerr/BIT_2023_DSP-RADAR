function [snr] = radar_eq_PC(np,pt, freq, g, sigma, te, tau, nf, loss, range)
% This program implements Eq. (1.56)
c = 3.0e+8; % speed of light
lambda = c / freq; % wavelength
np_db = 10*log10(np);
p_peak = 10*log10(pt); % convert peak power to dB
lambda_sqdb = 10*log10(lambda^2); % compute wavelength square in dB
sigmadb = 10*log10(sigma); % convert sigma to dB
four_pi_cub = 10*log10((4.0 * pi)^3); % (4pi)^3 in dB
k_db = 10*log10(1.38e-23); % Boltzman's constant in dB
te_db = 10*log10(te); % noise temp. in dB
tau_db = 10*log10(tau); % bandwidth in dB
range_pwr4_db = 10*log10(range.^4); % vector of target range^4 in dB
% Implement Equation (5.7)
num = np_db + p_peak + g + g + lambda_sqdb + sigmadb + tau_db;
den = four_pi_cub + k_db + te_db + nf + loss + range_pwr4_db;
snr = num - den;
return
