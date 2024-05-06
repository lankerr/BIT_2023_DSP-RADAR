% Use this program to reproduce Fig. 4.6 of text
close all
clear all
taup = 1;
b =20.;
up_down = 1.;
taux = -1.5*taup:.01:1.5*taup;
fd = 0.;
mu = up_down * b / 2. / taup;
ii = 0.;
for tau = -1.5*taup:.01:1.5*taup
   ii = ii + 1;
   val1 = 1. - abs(tau) / taup;
   val2 = pi * taup * (1.0 - abs(tau) / taup);
   val3 = (fd + mu * tau);
   val = val2 * val3;
   x(ii) = abs( val1 * (sin(val+eps)/(val+eps)));
end
figure(1)
plot(taux,x)
grid
xlabel ('Delay - seconds')
ylabel ('Uncertainty')
figure(2)
plot(taux,x.^2)
grid
xlabel ('Delay - seconds')
ylabel ('Ambiguity')
