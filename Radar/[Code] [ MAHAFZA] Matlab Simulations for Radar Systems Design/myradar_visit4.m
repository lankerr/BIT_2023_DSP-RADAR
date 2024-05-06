% Use this program to reproduce Fig.s 4.5 to 4.27 of tetxt
close all
clear all
eps = 0.0001;
taup = 20.e-6;
b =5.e6;
up_down = 1.;
i = 0;
mu = up_down * b / 2. / taup;
delt = 2.2*taup /450;
delf = 2*b /500;
for tau = -1.1*taup:delt:1.1*taup
   i = i + 1;
   j = 0;
   for fd = -b:delf:b
      j = j + 1;
      val1 = 1. - abs(tau) / taup;
      val2 = pi * taup * (1.0 - abs(tau) / taup);
      val3 = (fd + mu * tau);
      val = val2 * val3;
      x(j,i) = abs( val1 * (sin(val+eps)/(val+eps))).^2;
   end
end
taux = linspace(-1.1*taup,1.1*taup,451).*1e6;
fdy = linspace(-b,b,501) .* 1e-6;
figure(1)
mesh(taux,fdy,sqrt(x))
xlabel ('Delay - Micro-seconds')
ylabel ('Doppler - MHz')
zlabel ('Ambiguity function')
figure(2)
contour(taux,fdy,sqrt(x))
xlabel ('Delay - Micro-seconds')
ylabel ('Doppler - MHz')
grid
