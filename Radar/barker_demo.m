% 定义13阶巴克码
barker_code = [+1, +1, +1, +1, +1, -1, -1, +1, +1, -1, +1, -1, +1];

% 重复巴克码以增加长度
repeated_barker_code = repmat(barker_code, 1, 10);

% 生成时间向量
T = 1; % 持续时间（秒）
fs = length(repeated_barker_code) / T; % 采样率
t = 0:1/fs:T-1/fs; 

% 绘制13阶巴克码的时域图
figure;
subplot(2, 1, 1);
plot(t, repeated_barker_code, 'LineWidth', 1.5);
title('13-Order Barker Code (Time Domain)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% 计算13阶巴克码的频谱
N = length(repeated_barker_code);
frequencies = linspace(0, fs, N);
barker_fft = fft(repeated_barker_code);

% 绘制13阶巴克码的频域图
subplot(2, 1, 2);
plot(frequencies, abs(barker_fft), 'LineWidth', 1.5);
title('13-Order Barker Code (Frequency Domain)');
xlabel('Frequency (Hz)');
ylabel('Amplitude');
grid on;

sgtitle('13-Order Barker Code - Time and Frequency Domain');
