clear all
xx = -2*pi:.1:2*pi;
[X,Y] = meshgrid(xx);
z = sqrt(X^2+Y^2);
x = sinc(z);