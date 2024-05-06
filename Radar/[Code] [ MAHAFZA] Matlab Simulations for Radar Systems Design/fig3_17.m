% use this program to reproduce Fig. 3.17 of text
clear all
close all
nscat = 1;
scat_range = 912;
scat_rcs = 10;
n =64;
deltaf = 10e6;
prf = 10e3;
v = 15;
rnote = 900,
winid = 1;
count = 0;
for time = 0:.05:3
    count = count +1;
    hl = hrr_profile (nscat, scat_range, scat_rcs, n, deltaf, prf, v, rnote,winid);
    array(count,:) = transpose(hl);
    hl(1:end) = 0;
    scat_range =  scat_range - 2 * n * v / prf;
end
figure (1)
 numb = 2*256;% this number matches that used in hrr_profile. 
 delx_meter = 15 / numb;
 xmeter = 0:delx_meter:15-delx_meter;
 imagesc(xmeter, 0:0.05:4,array)
 colormap(gray)
ylabel ('Time in seconds')
xlabel('Relative distance in meters')
