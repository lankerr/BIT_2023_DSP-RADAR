clear all
n= 0.;
for f = 0:.011:1.;
   x1 = sqrt(100. / 2.) * (1. +  f);
   x2 = sqrt(100. / 2.) * (1. - 2. * f);
   c2 = quadl('fresnelc',0,x2);
   c1 = quadl('fresnelc',0,x1);
   s1 = quadl('fresnels',0,x1);
   s2 = quadl('fresnels',0,x1);
   n = n + 1.;
   spec(n) = (c2 + c1 + i * (s2 + s1)) / sqrt(2.);
end
f = 0:0.011:1;
plot(f,abs(spec))