% This program can be used tore-produce Figure 2.2 of text
clear all
close all
xg = linspace(-6,6,1500); % randowm variable between -4 and 4
xr = linspace(0,6,1500); % randowm variable between 0 and 8
mu = 0; % zero mean Gaussain pdf mean
sigma = 1.5; % standard deviation (sqrt(variance) 
ynorm = normpdf(xg,mu,sigma); % use MATLAB funtion normpdf
yray = raylpdf(xr,sigma); % use MATLAB function raylpdf
plot(xg,ynorm,'k',xr,yray,'k-.');
grid
legend('Gaussian pdf','Rayleigh pdf')
xlabel('x')
ylabel('Probability density')
gtext('\mu = 0; \sigma = 1.5')
gtext('\sigma =1.5')