% Use this program to reproduce Fig. 4.2 of text
close all
clear all
eps = 0.000001;
taup = 3.;
taumin = -1.1 * taup;
taumax = -taumin;
x = single_pulse_ambg(taup);
taux = taumin:.05:taumax;
fdy = -7/taup:.05:7/taup;
figure(1)
mesh(taux,fdy,x);
xlabel ('Delay - seconds')
ylabel ('Doppler - Hz')
zlabel ('Ambiguity function')
colormap([.5 .5 .5])
colormap (gray)
figure(2)
contour(taux,fdy,x);
xlabel ('Delay - seconds')
ylabel ('Doppler - Hz')
colormap([.5 .5 .5])
colormap (gray)
grid
y = x.^2;
figure(3)
mesh(taux,fdy,y);
xlabel ('Delay - seconds')
ylabel ('Doppler - Hz')
zlabel ('Ambiguity function')
colormap([.5 .5 .5])
colormap (gray)
figure(4)
contour(taux,fdy,y);
xlabel ('Delay - seconds')
ylabel ('Doppler - Hz')
colormap([.5 .5 .5])
colormap (gray)
grid
