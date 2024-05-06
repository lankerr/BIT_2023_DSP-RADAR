%use thsi figure to generate Fig. 1.21 of text
clear all
close all
np = linspace(1,10000,1000);
snrci = pulse_integration(4,94.e9,47,20,290,20e6,7,10,5.01e3,np,1);
snrnci = pulse_integration(4,94.e9,47,20,290,20e6,7,10,5.01e3,np,2);
semilogx(np,snrci,'k',np,snrnci,'k:')
legend('Coherent integration','Non-coherent integration')
grid
xlabel ('Number of integrated pulses');
ylabel ('SNR - dB');
