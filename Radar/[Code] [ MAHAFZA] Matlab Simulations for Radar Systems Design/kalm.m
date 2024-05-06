function kalm(start_loc, velocity, yamp, yperiod, zamp, zperiod, samplingtime, deltat, sigmaaz, sigmael, sigmarange, x0, P0, R, Q)
% kalm.m
% by David J. Hall
% for Bassem Mahafza
% 17 June 2003
% 16:34
%


   phi = [1 deltat 0 0 0 0 ;     % state transition matrix 
     0 1 0 0 0 0 ;
     0 0 1 deltat 0 0 ;
     0 0 0 1 0 0 ;
     0 0 0 0 1 deltat ;
     0 0 0 0 0 1];



% make trajectory based on parameters
[times trajectory] = maketraj(start_loc, velocity, yamp, yperiod, zamp, zperiod, samplingtime, deltat) ;

figure
plot3( trajectory(1,:), trajectory(2,:), trajectory(3,:) )
grid on
title('desired trajectory')
xlabel('x  m')
ylabel('y  m')
zlabel('z  m')
view(22,66)

% add noise to corrupt trajectory
[noisytraj] = addnoise(trajectory, sigmaaz, sigmael, sigmarange ) ;

figure
plot3( noisytraj(1,:), noisytraj(2,:), noisytraj(3,:) )
grid on
title('corrupted trajectory')
xlabel('x  m')
ylabel('y  m')
zlabel('z  m')
view(22,66)

figure
plot(times, noisytraj(1,:), times, trajectory(1,:))
title('x position')
xlabel('sec')
ylabel('m')
legend('corrupted','uncorrupted')
grid on

figure
plot(times, noisytraj(2,:), times, trajectory(2,:))
title('y position')
xlabel('sec')
ylabel('m')
legend('corrupted','uncorrupted')
grid on

figure
plot(times, noisytraj(3,:), times, trajectory(3,:))
title('z position')
xlabel('sec')
ylabel('m')
legend('corrupted','uncorrupted')
grid on

% perform Kalman filtering on corrupted trajectory
[filtered, residuals , covariances, kalmgains] = kalfilt(noisytraj, x0, P0, phi, R, Q ) ;

% plot trajectory vs. filtered positions
figure
subplot(3,1,1)
plot(times, noisytraj(1,:), times, filtered(1,:) ) ;
grid on
title('x position')
legend('trajectory','filtered')
xlabel('sec')
ylabel('m')
subplot(3,1,2)
plot(times, noisytraj(2,:), times, filtered(3,:) ) ;
grid on
title('y position')
legend('trajectory','filtered')
xlabel('sec')
ylabel('m')
subplot(3,1,3)
plot(times, noisytraj(3,:), times, filtered(5,:) ) ;
grid on
title('z position')
legend('trajectory','filtered')
xlabel('sec')
ylabel('m')

% plot filtered velocities
figure
subplot(3,1,1)
plot(times, filtered(2,:) ) ;
grid on
title('x velocity')
xlabel('sec')
ylabel('m per sec')
axis([0 times(length(times)) min(filtered(2, 3:length(times)))  max(filtered(2, 3:length(times))) ]);
subplot(3,1,2)
plot(times, filtered(4,:) ) ;
grid on
title('y velocity')
xlabel('sec')
ylabel('m per sec')
axis([0 times(length(times)) min(filtered(4, 3:length(times)))  max(filtered(4, 3:length(times))) ]);
subplot(3,1,3)
plot(times, filtered(6,:) ) ;
grid on
title('z velocity')
xlabel('sec')
ylabel('m per sec')
axis([0 times(length(times)) min(filtered(6, 3:length(times)))  max(filtered(6, 3:length(times))) ]);


% plot residuals of positions
figure
subplot(3,1,1)
plot(times, residuals(1,:) ) ;
grid on
title('x position residual')
xlabel('seconds')
ylabel('m')
axis([0 times(length(times)) min(residuals(1, 3:length(times)))  max(residuals(1, 3:length(times))) ]);
subplot(3,1,2)
plot(times, residuals(3,:) ) ;
grid on
title('y position residual')
xlabel('seconds')
ylabel('m')
axis([0 times(length(times)) min(residuals(3, 3:length(times)))  max(residuals(3, 3:length(times))) ]);
subplot(3,1,3)
plot(times, residuals(5,:) ) ;
grid on
title('z position residual')
xlabel('seconds')
ylabel('m')
axis([0 times(length(times)) min(residuals(5, 3:length(times)))  max(residuals(5, 3:length(times))) ]);

