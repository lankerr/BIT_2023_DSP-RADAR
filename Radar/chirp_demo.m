% 定义参数
fs = 1000; % 采样率
T = 1; % 信号持续时间（秒）
t = 0:1/fs:T-1/fs; % 时间向量

% 定义线性调频信号
f_start = 5; % 起始频率 (Hz)
f_end = 150; % 终止频率 (Hz)
chirp_signal = chirp(t, f_start, T, f_end);

% 绘制线性调频信号的时域图
figure;
subplot(2, 1, 1);
plot(t, chirp_signal);
title('Chirp Signal (Time Domain)');
xlabel('Time (s)');
ylabel('Amplitude');

% 计算线性调频信号的频谱
N = length(chirp_signal);
frequencies = linspace(0, fs, N);
chirp_fft = fft(chirp_signal);

% 绘制线性调频信号的频域图
subplot(2, 1, 2);
plot(frequencies, abs(chirp_fft));
title('Chirp Signal (Frequency Domain)');
xlabel('Frequency (Hz)');
ylabel('Amplitude');

sgtitle('Chirp Signal - Time and Frequency Domain');
