function rcs = cylinder (r, h, lambda)
% This program compute monostatic RCS for a cylinder
% Circular symmetry is assumed.
% Plot of RCS versus aspect angle is produced
%clear all
index = 0;
eps =0.00001;
% Enter dimensions of cylinder
%r = .125;
%h = 1.;
% Compute wavelength
%lambda = 3.0e+8 /9.5e+9;
% Compute RCS from zero aspect to broadside
for theta = 0.0:.1:90-.5
   index = index +1;
   theta = theta * pi /180.;
   rcs(index) = (lambda * r * sin(theta) / ...
      (8. * pi * (cos(theta))^2)) + eps;
end
% Compute RCS for broadside specular
theta = pi/2;
index = index +1;
rcs(index) = (2. * pi * h^2 * r / lambda )+ eps;
% Compute RCS from 90 to 180 degrees
for theta = 90+.5:.1:180.
   index = index + 1;
   theta = theta * pi / 180.;
   rcs(index) = ( lambda * r * sin(theta) / ...
      (8. * pi * (cos(theta))^2)) + eps;
end
% Plot results
delta= 180/(index-1)
angle = 0:delta:180;
plot(angle,10*log10(rcs),'k');
grid;
xlabel ('Aspect angle - degrees');
ylabel ('RCS - dBsm');
title  ('Frequency = 9.5 GHz');
