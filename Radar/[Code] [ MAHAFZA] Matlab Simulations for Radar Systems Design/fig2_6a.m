% This program is used to produce Fig. 2.6a
% It uses the function "improv_fac"
clear all
close all
pfa1 = 1.0e-2;
pfa2 = 1.0e-6;
pfa3 = 1.0e-10;
pfa4 = 1.0e-13;
pd1 = .5;
pd2 = .8;
pd3 = .95;
pd4 = .999;
index = 0;
for np = 1:1:1000
   index = index + 1;
   I1(index) = improv_fac (np, pfa1, pd1);
   I2(index) = improv_fac (np, pfa2, pd2);
   I3(index) = improv_fac (np, pfa3, pd3);
   I4(index) = improv_fac (np, pfa4, pd4);
end
np = 1:1:1000;
semilogx (np, I1, 'k', np, I2, 'k--', np, I3, 'k-.', np, I4, 'k:')
%set (gca,'xtick',[1 2 3 4 5 6 7 8  10 20 30 100]);
xlabel ('Number of pulses');
ylabel ('Improvement factor in dB')
legend ('pd=.5, nfa=e+2','pd=.8, nfa=e+6','pd=.95, nfa=e+10','pd=.999, nfa=e+13');
grid
