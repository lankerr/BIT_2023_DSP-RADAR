function [ambig] = barker_ambig(uinput)
% Compute and plot the ambiguity function for a Barker code
%Compute the ambiguity function
% by utilizing the FFT through combining multiple range cuts
N = size(uinput,2);
tau = N;
Barker_code = uinput;
samp_num = size(Barker_code,2) *10;
n = ceil(log(samp_num) / log(2));
nfft = 2^n;
u(1:nfft) = 0;
j = 0;
for index = 1:10:samp_num
    index;
    j = j+1;
    u(index:index+10-1) = Barker_code(j);
end
v = u;
delay = linspace(-tau, tau, nfft);
freq_del = 12 / tau /100;
j = 0;
vfft = fft(v,nfft);
for freq = -6/tau:freq_del:6/tau;
    j = j+1;
    exf = exp(sqrt(-1) * 2. * pi * freq .* delay);
    u_times_exf = u .* exf;
    ufft = fft(u_times_exf,nfft);
    prod = ufft .* conj(vfft);
    ambig(:,j) = fftshift(abs(ifft(prod))');
end
freq = -6/tau:freq_del:6/tau;
delay = linspace(-N,N,nfft);
figure (1)
mesh(freq,delay,ambig ./ max(max(ambig)))
colormap([.5 .5 .5])
colormap(gray)
axis tight
xlabel('frequency')
ylabel('delay')
zlabel('ambiguity function')
figure (2)
value = 10 * N ;
plot(delay,ambig(:,51)/value,'k')
xlabel('delay')
ylabel('normalized amibiguity cut for f=0')
grid
axis tight
figure (3)
contour(freq,delay,ambig ./ max(max(ambig)))
colormap([.5 .5 .5])
colormap (gray)
xlabel('frequency')
ylabel('delay')
grid on

