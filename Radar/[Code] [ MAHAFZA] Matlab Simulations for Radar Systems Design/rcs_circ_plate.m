function [rcsdb] = rcs_circ_plate (r, freq) 
% This program calculates and plots the backscattered RCS of
% circular flat plate of radius r.
eps = 0.000001;
% Compute aspect angle vector
% Compute wavelength
lambda = 3.e+8 / freq; % X-Band
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
% Compute RCS using Eq. (2.36)
       val1m = lambda * r;
       val2m = 8. * pi * sin(aspect) * (tan(aspect)^2);
       rcs_mu(index) = val1m / val2m + eps;
    end
 end
 % Compute RCS using Eq. (2.35) (theta=0,180)
rcsdb = 10. * log10(rcs_po);
rcsdb_mu = 10 * log10(rcs_mu);
angle = 0:.1:180;
plot(angle,rcsdb,'k',angle,rcsdb_mu,'k-.')
grid;
xlabel ('Aspect angle - degrees');
ylabel ('RCS - dBsm');
legend('Using Eq.(11.37)','Using Eq.(11.36)')
freqGH = num2str(freq*1.e-9);
title (['Frequency = ',[freqGH],'  GHz']);


