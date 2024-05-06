function [rcs] = rcs_isosceles (a, b, freq, phi)
% This program caculates the backscattered RCS for a perfectly
% conducting triangular flat plate, using Eq.s (2.63) through (2.65)
% The default case is to assume phi = pi/2. These equations are
% valid for aspect angles less than 30 degrees
% Users may vary wavelngth, or plate's dimensions
% Enter a, b, and lambda
A = a * b / 2.;
lambda = 3.e+8 / freq;
ka = 2. * pi / lambda;
kb = 2. *pi / lambda;
% Compute theta vector
theta_deg = 0.01:.05:89;
theta = (pi /180.) .* theta_deg;
alpha = ka * cos(phi) .* sin(theta);
beta =  kb * sin(phi) .* sin(theta);
if (phi == pi / 2)
  rcs = (4. * pi * A^2 / lambda^2) .* cos(theta).^2 .* (sin(beta ./ 2)).^4 ...
     ./ (beta./2).^4 + eps;
end
if (phi == 0)
   rcs = (4. * pi * A^2 / lambda^2) .* cos(theta).^2 .* ...
      ((sin(alpha).^4 ./ alpha.^4) + (sin(2 .* alpha) - 2.*alpha).^2 ...
      ./ (4 .* alpha.^4)) + eps;
end
if (phi ~= 0 & phi ~= pi/2)
   sigmao1 = 0.25 *sin(phi)^2 .* ((2. * a / b) * cos(phi) .* ...
      sin(beta) - sin(phi) .* sin(2. .* alpha)).^2;
   fact1 = (alpha).^2 - (.5 .* beta).^2;
   fact2 = (sin(alpha).^2 - sin(.5 .* beta).^2).^2;
   sigmao = (fact2 + sigmao1) ./ fact1;
   rcs = (4. * pi * A^2 / lambda^2) .* cos(theta).^2 .* sigmao + eps;
end
rcsdb = 10. *log10(rcs);
plot(theta_deg,rcsdb,'k','linewidth', 1.)
xlabel ('Aspect angle - degrees');
ylabel ('RCS - dBsm')
grid
