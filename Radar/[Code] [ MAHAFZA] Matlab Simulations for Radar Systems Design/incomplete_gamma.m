function [value] = incomplete_gamma ( vt, np)
% This function implements Eq. (2.67) to compute the Incomplete Gamma Function
% This function needs "factor.m" to run
format long
eps = 1.000000001;
% Test to see if np = 1
if (np == 1)
   value1 = vt * exp(-vt);
   value = 1.0 - exp(-vt);
   return
end
sumold = 1.0;
sumnew =1.0;
calc1 = 1.0;
calc2 = np;
xx = np * log(vt+0.0000000001) - vt - factor(calc2);
temp1 = exp(xx);
temp2 = np / (vt+0.0000000001);
diff = .0;
ratio = 1000.0;
if (vt >= np)
   while (ratio >= eps)
      diff = diff + 1.0;
      calc1 = calc1 * (calc2 - diff) / vt ;
      sumnew = sumold + calc1;
      ratio = sumnew / sumold;
      sumold = sumnew;
   end
   value = 1.0 - temp1 * sumnew * temp2; 
   return  
else
   diff = 0.;
   sumold = 1.;
   ratio = 1000.;
   calc1 = 1.;
   while(ratio >= eps)
      diff = diff + 1.0;
      calc1 = calc1 * vt / (calc2 + diff);
      sumnew = sumold + calc1;
      ratio = sumnew / sumold;
      sumold = sumnew;
   end
   value = temp1 * sumnew;
end

   