function [val] = factor(n)
% Compute the factorial of n using logarithms to avoid overflow.
format long
n = n + 9.0;
n2 = n * n;
temp = (n-1) * log(n) - n + log(sqrt(2.0 * pi * n)) ...
   + ((1.0 - (1.0/30. + (1.0/105)/n2)/n2) / 12) / n;
val = temp - log((n-1)*(n-2)*(n-3)*(n-4)*(n-5)*(n-6) ...
   *(n-7)*(n-8));
return  
   
   