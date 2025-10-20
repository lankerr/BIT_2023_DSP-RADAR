function X = iterative_fft(x)
    N = length(x);

    % 确保输入序列长度为2的幂
    if log2(N) ~= round(log2(N))
        error('Input size must be a power of 2.');
    end

    % 计算旋转因子
    W_N = exp(-2i * pi / N);

    % 初始化蝶形运算的步长
    step = N / 2;

    % 迭代计算FFT
    while step >= 1
        for k = 1:step:N
            % 蝶形运算
            for j = 0:step-1
                index = k + j;
                even = x(index);
                odd = x(index + step);

                % 旋转因子
                twiddle = W_N^(j * N / (2 * step));

                % 更新值
                x(index) = even + twiddle * odd;
                x(index + step) = even - twiddle * odd;
            end
        end

        % 更新步长
        step = step / 2;
    end

    % 返回FFT结果
    X = x;
end
