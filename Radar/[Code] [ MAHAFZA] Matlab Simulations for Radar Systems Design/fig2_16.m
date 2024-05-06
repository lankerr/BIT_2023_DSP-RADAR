% Use this program to reproduce Fig. 2.16 of text
% clear all
% close all
index = 0.;
for pd = 0.01:.05:1
    index = index + 1;
    [Lf,Pd_Sw5] = fluct_loss(pd, 1e-9,1,1);
    Lf1(index) = Lf;
    [Lf,Pd_Sw5] = fluct_loss(pd, 1e-9,1,4);
    Lf4(index) = Lf;
    
end
pd = 0.01:.05:1;
figure (3)
plot(pd, Lf1, 'k',pd, Lf4,'K:')
xlabel('Probability of detection')
ylabel('Fluctuation loss - dB')
legend('Swerling I & II','Swerling III & IV')
title('Pfa=1e-9, np=1')
grid




