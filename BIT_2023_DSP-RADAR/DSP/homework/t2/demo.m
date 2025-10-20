% demo.m
function demo()

    % 设置 N1 和 N2 的值
    N1 = 1024;
    N2 = 4096;

    % 生成数据并保存到 data.mat

    % 多次运行取平均计算时间
    num_trials = 10;
    time_avg_direct = 0;
    time_avg_fft = 0;
    time_avg_matlab_fft = 0;

    for i = 1:num_trials
        % 重新加载不同的数据
        [x1, x2] = datagenerator(N1, N2);
        load('data.mat', 'x1', 'x2');

        % (1) 直接计算N点DFT
        tic;
        fft(x1);
        fft(x2);
        time_avg_direct = time_avg_direct + toc;

        % (2) 采用设计的FFT程序
        tic;
        myfft(x1);
        myfft(x2);
        time_avg_fft = time_avg_fft + toc;

        % (3) 使用MATLAB的FFT程序
        tic;
        fft(x1);
        fft(x2);
        time_avg_matlab_fft = time_avg_matlab_fft + toc;
    end

    time_avg_direct = time_avg_direct / num_trials;
    time_avg_fft = time_avg_fft / num_trials;
    time_avg_matlab_fft = time_avg_matlab_fft / num_trials;

    % 输出结果
    disp('多次运行取平均:');
    disp(['   直接计算N=1024点DFT平均时间: ', num2str(time_avg_direct)]);
    disp(['   采用设计的FFT程序N=1024点DFT平均时间: ', num2str(time_avg_fft)]);
    disp(['   使用MATLAB的FFT程序N=1024点DFT平均时间: ', num2str(time_avg_matlab_fft)]);

    y1_direct = fft(x1);
    y2_direct = fft(x2);
    
    y1_fft = myfft(x1);
    y2_fft = myfft(x2);

    y1_matlab_fft = fft(x1);
    y2_matlab_fft = fft(x2);
    % 比较结果
    disp('比较结果:');
    disp(['   N=1024点DFT结果相对误差: ', num2str(max(abs(y1_direct - y1_fft)))]);
    disp(['   N=4096点DFT结果相对误差: ', num2str(max(abs(y2_direct - y2_fft)))]);
    disp(['   N=1024点DFT结果相对误差(Matlab FFT): ', num2str(max(abs(y1_direct - y1_matlab_fft)))]);
    disp(['   N=4096点DFT结果相对误差(Matlab FFT): ', num2str(max(abs(y2_direct - y2_matlab_fft)))]);
end
