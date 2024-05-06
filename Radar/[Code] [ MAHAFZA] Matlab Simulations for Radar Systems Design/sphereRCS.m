% calculate and plot RCS of a perfectly conducting sphere using 
% Eq.(2.XXXXX) and produce plots similar to Figures (2.XXXX) and (2.XXXXX) 
% Spherical Bessel functions are computed using series approximation 
% and recursion. 
clear all
eps   = 0.00001;
index = 0;
% ka limits are [0.05 - 15] ===> 300 points
for kr = 0.05:0.05:15
   index = index + 1;
   sphere_rcs   = 0. + 0.*i;
   f1    = 0. + 1.*i;
   f2    = 1. + 0.*i;
   m     = 1.;
   n     = 0.;
   q     = -1.;
   % initially set del to huge value
   del =100000+100000*i;
   while(abs(del) > eps)
      q   = -q;
      n   = n + 1;
      m   = m + 2;
      del = (2.*n-1) * f2 / kr-f1;
      f1  = f2;
      f2  = del;
      del = q * m /(f2 * (kr * f1 - n * f2));
      sphere_rcs = sphere_rcs + del;
   end
   sphere_rcsdb(index) = 20. * log10(abs(sphere_rcs));
   rcs(index)   = abs(sphere_rcs);
end
figure(1);
n=0.05:.05:15;
plot(n,rcs);
set(gca,'xtick',[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15]);
xlabel('Sphere circumference in wavelengths');
ylabel('Normalized sphere RCS');
grid;
figure(2);
plot(n,sphere_rcsdb);
set(gca,'xtick',[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15]);
xlabel('Sphere circumference in wavelengths');
ylabel('Normalized sphere RCS - dB');
grid;



