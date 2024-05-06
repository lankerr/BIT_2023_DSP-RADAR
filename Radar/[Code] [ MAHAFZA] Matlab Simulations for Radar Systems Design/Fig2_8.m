% Use this program to reproduce Fig. 2.8 of text
clear all
for n= 1: 1:150
   [pfa1 y1(n)] = threshold(1000,n);
   [pfa2 y3(n)] = threshold(10000,n);
   [pfa3 y4(n)] = threshold(500000,n);
end
n =1:1:150;
loglog(n,y1,'k',n,y3,'k--',n,y4,'k-.');
axis([0 200 1 300])
xlabel ('Number of pulses');
ylabel('Threshold')
legend('nfa=1000','nfa=10000','nfa=500000')
grid