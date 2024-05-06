function [y] = matched_filter(nscat,taup,b,rrec,scat_range,scat_rcs,winid)
eps = 1.0e-16;
% time bandwidth product
time_B_product = b * taup;
if(time_B_product < 5 )
    fprintf('************ Time Bandwidth product is TOO SMALL ***************')
    fprintf('\n Change b and or taup')
  return
end
% speed of light
c = 3.e8; 
% number of samples
n = fix(5 * taup * b);
% initialize input, output and replica vectors
x(nscat,1:n) = 0.;
y(1:n) = 0.;
replica(1:n) = 0.;
% determine proper window
if( winid == 0.)
   win(1:n) = 1.;
end
if(winid == 1.);
    win = hamming(n)';
end
if( winid == 2.)
    win = kaiser(n,pi)';
end
if(winid == 3.)
    win = chebwin(n,60)';
end
% check to ensure that scatterers are within recieve window
index = find(scat_range > rrec);
if (index ~= 0)
    'Error. Receive window is too large; or scatterers fall outside window'
  return
end
% calculate sampling interval
t = linspace(-taup/2,taup/2,n);
replica = exp(i * pi * (b/taup) .* t.^2);
figure(1)
subplot(2,1,1)
plot(t,real(replica))
ylabel('Real (part) of replica')
xlabel('time in seconds')
grid
subplot(2,1,2)
sampling_interval = taup / n;
freqlimit = 0.5/ sampling_interval;
freq = linspace(-freqlimit,freqlimit,n);
plot(freq,fftshift(abs(fft(replica))));
ylabel('Spectrum of replica')
xlabel('Frequency in Hz')
grid
 for j = 1:1:nscat
    range = scat_range(j) ;;
    x(j,:) = scat_rcs(j) .* exp(i * pi * (b/taup) .* (t +(2*range/c)).^2) ;
    y = x(j,:)  + y;
end
figure(2) 
 y = y .* win;
plot(t,real(y),'k')
xlabel ('Relative delay - seconds')
ylabel ('Uncompressed echo')
grid
out =xcorr(replica, y);
out = out ./ n;
s = taup * c /2;
Npoints = ceil(rrec * n /s);
dist =linspace(0, rrec, Npoints);
delr = c/2/b;
figure(3)
plot(dist,abs(out(n:n+Npoints-1)),'k')
xlabel ('Target relative position in meters')
ylabel ('Compressed echo')
grid

