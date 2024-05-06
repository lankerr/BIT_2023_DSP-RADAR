function [noisytraj ] = addnoise(trajectory, sigmaaz, sigmael, sigmarange )
% addnoise.m
% by David J. Hall
% for Bassem Mahafza
% 10 June 2003
% 11:46
%
% USAGE: [noisytraj ] = addnoise(trajectory, sigmaaz, sigmael, sigmarange )
%
% INPUTS
%
% name         dimension  explanation                             units
%------        ------     ---------------                         -------
% trajectory   3 X POINTS trajectory in radar reference coords    [m;m;m]
% sigmaaz      1          standard deviation of azimuth error     radians
% sigmael      1          standard deviation of elevation error   radians
% sigmarange   1          standard deviation of range error       m
%
% OUTPUTS
%
% name         dimension   explanation                            units
%------        ------      ---------------                        -------
% noisytraj    3 X POINTS  noisy trajectory                       [m;m;m]

noisytraj = zeros(3, size(trajectory,2)) ;

for loop = 1 : size(trajectory,2)
   x = trajectory(1,loop);
   y = trajectory(2,loop);
   z = trajectory(3,loop);
   azimuth_corrupted =  atan2(y,x) + sigmaaz*randn(1) ;
   elevation_corrupted = atan2(z, sqrt(x^2+y^2)) + sigmael*randn(1) ;
   range_corrupted = sqrt(x^2+y^2+z^2)  + sigmarange*randn(1) ;
   x_corrupted = range_corrupted*cos(elevation_corrupted)*cos(azimuth_corrupted) ;
   y_corrupted = range_corrupted*cos(elevation_corrupted)*sin(azimuth_corrupted) ;
   z_corrupted = range_corrupted*sin(elevation_corrupted) ;
   noisytraj(:,loop) = [x_corrupted ; y_corrupted; z_corrupted ] ;
end % next loop