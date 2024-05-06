if (Rmin == Rmax)
    clear range;
    range = Rmin;
else
    range = linspace(Rmin,Rmax, 300);
end
[sigmaC,CNR] = clutter_rcs(sigma0, thetaE, thetaA, SL, range, hr, ht, pt, f0, b, t0, f, l,ant_id);
