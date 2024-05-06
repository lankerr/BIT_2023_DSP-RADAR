% This program can be used to reproduce Fig. 2.7
close all
clear all
format long
ii = 0;
for x = 0:.1:20
   ii = ii+1;
   val1(ii) = incomplete_gamma(x , 1);
   val2(ii) = incomplete_gamma(x , 3);
   val = incomplete_gamma(x , 6);
   val3(ii) = val;
   val = incomplete_gamma(x , 10);
   val4(ii) = val;
end
xx = 0:.1:20;
plot(xx,val1,'k',xx,val2,'k:',xx,val3,'k--',xx,val4,'k-.')
legend('N = 1','N = 3','N = 6','N = 10')
xlabel('x')
ylabel('Incomplete Gamma function (x,N)')
grid