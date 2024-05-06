% This program is used to produce Fig. 2.4
close all
clear all
for nfa = 2:2:12
   b = sqrt(-2.0 * log(10^(-nfa)));
   index = 0;
   hold on
   for snr = 0:.1:18
      index = index +1;
      a = sqrt(2.0 * 10^(.1*snr));
      pro(index) = marcumsq(a,b);
   end
   x = 0:.1:18;
   set(gca,'ytick',[.1 .2 .3 .4 .5 .6  .7 .75 .8 .85 .9 ...
         .95 .9999])
   set(gca,'xtick',[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18])

   loglog(x, pro,'k');
end
hold off
xlabel ('Single pulse SNR - dB')
ylabel ('Probability of detection')
grid
