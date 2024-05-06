function [SIR] = sir (pt, g, sigma, freq, tau,T0,  loss, R, pj, bj, gj, lossj);
c = 3.0e+8;
k = 1.38e-23;
%R = linspace(rmin, rmax, 1000);
range = R .* 1000;
lambda = c / freq;
gj = 10^(gj/10);
G = 10^(g/10);
ERP1 = pj * gj / lossj;
ERP_db = 10*log10(ERP1);
% Calculate Eq. (8.10)
Ar = lambda *lambda * G / 4 /pi;
num1 = pt * tau * G * sigma * Ar;
demo1 = 4^2 * pi^2 * loss .* range.^4;
demo2 = 4 * pi * bj .* range.^2;
num2 = ERP1 * Ar;
val11 = num1 ./ demo1;
val21 = num2 ./demo2; 
sir = val11 ./ (val21 + k * T0);
SIR = 10*log10(sir);
figure (1)
plot (R, SIR,'k')
xlabel ('Detection range in Km');
ylabel ('S/(J+N) in dB')
grid