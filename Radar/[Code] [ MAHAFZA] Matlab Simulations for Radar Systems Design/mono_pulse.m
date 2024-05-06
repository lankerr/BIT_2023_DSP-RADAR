function mono_pulse(phi0)
eps = 0.0000001;
angle = -pi:0.01:pi;
y1 = sinc(angle + phi0);
y2 = sinc((angle - phi0));
ysum = y1 + y2;
ydif = -y1 + y2;
figure(1)
plot(angle,y1,'k',angle,y2,'k');
grid;
xlabel('Angle - radians')
ylabel('Squinted patterns')
figure(2)
plot(angle,ysum,'k');
grid;
xlabel('Angle - radians')
ylabel('Sum pattern')
figure(3)
plot(angle,ydif,'k');
grid;
xlabel('Angle - radians')
ylabel('Difference pattern')
angle = -pi/4:0.01:pi/4;
y1 = sinc(angle + phi0);
y2 = sinc((angle - phi0));
ydif = -y1 + y2;
ysum = y1 + y2;
dovrs = ydif ./ ysum;
figure(4)
plot(angle,dovrs,'k');
grid;
xlabel('Angle - radians')
ylabel('voltage gain')