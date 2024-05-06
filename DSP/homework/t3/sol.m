% 信号
Fs = 400;  % 采样频率
t = 0:1/Fs:20;
signal = 0.8*sin(50*pi*t) - 0.3*cos(120*pi*t) - 0.6*sin(160*pi*t) + cos(300*pi*t);

Fpass = 0.5;         % Passband Frequency
Fstop = 0.6;         % Stopband Frequency
Apass = 0.3;         % Passband Ripple (dB)
Astop = 30;          % Stopband Attenuation (dB)
match = 'stopband';  % Band to match exactly

% 设计巴特沃斯滤波器
h_butter = fdesign.lowpass(Fpass, Fstop, Apass, Astop);
butterworthFilter = design(h_butter, 'butter', 'MatchExactly', match);

% 设计切比雪夫I滤波器
h_cheby1 = fdesign.lowpass(Fpass, Fstop, Apass, Astop);
chebyshev1Filter = design(h_cheby1, 'cheby1', 'MatchExactly', match);

% 设计切比雪夫II滤波器
h_cheby2 = fdesign.lowpass(Fpass, Fstop, Apass, Astop);
chebyshev2Filter = design(h_cheby2, 'cheby2', 'MatchExactly', match);

% 设计椭圆滤波器
h_ellip = fdesign.lowpass(Fpass, Fstop, Apass, Astop);
ellipticFilter = design(h_ellip, 'ellip', 'MatchExactly', match);

% 对信号进行滤波
filtered_butter = filter(butterworthFilter, signal);
filtered_cheby1 = filter(chebyshev1Filter, signal);
filtered_cheby2 = filter(chebyshev2Filter, signal);
filtered_elliptic = filter(ellipticFilter, signal);

% 绘制滤波前后的信号幅度谱
figure;

subplot(5,1,1);
plot(t, signal);
title('Original Signal');

subplot(5,1,2);
plot(t, filtered_butter);
title('Butterworth Filtered Signal');

subplot(5,1,3);
plot(t, filtered_cheby1);
title('Chebyshev I Filtered Signal');

subplot(5,1,4);
plot(t, filtered_cheby2);
title('Chebyshev II Filtered Signal');

subplot(5,1,5);
plot(t, filtered_elliptic);
title('Elliptic Filtered Signal');

% 计算原始信号的频谱
f_original = fftshift(fft(signal));
f_original = abs(f_original) / length(f_original);
frequencies_original = linspace(-Fs/2, Fs/2, length(f_original));

% 计算滤波后信号的频谱
f_butter = fftshift(fft(filtered_butter));
f_butter = abs(f_butter) / length(f_butter);

f_cheby1 = fftshift(fft(filtered_cheby1));
f_cheby1 = abs(f_cheby1) / length(f_cheby1);

f_cheby2 = fftshift(fft(filtered_cheby2));
f_cheby2 = abs(f_cheby2) / length(f_cheby2);

f_elliptic = fftshift(fft(filtered_elliptic));
f_elliptic = abs(f_elliptic) / length(f_elliptic);

% 绘制频谱图
figure;

subplot(5,1,1);
plot(frequencies_original, f_original);
title('Original Signal Spectrum');

subplot(5,1,2);
plot(frequencies_original, f_butter);
title('Butterworth Filtered Signal Spectrum');

subplot(5,1,3);
plot(frequencies_original, f_cheby1);
title('Chebyshev I Filtered Signal Spectrum');

subplot(5,1,4);
plot(frequencies_original, f_cheby2);
title('Chebyshev II Filtered Signal Spectrum');

subplot(5,1,5);
plot(frequencies_original, f_elliptic);
title('Elliptic Filtered Signal Spectrum');
