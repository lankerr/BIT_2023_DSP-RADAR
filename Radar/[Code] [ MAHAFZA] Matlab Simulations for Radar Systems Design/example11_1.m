clear all
close all
N = 50;
wct = linspace(0,2*pi,N);
% case 1
ax1 = cos(wct);
ay1 = sqrt(3) .* cos(wct);
M1 = moviein(N);
figure(1)
xc =0;
yc=0;
axis image
hold on
for ii = 1:N
   plot(ax1(ii),ay1(ii),'>r');
   line([xc ax1(ii)],[yc ay1(ii)]);
   plot(ax1,ay1,'g');
   M1(ii) = getframe;
end
grid
xlabel('Ex')
ylabel('Ey')
title('Electric Field Locus; case 1')
% Case 2
ax3 = cos(wct);
ay3 = sin(wct);
M3 = moviein(N);
figure(3)
axis image
hold on
for ii = 1:N
   plot(ax3(ii),ay3(ii),'>r');
   line([xc ax3(ii)],[yc ay3(ii)]);
   plot(ax3,ay3,'g');
   M3(ii) = getframe;
end
grid
xlabel('Ex')
ylabel('Ey')
title('Electric Field Locus; case 2')
rho = sqrt(ax3.^2 + ay3.^2);
major_axis = 2*max(rho);
minor_axis = 2*min(rho);
aspect3 = 10*log10(major_axis/minor_axis)
alpha3 = (180/pi) * atan2(ay3(1),ax3(1))
% Case 3
ax4 = cos(wct);
ay4 = cos(wct+(pi/6));
M4 = moviein(N);
figure(4)
axis image
hold on
for ii = 1:N
   plot(ax4(ii),ay4(ii),'>r');
   line([xc ax4(ii)],[yc ay4(ii)]);
   plot(ax4,ay4,'g')
   M4(ii) = getframe;
end
grid
xlabel('Ex')
ylabel('Ey')
title('Electric Field Locus; case 3')
rho = sqrt(ax4.^2 + ay4.^2);
major_axis = 2*max(rho);
minor_axis = 2*min(rho);
aspect4 = 10*log10(major_axis/minor_axis)
alpha4 = (180/pi) * atan2(ay4(1),ax4(1))
end
% Case 4
ax6 = cos(wct);
ay6 = sqrt(3) .* cos(wct+(pi/3));
M6 = moviein(N);
figure(6)
axis image

hold on
for ii = 1:N
    plot(ax6(ii),ay6(ii),'>r');
   line([xc ax6(ii)],[yc ay6(ii)]);
   plot(ax6,ay6,'g')
   M6(ii) = getframe;
end
grid
xlabel('Ex')
ylabel('Ey')
title('Electric Field Locus; case 4')
rho = sqrt(ax6.^2 + ay6.^2);
major_axis = 2*max(rho);
minor_axis = 2*min(rho);
aspect6 = 10*log10(major_axis/minor_axis)
alpha6 = (180/pi) * atan2(ay6(1),ax6(1))
