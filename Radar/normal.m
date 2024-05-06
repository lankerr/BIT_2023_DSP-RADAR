%% 清空一切
clear;close all;clc;

%% 仿真设置
USE_COMPLEX_SIG     = 0;
USE_MTI             = 1;
USE_PRINT_INFO      = 1;
USE_CFAR_Method     = 3;
USE_CFAR_Custom_Thd = 0;

%% 参数
fft_num   = 128;                                                           % FFT运算点数
pulse_num = fft_num + 2;                                                   % 总的脉冲数
prf = 1e3;                                                                 % 脉冲重复频率（Hz）
pri = 1/prf;                                                               % 脉冲重复间隔（s）
fs = 1e6;                                                                  % 快时间维采样频率（Hz）（大于等于发射脉冲带宽，发射脉冲带宽几乎总是小于等于载波频率的10%，通常为载波频率的1%）
ts = 1/fs;                                                                 % 快时间维采样间隔（s）
fc = 100e6;                                                                % 载波频率（Hz）
vr = 300;                                                                  % 动目标相对雷达的径向速度（m/s）                                                   
c  = 3e8;                                                                  % 光速（m/s）                                         
lamada  = c/fc;                                                            % 载波波长（m）
fd      = 2*vr/lamada;                                                     % 动目标多普勒频率（Hz）（或多普勒移动，即发射频率与接收频率之差）
np_fast = fs/prf;                                                          % 1个脉冲重复间隔内的采样点数（快时间维的距离点数）
np_slow = pulse_num * np_fast;                                             % 多个脉冲重复间隔内的采样点数
target_start_index = 200;                                                  % 目标起始距离单元
target_end_index   = 203;                                                  % 目标结束距离单元

%% 生成动目标回波+杂波
m        = 1:np_slow;
target   = 20*exp(1i*2*pi*fd*m/fs);                                        % 生成 动目标回波(此处直接生成包含多普勒信息的信号,不含载频)(注意式中采用fs,而非fr)

rng default;
clutteri = 5 * randn(1, length(target));
clutterq = 5 * randn(1, length(target));
clutter  = complex(clutteri,clutterq);                                     % 生成 杂波

points1 = zeros(1,np_fast);
points1(1,target_start_index:target_end_index) = 1;                        % 1个脉冲重复间隔内np_fast个距离点
points_total = repmat(points1, 1, pulse_num);                              % pulse_num个脉冲重复间隔内pulse_num*np_fast个距离点
s = points_total .* target + clutter;                                      % 生成 动目标与杂波的混合信号

if USE_COMPLEX_SIG == 0
    s = real(s);
end

%% MTI杂波抑制（三脉冲对消处理）
if USE_MTI == 1
    mti_in = reshape(s, length(s)/pulse_num, pulse_num)';                  % 形成由多个脉冲组成的二维数据矩阵（慢时间维pulse_num个脉冲，快时间维1000个距离点）
    b = [1, -2, 1];                                                        % 三脉冲对消器系统函数分子多项式系数向量
    a = [1];                                                               % 三脉冲对消器系统函数分母多项式系数向量
    mti_out = filter(b, a, mti_in);                                        % 三脉冲对消运算（同一距离点在3个相邻脉冲重复间隔内的数据做相减运算）
    mti_out = mti_out(3:end,:);
else
    mti_in  = reshape(s, length(s)/pulse_num, pulse_num)';                 % 形成由10个脉冲组成的二维数据矩阵（慢时间维10个脉冲，快时间维1000个距离点）
    mti_out = mti_in(3:end,:);
end

%% 脉冲多普勒处理                                                  
win = repmat(hamming(fft_num),1,np_fast);                                  % FFT采样点数即多普勒谱分析样本点数亦即MTD滤波器组滤波器个数;hamming(K)是一个列向量
mtd_out = fft(mti_out.*win);                                               % 对同一距离点不同脉冲重复间隔的数据做K点FFT加窗运算(对矩阵进行FFT时,是分别计算各列的FFT)
figure;
mesh(abs(mtd_out));
title(strcat('V:',num2str(vr),'----','FD:',num2str(fd)));

%% CFAR处理
nr  = 16;
np  = 4;
pfa = 0.0005;                                                               

% 注意:phased.CFARDetector只能处理列向量
cfarDetector = phased.CFARDetector();
switch USE_CFAR_Method
    case 0
        cfarDetector.Method = 'CA';
    case 1
        cfarDetector.Method = 'OS';
    case 2
        cfarDetector.Method = 'SOCA';
    case 3
        cfarDetector.Method = 'GOCA';
   	otherwise
        cfarDetector.Method = 'CA';
end         

cfarDetector.NumTrainingCells      = nr;                                   % 噪声统计单元数目
cfarDetector.NumGuardCells         = np;                                   % 保护单元数目
cfarDetector.ProbabilityFalseAlarm = pfa;                                  % 虚警概率

if USE_CFAR_Custom_Thd == 1
    alafa = 2*nr*(pfa^(-1/(2 * nr)) - 1); 
    cfarDetector.ThresholdFactor = 'Custom';                               % 手动设置门限因子
    cfarDetector.CustomThresholdFactor = alafa;
end

cfarDetector.OutputFormat = 'CUT result';                                  % 输出 检测到信号
cfarDetector.ThresholdOutputPort = true;                                   % 输出 CFAR检测门限
cfarDetector.NoisePowerOutputPort = true;                                  % 输出 噪声统计结果

sigCfarDeal_range = abs(mtd_out').^2;                                      % 假定使用平方律检波 

index = find(sigCfarDeal_range<1e5);                                       % 测试,预处理
sigCfarDeal_range(index) = 0;

[detsVld,detsThd,noiseEst] = cfarDetector(sigCfarDeal_range,1:np_fast);

figure;
mesh(abs(detsVld));
title('CFAR处理');

%% 输出信息
if USE_PRINT_INFO == 1
    format short;
    fprintf('载波频率为%f MHz \n',fc/1e6);
    fprintf('目标速度为%f m/s \n',vr);
    fprintf('多普勒频率%f Hz  \n',fd);
    fprintf('多普勒频率分辨率为%f Hz  \n',prf/fft_num);
    fprintf('多普勒频率索引（一区）为%f Hz  \n',fd/prf*fft_num);
    fprintf('多普勒频率索引（二区）为%f Hz  \n',fft_num-fd/prf*fft_num);
end