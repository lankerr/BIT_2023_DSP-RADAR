function [pattern,amn] = circ_array(N,dolxr,dolyr,theta0,phi0,winid,win,nbits);
%%%%%%%%%%%%%%%%%%%% ************************ %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function computes the 3-D directive gain patterns for a circular plannar array
% This function uses the fft2 to compute its output. It assumes that there are the same number 
% of elements along the major x- and y-axes
%%%%%%%%%%%%%%%%%%%% ************  INPUTS ************ %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% N ==> number of elements along x-aixs or y-axis
% dolxr ==> element spacing in x-direction; dolyr ==> element spacing in y-direction. Both are in lambda units
% theta0 ==> elevation steering angle in degrees, phi0 ==> azimuth steering angle in degrees
% This function uses the function (rec_to_circ) which computes the circular array from a square 
% array (of size NXN) using the notation developed by ALLEN,J.L.,"The Theory of Array Antennas 
% (with Emphasis on Radar Application)" MIT-LL Technical Report No. 323,July, 25 1965. 
% winid ==> window identifier; winid negative ==> no window ; winid positive ==> use window given by win
% win ==> input window function (2-D window) MUST be of size (Nxr X Nyr)
% nbits is the number of nbits used in phase quantization; nbits negative ==> NO quantization
%%%%%%%%%%%%%%%%%%%% *********** OUTPUTS ************* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% amn ==> array of ones and zeros; ones indicates true element location on the grid
% zeros mean no elements at that location; pattern ==> directive gain pattern
%%%%%%%%%%%%%%%%%%%% ************************ %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

eps = 0.0001;
nx = 0:N-1;
ny = 0:N-1;
i = sqrt(-1);

% check that window size is the same as the array size
[nw,mw] = size(win);
if winid >0
   if mw ~= N
      fprintf('STOP == Window size must be the same as the array')
       return
   end
   if nw ~= N
      fprintf('STOP == Window size must be the same as the array')
       return
   end
end

%if dol is > 0.5 then; choose dol = 0.5 and compute new N
if(dolxr <=0.5)
   ratiox = 1 ;
   dolx = dolxr ;
   Nx = N ;
else
   ratiox = ceil(dolxr/.5) ;
   Nx = (N-1) * ratiox + 1 ;
   dolx = 0.5 ;
end
if(dolyr <=0.5)
   ratioy = 1 ;
   doly = dolyr ;
   Ny = N ;
else
   ratioy = ceil(dolyr/.5); 
   Ny = (N-1)*ratioy + 1 ;
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
   array = ones(N,N);
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
    phasem = exp(i*2*pi*dolx*u0 .* nx * ratiox);
    phasen = exp(i*2*pi*doly*v0 .* ny * ratioy);
else
    levels = 2^nbits;
    qlevels = 2.0*pi / levels; % compute quantization levels
    sinthetaq = round(dolx .* nx * u0 * levels * ratiox) .* qlevels; % vector of possible angles
    sinphiq = round(doly .* ny * v0 * levels *ratioy) .* qlevels; % vector of possible angles
    phasem = exp(i*sinthetaq);
    phasen = exp(i*sinphiq);     
end

% add the phase shift terms
array = array .* (transpose(phasem) * phasen) ;

% determine if interpolation is needed (i.e N > Nr)
if (Nx > N )| (Ny > N)
   for xloop = 1 : N
      temprow = array(xloop, :) ;
      w( (xloop-1)*ratiox+1, 1:ratioy:Ny) =  temprow ;
   end
   array = w;
else
    w(1:Nx, :) = array(1:N,:);
end

% Convert rectangular array into circular using function rec_to_circ
[m,n] = size(w) ;
NC = max(m,n);  % Use Allens algorithm
if Nx == Ny
    temp_array = w;
else
    midpoint = (NC-1)/2 +1 ;
    midwm = (m-1)/2 ;
    midwn = (n-1)/2 ;
    temp_array = zeros(NC,NC);
    temp_array(midpoint-midwm:midpoint+midwm, midpoint-midwn:midpoint+midwn) = w ;
end
amn = rec_to_circ(NC);  % must be rectangular array (Nx=Ny)
amn = temp_array .* amn ;

% Compute array pattern
arrayfft = abs(fftshift(fft2(amn,nfftx,nffty))).^2 ;

%compute [su,sv] matrix
U = [-nfftx/2:(nfftx/2)-1] ./(dolx*nfftx);
indexx = find(abs(U) <= 1);
U = U(indexx);
V = [-nffty/2:(nffty/2)-1] ./(doly*nffty);
indexy = find(abs(V) <= 1);
V = V(indexy);
[SU,SV] = meshgrid(V,U);
indx = find((SU.^2 + SV.^2) >1);
arrayfft(indx) = eps/10;


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
axis image
grid
xlabel('V')
ylabel('U');
axis([-1 1 -1 1])

figure(3)

x0 = (NC+1)/2 ;
y0 = (NC+1)/2 ;
radiusx = dolx*((NC-1)/2 + 0.05/dolx) ;
radiusy = doly*((NC-1)/2 + 0.05/dolx) ;
theta = 5  ;
[xxx, yyy]=find(abs(amn)>0);
xxx = xxx-x0 ;
yyy = yyy-y0 ;
plot(yyy*doly, xxx*dolx,'rx')
axis equal
hold on
axis([-radiusy-0.5 radiusy+0.5 -radiusx-0.5  radiusx+0.5]);
grid
title('antenna spacing pattern');
xlabel('y - \lambda units')
ylabel('x - \lambda units')


[x, y]= makeellip( 0, 0, radiusx, radiusy, theta) ;

plot(y, x) ;
axis([-radiusy-0.5 radiusy+0.5 -radiusx-0.5  radiusx+0.5]);


[xxx0, yyy0]=find(abs(amn)<=0);
xxx0 = xxx0-x0 ;
yyy0 = yyy0-y0 ;
plot(yyy0*doly, xxx0*dolx,'co')
axis([-radiusy-0.5 radiusy+0.5 -radiusx-0.5  radiusx+0.5]);
axis equal

hold off ;

return