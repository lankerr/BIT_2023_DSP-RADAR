function [residual, estimate] = kalman_filter(npts, T, X0, inp, R, nvar)
N = npts;
rn=1;
% read the intial estimate for the state vector
X = X0;
% it is assumed that the measurement vector H=[1,0,0]
% this is the state noise variance
VAR = nvar;
% setup the initial value for the prediction covariance.
S = [1. 1. 1.; 1. 1. 1.; 1. 1. 1.];
% setup the transition matrix PHI
PHI = [1. T (T^2)/2.; 0. 1. T; 0. 0. 1.];
% setup the state noise covariance matrix
Q(1,1) = (VAR * (T^5)) / 20.;
Q(1,2) = (VAR * (T^4)) / 8.;
Q(1,3) = (VAR * (T^3)) / 6.;
Q(2,1) = Q(1,2);
Q(2,2) = (VAR * (T^3)) / 3.;
Q(2,3) = (VAR * (T^2)) / 2.;
Q(3,1) = Q(1,3);
Q(3,2) = Q(2,3);
Q(3,3) = VAR * T;
while rn < N ;
   %use the transition matrix to predict the next state
   XN = PHI * X;
   % Perform error covariance extrapolation
   S = PHI * S * PHI' + Q;
   % compute the Kalman gains
   ak(1) = S(1,1) / (S(1,1) + R);
   ak(2) = S(1,2) / (S(1,1) + R);
   ak(3) = S(1,3) / (S(1,1) + R);
   %perform state estimate update:
   error = inp(rn) + normrnd(0,R) - XN(1);
   residual(rn) = error;
   tmp1 = ak(1) * error;
   tmp2 = ak(2) * error;
   tmp3 = ak(3) * error;
   X(1) = XN(1) + tmp1;
   X(2) = XN(2) + tmp2;
   X(3) = XN(3) + tmp3;
   estimate(rn) = X(1);
   % update the error covariance
   S(1,1) = S(1,1) * (1. -ak(1));
   S(1,2) = S(1,2) * (1. -ak(1));
   S(1,3) = S(1,3) * (1. -ak(1));
   S(2,1) = S(1,2);
   S(2,2) = -ak(2) * S(1,2) + S(2,2);
   S(2,3) = -ak(2) * S(1,3) + S(2,3);
   S(3,1) = S(1,3);
   S(3,3) = -ak(3) * S(1,3) + S(3,3);
   rn = rn + 1.;
end
