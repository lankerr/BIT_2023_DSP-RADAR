clear all
indes = 0;
eps =0.00001;
a1 =.125;
h = 1.;
lambda = 3.0e+8 /9.5e+9;
lambda = 0.00861;
index = 0;
for theta = 0.0:.1:90-.1
   index = index +1;
   theta = theta * pi /180.;
   rcs(index) = (lambda * a1 * sin(theta) / ...
      (8 * pi * (cos(theta))^2)) + eps;
end
theta*180/pi
theta = pi/2;
index = index +1
rcs(index) = (2 * pi * h^2 * a1 / lambda )+ eps;
for theta = 90+.1:.1:180.
   index = index + 1;
   theta = theta * pi / 180.;
   rcs(index) = ( lambda * a1 * sin(theta) / ...
      (8 * pi * (cos(theta))^2)) + eps;
end
%%%%%%%%%%%
r = a1;
index = 0;
for aspect_deg = 0.:.1:180
   index = index +1;
   aspect = (pi /180.) * aspect_deg; 
% Compute RCS using Eq. (2.37)
   if (aspect == 0 | aspect == pi)
       rcs_po(index) = (4.0 * pi^3 * r^4 / lambda^2) + eps;
       rcs_mu(index) = rcs_po(1);
    else
       x = (4. * pi * r / lambda) * sin(aspect);
       val1 = 4. * pi^3 * r^4 / lambda^2;
       val2 = 2. * besselj(1,x) / x;
       rcs_po(index) = val1 * (val2 * cos(aspect))^2 + eps;
    end
 end
rcs_t =(rcs_po + rcs);

%%%%%%%%%%%%%
angle = 0:.1:180;
plot(angle,10*log10(rcs_t(1:1801)));
grid
