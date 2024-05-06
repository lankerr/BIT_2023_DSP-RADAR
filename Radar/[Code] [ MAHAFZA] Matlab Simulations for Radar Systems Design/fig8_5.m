% Use this code to produce figure 8.5a and 8.5b based on equation 8.34
clear all
close all
eps = 0.00001;
k = 2*pi;
theta = -pi : pi / 10791 : pi;
var = sin(theta);
nelements = 8;
d = 1;         %  d = 1;
num = sin((nelements * k * d * 0.5) .* var);

if(abs(num) <= eps)
   num = eps;
end
den = sin((k* d * 0.5) .* var);
if(abs(den) <= eps)
   den = eps;
end

pattern = abs(num ./ den);
maxval = max(pattern);
pattern = pattern ./ maxval;

figure(1)
plot(var,pattern)
xlabel('sine angle - dimensionless')
ylabel('Array pattern')
grid

figure(2)
plot(var,20*log10(pattern))
axis ([-1 1 -60 0])
xlabel('sine angle - dimensionless')
ylabel('Power pattern [dB]')
grid;

figure(3)
theta = theta +pi/2;
polar(theta,pattern)
title ('Array pattern')

figure(4)
polardb(theta,pattern)
title ('Power pattern [dB]')

