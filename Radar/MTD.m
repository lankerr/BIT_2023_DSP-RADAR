% 雷达杂波仿真参数
Fs = 1000; % 采样频率
T = 1/Fs; % 采样间隔
t = 0:T:1; % 1秒的时间
num_samples = length(t);

% 生成地杂波、鸟类、云雨杂波和飞机信号
ground_clutter = cos(2*pi*10*t); % 假设地杂波频率为10Hz
birds = cos(2*pi*5*t); % 假设鸟类频率为5Hz
rain_clouds = cos(2*pi*2*t); % 假设云雨杂波频率为2Hz
aircraft = cos(2*pi*30*t); % 假设飞机频率为30Hz

% 合成总体信号
received_signal = ground_clutter + birds + rain_clouds + aircraft;

% MTI滤波器设计
fcut = 0.2; % 截止频率占Nyquist频率的比例
N = 64; % 滤波器长度
h = fir1(N-1, fcut, 'low', kaiser(N, 5)); % 使用kaiser窗设计低通滤波器

% MTI处理
output_signal = conv(received_signal, h, 'same');

% 绘制滤波器频域响应
%freqz(h, 1, 1024, Fs);

% 显示结果
figure;
subplot(2, 1, 1);
plot(t, received_signal, 'b', t, output_signal, 'r');
title('Received Signal and MTI Output');
xlabel('Time (s)');
ylabel('Amplitude');
legend('Received Signal', 'MTI Output');

