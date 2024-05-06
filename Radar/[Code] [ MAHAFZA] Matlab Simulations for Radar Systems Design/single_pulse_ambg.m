function x = single_pulse_ambg (taup)
colormap (gray(1))
eps = 0.000001;
i = 0;
taumax = 1.1 * taup;
taumin = -taumax;
for tau = taumin:.05:taumax
   i = i + 1;
   j = 0;
   for fd = -5/taup:.05:5/taup %-2.5:.05:2.5
      j = j + 1;
      val1 = 1. - abs(tau) / taup;
      val2 = pi * taup * (1.0 - abs(tau) / taup) * fd;
      x(j,i) = abs( val1 * sin(val2+eps)/(val2+eps));
   end
end

