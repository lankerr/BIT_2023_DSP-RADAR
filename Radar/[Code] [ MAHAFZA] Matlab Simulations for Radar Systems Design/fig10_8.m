% Use this program to reproduce Fig. 1.8 in the text
clear all
close all
tau = linspace(.25,10,500);
taum = tau .* 1e-3;
C_S = [30 20 10 0];
c_s = 10.^(C_S./10);
for n = 1:size(C_S,2)
    val1 = 1 / (1.81*sqrt(2*c_s(n)));
    sigma(n,:) = val1 ./ taum;
end
figure (1)
semilogy(tau,sigma(1,:),'k',tau,sigma(2,:),'k-- ',tau,sigma(3,:),'k-.', ...
    tau,sigma(4,:),'k:');
xlabel('Pulsewidth in Milliseconds')
ylabel('RMS thermal error in Hz')
legend('30 dB C/S','20 dB C/S','10 dB C/S','0 dB C/S')
grid
    
    
    