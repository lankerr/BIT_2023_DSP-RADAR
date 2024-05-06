function x = lfm_ambg(taup, b, up_down)
eps = 0.000001;
i = 0;
mu = up_down * b / 2. / taup;
delt = 2.2*taup/250;
delf = 2*b /250;
for tau = -1.1*taup:.05:1.1*taup
   i = i + 1;
   j = 0;
   for fd = -b:.05:b
      j = j + 1;
      val1 = 1. - abs(tau) / taup;
      val2 = pi * taup * (1.0 - abs(tau) / taup);
      val3 = (fd + mu * tau);
      val = val2 * val3;
      x(j,i) = abs( val1 * (sin(val+eps)/(val+eps))).^2;
   end
end
