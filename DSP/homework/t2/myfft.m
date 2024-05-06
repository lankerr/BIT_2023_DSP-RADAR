% myfft.m

function X = myfft(x)
    N = length(x);
    if N <= 1
        X = x;
    else
        X_even = myfft(x(1:2:N-1));
        X_odd = myfft(x(2:2:N));
        factor = exp(-2i * pi / N).^(0:N/2-1);
        X = [X_even + factor .* X_odd, X_even - factor .* X_odd];
    end
end
