function x = train_ambg (taup, n, pri)
if( taup > pri / 2.)
   'ERROR. Pulse width must be less than the PRI/2.'
   return
end
gap = pri - 2.*taup;
eps = 0.000001;
b = 1. / taup;
ii = 0.;
for q = -(n-1):1:n-1
   tauo = q - taup ;
   index = -1.;
   for tau1 = tauo:0.0533:tauo+gap+2.*taup
      index = index + 1;
      tau = -taup + index*.0533;
      ii = ii + 1;
      j = 0.;
      for fd = -b:.0533:b
         j = j + 1;
         if (abs(tau) <= taup)
            val1 = 1. -abs(tau) / taup;
            val2 = pi * taup * fd * (1.0 - abs(tau) / taup);
            val3 = abs(val1 * sin(val2+eps) /(val2+eps)); 
            val4 = abs((sin(pi*fd*(n-abs(q))*pri+eps))/(sin(pi*fd*pri+eps)));
            x(j,ii)=  val3 * val4 / n;
         else
            x(j,ii) = 0.;
         end
      end
   end
end

