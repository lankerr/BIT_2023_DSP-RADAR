% testkalm.m
% by David J. Hall
% for Bassem Mahafza
% 18 June 2003
% 14:51

% tests Kalman filter

close all
clear

npts = 2000 ;
del = 1/2000 ;
t = 0:del:1 ;
inp = (1+.2.*t+.1.*t.^2)+cos(2.*pi*5.0.*t);
T=1;
R=0.035;
nvar = 0.5
inp = inp+ones(1,2001).*R.*randn(1,2001);
trajectory = [inp;inp;inp] ;
x0 = zeros(6,1) 
 
P0 = diag([.5 .5 .5 .5 .5 .5])
phi = [1 T 0 0 0 0; 0 1 0 0 0 0 ; 0 0 1 T 0 0 ; 0 0 0 1 0 0  ; 0 0 0 0 1 T ; 0 0 0 0 0 1]
Q = diag([.035^2 .035^2 .035^2 .035^2 .035^2 .035^2])
R =diag([.5^2 .5^2 .5^2])
[filtered, residuals , covariances, kalmgains] = kalfilt(trajectory, x0, P0, phi, R, Q );

figure(1)
plot(trajectory(1,:))
grid on
axis([0 2000 -0.5 2.5]) ;

figure(2)
plot(filtered(1,:))
grid on
axis([0 2000 -0.5 2.5]) ;

figure(3)
plot(residuals(1,:))
grid on
axis([ 0 2000 -.1 .1 ]);