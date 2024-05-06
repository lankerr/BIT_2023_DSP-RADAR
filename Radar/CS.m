% 生成雷达信号
Fs = 1000; % 采样频率
T = 1/Fs; % 采样间隔
t = 0:T:1; % 1秒的时间
num_samples = length(t);

% 生成三个飞机信号
aircraft1 = cos(2*pi*50*t); % 假设飞机1信号频率为50Hz
aircraft2 = cos(2*pi*60*t); % 假设飞机2信号频率为60Hz
aircraft3 = cos(2*pi*70*t); % 假设飞机3信号频率为70Hz

% 生成地杂波和鸟类信号
ground_clutter = randn(1, num_samples); % 地杂波信号
birds = cos(2*pi*20*t); % 假设鸟类信号频率为20Hz

% 无压缩信号
uncompressed_signal = aircraft1 + aircraft2 + aircraft3 + ground_clutter + birds;

% 合成总体信号
received_signal = uncompressed_signal;

% Chirp脉冲压缩
chirp_pulse = chirp(t, 0, 1, 100); % 生成线性调频脉冲
chirp_compressed_signal = abs(conv(received_signal, chirp_pulse, 'same'));

% 巴克码脉冲压缩
barker_code = [+1, +1, +1, -1, -1, +1, -1]; % 巴克码
barker_pulse = upsample(barker_code, round(num_samples/length(barker_code)));
barker_pulse = barker_pulse(1:num_samples);
barker_compressed_signal = abs(conv(received_signal, barker_pulse, 'same'));

% 频率步进脉冲压缩
freq_step_pulse = cos(2*pi*30*t) + cos(2*pi*60*t) + cos(2*pi*90*t); % 频率步进脉冲
freq_step_compressed_signal = abs(conv(received_signal, freq_step_pulse, 'same'));

% MTI对消
PRI = 10; % 脉冲重复间隔
weight_pulse1 = exp(-1i * 2 * pi * t / PRI);
weight_pulse2 = exp(-1i * 2 * pi * t / PRI).* exp(-1i * 2 * pi * t * PRI);
output_signal_mti = received_signal .* (weight_pulse1 - weight_pulse2);

% 匹配滤波
match_filter_template = uncompressed_signal; % 使用无压缩信号作为匹配滤波器的模板
matched_filter_output = abs(conv(received_signal, flip(match_filter_template), 'same'));


% 匹配滤波
match_filter_template_chirp = chirp_pulse; % 使用Chirp脉冲作为匹配滤波器的模板
matched_filter_output_chirp = abs(conv(received_signal, flip(match_filter_template_chirp), 'same'));

match_filter_template_barker = barker_pulse; % 使用巴克码脉冲作为匹配滤波器的模板
matched_filter_output_barker = abs(conv(received_signal, flip(match_filter_template_barker), 'same'));

match_filter_template_freq_step = freq_step_pulse; % 使用频率步进脉冲作为匹配滤波器的模板
matched_filter_output_freq_step = abs(conv(received_signal, flip(match_filter_template_freq_step), 'same'));


% 显示结果
figure;
subplot(9, 1, 1);
plot(t, received_signal);
title('Uncompressed Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(9, 1, 2);
plot(t, uncompressed_signal);
title('Received Signal (Uncompressed)');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(9, 1, 3);
plot(t, chirp_compressed_signal);
title('Chirp Compressed Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(9, 1, 4);
plot(t, barker_compressed_signal);
title('Barker Code Compressed Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(9, 1, 5);
plot(t, freq_step_compressed_signal);
title('Frequency Stepped Compressed Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(9, 1, 6);
plot(t, output_signal_mti);
title('MTI Output');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(9, 1, 7);
plot(t, matched_filter_output_chirp);
title('Matched Filter Output (Chirp)');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(9, 1, 8);
plot(t, matched_filter_output_barker);
title('Matched Filter Output (Barker)');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(9, 1, 9);
plot(t, matched_filter_output_freq_step);
title('Matched Filter Output (Freq Step)');
xlabel('Time (s)');
ylabel('Amplitude');