function [theta,patternr,patterng] = linear_array(Nr,dolr,theta0,winid,win,nbits);
% This function computes and returns the gain radiation pattern for a linear array
% It uses the FFT to computes the pattern
%%%%%%%%%%%%%%%%%%%% ********** INPUTS ************** %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Nr ==> number of elements; dolr ==> element spacing (d) in lambda units divided by lambda
% theta0 ==> steering angle in degrees; winid ==> use winid negative for no window, winid positive to enter your window of size(Nr)
% win is input window, NOTE that win must be an NrX1 row vector; nbits ==> number of bits used in the pahse shifters
% negative nbits mean no quantization is used
%%%%%%%%%%%%%%%%%%%% *********** OUTPUTS ************* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% theta ==> real-space angle; patternr ==> array radiation pattern in dBs
% patterng ==> array directive gain pattern in dBs
%%%%%%%%%%%%%%%%%%%% ************************ %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

eps = 0.00001;
n = 0:Nr-1;
i = sqrt(-1);

%if dolr is > 0.5 then; choose dol = 0.25 and compute new N
if(dolr <=0.5)
   dol = dolr;
   N = Nr;
else
   ratio = ceil(dolr/.25);
   N = Nr * ratio;
   dol = 0.25;
end
% choose proper size fft, for minimum value choose 256
Nrx = 10 * N; 
nfft = 2^(ceil(log(Nrx)/log(2)));
if nfft < 256
    nfft = 256;
end
% convert steering angle into radians; and compute the sine of angle
theta0 = theta0 *pi /180.;
sintheta0 = sin(theta0);

% detrmine and comupte quantized steering angle
if nbits < 0
   phase0 = exp(i*2.0*pi .* n * dolr * sintheta0);
else
    % compute and add the phase shift terms (WITH nbits quantization)
    % Use formula thetal = (2*pi*n*dol) * sin(theta0) divided into 2^nbits
    % and rounded to the nearest qunatization level
    levels = 2^nbits;
    qlevels = 2.0 * pi / levels; % compute quantization levels
    % compute the phase level and round it to the closest quantizatin level at each array element
    angleq = round(dolr .* n * sintheta0 * levels) .* qlevels; % vector of possible angles
    phase0 = exp(i*angleq);
end

% generate array of elements with or without window
if winid < 0 
    wr(1:Nr) = 1;
else
    wr = win';
end

% add the phase shift terms
 wr =  wr .* phase0;
 
% determine if interpolation is needed (i.e N > Nr)
if N > Nr
    w(1:N) = 0;
    w(1:ratio:N) = wr(1:Nr);
else
    w = wr;
end

% compute the sine(theta) in real space sthat correspond to the FFT index 
arg = [-nfft/2:(nfft/2)-1] ./ (nfft*dol);
idx = find(abs(arg) <= 1);
sinetheta = arg(idx);
theta = asin(sinetheta);
% convert angle into degrees
theta = theta .* (180.0 / pi);

% Compute fft of w (radiation pattern)
patternv = (abs(fftshift(fft(w,nfft)))).^2;
% convert raditiona pattern to dBs
patternr = 10*log10(patternv(idx) ./Nr +  eps);

% Compute directive gain pattern  
rbarr  = 0.5 *sum(patternv(idx)) ./ (nfft * dol);
patterng = 10*log10(patternv(idx) + eps) - 10*log10(rbarr + eps);
return
