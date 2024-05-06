function [Range] = burn_thru (pt, g, sigma, freq, tau, T0, loss, pj, bj, gj, lossj,sir0,ERP);
c = 3.0e+8;
k = 1.38e-23;
%R = linspace(rmin, rmax, 1000);
sir0 = 10^(sir0/10);
lambda = c / freq;
gj = 10^(gj/10);
G = 10^(g/10);
 Ar = lambda *lambda * G / 4 /pi;
%ERP = linspace(1,1000,5001);
num32 = ERP .* Ar;
demo3 = 8 *pi * bj * k * T0;
demo4 = 4^2 * pi^2 * k * T0 * sir0;
val1 = (num32 ./ demo3).^2;
val2 = (pt * tau * G * sigma * Ar)/(4^2 * pi^2 * loss * sir0 * k *T0);
val3 = sqrt(val1 + val2);
val4 = (ERP .* Ar) ./ demo3;
Range = sqrt(val3 - val4) ./ 1000;
figure (1)
plot (10*log10(ERP), Range,'k')
xlabel (' Jammer ERP in dB')
ylabel ('Burnthrough range in Km')
grid