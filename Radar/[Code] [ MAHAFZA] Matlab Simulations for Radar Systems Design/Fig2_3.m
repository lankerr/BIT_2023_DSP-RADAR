%This program generates Figure 2.3.
close all
clear all
logpfa = linspace(.01,250,1000);
var = 10.^(logpfa ./ 10.0);
vtnorm =  sqrt( log (var));
semilogx(logpfa, vtnorm,'k')
grid
