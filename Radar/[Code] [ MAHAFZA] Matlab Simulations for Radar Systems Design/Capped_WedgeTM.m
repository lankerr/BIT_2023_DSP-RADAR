% Program to calculate the near field of a sharp conducting wedge
% due to an incident field from a line source or a plane wave 
% By: Dr. Atef Elsherbeni -- atef@olemiss.edu  
% This program uses the function 6 other functions
% Last modified July 24, 2003

clear all
close all
img = sqrt(-1);
rtd = 180/pi;   dtr = pi/180;
mu0 = 4*pi*1e-7;                % Permeability of free space      
eps0 = 8.854e-12;               % Permittivity of free space 

%  =====   Input parameters   =====
alphad = 30;                    % above x Wedge angle
betad = 30;                     % Below x wedge angle
reference = 'on x-axis';         % Reference condition 'top face' or 'bisector' or 'on x-axis'
CapType = 'Diel';               % Cap Type 'Cond', 'diel' or 'None'
ar = .15;                       % Cap radius in lambda
rhop = 0.5;                     % radial Position of the line source in terms of lambda
phipd = 180;                    % angular position of the line source                 
Ie = .001;                       % Amplitude of the current source
freq = 2.998e8;                 % frequency
mur = 1;        
epsr = 1;  
ax = 1.5;    by = 1;            % area for near field calculations
nx = 30;        ny = 20;        % Number of points for near field calculations
%  =====  End of Input Data   =====

alpha = alphad*dtr;
beta = betad *dtr;

switch reference
    case 'top face'
        alpha = 0;
        vi = pi/(2*pi-beta);
    case 'bisector'
        beta = alpha;
        vi = pi/(2*pi-2*beta);
    case 'on x-axis'
        vi = pi/(2*pi-alpha-beta);
end

phip = phipd*dtr;
etar = sqrt(mur/epsr);
mu = mu0*mur;
eps = eps0*epsr;
lambda = 2.99e8/freq;
k = 2*pi/lambda;                % free space wavenumber
ka = k*ar;
k1 = k*sqrt(mur*epsr);         % wavenumber inside dielectric
k1a = k1*ar;
krhop = k*rhop;
omega =2*pi*freq;

%   <<< Far field Calculations of Ez component >>>
%   ===   Line source excitation   ===
Nc =round(1+2*k*rhop);          % number of terms for series summation  
Term   = pi*omega*mu0/(2*pi-alpha-beta);
Term0D =  img*4*pi/(2*pi-alpha-beta);
Term0C = -img*4*pi/(2*pi-alpha-beta);
Term0  =      4*pi/(2*pi-alpha-beta);
for ip = 1:360   
    phii = (ip -1)*dtr;
    xphi(ip) = ip-1;
    if phii > alpha  & phii < 2*pi-beta %  outside the wedge region
        EzFLs(ip) = 0;
        for m = 1:Nc  
            v = m*vi;     
            ssterm = (img^v)*sin(v*(phip-alpha))*sin(v*(phii-alpha));
            switch CapType
                case 'Diel'                   
                    Aterm = k * besselj(v,k1a)*(dbesselj(v,ka)*bessely(v,krhop)-dbessely(v,ka)*besselj(v,krhop)) ...
                        +k1*dbesselj(v,k1a)*( bessely(v,ka)*besselj(v,krhop)- besselj(v,ka)*bessely(v,krhop));
                    Bterm =k*dbesselh(v,2,ka)*besselj(v,k1a)-k1*besselh(v,2,ka)*dbesselj(v,k1a);
                    EzLS(m) = Term0D*ssterm*Aterm/Bterm; 
                case 'Cond'
                    Aterm = bessely(v,ka)*besselj(v,krhop)- besselj(v,ka)*bessely(v,krhop);
                    Bterm = besselh(v,2,ka);                
                    EzLS(m) = Term0C*ssterm*Aterm/Bterm;   
                case 'None'               
                    EzLS(m) = Term0*ssterm*besselj(v,krhop);      
            end          
        end
        EzFLs(ip) = abs(sum(EzLS));
    else 
        EzFLs(ip)=0;
    end
end
EzFLs = EzFLs/max(EzFLs);

figure(1);
plot(xphi,EzFLs,'linewidth',1.5);
xlabel('Observation angle \phi^o'); 
ylabel('Ez');
axis ([0 360 0 1])
title('Total Far Field (Ez) [Line source excitation]');

figure(2)
polardb(xphi*dtr,EzFLs,'k')
title ('Total Far Field (Ez) [dB]')

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

%    Line source excitation, near field calculations

