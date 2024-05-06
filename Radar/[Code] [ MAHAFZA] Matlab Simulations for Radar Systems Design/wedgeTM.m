% Program to calculate the near field of conducting Sharp wedge
% By: Dr. Atef Elsherbeni -- atef@olemiss.edu -- December 2002
% 
% This program uses the function wedgeTMfields.m

clear all
close all
img = sqrt(-1);
rtd = 180/pi;   dtr = pi/180;
mu0 = 4*pi*1e-7;                % Permeability of free space      
eps0 = 8.854e-12;               % Permittivity of free space 

% Input parameters

rhop = 0.5;                     % radial Position of the line source
phip = 145*dtr;                 % angular position of the line source
alpha = 45*dtr;                 % half Wedge angle
freq = 2.998e8;                 % frequency
mur = 1;        epsr = 3;  

ax = 3*rhop;   by = 2*rhop;   % area for near field calculations
nx = 50;    ny = 40;            % Number of points for near field calculations

% End of input parameters

etar = sqrt(mur/epsr);
mu = mu0*mur;
eps = eps0*epsr;
lambda = 2.99e8/freq;
k0 = 2*pi/lambda;               % free space wavenumber
k = k0*sqrt(mur*epsr);          % wavenumber inside dielectric
Nc =round(1+2*k*rhop);          % number of terms for series summation  
omega =2*pi*freq;
a = -(pi*omega*mu0*mur)/(2*(pi-alpha)); % equation 11-188 Balanis book

%   <<< Far field Calculations of Ez component >>>

% Line source excitation
krhop = k*rhop;
for ip = 1:360   
    phii = (ip -1)*dtr;
        xphi(ip) = ip-1;
    if phii > alpha  & phii < 2*pi-alpha %  outside the wedge region
        EzFLs(ip) = 0;
        for m = 1:Nc  
            v = (m*pi)/(2*(pi-alpha));  % Equation 11-183a, Balanis book
            ssterm = sin(v*(phip-alpha))*sin(v*(phii-alpha));
            EzLS(m) = (img^v)*besselj(v,krhop)*ssterm; 
        end
        EzFLs(ip) = abs(sum(EzLS));
    else 
        EzFLs(ip)=0;
    end
end

    figure(4);
    plot(xphi,EzFLs);
    xlabel('Observation angle [Deg.]'); ylabel('Ez');
    title('Far Field (E\z) [Sharp Conducting wedge - Line source]');
    
%   <<<   Near field observation points   >>>

delx = 2*ax/nx; dely = 2*by/ny;
xi = -ax;   yi = -by;           % Initial values for x and y

for i = 1:nx
    for j = 1:ny
        x(i,j) = xi + (i-1)*delx;
        y(i,j) = yi + (j-1) *dely;
        rho(i,j) = sqrt(x(i,j)^2+y(i,j)^2);
        phi(i,j) = atan2(y(i,j),x(i,j));
        if phi(i,j) < 0
            phi(i,j) = phi(i,j) + 2*pi;
        end    
        if rho(i,j) <= 0.001
                rho(i,j) = 0.001;
        end
    end 
end


% Plane wave excitation Near Field calculations

for i = 1:nx
    for j = 1:ny
        krho = k*rho(i,j);
        if phi(i,j) > alpha  & phi(i,j) < 2*pi-alpha %  outside the wedge region
            EzNPw(i,j) = 0;
            for m = 1:Nc  
                v = (m*pi)/(2*(pi-alpha));  % Equation 11-183a, Balanis book
                ssterm = sin(v*(phip-alpha))*sin(v*(phi(i,j)-alpha));
                EzPw(m) = (img^v)*besselj(v,krho)*ssterm; 
            end
            EzNPw(i,j) = abs(sum(EzPw));
        else 
            EzNPw(i,j)=0;
        end
    end
end

figure(5);
surf(x,y,abs(EzNPw));
axis ('equal');
view(2); shading flat;
xlabel('a'); ylabel('b'); zlabel('E_z');
title('Near Field (E\z) [Sharp Conducting wedge - Plane wave excitation]');

% Line source Excitation 

termhr = -1/(img*omega*mu);
termhp = k/(img*omega*mu);
for i = 1:nx
    for j = 1:ny
        for m = 1:Nc
            v = (m*pi)/(2*(pi-alpha));  % Equation 11-183a, Balanis book
            [Ezt,Hrhot,Hphit] = wedgeTMfields(v,rho(i,j),rhop,phi(i,j),phip,k,a,alpha); 
            Eztt(m) = Ezt;
            Hrhott(m) = Hrhot;
            Hphitt(m) = Hphit;
        end
        SEz(i,j) = sum(Eztt);
        SHrho(i,j) = termhr*sum(Hrhott);
        SHphi(i,j) = termhp*sum(Hphitt);
    end
end

figure(1);
% mesh(x,y,abs(SEz));
surf(x,y,abs(SEz));
axis ('equal');
view(2); %shading flat;
xlabel('a'); ylabel('b'); zlabel('E_z');
title('Ez - Sharp Conducting wedge');

figure(2);
% mesh(x,y,abs(SHrho));
surf(x,y,abs(SHrho));
axis ('equal');
view(2); %shading flat;
xlabel('a'); ylabel('b'); zlabel('H\rho');
title('H\rho - Sharp Conducting wedge');

figure(3);
% mesh(x,y,abs(SHphi));
surf(x,y,abs(SHphi));
axis ('equal');
view(2); shading flat;

xlabel('a'); ylabel('b'); zlabel('H\phi');
title('E\phi - Sharp Conducting wedge');

