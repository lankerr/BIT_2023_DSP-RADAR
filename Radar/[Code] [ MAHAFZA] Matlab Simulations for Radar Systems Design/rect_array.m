function [pattern] = rect_array(Nxr,Nyr,dolxr,dolyr,theta0,phi0,winid,win,nbits);
%%%%%%%%%%%%%%%%%%%% ************************ %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function computes the 3-D directive gain patterns for a plannar array
% This function uses the fft2 to compute its output
%%%%%%%%%%%%%%%%%%%% ************  INPUTS ************ %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Nxr ==> number of along x-aixs; Nyr ==> number of elemnts along y-axis
% dolxr ==> element spacing in x-direction; dolyr ==> element spacing in y-direction Both are in lambda units
% theta0 ==> elevation steering angle in degrees, phi0 ==> azimuth steering angle in degrees
% winid ==> window identifier; winid negative ==> no window ; winid positive ==> use window given by win
% win ==> input window function (2-D window) MUST be of size (Nxr X Nyr)
% nbits is the number of nbits used in phase quantization; nbits negative ==> NO quantization
%%%%%%%%%%%%%%%%%%%% *********** OUTPUTS ************* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% pattern ==> directive gain pattern
%%%%%%%%%%%%%%%%%%%% ************************ %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

eps = 0.0001;
nx = 0:Nxr-1;
ny = 0:Nyr-1;
i = sqrt(-1);

% check that window size is the same as the array size
[nw,mw] = size(win);
if winid >0
    if nw ~= Nxr
    fprintf('STOP == Window size must be the same as the array')
    return
end
if mw ~= Nyr
    fprintf('STOP == Window size must be the same as the array')
    return
end
end

%if dol is > 0.5 then; choose dol = 0.5 and compute new N
if(dolxr <=0.5)
   ratiox = 1  ;
   dolx = dolxr ;
   Nx = Nxr ;
else
   ratiox = ceil(dolxr/.5) ;
   Nx = (Nxr -1 ) * ratiox + 1 ;
   dolx = 0.5 ;
end
if(dolyr <=0.5)
   ratioy = 1  ;
   doly = dolyr ;
   Ny = Nyr ;
else
   ratioy = ceil(dolyr/.5) ;
   Ny = (Nyr -1) * ratioy + 1 ;
   doly = 0.5 ;
end

% choose proper size fft, for minimum value choose 256X256
Nrx = 10 * Nx; 
Nry = 10 * Ny;
nfftx = 2^(ceil(log(Nrx)/log(2)));
nffty = 2^(ceil(log(Nry)/log(2)));
if nfftx < 256
   nfftx = 256;
end
if nffty < 256
   nffty = 256;
end

% generate array of elements with or without window
if winid < 0 
   array = ones(Nxr,Nyr);
else
   array = win;
end


% convert steering angles (theta0, phi0) to radians
theta0 = theta0 * pi / 180;
phi0 = phi0 * pi / 180;
% convert steering angles (theta0, phi0) to U-V sine-space
u0 = sin(theta0) * cos(phi0);
v0 = sin(theta0) * sin(phi0);

% Use formula thetal = (2*pi*n*dol) * sin(theta0) divided into 2^m levels
% and rounded to the nearest qunatization level
if nbits < 0
    phasem = exp(i*2*pi*dolx*u0 .* nx *ratiox);
    phasen = exp(i*2*pi*doly*v0 .* ny *ratioy);
else
    levels = 2^nbits;
    qlevels = 2.0*pi / levels; % compute quantization levels
    sinthetaq = round(dolx .* nx * u0 * levels * ratiox) .* qlevels; % vector of possible angles
    sinphiq = round(doly .* ny * v0 * levels *ratioy) .* qlevels; % vector of possible angles
    phasem = exp(i*sinthetaq);
    phasen = exp(i*sinphiq);     
end
     
% add the phase shift terms
array = array .* (transpose(phasem) * phasen);
  

% determine if interpolation is needed (i.e N > Nr)
if (Nx > Nxr )| (Ny > Nyr)
   for xloop = 1 : Nxr
      temprow = array(xloop, :) ;
      w( (xloop-1)*ratiox+1, 1:ratioy:Ny) =  temprow ;
   end
   array = w;
else
    w = array ;
%    w(1:Nx, :) = array(1:N,:);
end


% Compute array pattern
arrayfft = abs(fftshift(fft2(w,nfftx,nffty))).^2 ;

%compute [su,sv] matrix
U = [-nfftx/2:(nfftx/2)-1] ./(dolx*nfftx);
indexx = find(abs(U) <= 1);
U = U(indexx);
V = [-nffty/2:(nffty/2)-1] ./(doly*nffty);
indexy = find(abs(V) <= 1);
V = V(indexy);

%Normalize to generate gain patern
rbar=sum(sum(arrayfft(indexx,indexy))) / dolx/doly/4./nfftx/nffty;
arrayfft = arrayfft(indexx,indexy) ./rbar;

[SU,SV] = meshgrid(V,U);
indx = find((SU.^2 + SV.^2) >1);
arrayfft(indx) = eps/10;

pattern = 10*log10(arrayfft +eps);

figure(1)
mesh(V,U,pattern);
xlabel('V')
ylabel('U');
zlabel('Gain pattern - dB')

figure(2)
contour(V,U,pattern)
grid
axis image
xlabel('V')
ylabel('U');
axis([-1 1 -1 1])

figure(3)
x0 = (Nx+1)/2 ;
y0 = (Ny+1)/2 ;
radiusx = dolx*((Nx-1)/2) ;
radiusy = doly*((Ny-1)/2) ;
[xxx, yyy]=find(abs(array)>eps);
xxx = xxx-x0 ;
yyy = yyy-y0 ;
plot(yyy*doly, xxx*dolx,'rx')
hold on
axis([-radiusy-0.5 radiusy+0.5 -radiusx-0.5  radiusx+0.5]);
grid
title('antenna spacing pattern');
xlabel('y - \lambda units')
ylabel('x - \lambda units')

[xxx0, yyy0]=find(abs(array)<=eps);
xxx0 = xxx0-x0 ;
yyy0 = yyy0-y0 ;
plot(yyy0*doly, xxx0*dolx,'co')
axis([-radiusy-0.5 radiusy+0.5 -radiusx-0.5  radiusx+0.5]);


hold off

return