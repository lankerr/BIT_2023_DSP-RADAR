function pd = pd_swerling3 (nfa, np, snrbar)
% This function is used to calculate the probability of detection
% for Swerling 2 targets.
format long
snrbar = 10.0^(snrbar/10.);
eps = 0.00000001;
delmax = .00001;
delta =10000.;
% Calculate the threshold Vt
pfa =  np * log(2) / nfa;
sqrtpfa = sqrt(-log10(pfa));
sqrtnp = sqrt(np); 
vt0 = np - sqrtnp + 2.3 * sqrtpfa * (sqrtpfa + sqrtnp - 1.0);
vt = vt0;
while (abs(delta) >= vt0)
   igf = incomplete_gamma(vt0,np);
   num = 0.5^(np/nfa) - igf;
   temp = (np-1) * log(vt0+eps) - vt0 - factor(np-1);
   deno = exp(temp);
   vt = vt0 + (num / (deno+eps));
   delta = abs(vt - vt0) * 10000.0; 
   vt0 = vt;
end
temp1 = vt / (1.0 + 0.5 * np *snrbar);
temp2 = 1.0 + 2.0 / (np * snrbar);
temp3 = 2.0 * (np - 2.0) / (np * snrbar);
ko = exp(-temp1) * temp2^(np-2.) * (1.0 + temp1 - temp3);
if (np <= 2)
   pd = ko;
   return
else
   temp4 = vt^(np-1.) * exp(-vt) / (temp1 * exp(factor(np-2.)));
   temp5 =  vt / (1.0 + 2.0 / (np *snrbar));
   pd = temp4 + 1.0 - incomplete_gamma(vt,np-1.) + ko * ...
      incomplete_gamma(temp5,np-1.);
end
