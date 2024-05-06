% Use this input file to excite function "ssj_req"
clear all
pt = 50.0e+3;    % peak power in Watts
g = 35.0;       % antenna gain in dB
freq = 5.6e+9;  % radar operating frequency in Hz
sigma = 10.0 ;    % radar cross section in m sqaured
b = 667.0e+3;    % radar operating bandwidth in Hz
loss = 10;     % radar losses in dB
rangej = 50.0; % range to jammer in Km
pj = 200.0;    % jammer peak power in Watts
bj = 1e9;  % jammer operating bandnwidth in Hz
gj = 10.0; 		 % jammer antenna gain in dB
lossj = 1.0;    % jammer losses in dB

T0 =290;
tau = 50e-5;
sir0 = 15;
R =linspace(10,400,4000);