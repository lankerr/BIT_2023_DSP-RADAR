% Myradar design case study visit 2_1
close all
clear all
pfa = 1e-7;
pd = 0.995;
np = 7;
pt = 165.8e3; % peak power in Watts
freq = 3e+9; % radar operating frequency in Hz
g = 34.5139; % antenna gain in dB
sigmam = 0.5; % missile RCS m squared
sigmaa = 4; % aircraft RCS m squared
te = 290.0; % effective noise temperature in Kelvins
b = 1.0e+6; % radar operating bandwidth in Hz
nf = 6.0; %noise figure in dB
loss = 8.0; % radar losses in dB
% compute the improvement factor due to 7-pulse non-coherent integration
Improv = improv_fac (np, pfa, pd);
% calculate the integration loss
lossnci = 10*log10(np) - Improv;
% calculate net gain inSNR due to integration
SNR_net = Improv - lossnci;
loss_total = loss + lossnci;
rangem = 55e3;
rangea = 90e3;
SNR_single_pulse_missile = radar_eq(pt, freq, g, sigmam, te, b, nf, loss, rangem)
SNR_7_pulse_NCI_missile = SNR_single_pulse_missile + SNR_net 
SNR_single_pulse_aircraft = radar_eq(pt, freq, g, sigmaa, te, b, nf, loss, rangea)
SNR_7_pulse_NCI_aircrfat = SNR_single_pulse_aircraft + SNR_net
