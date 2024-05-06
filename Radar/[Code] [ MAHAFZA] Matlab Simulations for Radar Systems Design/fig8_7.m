% Use this program to reproduce Fig. 8.7 of text
clear all
close all
eps =0.00001;
N = 32;
rect(1:32) = 1;
ham = hamming(32);
han = hanning(32);
blk = blackman(32);
k3 = kaiser(32,3);
k6 = kaiser(32,6);
RECT = 20*log10(abs(fftshift(fft(rect, 1024)))./32 +eps);
HAM =  20*log10(abs(fftshift(fft(ham, 1024)))./32 +eps);
HAN =  20*log10(abs(fftshift(fft(han, 1024)))./32+eps);
BLK = 20*log10(abs(fftshift(fft(blk, 1024)))./32+eps);
K6 = 20*log10(abs(fftshift(fft(k6, 1024)))./32+eps);
x = linspace(-1,1,1024);
figure
subplot(2,1,1)
plot(x,RECT,'k--',x,HAM,'k',x,HAN,'k-.');
xlabel('x')
ylabel('Window')
grid
axis tight
legend('Rectangular','Hamming','Hanning')
subplot(2,1,2)
plot(x,RECT,'k--',x,BLK,'k',x,K6,'K-.')
xlabel('x')
ylabel('Window')
legend('Rectangular','Blackman','Kasier at \beta = 6')
grid
axis tight

