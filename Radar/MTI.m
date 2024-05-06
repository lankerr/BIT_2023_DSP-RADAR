% 雷达杂波仿真参数
Fs = 1000; % 采样频率
T = 1/Fs; % 采样间隔
t = 0:T:1; % 1秒的时间
num_samples = length(t);

% 生成飞机、鸟类和低杂波信号
aircraft_signal = cos(2*pi*50*t); % 假设飞机信号频率为50Hz
bird_signal = 2*cos(2*pi*20*t); % 假设鸟类信号频率为20Hz
clutter_signal = randn(1, num_samples); % 低杂波信号

% 合成总体信号
received_signal = aircraft_signal + bird_signal + clutter_signal;

% 二脉冲对消
range_cells = 1:num_samples;
PRI = 10; % 两个脉冲之间的脉冲重复间隔
doppler_cells = linspace(-Fs/2, Fs/2, num_samples);

w = exp(-1i * 2 * pi * doppler_cells * PRI);
% 生成两个脉冲的权重
weight_pulse1 = exp(-1i * 2 * pi * range_cells / num_samples);
weight_pulse2 = exp(-1i * 2 * pi * range_cells / num_samples).*w;

% 二脉冲对消
output_signal_2pulse = received_signal .* (weight_pulse1 - weight_pulse2);

% 三脉冲对消
weight_pulse3 = exp(-1i * 2 * pi * range_cells / num_samples) .* exp(-1i * 2 * pi * doppler_cells * PRI * 2);

% 三脉冲对消
output_signal_3pulse = received_signal .* (weight_pulse1 - weight_pulse2 + weight_pulse3);

% 显示结果
figure;
subplot(3, 1, 1);
plot(t, abs(fft(received_signal)), 'b');
title('Received Signal');
xlabel('Hz');
ylabel('Amplitude');

subplot(3, 1, 2);
plot(t, abs(fft(output_signal_2pulse)), 'r');
title('Two-Pulse Canceller Output');
xlabel('Hz');
ylabel('Amplitude');

subplot(3, 1, 3);
plot(t, abs(fft(output_signal_3pulse)), 'g');
title('Three-Pulse Canceller Output');
xlabel('Hz');
ylabel('Amplitude');
