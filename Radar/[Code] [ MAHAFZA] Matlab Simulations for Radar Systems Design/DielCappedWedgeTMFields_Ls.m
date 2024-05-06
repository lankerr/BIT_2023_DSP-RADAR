function [Ezt,Hphit,Hrhot] = DielCappedWedgeTMFields_Ls(v,m,rhoij,phiij,rhop,phip,ar,k,k1,alpha,beta,a,b,c,d);
% Function to calculate the near field components of a capped wedge 
% with a line source excitation at one near field point
% This function is to be called by the Main progran: Diel_Capped_WedgeTM.m
% By: Dr. Atef Elsherbeni -- atef@olemiss.edu 
% Last modified July 23, 2003

Ezt = 0;  Hrhot = 0;  Hphit = 0;    % Initialization

if phiij > alpha  & phiij < 2*pi-beta %  outside the wedge region
    krho = k*rhoij;
    k1rho = k1*rhoij;
    jvkrho = besselj(v,krho);
    hvkrho = besselh(v,2,krho);
    jvk1rho = besselj(v,k1rho);
    djvkrho = dbesselj(v,krho);
    djvk1rho = dbesselj(v,k1rho);
    dhvkrho = dbesselh(v,2,krho);    
    ssterm = sin(v*(phip-alpha))*sin(v*(phiij-alpha));
    scterm = sin(v*(phip-alpha))*cos(v*(phiij-alpha));
   
    if rhoij <= ar   % field point location is inside the cap region
        Ezt = a(m)*jvk1rho*ssterm; 
        Hphit = k1*a(m)*djvk1rho*ssterm;
        Hrhot = v*a(m)*jvk1rho*scterm/rhoij;
    elseif rhoij <= rhop   % field point location is between the cap and the line source location
        Ezt = (b(m)*jvkrho+c(m)*hvkrho)*ssterm; 
        Hphit = k*(b(m)*djvkrho+c(m)*dhvkrho)*ssterm; 
        Hrhot = v*(b(m)*jvkrho+c(m)*hvkrho)*scterm/rhoij;
    elseif rhoij > rhop % field point location is greater than the line source location
        Ezt = d(m)*hvkrho*ssterm; 
        Hphit = k*d(m)*dhvkrho*ssterm;
        Hrhot = v*d(m)*hvkrho*scterm/rhoij;
    end
else
    Ezt = 0;    Hrhot = 0;  Hphit = 0;  % inside wedge region
end