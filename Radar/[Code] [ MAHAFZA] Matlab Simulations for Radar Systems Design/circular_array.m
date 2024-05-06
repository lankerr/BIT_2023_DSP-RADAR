 %Circular Array in the x-y plane 
% Element is a short dipole antenna parallel to the z axis
% 2D Radiation Patterns for fixed phi or fixed theta
% dB polar plots uses the polardb.m file
% Last modified: July 13, 2003
%
%%%% Element expression needs to be modified if different
%%%% than a short dipole antenna along the z axis
%
clear all
clf
% close all

%  ====   Input Parameters  ====
a = 1.;         % radius of the circle
N = 10;           % number of Elements of the circular array
theta0 = 45;    % main beam Theta direction
phi0 = 60;      % main beam Phi direction
% Theta or Phi variations for the calculations of the far field pattern
Variations = 'Phi';  % Correct selections are  'Theta' or 'Phi' 
phid = 60;       % constant phi plane for theta variations
thetad = 45;     % constant theta plane for phi variations
%  ====   End of Input parameters section  ====

dtr = pi/180;           % conversion factors
rtd = 180/pi;
phi0r = phi0*dtr;
theta0r = theta0*dtr;
lambda = 1;   
k = 2*pi/lambda;
ka = k*a;               % Wavenumber times the radius
jka = j*ka;
I(1:N) = 1;             % Elements excitation Amplitude and Phase
alpha(1:N) =0;    
for n = 1:N             % Element positions Uniformly distributed along the circle
    phin(n) = 2*pi*n/N;
end

switch Variations
case 'Theta'
    phir = phid*dtr;    % Pattern in a constant Phi plane 
    i = 0;
    for theta = 0.001:1:181
        i = i+1;
        thetar(i) = theta*dtr;
        angled(i) = theta;  angler(i) = thetar(i);
        Arrayfactor(i) = 0;
        for n = 1:N
            Arrayfactor(i) = Arrayfactor(i) + I(n)*exp(j*alpha(n)) ...
                           * exp( jka*(sin(thetar(i))*cos(phir -phin(n))) ...
                                 -jka*(sin(theta0r  )*cos(phi0r-phin(n)))  );             
        end
        Arrayfactor(i) = abs(Arrayfactor(i));
        Element(i) = abs(sin(thetar(i)+0*dtr));  % use the abs function to avoid 
    end
case 'Phi'
    thetar = thetad*dtr;  % Pattern in a constant Theta plane 
    i = 0;
    for phi = 0.001:1:361
        i = i+1;
        phir(i)   = phi*dtr;
        angled(i) = phi;  angler(i) = phir(i);
        Arrayfactor(i) = 0;
        for n = 1:N
            Arrayfactor(i) = Arrayfactor(i) +  I(n)*exp(j*alpha(n)) ...
                           * exp( jka*(sin(thetar )*cos(phir(i)-phin(n))) ...
                                 -jka*(sin(theta0r)*cos(phi0r  -phin(n)))  );              
        end
        Arrayfactor(i) = abs(Arrayfactor(i));
        Element(i) = abs(sin(thetar+0*dtr));  % use the abs function to avoid 
    end   
end
angler = angled*dtr;
Element = Element/max(Element);
Array = Arrayfactor/max(Arrayfactor);
ArraydB = 20*log10(Array);
EtotalR =(Element.*Arrayfactor)/max(Element.*Arrayfactor);

figure(1)
plot(angled,Array)
ylabel('Array pattern')
grid
switch Variations
case 'Theta'
  axis ([0 180 0 1 ])
%  theta = theta +pi/2;
   xlabel('Theta [Degrees]')
   title ( 'phi = 90^o plane')
case 'Phi'
axis ([0 360 0 1 ])
   xlabel('Phi [Degrees]')
    title ( 'Theta = 90^o plane')
end

figure(2)
plot(angled,ArraydB)
%axis ([-1 1 -60 0])
ylabel('Power pattern [dB]')
grid;
switch Variations
case 'Theta'
  axis ([0 180 -60 0 ])
   xlabel('Theta [Degrees]')
      title ( 'phi = 90^o plane')
case 'Phi'
axis ([0 360 -60 0 ])
   xlabel('Phi [Degrees]')
       title ( 'Theta = 90^o plane')
end

figure(3)
polar(angler,Array)
title ('Array pattern')

figure(4)
polardb(angler,Array)
title ('Power pattern [dB]')

% the plots provided above are for the array factor based on the circular 
% array plots for other patterns such as those for the antenna element 
% (Element)or the total pattern (Etotal based on Element*Arrayfactor) can 
% also be displayed by the user as all these patterns are already computed 
% above.

figure(10)
subplot(2,2,1)  
polardb (angler,Element,'b-'); % rectangular plot of element pattern
title('Element normalized E field [dB]')
subplot(2,2,2)
polardb(angler,Array,'b-')
title(' Array Factor normalized [dB]')
subplot(2,2,3)
polardb(angler,EtotalR,'b-');  % polar plot
title('Total normalized E field [dB]')
