function [BR_range] = soj_req (pt, g, sigma, b, freq, loss, range, ...
   pj, bj,gj, lossj, gprime, rangej)
% This function implements equations for SOJs
c = 3.0e+8;
lambda = c / freq;
lambda_db = 10*log10(lambda^2)
if (loss == 0.0)
   loss = 0.000001;
end
if (lossj == 0.0)
   lossj =0.000001;
end
sigmadb = 10*log10(sigma);
range_db = 10*log10(range * 1000.);
rangej_db = 10*log10(rangej * 1000.)
pt_db = 10*log10(pt);
b_db = 10*log10(b);
bj_db = 10*log10(bj);
pj_db = 10*log10(pj);
factor = 10*log10(4.0 *pi);
BR_range = ((pt * 10^(2.0*g/10) * sigma * bj * 10^(lossj/10) * ...
   (rangej)^2) / (4.0 * pi * pj * 10^(gj/10) * 10^(gprime/10) * ...
   b * 10^(loss/10)))^.25 / 1000. 
s_at_br = pt_db + 2.0 * g + lambda_db + sigmadb - ...
   3.0 * factor - 4.0 * 10*log10(BR_range) - loss  
index =0;
for ran_var = .1:1:1000;
   index = index + 1;
   ran_db = 10*log10(ran_var * 1000.0);
   s(index) = pt_db + 2.0 * g + lambda_db + sigmadb - ...
      3.0 * factor - 4.0 * ran_db - loss + s_at_br;
   soj(index) = s_at_br - s_at_br;
end
ranvar = .1:1:1000;
%ranvar = ranvar ./BR_range;
semilogx (ranvar,s,'k',ranvar,soj,'k-.');
xlabel ('Range normalized to cross-over range');
legend('Target echo','SOJ')
ylabel ('Relative signal or jamming amplitude - dB');


      
