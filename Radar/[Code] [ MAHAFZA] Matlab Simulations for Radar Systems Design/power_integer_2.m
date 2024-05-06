function n = power_integer_2 (x)
m = 0.;
for j = 1:30
   m = m + 1.;
   delta = x - 2.^m;
   if(delta < 0.)
      n = m;
      return
   else
   end
end

