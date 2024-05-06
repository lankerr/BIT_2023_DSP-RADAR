function [rcs] = rcs_frequency (scat_spacing, frequ, freql)
% This program demonstrates the dependency of RCS on wavelength 
% The default frequency band is X-band (8 - 12.5 GHz), and two 
% unity point scatterers separated by 0.2 meters
% The radar line of sight is alinged with the two scatterers
% A plot of RCS variation versus frequency if produced

% Users may vary frequency band, and/or scatterres spacing 

eps = 0.0001;
% Enter scatterer spacing, in meters
%scat_spacing = .1;
% Enter frequency band 
freq_band = frequ - freql;
delfreq = freq_band / 500.;
index = 0;
for freq = freql: delfreq: frequ
   index = index +1;
   wavelength(index) = 3.0e+8 / freq;
end
% Compute electrical scatterer spacing vector in wavelength units
elec_spacing = 2.0 * scat_spacing ./ wavelength;
% Compute RCS (RCS = RCS_scat1 + RCS_scat2) 
rcs = abs (  1 + cos((2.0 * pi) .* elec_spacing) ... 
            + i * sin((2.0 * pi) .* elec_spacing));
rcs = rcs + eps;
rcs = 20.0*log10(rcs); % RCS ins dBsm
% Plot RCS versus frequency
freq = freql:delfreq:frequ;
%figure (1);
plot(freq,rcs);
grid;
xlabel('Frequency');
ylabel('RCS in dBsm');
%title(' X=Band; scatterer spacing is 0.2m');

