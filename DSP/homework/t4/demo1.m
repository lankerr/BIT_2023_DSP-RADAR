% 给定参数
wp = 0.4 * pi;    % 通带边界频率
ws = 0.6 * pi;    % 阻带边界频率
delta1 = 0.01;    % 通带最大允许波纹
delta2 = 0.001;   % 阻带最大允许波纹
A = 60;
bta = 0.1102*(A - 8.7);  % beta 值
M = 37;           % 滤波器阶数
wc = (wp+ws)/2;

% 计算 alpha
alpha = (M + 1) / 2;
n_est = M + 1;

% 计算脉冲响应

nw = round(n_est);
bes = abs(besseli(0,bta));
odd = rem(nw,2);
xind = (nw-1)^2;
n = fix((nw+1)/2);
xi = (0:n-1) + .5*(1-odd);
xi = 4*xi.^2;
w = besseli(0,bta*sqrt(1-xi/xind))/bes;
w = abs([w(n:-1:odd+1) w])';%19,20max


h  = fir1(M, 0.5,'low', w, 'scale');

plot(h);

% 计算频域响应
frequencies = linspace(0, pi, 1000);
H = freqz(h, 1, frequencies);


% 绘制频域响应
figure;
plot(frequencies/pi, 20 * log10(abs(H)));
title('滤波器频域响应');
xlabel('Frequency (归一化的)');
ylabel('Magnitude (dB)');
ylim([-100 60])
grid on;