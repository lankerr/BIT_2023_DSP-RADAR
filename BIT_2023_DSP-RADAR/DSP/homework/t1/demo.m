% DTMF双频拨号信号的生成和检测程序
clear; clc;

tm = ['1', '2', '3', 'A'; '4', '5', '6', 'B'; '7', '8', '9', 'C'; '*', '0', '#', 'D']; % DTMF信号代表的16个数
N = 205;
K = [18, 20, 22, 24, 31, 34, 38, 42];
f1 = [697, 770, 852, 941];
f2 = [1209, 1336, 1477, 1633];
ss1 = 45;ss2 = 55;%最小45毫秒，最大55毫秒

tone1 = sin(2*pi*ss1*f1/8000);
tone2 = sin(2*pi*ss2*f2/8000);

% 生成音频实际持续时间至少为45毫秒，不大于55毫秒
TN = input('键入电话号码=', 's');
TNr = '';

if length(TN) > 10
    error('电话长度不能超过10')
end
for l = 1:length(TN)
    d = TN(l);

    for p = 1:4
        for q = 1:4
            if tm(p, q) == d
                break;
            end
        end
        if tm(p, q) == d
            break;
        end
    end

    n = 0:1023;
    x = sin(2*pi*n*f1(p)/8000) + sin(2*pi*n*f2(q)/8000);
    sound(x, 8000);
    pause(0.1);

    % 接收检测端的程序
    X = goertzel(x(1:205), K+1);
    val = abs(X);

    subplot(ceil(length(TN)/2), 2, l);
    stem(K, val, '.'); grid; xlabel('k'); ylabel('|X(k)|');
    axis([10 50 0 120]);

    limit = 80;
    for s = 5:8
        if val(s) > limit
            break;
        end
    end
    for r = 1:4
        if val(r) > limit
            break;
        end
    end
    TNr = [TNr, tm(r, s-4)];
end

disp('接收端检测到的号码为：');
disp(TNr);
