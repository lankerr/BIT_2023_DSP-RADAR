% This program is used to reproduce Fig. 2.10
%close all
clear all
pfa = 1e-9;
nfa = log(2) / pfa;
b = sqrt(-2.0 * log(pfa));
index = 0;
for snr = 0:.01:22
   index = index +1;
   a = sqrt(2.0 * 10^(.1*snr));
   pro(index) = marcumsq(a,b);
   prob(index) =  pd_swerling2 (nfa, 1, snr);
end
x = 0:.01:22;
%figure(10)
plot(x, pro,'k',x,prob,'k:');
axis([2 22 0 1])
xlabel ('SNR - dB')
ylabel ('Probability of detection')
legend('Swerling V','Swerling I')
grid