%    ====   Line source coefficients    ====
Nc =round(1+2*k*max(max(rho)));          % number of terms for series summation  
Term   = Ie*pi*omega*mu0/(2*pi-alpha-beta);
for m = 1:Nc  
    v = m*vi;     
    switch CapType
        case 'Diel'
            b(m) = -Term * besselh(v,2,krhop);
            c(m) = -b(m) * (k*dbesselj(v,ka)*besselj(v,k1a)-k1*besselj(v,ka)*dbesselj(v,k1a)) ...
                / (k*dbesselh(v,2,ka)*besselj(v,k1a)-k1*besselh(v,2,ka)*dbesselj(v,k1a));
            d(m) = c(m) + b(m) * besselj(v,krhop) / besselh(v,2,krhop);
            a(m) = ( b(m) * besselj(v,ka)+c(m) * besselh(v,2,ka))/besselj(v,k1a);
        case 'Cond'
            b(m) = -Term * besselh(v,2,krhop);
            c(m) = -b(m) * besselj(v,ka)/besselh(v,2,ka);
            d(m) = c(m) + b(m) * besselj(v,krhop) / besselh(v,2,krhop);
            a(m) = 0;
        case 'None'               
            b(m) = -Term * besselh(v,2,krhop);
            c(m) = 0;
            d(m) = -Term * besselj(v,krhop); 
            a(m) = b(m);  
    end          
end
   
termhphi = sqrt(-1)*omega*mu0;
termhrho = -termhphi;
for i = 1:nx
    for j = 1:ny
        for m = 1:Nc
            v = m*vi;  % Equation 
             [Ezt,Hphit,Hrhot] = DielCappedWedgeTMFields_Ls(v,m,rho(i,j),phi(i,j),rhop, ...
                                 phip,ar,k,k1,alpha,beta,a,b,c,d);
            Eztt(m) = Ezt;
            Hphitt(m) = Hphit;
            Hrhott(m) = Hrhot;
        end
        SEz(i,j) = sum(Eztt);
        SHphi(i,j) = sum(Hphitt)/termhphi;
        SHrho(i,j) = sum(Hrhott)/termhrho;
    end
end

figure(3);
surf(x,y,abs(SEz));
axis ('equal'); 
view(45,60); 
shading interp;
xlabel('x'); 
ylabel('y'); 
zlabel('E_z');
title('Ez [Line source excitation]');
colorbar

figure(4);
surf(x,y,377*abs(SHrho));
axis ('equal');
view(45,60);  
shading interp;
xlabel('x'); 
ylabel('y'); 
zlabel('\eta_o  H\rho');
title('\eta_o  H\rho [Line source excitation]');
colorbar

figure(5);
surf(x,y,377*abs(SHphi));
axis ('equal');
view(45,60); 
shading interp;
xlabel('x'); 
ylabel('y'); 
zlabel('\eta_o  H\phi');
title('\eta_o  H\phi [Line source excitation]')
colorbar

%   ===   Plane wave excitation, near field calculations   ===
Nc =round(1+2*k*max(max(rho)));          % number of terms for series summation  
Term   = 4*pi/(2*pi-alpha-beta);
for m = 1:Nc  
    v = m*vi;     
    switch CapType
        case 'Diel'
            b(m) = Term * img^v;
            c(m) = -b(m) * (k*dbesselj(v,ka)*besselj(v,k1a)-k1*besselj(v,ka)*dbesselj(v,k1a)) ...
                / (k*dbesselh(v,2,ka)*besselj(v,k1a)-k1*besselh(v,2,ka)*dbesselj(v,k1a));
            a(m) = ( b(m) * besselj(v,ka)+c(m) * besselh(v,2,ka))/besselj(v,k1a);
        case 'Cond'
            b(m) = -Term * img^v;
            c(m) = -b(m) * besselj(v,ka)/besselh(v,2,ka);
            a(m) = 0;
        case 'None'               
            b(m) = -Term * img^v;
            c(m) = 0;
            a(m) = b(m);  
    end          
end

termhphi = sqrt(-1)*omega*mu0;
termhrho = -termhphi;
for i = 1:nx
    for j = 1:ny
        for m = 1:Nc
            v = m*vi;  % Equation 
             [Ezt,Hphit,Hrhot] = DielCappedWedgeTMFields_PW(v,m,rho(i,j),phi(i,j), ...
                                 phip,ar,k,k1,alpha,beta,a,b,c);
            Eztt(m) = Ezt;
            Hphitt(m) = Hphit;
            Hrhott(m) = Hrhot;
end
        EzPW(i,j) = sum(Eztt);
        HphiPW(i,j) = sum(Hphitt)/termhphi;
        HrhoPW(i,j) = sum(Hrhott)/termhrho;
   end
end           

figure(6);
surf(x,y,abs(EzPW));
axis ('equal');
view(45,60); 
shading interp;
xlabel('x'); 
ylabel('y'); 
zlabel('E_z');
colorbar
title('Near Field (Ez) [Plane wave excitation]');

figure(7);
surf(x,y,377*abs(HrhoPW));
axis ('equal');
view(45,60); 
shading interp;
xlabel('x'); 
ylabel('y'); 
zlabel('\eta_o H\rho');
title('\eta_o H\rho [Plane wave excitation]');
colorbar

figure(8);
surf(x,y,377*abs(HphiPW));
axis ('equal');
view(45,60); 
shading interp;
xlabel('x'); 
ylabel('y'); 
zlabel('\eta_o H\phi');
title('\eta_o H\phi [Plane wave excitation]');
colorbar