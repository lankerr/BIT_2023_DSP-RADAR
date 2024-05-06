function [y] = stretch(nscat,taup,f0,b,rrec,scat_range,scat_rcs,winid)
eps = 1.0e-16;
htau = taup / 2.;
c = 3.e8;
trec = 2. * rrec / c;
n = fix(2. * trec * b);
m = power_integer_2(n);
nfft = 2.^m;
x(nscat,1:n) = 0.;
y(1:n) = 0.;
if( winid == 0.)
   win(1:n) = 1.;
   win =win';
else
   if(winid == 1.)
      win = hamming(n);
   else
      if( winid == 2.)
         win = kaiser(n,pi);
      else
         if(winid == 3.)
            win = chebwin(n,60);
         end
      end
   end
end
deltar = c / 2. / b;
max_rrec = deltar * nfft / 2.;
maxr = max(scat_range);
if(rrec > max_rrec | maxr >= rrec )
   'Error. Receive window is too large; or scatterers fall outside window'
   return
end
t = linspace(0,taup,n);
for j = 1:1:nscat
    range = scat_range(j);% + rmin;
   psi1 = 4. * pi * range * f0 / c - ...
      4. * pi * b * range * range / c / c/ taup;
   psi2 = (2*4. * pi * b * range / c / taup) .* t;
   x(j,:) = scat_rcs(j) .* exp(i * psi1 + i .* psi2);
   y = y + x(j,:);
end
figure(1)
plot(t,real(y),'k')
xlabel ('Relative delay - seconds')
ylabel ('Uncompressed echo')
grid
ywin = y .* win';
yfft = fft(y,n) ./ n;
out= fftshift(abs(yfft));
figure(2)
delinc = rrec/ n;
%dist = linspace(-delinc-rrec/2,rrec/2,n);
dist = linspace((-rrec/2), rrec/2,n);
plot(dist,out,'k')
xlabel ('Relative range in meters')
ylabel ('Compressed echo')
axis auto
grid

