function X = recursive_fft(x)
    N = length(x);

    if N <= 1
        X = x; % 基本情况，长度为1的序列的FFT是其本身
    else
        even = recursive_fft(x(1:2:N-1));
        odd = recursive_fft(x(2:2:N));

        % 计算FFT的递归步骤
        factor = exp(-2i * pi / N).^(0:N/2-1);
        X = [even + factor .* odd, even - factor .* odd];
    end
end
