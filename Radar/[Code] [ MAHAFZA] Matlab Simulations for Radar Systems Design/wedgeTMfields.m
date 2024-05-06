function [Ezt,Hrhot,Hphit] = wedgeTMfields(v,rho,rhop,phii,phip,k,a,alpha)
% Function to calculate the near field components of a sharp wedge 
% with a line source excitation at one near field point
% Main progran is wedgeTM.m
% By: Dr. Atef Elsherbeni -- atef@olemiss.edu -- December 2002
% 

if phii > alpha  & phii < 2*pi-alpha %  outside the wedge region
    krhop = k*rhop;
    krho = k*rho;
    voverkrho = v/krho;  
    bjvkrho = besselj(v,krho);
    bjvkrhop = besselj(v,krhop);
    bhvkrho = besselh(v,2,krho);
    bhvkrhop = besselh(v,2,krhop);
    ssterm = sin(v*(phip-alpha))*sin(v*(phii-alpha));
    csterm = sin(v*(phip-alpha))*cos(v*(phii-alpha));
       
    if rho >= rhop   % field point location is greater than the line source location
        beslhd = besselh(v-1,2,krho) - voverkrho*besselh(v,2,krho);
        
        Ezt = a*bjvkrhop*bhvkrho*ssterm; 
        Hrhot = (1/rho)*v*a*bjvkrhop*bhvkrho*csterm;
        Hphit = a*bjvkrhop*beslhd*ssterm;
        
    else if rho < rhop % field point location is less than the line source location
            besljd = besselj(v-1,krho) - voverkrho*besselj(v,krho);
            
            Ezt = a*bjvkrho*bhvkrhop*ssterm;           
            Hrhot = (1/rho)*v*a*bjvkrho*bhvkrhop*csterm;         
            Hphit = a*besljd*bhvkrhop*ssterm;
        end
    end    
else
    Ezt = 0;    Hrhot = 0;  Hphit = 0;  % inside wedge region
end


