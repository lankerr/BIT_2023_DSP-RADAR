function RRF = range_red_factor (te, pj, gj, g, freq, bj, rangej, lossj)
% This function computes the range reduction factor and produces
% plots of RRF versus wavelength, radar to jammer range, and jammer power 
c = 3.0e+8;
k = 1.38e-23;
lambda = c / freq;
gj_10 = 10^( gj/10);
g_10 = 10^( g/10);
lossj_10 = 10^(lossj/10);
index = 0;
for wavelength = .01:.001:1
   index = index +1;
   jamer_temp = (pj * gj_10 * g_10 *wavelength^2) / ...
      (4.0^2 * pi^2 * k * bj * lossj_10 * (rangej * 1000.0)^2);
   delta = 10.0 * log10(1.0 + (jamer_temp / te));
   rrf(index) = 10^(-delta /40.0); 
end
w = 0.01:.001:1;
figure (1)
semilogx(w,rrf,'k')
grid
xlabel ('Wavelength in meters')
ylabel ('Range reduction factor')
index = 0;
return
for ran =rangej*.3:10:rangej*2
   index = index + 1;
   jamer_temp = (pj * gj_10 * g_10 *lambda^2) / ...
      (4.0^2 * pi^2 * k * bj * lossj_10 * (ran * 1000.0)^2);
   delta = 10.0 * log10(1.0 + (jamer_temp / te));
   rrf1(index) = 10^(-delta /40.0);
end
figure(2)
ranvar = rangej*.3:10:rangej*2 ;
plot(ranvar,rrf1,'k')
grid
xlabel ('Radar to jammer range - Km')
ylabel ('Range reduction factor')
index = 0;
for pjvar = pj*.01:100:pj*2
   index = index + 1;
   jamer_temp = (pjvar * gj_10 * g_10 *lambda^2) / ...
      (4.0^2 * pi^2 * k * bj * lossj_10 * (rangej * 1000.0)^2);
   delta = 10.0 * log10(1.0 + (jamer_temp / te));
   rrf2(index) = 10^(-delta /40.0);
end
figure(3)
pjvar = pj*.01:100:pj*2;
plot(pjvar,rrf2,'k')
grid
xlabel ('Jammer peak power - Watts')
ylabel ('Range reduction factor')


