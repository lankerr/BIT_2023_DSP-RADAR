clear all
eps = 0.0000001;
npts = 5000;
del = 1./ 5000.;
t = 0. : del : 1.;
% generate input sequence
inp = 1.+ t.^3 + .5 .*t.^2 + cos(2.*pi*5 .* t) ;
% read the intial estimate for the state vector
X0 = [2,.1,.01]';
% this is the update interval in seconds
T = 100. * del;
% this is the value of the smoothing coefficient
xi = .1;
[residual, estimate] = ghk_tracker (X0, xi, inp, npts, T, eps);
figure(1)
plot (residual(1:500),'k')
xlabel ('Sample number')
ylabel ('Residual error')
grid
figure(2)
NN = 4999.;
n = 1:NN;
plot(n,estimate(1:NN),'k',n,inp(1:NN),'k--')
xlabel ('Sample number')
ylabel ('Position')
legend ('Estimated','Input')
figure(3)
plot(inp,'k')
xlabel ('Sample number')
ylabel ('Position')
