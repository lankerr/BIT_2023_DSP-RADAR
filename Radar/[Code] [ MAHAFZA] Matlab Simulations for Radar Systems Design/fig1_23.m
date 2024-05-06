% Use this program to reproduce Fig. 1.23
clear all
close all
x = linspace(-2*pi,2*pi, 200);
y = sinc(x);
y = y ./ (max(y));
figure (1)
plot(x, 20*log10(abs(y)));
grid
axis tight
xlabel('Angle - radians')
ylabel('Normalized antenna pattern -dB')
