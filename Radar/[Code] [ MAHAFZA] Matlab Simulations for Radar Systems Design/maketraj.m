function [times , trajectory] = maketraj(start_loc, xvelocity, yamp, yperiod, zamp, zperiod, samplingtime, deltat)
%
% maketraj.m
% by David J. Hall
% for Bassem Mahafza
% 17 June 2003
% 17:01
%
% USAGE:  [times , trajectory] = maketraj(start_loc, xvelocity, yamp, yperiod, zamp, zperiod, samplingtime, deltat)
%
% NOTE: all coordinates are in radar reference coordinates.
%
% INPUTS
%
% name         dimension explanation                             units
%------        ------    ---------------                         -------
% start_loc     3 X 1    starting location of target             m
% xvelocity     1        velocity of target                      m/s
% yamp          1        amplitude of oscillation y direction    m
% yperiod       1        period of oscillation y direction       m
% zamp          1        amplitude of oscillation z direction    m
% zperiod       1        period of oscillation z direction       m
% samplingtime  1        length of interval of trajectory        sec
% deltat        1        time between samples                    sec
%
% OUTPUTS
%
% name         dimension               explanation              units
%------        ----------              ---------------          ------
% times        1 X samplingtime/deltat vector of times            
%                                      corresponding to samples sec
% trajectory   3 X samplingtime/deltat trajectory x,y,z         m
%


times = 0: deltat: samplingtime ;


x = start_loc(1)+xvelocity.*times ;
if yperiod~=0
   y = start_loc(2)+yamp*cos(2*pi*(1/yperiod).*times) ;
else
   y = ones(1, length(times))*start_loc(2) ;
end
if zperiod~=0
   z = start_loc(3)+zamp*cos(2*pi*(1/zperiod).*times)  ;
else
   z = ones(1, length(times))*start_loc(3) ;    
end

trajectory = [x ; y  ; z] ;
