% datagenerator.m

function [x1, x2] = datagenerator(N1, N2)
    x1 = randn(1, N1) + 1i * randn(1, N1);
    x2 = randn(1, N2) + 1i * randn(1, N2);

    % 保存数据到 data.mat
    save('data.mat', 'x1', 'x2');
end
