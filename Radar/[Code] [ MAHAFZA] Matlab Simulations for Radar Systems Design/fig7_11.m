fofr=0.01:0.001:32;
a=63.0/64.0;
term1=(1-2.*cos(a*2*pi*fofr)+cos(4*pi*fofr)).^2;
term2=(-2*sin(a*2*pi*fofr)+sin(4*pi*fofr)).^2;
resp=.25.*sqrt(term1+term2);
%axis([0 4 -60 0]);
resp=10.*log(resp);
plot(fofr,resp);
axis([0 32 -40 0]);
grid
