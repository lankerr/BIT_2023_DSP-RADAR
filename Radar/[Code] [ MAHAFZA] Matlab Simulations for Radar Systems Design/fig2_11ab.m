% This program is used to produce Fig. 2.11a&b
clear all
pfa = 1e-11;
nfa = log(2) / pfa;
index = 0;
for snr = -10:.5:30
   index = index +1;
   prob1(index) =  pd_swerling1 (nfa, 1, snr);
   prob10(index) =  pd_swerling1 (nfa, 10, snr);
   prob50(index) =  pd_swerling1 (nfa, 50, snr);
   prob100(index) =  pd_swerling1 (nfa, 100, snr);
end
x = -10:.5:30;
plot(x, prob1,'k',x,prob10,'k:',x,prob50,'k--', ...
   x, prob100,'k-.');
axis([-10 30 0 1])
xlabel ('SNR - dB')
ylabel ('Probability of detection')
legend('np = 1','np = 10','np = 50','np = 100')
grid






