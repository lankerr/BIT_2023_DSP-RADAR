% Use this program to reproduce Fig. 4.5 of tetxt
close all
clear all
eps = 0.0001;
taup = 1.;
b =10.;
up_down = 1.;
x = lfm_ambg(taup, b, up_down);
taux = -1.1*taup:.05:1.1*taup;
fdy = -b:.05:b;
figure(1)
mesh(taux,fdy,x)
xlabel ('Delay - seconds')
ylabel ('Doppler - Hz')
zlabel ('Ambiguity function')
figure(2)
contour(taux,fdy,x)
xlabel ('Delay - seconds')
ylabel ('Doppler - Hz')
y = sqrt(x);
figure(3)
mesh(taux,fdy,y)
xlabel ('Delay - seconds')
ylabel ('Doppler - Hz')
zlabel ('Uncertainty function')
figure(4)
contour(taux,fdy,y)
xlabel ('Delay - seconds')
ylabel ('Doppler - Hz')

