%ssj_reqi
clear all
pt = 50.0e+3;    % peak power in Watts
g = 35.0;       % antenna gain in dB
freq = 5.6e+9;  % radar operating frequency in Hz
sigma = 10.0 ;    % radar cross section in m sqaured
b = 667.0e+3;    % radar operating bandwidth in Hz
loss = 0.1000;     % radar losses in dB
rangej = 50.0; % range to jammer in Km
pj = 200.0;    % jammer peak power in Watts
bj = 50.0e+6;  % jammer operating bandnwidth in Hz
gj = 10.0; 		 % jammer antenna gain in dB
lossj = .10;    % jammer losses in dB
[BR_range] = ssj_req (pt, g, freq, sigma, b, loss, ...
   pj, bj, gj, lossj);
