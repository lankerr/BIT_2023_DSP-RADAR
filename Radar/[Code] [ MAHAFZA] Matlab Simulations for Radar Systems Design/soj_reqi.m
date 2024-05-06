% Use this input file to excite function "ssj_req"
clear all
pt = 5.0e+3;    % peak power in Watts
g = 35.0;       % antenna gain in dB
freq = 5.6e+9;  % radar operating frequency in Hz
sigma = 10 ;  % radar cross section in m sqaured
b = 667.0e+3;    % radar operating bandwidth in Hz
range = 20*1852;    % radar to target range
gprime = 10.0;   % radar antenna gain on jammer
loss = 0.01;     % radar losses in dB
rangej = 12*1852; % range to jammer in Km
pj = 5.0e+3;     % jammer peak power in Watts
bj = 50.0e+6;   % jammer operating bandnwidth in Hz
gj = 30.0; 		 % jammer antenna gain in dB
lossj = 0.1;    % jammer losses in dB

