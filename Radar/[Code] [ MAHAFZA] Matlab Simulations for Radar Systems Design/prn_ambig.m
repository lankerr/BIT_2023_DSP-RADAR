function [ambig] = prn_ambig(uinput)
% Compute and plot the ambiguity function for a PRN code
% Compute the ambiguity function by utilizing the FFT 
% through combining multiple range cuts

N = size(uinput,2);
tau = N;
PRN = uinput;
samp_num = size(PRN,2) * 10;
n = ceil(log(samp_num) / log(2));
nfft = 2^n;
u(1:nfft) = 0;
j = 0;
for index = 1:10:samp_num
    index;
    j = j+1;
    u(index:index+10-1) = PRN(j);
end
% set-up the array v
v = u;
delay = linspace(0,5*tau,nfft);
freq_del = 8 / tau /100;
j = 0;
vfft = fft(v,nfft);
for freq = -4/tau:freq_del:4/tau;
    j = j+1;
    exf = exp(sqrt(-1) * 2. * pi * freq .* delay);
    u_times_exf = u .* exf;
    ufft = fft(u_times_exf,nfft);
    prod = ufft .* conj(vfft);
    ambig(:,j) = fftshift(abs(ifft(prod))');
end
freq = -4/tau:freq_del:4/tau;
delay = linspace(-N,N,nfft);
figure(1)
mesh(freq,delay,ambig ./ max(max(ambig)))
% colormap([.5 .5 .5])
% colormap(gray)
axis tight
xlabel('frequency')
ylabel('delay')
zlabel('ambiguity function a PRN code')
figure(2)
plot(delay,ambig(:,51)/(max(max(ambig))),'k')
xlabel('delay')
ylabel('normalized amibiguity cut for f=0')
grid
axis tight
figure(3)
contour(freq,delay,ambig ./ max(max(ambig)))
axis tight
% colormap([.5 .5 .5])
% colormap(gray)
xlabel('frequency')
ylabel('delay')

