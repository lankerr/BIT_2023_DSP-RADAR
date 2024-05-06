function [BR_range] = ssj_req (pt, g, freq, sigma, b, loss, ...
   pj, bj, gj, lossj)
% This function implements Eq.s (10.9)
c = 3.0e+8;
lambda = c / freq;
lambda_db = 10*log10(lambda^2);
if (loss == 0.0)
   loss = 0.000001;
end
if (lossj == 0.0)
   lossj =0.000001;
end
sigmadb =10*log10(sigma);
pt_db = 10*log10(pt);
b_db = 10*log10(b);
bj_db = 10*log10(bj);
pj_db = 10*log10(pj);
factor = 10*log10(4.0 *pi);
BR_range = sqrt((pt * (10^(g/10)) * sigma * bj * (10^(lossj/10))) / ...
   (4.0 * pi * pj * (10^(gj/10)) * b * ...
   (10^(loss/10)))) / 1000.0  
s_at_br = pt_db + 2.0 * g + lambda_db + sigmadb - ...
      3.0 * factor - 4.* 10*log10(BR_range) - loss 
index =0;
for ran_var = .1:10:10000
   index = index + 1;
   ran_db = 10*log10(ran_var * 1000.0);
   ssj(index) = pj_db + gj + lambda_db + g + b_db - 2.0 * factor - ...
      2.0 * ran_db - bj_db - lossj + s_at_br ;
   s(index) = pt_db + 2.0 * g + lambda_db + sigmadb - ...
      3.0 * factor - 4.* ran_db - loss + s_at_br ;
end
ranvar = .1:10:10000;
ranvar = ranvar ./ BR_range;
semilogx (ranvar,s,'k',ranvar,ssj,'k-.');
axis([.1 1000 -90 40])
xlabel ('Range normalized to cross-over range');
legend('Target echo','SSJ')
ylabel ('Relative signal or jamming amplitude - dB');
grid
pj_var = 1:1:1000;
BR_pj = sqrt((pt * (10^(g/10)) * sigma * bj * (10^(lossj/10))) ...
   ./ (4.0 * pi .* pj_var * (10^(gj/10)) * b * (10^(loss/10)))) ./ 1000;
pt_var = 1000:100:10e6;
BR_pt = sqrt((pt_var * (10^(g/10)) * sigma * bj * (10^(lossj/10))) ...
   ./ (4.0 * pi .* pj * (10^(gj/10)) * b * (10^(loss/10)))) ./ 1000;
figure (2)
subplot (2,1,1)
semilogx (BR_pj,'k')
xlabel ('Jammer peak power - Watts');
ylabel ('Cross-over range - Km')
grid
subplot (2,1,2)
semilogx (BR_pt,'k')
xlabel ('Radar peak power - KW')
ylabel ('Cross-over range - Km')
grid



      
