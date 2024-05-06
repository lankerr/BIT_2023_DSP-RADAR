clear all
bw = 10.0;
f0 = 10.;
tau = 30.0e-3;
mu = bw / tau;
n=0;
fs = 2.5*bw;
for t = -1.25:.1/fs:1.25
   n = n+1;
   y(n) = exp(i * .5 * mu * t^2);
end
yfft= fftshift(fft(y,1024));
freq= -.5:1./1023:.5;
plot(freq,abs(yfft)./ abs(yfft(512)),'k')
grid
xlabel ('Normalized frequency');
ylabel ('LFM amplitude spectrum')
%title('B=10Hz ; tau= 32msec')
