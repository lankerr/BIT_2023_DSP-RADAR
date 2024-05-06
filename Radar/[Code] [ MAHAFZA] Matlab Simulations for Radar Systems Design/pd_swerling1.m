function pd = pd_swerling1 (nfa, np, snrbar)
% This function is used to calculate the probability of detection
% for Swerling 1 targets.
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
if (np == 1)
   temp = -vt / (1.0 + snrbar);
   pd = exp(temp);
   return
end
   temp1 = 1.0 + np * snrbar;
   temp2 = 1.0 / (np *snrbar);
   temp = 1.0 + temp2;
   val1 = temp^(np-1.);
   igf1 = incomplete_gamma(vt,np-1);
   igf2 = incomplete_gamma(vt/temp,np-1);
   pd = 1.0 - igf1 + val1 * igf2 * exp(-vt/temp1);

