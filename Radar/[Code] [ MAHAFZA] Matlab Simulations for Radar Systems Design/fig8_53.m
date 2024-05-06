%Use this program to reproduce Fig. 8.41 in the text
clear all
close all
d = 0.6; % element spacing in lambda units
betadeg = linspace(0,22.5,1000);
beta = betadeg .*pi ./180;
den = pi*d .* sin(beta);
numarg = den;
num = sin(numarg);
lscan = (num./den).^-4;
LSCAN = 10*log10(lscan+eps);
figure (1)
plot(betadeg,LSCAN)
xlabel('scan angle in degrees')
ylabel('Scan loss in dB')
grid
title('Element spacing is d = 0.6 \lambda ')