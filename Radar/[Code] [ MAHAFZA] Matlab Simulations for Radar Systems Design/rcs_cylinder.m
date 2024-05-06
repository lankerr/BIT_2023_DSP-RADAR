function [rcs] = rcs_cylinder(r1, r2, h, freq, phi, CylinderType)
% rcs_cylinder.m
% This program compute monostatic RCS for a finite length
% cylinder of either cricular or elliptical cross-section.
% Plot of RCS versus aspect angle theta is generated at a specified 
% input angle phi
% Last modified on July 16, 2003
 r = r1;           % radius of the circular cylinder
eps =0.00001;
dtr = pi/180;
phir = phi*dtr;
freqGH = num2str(freq*1.e-9);
lambda = 3.0e+8 /freq;      % wavelength
% CylinderType= 'Elliptic';   % 'Elliptic' or 'Circular' 

switch CylinderType
case 'Circular'
    % Compute RCS from 0 to (90-.5)  degrees 
    index = 0;
    for theta = 0.0:.1:90-.5
        index = index +1;
        thetar = theta * dtr;
        rcs(index) = (lambda * r * sin(thetar) / ...
            (8. * pi * (cos(thetar))^2)) + eps;
    end
    % Compute RCS for broadside specular at 90 degree
    thetar = pi/2;
    index = index +1;
    rcs(index) = (2. * pi * h^2 * r / lambda )+ eps;    
    % Compute RCS from (90+.5) to 180 degrees
    for theta = 90+.5:.1:180.
        index = index + 1;
        thetar = theta * dtr;
        rcs(index) = ( lambda * r * sin(thetar) / ...
            (8. * pi * (cos(thetar))^2)) + eps;
    end
case 'Elliptic'
    r12 = r1*r1;
    r22 = r2*r2;
    h2 = h*h;
    % Compute RCS from 0 to (90-.5)  degrees 
    index = 0;
    for theta = 0.0:.1:90-.5
        index = index +1;
        thetar = theta * dtr;
        rcs(index) =  lambda * r12 * r22 * sin(thetar) / ...
                 ( 8*pi* (cos(thetar)^2)* ( (r12*cos(phir)^2 + r22*sin(phir)^2)^1.5 ))+ eps;    
    end
    % Compute RCS for broadside specular at 90 degree
    index = index +1;
    rcs(index) = 2. * pi * h2 * r12 * r22 / ...
                 ( lambda*( (r12*cos(phir)^2 + r22*sin(phir)^2)^1.5 ))+ eps;    
    % Compute RCS from (90+.5) to 180 degrees
    for theta = 90+.5:.1:180.
        index = index + 1;
        thetar = theta * dtr;
        rcs(index) =  lambda * r12 * r22 * sin(thetar) / ...
                 ( 8*pi* cos(thetar)^2* ( (r12*cos(phir)^2 + r22*sin(phir)^2)^1.5 ))+ eps;    
    end
end

% Plot the results
delta= 180/(index-1);
angle = 0:delta:180;
plot(angle,10*log10(rcs),'k','linewidth',1.5);
grid;
xlabel ('Aspect angle, Theta [Degrees]');;
ylabel ('RCS - dBsm');
title  ([[CylinderType],'  Cylinder','  at Frequency = ',[freqGH],'  GHz']);
