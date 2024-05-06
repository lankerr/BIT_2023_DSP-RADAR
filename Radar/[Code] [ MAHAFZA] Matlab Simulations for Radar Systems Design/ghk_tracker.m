function [residual, estimate] = ghk_tracker (X0, smoocof, inp, npts, T, nvar)
rn = 1.;
% read the intial estimate for the state vector
X = X0; 
theta = smoocof;
%compute values for alpha, beta, gamma
w1 = 1. - (theta^3);
w2 = 1.5 * (1. + theta) * ((1. - theta)^2) / T;
w3 = ((1. - theta)^3) / (T^2);
% setup the transition matrix PHI
PHI = [1. T (T^2)/2.;0. 1. T;0. 0. 1.];
while rn < npts ;
   %use the transition matrix to predict the next state
   XN = PHI * X;
   error = (inp(rn) + normrnd(0,nvar)) - XN(1);
   residual(rn) = error;
   tmp1 = w1 * error;
   tmp2 = w2 * error;
   tmp3 = w3 * error;
   % compute the next state
   X(1) = XN(1) + tmp1;
   X(2) = XN(2) + tmp2;
   X(3) = XN(3) + tmp3;
   estimate(rn) = X(1);
   rn = rn + 1.;
end
return
