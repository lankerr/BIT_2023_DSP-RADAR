% This program is used to produce Fig. 2.6b
% It uses the function "improv_fac". 
clear all
close all
pfa1 = 1.0e-12;
pfa2 = 1.0e-12;
pfa3 = 1.0e-12;
pfa4 = 1.0e-12;
pd1 = .5;
pd2 = .8;
pd3 = .95;
pd4 = .99;
index = 0;
for np = 1:1:1000
    index = index+1;
    I1 = improv_fac (np, pfa1, pd1);
    i1 = 10.^(0.1*I1);
    L1(index) = -1*10*log10(i1 ./ np);
    I2 = improv_fac (np, pfa2, pd2);
    i2 = 10.^(0.1*I2);
    L2(index) = -1*10*log10(i2 ./ np);
    I3 = improv_fac (np, pfa3, pd3);
    i3 = 10.^(0.1*I3);
    L3(index) = -1*10*log10(i3 ./ np);
    I4 = improv_fac (np, pfa4, pd4);
    i4 = 10.^(0.1*I4);
    L4 (index) = -1*10*log10(i4 ./ np);
end
np = 1:1:1000;
semilogx (np, L1, 'k', np, L2, 'k--', np, L3, 'k-.', np, L4, 'k:')
axis tight
xlabel ('Number of pulses');
ylabel ('Integration loss - dB')
legend ('pd=.5, nfa=e+12','pd=.8, nfa=e+12','pd=.95, nfa=e+12','pd=.99, nfa=e+12');
grid
