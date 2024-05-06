function [filtered, residuals , covariances, kalmgains] = kalfilt(trajectory, x0, P0, phi, R, Q )
% kalfilt.m
% by David J. Hall
% for Bassem Mahafza
% 10 June 2003
% 11:46
%
% USAGE: [filtered, residuals , covariances, kalmgains] = kalfilt(trajectory, x0, P0, phi, R, Q )
%
% INPUTS
%
% name         dimension                    explanation                                  units
%------        ------                       ---------------                              -------
% trajectory   NUMMEASUREMENTS X NUMPOINTS  trajectory in radar reference coords         [m;m;m]
% x0           NUMSTATES X 1                initial estimate of state vector             m, m/s
% P0           NUMSTATES X NUMSTATES        initial estimate of covariance matrix        m, m/s
% phi          NUMSTATES X NUMSTATES        state transition matrix                      -
% R            NUMMEASUREMENTS X NUMMEASUREMENTS   measurement error covariance matrix   m
% Q            NUMSTATES X NUMSTATES        state error covariance matrix                m, m/s
%
% OUTPUTS
%
% name         dimension                    explanation                                  units
%------        ------                       ---------------                              -------
% filtered     NUMSTATES X NUMPOINTS        filtered trajectory x,y,z pos, vel    [m; m/s; m; m/s; m; m/s]
% residuals    NUMSTATES X NUMPOINTS        residuals of filtering                [m;m;m]
% covariances  NUMSTATES X NUMPOINTS        diagonal of covariance matrix         [m;m;m]
% kalmgains    (NUMSTATES X NUMMEASUREMENTS) 
%                 X NUMPOINTS               Kalman gain matrix                    -
%


NUMSTATES = 6 ;
NUMMEASUREMENTS = 3 ;
NUMPOINTS = size(trajectory, 2) ;

% initialize output matrices
filtered = zeros(NUMSTATES, NUMPOINTS) ;
residuals = zeros(NUMSTATES, NUMPOINTS) ;
covariances = zeros(NUMSTATES, NUMPOINTS) ;
kalmgains = zeros(NUMSTATES*NUMMEASUREMENTS, NUMPOINTS) ;

% set matrix relating measurements to states
H = [1 0 0 0 0 0 ; 0 0 1 0 0 0 ; 0 0 0 0 1 0];

xhatminus = x0 ;
Pminus = P0 ;
   
for loop = 1: NUMPOINTS

   
   % compute the Kalman gain
   K = Pminus*H'*inv(H*Pminus*H' + R) ;
   kalmgains(:,loop) = reshape(K, NUMSTATES*NUMMEASUREMENTS, 1) ;
   
   % update the estimate with the measurement z
   z = trajectory(:,loop) ;
   xhat = xhatminus + K*(z - H*xhatminus) ;
   filtered(:,loop) = xhat ;
   residuals(:,loop) = xhat - xhatminus ;
   
   % update the error covariance for the updated estimate
   P = ( eye(NUMSTATES, NUMSTATES) - K*H)*Pminus ;
   covariances(:,loop) = diag(P) ;  % only save diagonal of covariance matrix
   
   % project ahead
   xhatminus_next = phi*xhat ;
   Pminus_next = phi*P*phi' + Q ;
   
   xhatminus = xhatminus_next ;
   Pminus = Pminus_next ;
   
end % next loop

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
