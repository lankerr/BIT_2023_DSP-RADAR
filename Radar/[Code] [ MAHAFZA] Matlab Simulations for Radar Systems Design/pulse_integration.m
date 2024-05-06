function [snrout] = pulse_integration(pt, freq, g, sigma, te, b, nf, loss, range,np,ci_nci)
 snr1 = radar_eq(pt, freq, g, sigma, te, b, nf, loss, range) % single pulse SNR
 snr1=0
if (ci_nci == 1) % coherent integration
   snrout = snr1 + 10*log10(np);
else % non-coherent integration
    if (ci_nci == 2)
        snr_nci = 10.^(snr1./10);
        val1 = (snr_nci.^2) ./ (4.*np.*np);
        val2 = snr_nci ./ np;
        val3 = snr_nci ./ (2.*np);
        SNR_1 = val3 + sqrt(val1 + val2); % Equation 1.87 of text
        LNCI = (1+SNR_1) ./ SNR_1; % Equation 1.85 of text
        snrout = snr1 + 10*log10(np) - 10*log10(LNCI);
    end
end
return