% plot residuals of velocities
figure
subplot(3,1,1)
plot(times, residuals(2,:) ) ;
grid on
title('x velocity residual')
xlabel('sec')
ylabel('m per sec')
axis([0 times(length(times)) min(residuals(2, 3:length(times)))  max(residuals(2, 3:length(times))) ]);
subplot(3,1,2)
plot(times, residuals(4,:) ) ;
grid on
title('y velocity residual')
xlabel('sec')
ylabel('m per sec')
axis([0 times(length(times)) min(residuals(4, 3:length(times)))  max(residuals(4, 3:length(times))) ]);
subplot(3,1,3)
plot(times, residuals(6,:) ) ;
grid on
title('z velocity residual')
xlabel('sec')
ylabel('m per sec')
axis([0 times(length(times)) min(residuals(6, 3:length(times)))  max(residuals(6, 3:length(times))) ]);

% plot covariances
figure
subplot(6,1,1)
plot(times, covariances(1,:) )
grid on
title('covariance 1')
xlabel('sec')
axis([0 times(length(times)) min(covariances(1, 3:length(times)))  max(covariances(1, 3:length(times))) ]);

subplot(6,1,2)
plot(times, covariances(2,:) )
grid on
title('covariance 2')
xlabel('sec')
axis([0 times(length(times)) min(covariances(2, 3:length(times)))  max(covariances(2, 3:length(times))) ]);

subplot(6,1,3)
plot(times, covariances(3,:) )
grid on
title('covariance 3')
xlabel('sec')
axis([0 times(length(times)) min(covariances(3, 3:length(times)))  max(covariances(3, 3:length(times))) ]);

subplot(6,1,4)
plot(times, covariances(4,:) )
grid on
title('covariance 4')
xlabel('sec')
axis([0 times(length(times)) min(covariances(4, 3:length(times)))  max(covariances(4, 3:length(times))) ]);

subplot(6,1,5)
plot(times, covariances(5,:) )
grid on
title('covariance 5')
xlabel('sec')
axis([0 times(length(times)) min(covariances(5, 3:length(times)))  max(covariances(5, 3:length(times))) ]);

subplot(6,1,6)
plot(times, covariances(6,:) )
grid on
title('covariance 6')
xlabel('sec')
axis([0 times(length(times)) min(covariances(6, 3:length(times)))  max(covariances(6, 3:length(times))) ]);



% plot Kalman gains
figure
subplot(3,2,1)
plot(times, kalmgains(1,:))
grid on
xlabel('sec')
title('Kalman gains 1 1')
axis([0 times(length(times)) min(kalmgains(1, 3:length(times)))  max(kalmgains(1, 3:length(times))) ]);

subplot(3,2,2)
plot(times, kalmgains(2,:))
grid on
xlabel('sec')
title('Kalman gains 2 1')
axis([0 times(length(times)) min(kalmgains(2, 3:length(times)))  max(kalmgains(2, 3:length(times))) ]);

subplot(3,2,3)
plot(times, kalmgains(9,:))
grid on
xlabel('sec')
title('Kalman gains 3 2')
axis([0 times(length(times)) min(kalmgains(9, 3:length(times)))  max(kalmgains(9, 3:length(times))) ]);

subplot(3,2,4)
plot(times, kalmgains(10,:))
grid on
xlabel('sec')
title('Kalman gains 4 2')
axis([0 times(length(times)) min(kalmgains(10, 3:length(times)))  max(kalmgains(10, 3:length(times))) ]);

subplot(3,2,5)
plot(times, kalmgains(17,:))
grid on
xlabel('sec')
title('Kalman gains 5 3')
axis([0 times(length(times)) min(kalmgains(17, 3:length(times)))  max(kalmgains(17, 3:length(times))) ]);

subplot(3,2,6)
plot(times, kalmgains(18,:))
grid on
xlabel('sec')
title('Kalman gains 6 3')
axis([0 times(length(times)) min(kalmgains(18, 3:length(times)))  max(kalmgains(18, 3:length(times))) ]);




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%