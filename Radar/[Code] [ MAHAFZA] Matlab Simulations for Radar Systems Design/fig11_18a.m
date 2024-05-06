% Use this program to reproduce Fig. 11.18a
%This program computes the back-scattered RCS for an ellipsoid.
% The angle phi is fixed to three values 0, 45, and 90 degrees
% The angle theta is varied from 0-180 deg.
% A plot of RCS versus theta is generated
% Last modified on July 16, 2003
clear all;

% ===   Input parameters   ===
a = .15;            % 15 cm
b = .20;            % 20 cm
c = .95 ;           % 95 cm
% ===   End of Input parameters   ===

as = num2str(a);
bs = num2str(b);
cs = num2str(c);
eps = 0.00001;
dtr = pi/180;
for q = 1:3
    if q == 1 
        phir = 0;       % the first value of the angle phi
    elseif q == 2
        phir = pi/4;    % the second value of the angle phi
    elseif q == 3
        phir = pi/2;    % the third value of the angle phi
    end   
    sin_phi_s = sin(phir)^2;
    cos_phi_s = cos(phir)^2;
    % Generate aspect angle vector
    theta = 0.:.05:180;
    thetar = theta * dtr;
    if(a ~= b & a ~= c)
        rcs(q,:) = (pi * a^2 * b^2 * c^2) ./ (a^2 * cos_phi_s .* (sin(thetar).^2) + ...
            b^2 * sin_phi_s .* (sin(thetar).^2) + ...
            c^2 .* (cos(thetar).^2)).^2 ;
    elseif(a == b & a ~= c)
        rcs(q,:) = (pi * b^4 * c^2) ./ ( b^2 .* (sin(thetar).^2) + ...
            c^2 .* (cos(thetar).^2)).^2 ;
    elseif (a == b & a ==c)
        rcs(q,:) = pi * c^2;
    end
end
rcs_db = 10.0 * log10(rcs);
figure (1);
plot(theta,rcs_db(1,:),'b',theta,rcs_db(2,:),'r:',theta,rcs_db(3,:),'g--','linewidth',1.5);
xlabel ('Aspect angle, Theta [Degrees]');
ylabel ('RCS - dBsm');
title (['Ellipsoid with (a,b,c) = (', [as],', ', [bs],', ', [cs], ')  meter'])
legend ('phi = 0^o','phi = 45^o','phi = 90^o')
grid;