% use this program to reproduce Fig. 5.14 of text
clear all
eps = 1.5e-5;
t = 0:0.001:.5;                 
y = chirp(t,0,.25,20);
figure(1)
plot(t,y);
yfft = fft(y,512) ;
ycomp = fftshift(abs(ifft(yfft .* conj(yfft))));
maxval = max (ycomp);
ycomp = eps + ycomp ./ maxval; 
figure(1)
del = .5 /512.;
tt = 0:del:.5-eps;
plot (tt,ycomp,'k')
axis tight
xlabel ('Relative delay - seconds');
ylabel('Normalized compressed pulse')
grid
%change center frequency
y1 = chirp (t,0,.25,21);
y1fft = fft(y1,512);
y1comp = fftshift(abs(ifft(y1fft .* conj(yfft))));
maxval = max (y1comp);
y1comp = eps + y1comp ./ maxval; 
figure(2)
plot (tt,y1comp,'k')
axis tight
xlabel ('Relative delay - seconds');
ylabel('Normalized compressed pulse')
grid
%change pulse width
t = 0:0.001:.45;                 
y2 = chirp (t,0,.225,20);
y2fft = fft(y2,512);
y2comp = fftshift(abs(ifft(y2fft .* conj(yfft))));
maxval = max (y2comp);
y2comp = eps + y2comp ./ maxval; 
figure(3)
plot (tt,y2comp,'k')
axis tight
xlabel ('Relative delay - seconds');
ylabel('Normalized compressed pulse')
grid