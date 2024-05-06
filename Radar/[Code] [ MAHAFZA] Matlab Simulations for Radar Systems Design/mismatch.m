clear all
eps = 1.5e-5;
wind = hamming(512)';
t = 0:0.001:.5;                 
y = chirp(t,0,.25,20);
figure(1)
plot(t,y);
yfft = fft(y,512) ;
ycomp = fftshift(abs(ifft(yfft .* conj(yfft))));
maxval = max (ycomp);
ycomp = eps + ycomp ./ maxval; 
ycompdb = 20. .*log10(ycomp);
figure(1)
del = .5 /512.;
tt = 0:del:.5-eps;
plot (tt,ycompdb,'k')
xlabel ('Relative delay - seconds');
ylabel('Normalized compressed pulse - dB')
grid
%change center frequency
y1 = chirp (t,0,.25,21);
y1fft = fft(y1,512);
y1comp = fftshift(abs(ifft(y1fft .* conj(yfft))));
maxval = max (y1comp);
ycomp = eps + y1comp ./ maxval; 
y1compdb = 20. .*log10(y1comp);
figure(2)
plot (tt,y1compdb,'k')
xlabel ('Relative delay - seconds');
ylabel('Normalized compressed pulse - dB')
grid
%change pulse width
y2 = chirp (t,0,.26,20);
y2fft = fft(y2,512);
y2comp = fftshift(abs(ifft(y2fft .* conj(yfft))));
maxval = max (y2comp);
ycomp = eps + y2comp ./ maxval; 
y2compdb = 20. .*log10(y2comp);
figure(3)
plot (tt,y2compdb,'k')
xlabel ('Relative delay - seconds');
ylabel('Normalized compressed pulse - dB')
grid