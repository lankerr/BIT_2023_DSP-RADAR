% FIR Window Lowpass filter designed using the FIR1 function.

% All frequency values are normalized to 1.

Fpass = 0.4;      % Passband Frequency
Fstop = 0.6;      % Stopband Frequency
Dpass = 0.01;     % Passband Ripple
Dstop = 0.001;    % Stopband Attenuation
flag  = 'scale';  % Sampling Flag

% Calculate the order from the parameters using KAISERORD.
[N, Wn, BETA, TYPE] = kaiserord([Fpass Fstop], [1 0], [Dstop Dpass]);

% Calculate the coefficients using the FIR1 function.
b  = fir1(N, Wn, TYPE, kaiser(N+1, BETA), flag);
Hd = dfilt.dffir(b);

plot(Hd.Numerator)

% Plot amplitude and phase response using fvtool
fvtool(Hd, 1000);
