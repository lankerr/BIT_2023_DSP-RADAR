function pd = pd_swerling4 (nfa, np, snrbar)
% This function is used to calculate the probability of detection
% for Swerling 4 targets.
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
h8 = snrbar /2.0;
beta = 1.0 + h8;
beta2 = 2.0 * beta^2 - 1.0;
beta3 = 2.0 * beta^3;
if (np >= 50)
   temp1 = 2.0 * beta -1;
   omegabar = sqrt(np * temp1);
   c3 = (beta3 - 1.) / 3.0 / beta2 / omegabar;
   c4 = (beta3 * beta3 - 1.0) / 4. / np /beta2 /beta2;;
   c6 = c3 * c3 /2.0;
   V = (vt - np * (1.0 + snrbar)) / omegabar;
   Vsqr = V *V;
   val1 = exp(-Vsqr / 2.0) / sqrt( 2.0 * pi);
   val2 = c3 * (V^2 -1.0) + c4 * V * (3.0 - V^2) - ... 
      c6 * V * (V^4 - 10. * V^2 + 15.0);
   q = 0.5 * erfc (V/sqrt(2.0));
   pd =  q - val1 * val2;
   return
else
   snr = 1.0;
   gamma0 = incomplete_gamma(vt/beta,np);
   a1 = (vt / beta)^np / (exp(factor(np)) * exp(vt/beta));
   sum = gamma0;
   for i = 1:1:np
      temp1 = 1;
      if (i == 1)
         ai = a1;
      else
         ai = (vt / beta) * a1 / (np + i -1);
      end
      a1 = ai;
      gammai = gamma0 - ai;
      gamma0 = gammai;
      a1 = ai;

      for ii = 1:1:i
         temp1 = temp1 * (np + 1 - ii);
      end
      term = (snrbar /2.0)^i * gammai * temp1 / exp(factor(i));
      sum = sum + term;
   end
   pd = 1.0 - sum / beta^np;
end
pd = max(pd,0.);

   

