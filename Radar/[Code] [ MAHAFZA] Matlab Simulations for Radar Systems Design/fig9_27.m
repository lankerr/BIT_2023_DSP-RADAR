clear all
npts = 2000;
del = 1/2000;
t = 0:del:1;
inp = (1+.2 .* t + .1 .*t.^2);% + cos(2. * pi * 2.5 .* t);
X0 = [1,.1,.01]';
% it is assumed that the measurmeny vector H=[1,0,0]
% this is the update interval in seconds
T = 1.;
% enter the mesurement noise variance
R = .01;
% this is the state noise variance
nvar = .18;
[residual, estimate] = kalman_filter(npts, T, X0, inp, R, nvar);
figure(1)
plot(residual(1:500),'k')
xlabel ('Sample number')
ylabel ('Residual')
figure(2)
subplot(2,1,1)
plot(inp,'k')
axis tight
ylabel ('position - truth')
subplot(2,1,2)
plot(estimate,'k')
axis tight
xlabel ('Sample number')
ylabel ('Predicted position')
