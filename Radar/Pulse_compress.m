% 定义参数
fs = 1000; % 采样率
T = 1; % 信号持续时间（秒）
t = 0:1/fs:T-1/fs; 

% 发送Chirp信号
chirp_pulse = chirp(t, 100, T, 200); % Chirp信号

% 模拟接收到的回波信号（添加噪声）- 两个目标
target1_delay = 0.5; % 第一个目标的时间延迟
target2_delay = 0.8; % 第二个目标的时间延迟
received_chirp = chirp_pulse + ...
    0.2 * randn(size(t - target1_delay)) + ...
    0.2 * randn(size(t - target2_delay));

% 使用匹配滤波器处理回波信号
output_chirp = conv(received_chirp, fliplr(chirp_pulse), 'same');

% 计算Chirp信号的频谱
N = length(chirp_pulse);
frequencies_chirp = linspace(0, fs, N);
chirp_fft = fft(chirp_pulse);

% 计算回波信号的频谱
received_chirp_fft = fft(received_chirp);

% 计算匹配滤波器输出的频谱
output_chirp_fft = fft(output_chirp);

% 绘制信号和处理后的结果
figure;

% 绘制发送Chirp信号
subplot(3, 2, 1);
plot(t, chirp_pulse);
title('Transmitted Chirp Pulse');
xlabel('Time (s)');
ylabel('Amplitude');

% 绘制接收到的回波信号
subplot(3, 2, 2);
plot(t, received_chirp);
title('Received Chirp Pulse (with Noise)');
xlabel('Time (s)');
ylabel('Amplitude');

% 绘制Chirp信号的频域图
subplot(3, 2, 3);
plot(frequencies_chirp, abs(chirp_fft));
title('Chirp Signal Spectrum');
xlabel('Frequency (Hz)');
ylabel('Amplitude');

% 绘制回波信号的频域图
subplot(3, 2, 4);
plot(frequencies_chirp, abs(received_chirp_fft));
title('Received Chirp Signal Spectrum');
xlabel('Frequency (Hz)');
ylabel('Amplitude');

% 绘制匹配滤波器输出的频域图
subplot(3, 2, 5);
plot(frequencies_chirp, abs(output_chirp_fft));
title('Matched Filter Output Spectrum');
xlabel('Frequency (Hz)');
ylabel('Amplitude');

sgtitle('Chirp Signal Simulation with Two Targets and Matched Filtering');
