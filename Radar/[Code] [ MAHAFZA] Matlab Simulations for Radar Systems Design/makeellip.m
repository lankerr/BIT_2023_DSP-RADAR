function [x, y]= makeellip( x0, y0, radiusx, radiusy, angleinterval)
% (x0,  y0 ) = center of circle
% radiusx = radius in x direction (a)
% radiusy = radius in y direction (b)
% angleinterval = angle between corresponding points ( in degrees)
% outputs x= vector of x points
%         y = vector of corresponding y points

angleinterval = angleinterval*pi/180 ;

counter = 0 ;
for ang = 0 : angleinterval : 360
    counter = counter + 1 ;
    x(counter) = radiusx * cos(ang) + x0;
    y(counter) = radiusy * sin(ang) + y0 ;
end % next ang



