% this is the input vector to the tracker
%inp=[10,15,25,30,40,45,46,48,54,55,60,65,68,69,73,75,80,84,88,90];
% this is the number of data points 
N=2000;
del = 1/5000;
t= 0:del:1;
%inp=(1+.2 .* t + .1 .*t.^2+randn(size(t))) ./10;
inp=(1+.2 .* t + .1 .*t.^2);
rn=1;
% read the intial estimate for the state vector
X=[1,.1,.01]';
% this is the update interval in seconds
T=1;
% this is the value of theta
theta=.8;
%compute values for alpha, beta, gamma
w1=1-(theta^3);
w2=1.5*(1+theta)*((1-theta)^2)/T;
w3=((1-theta)^3)/(T^2);
% setup the transition matrix PHI
PHI=[1 T (T^2)/2;0 1 T;0 0 1];
while rn < N ;
   %use the transition matrix to predict the next state
   XN=PHI*X;
   %inp(rn)=inp(rn)+normrnd(0,.00001);
   error=inp(rn)-XN(1);
   residual(rn)=error;
   tmp1= w1*error;
   tmp2= w2*error;
   tmp3= w3*error;
   % compute the next state
   X(1)=XN(1)+tmp1;
   X(2)=XN(2)+tmp2;
   X(3)=XN(3)+tmp3;
   estimate(rn)=X(1);
   rn=rn+1;
end
plot(residual)
figure(2)
plot(inp)
figure(3)
plot(estimate)
