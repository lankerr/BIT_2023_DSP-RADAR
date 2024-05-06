% Use this program to reproduce Fig 4.4 of text
close all
clear all
eps = 0.0001;
taup = 2.;
fd = -10./taup:.05:10./taup;
uncer = abs( sinc(taup .* fd));
ambg = uncer.^2;
plot(fd, ambg,'k')
xlabel ('Frequency - Hz')
ylabel ('Ambiguity - Volts')
grid
figure(2)
plot (fd, uncer,'k');
xlabel ('Frequency - Hz')
ylabel ('Uncertainty - Volts')
grid



      