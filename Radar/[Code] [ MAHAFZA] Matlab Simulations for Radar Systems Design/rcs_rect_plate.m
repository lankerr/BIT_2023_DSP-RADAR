function  [rcsdb_h,rcsdb_v] = rcs_rect_plate(a, b, freq)
% This program computes the backscattered RCS for a rectangular 
% flat plate. The RCS is computed for vertical and horizontal
% polarization based on Eq.s(11.50)through (11.60). Also Physical
% Optics approximation Eq.(11.62) is computed.
% User may vary frequency, or the plate's dimensions.
% Default values are a=b=10.16cm; lambda=3.25cm.
eps = 0.000001;
% Enter a, b, and lambda
lambda = .0325;
ka = 2. * pi * a / lambda;
% Compute aspect angle vector
theta_deg = 0.05:0.1:85;
theta = (pi/180.) .* theta_deg;
sigma1v = cos(ka .*sin(theta)) - i .* sin(ka .*sin(theta)) ./ sin(theta);
sigma2v = exp(i * ka - (pi /4)) / (sqrt(2 * pi) *(ka)^1.5);
sigma3v = (1. + sin(theta)) .* exp(-i * ka .* sin(theta)) ./ ...
   (1. - sin(theta)).^2;
sigma4v = (1. - sin(theta)) .* exp(i * ka .* sin(theta)) ./ ...
   (1. + sin(theta)).^2;
sigma5v = 1. - (exp(i * 2. * ka - (pi / 2)) / (8. * pi * (ka)^3));
sigma1h = cos(ka .*sin(theta)) + i .* sin(ka .*sin(theta)) ./ sin(theta);
sigma2h = 4. * exp(i * ka * (pi / 4.)) / (sqrt(2 * pi * ka));
sigma3h =  exp(-i * ka .* sin(theta)) ./ (1. - sin(theta));
sigma4h = exp(i * ka * sin(theta)) ./ (1. + sin(theta));
sigma5h = 1. - (exp(j * 2. * ka + (pi / 4.)) / 2. * pi * ka);
% Compute vertical polarization RCS
rcs_v = (b^2 / pi) .* (abs(sigma1v - sigma2v .*((1. ./ cos(theta)) ...
   + .25 .* sigma2v .* (sigma3v + sigma4v)) .* (sigma5v).^-1)).^2 + eps;
% compute horizontal polarization RCS
rcs_h = (b^2 / pi) .* (abs(sigma1h - sigma2h .*((1. ./ cos(theta)) ...
   - .25 .* sigma2h .* (sigma3h + sigma4h)) .* (sigma5h).^-1)).^2 + eps;
% Compute RCS from Physical Optics, Eq.(2.62)
angle = ka .* sin(theta);
rcs_po = (4. * pi* a^2 * b^2 / lambda^2 ).*  (cos(theta)).^2 .* ...
   ((sin(angle) ./ angle).^2) + eps;
rcsdb_v = 10. .*log10(rcs_v);
rcsdb_h = 10. .*log10(rcs_h);
rcsdb_po = 10. .*log10(rcs_po);
figure(2)
plot (theta_deg, rcsdb_v,'k',theta_deg,rcsdb_po,'k -.');
set(gca,'xtick',[10:10:85]);
freqGH = num2str(freq*1.e-9);
A = num2str(a);
B = num2str(b);
title (['Vertical Polarization,  ','Frequency = ',[freqGH],'  GHz, ', '  a = ', [A], ' m','  b = ',[B],' m']);
ylabel ('RCS -dBsm');
xlabel ('Aspect angle - deg');
legend('Eq.(11.50)','Eq.(11.62)')
figure(3)
plot (theta_deg, rcsdb_h,'k',theta_deg,rcsdb_po,'k -.');
set(gca,'xtick',[10:10:85]);
title (['Horizontal Polarization,  ','Frequency = ',[freqGH],'  GHz, ', '  a = ', [A], ' m','  b = ',[B],' m']);
ylabel ('RCS -dBsm');
xlabel ('Aspect angle - deg');
legend('Eq.(11.51)','Eq.(11.62)')


