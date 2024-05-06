% Use this input file to reproduce Fig.s 8.5 through 8.7
clear all
te = 730.0;    % radar effective tem in Kelvin
pj	= 15; % jammer peak power in W
gj = 3.0;      % jammer antenna gain in dB
g = 40.0;      % radar antenna gain
freq = 10.0e+9;% radar operating frequency in Hz
bj	= 1.0e+6;   % radar operating bandwidth in Hz
rangej = 400.0;% radar to jammer range in Km
lossj = 1.0;   % jammer losses in dB
