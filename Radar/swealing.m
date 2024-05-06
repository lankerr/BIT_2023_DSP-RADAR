% 模拟雷达RCS斯威林1234型
rng('default'); % 设置随机数发生器的种子以获得可重复的结果

% 定义雷达参数
fc = 10e9; % 雷达频率为10 GHz
lambda = physconst('LightSpeed')/fc; % 波长

% 定义目标的物理参数
target_size = 5; % 目标尺寸（米）
target_rcs = zeros(4, 1); % 初始化RCS矢量

% 模拟斯威林型 1、2、3、4
for swerling_type = 1:4
    % 生成随机振幅和相位
    amplitude = randn(1, 1000);
    phase = 2 * pi * rand(1, 1000);
    
    % 计算RCS
    target_rcs(swerling_type) = sum(amplitude .* exp(1i * phase)) / sqrt(1000);
end

% 画出RCS起伏
figure;
bar(target_rcs);
title('RCS Fluctuations for Swerling Types 1, 2, 3, and 4');
xlabel('Swerling Type');
ylabel('RCS');
xticks(1:4);
xticklabels({'Swerling I', 'Swerling II', 'Swerling III', 'Swerling IV'});
