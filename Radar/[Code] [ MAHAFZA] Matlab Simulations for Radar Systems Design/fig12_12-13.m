%                        Figure18_3.m
%
%    Program to do Spotlight SAR using the rectangular format and
%    HRR for range compression.   
%
%                        13 June 2003
%                     Dr. Brian J. Smith

clear all;
%%%%%%%%% SAR Image Resolution %%%%
dr = .50;
da = .10;
% dr = 6*2.54/100;
% da = 6*2.54/100;

%%%%%%%%% Scatter Locations %%%%%%%
xn = [10000 10015 9985];  % Scatter Location, x-axis
yn = [0 -20 20];          % Scatter Location, y-axis
Num_Scatter = 3;          % Number of Scatters
Rnom = 10000;

%%%%%%%%% Radar Parameters %%%%%%%%
f_0 =   35.0e9;    % Lowest Freq. in the HRR Waveform
df =     3.0e6;    % Freq. step size for HRR, Hz
c =        3e8;    % Speed of light, m/s
Kr = 1.33;
Num_Pulse = 2^(round(log2(Kr*c/(2*dr*df))));
Lambda = c/(f_0 + Num_Pulse*df/2);

%%%%%%%%% Synthetic Array Parameters %%%%%%%
du = 0.2;
L = round(Kr*Lambda*Rnom/(2*da));
U = -(L/2):du:(L/2);
Num_du = length(U);

%%%%%%%%% This section generates the target returns %%%%%%
Num_U = round(L/du);
I_Temp = 0;
Q_Temp = 0;
for I = 1:Num_U
    for J = 1:Num_Pulse
        for K = 1:Num_Scatter
            Yr = yn(K) - ((I-1)*du - (L/2));
            Rt = sqrt(xn(K)^2 + Yr^2);
            F_ci = f_0 + (J -1)*df;
            PHI = -4*pi*Rt*F_ci/c;
            I_Temp = cos(PHI) + I_Temp;
            Q_Temp = sin(PHI) + Q_Temp;
        end;
        IQ_Raw(J,I) = I_Temp + i*Q_Temp;
        I_Temp = 0.0;
        Q_Temp = 0.0;
    end;
end;
%%%%%%%%%% End target return section %%%%%

%%%%%%%%%% Range Compression %%%%%%%%%%%%%
Num_RB = 2*Num_Pulse;
WR = hamming(Num_Pulse);
for I = 1:Num_U
    Range_Compressed(:,I) = fftshift(ifft(IQ_Raw(:,I).*WR,Num_RB));
end;

%%%%%%%%%% Focus Range Compressed Data %%%%
dn = (1:Num_U)*du - L/2;
PHI_Focus = -2*pi*(dn.^2)/(Lambda*xn(1));
for I = 1:Num_RB
    Temp = angle(Range_Compressed(I,:)) - PHI_Focus;
    Focused(I,:) = abs(Range_Compressed(I,:)).*exp(i*Temp);
end;
%Focused = Range_Compressed;

%%%%%%%%%% Azimuth Compression %%%%%%%%%%%%
WA = hamming(Num_U);
for I = 1:Num_RB
   AZ_Compressed(I,:) = fftshift(ifft(Focused(I,:).*WA'));
end;
 
SAR_Map = 10*log10(abs(AZ_Compressed));
Y_Temp = (1:Num_RB)*(c/(2*Num_RB*df));
Y = Y_Temp - max(Y_Temp)/2;
X_Temp = (1:length(IQ_Raw))*(Lambda*xn(1)/(2*L));
X = X_Temp - max(X_Temp)/2;

image(X,Y,20-SAR_Map);  % 18.3(a) 
%image(X,Y,5-SAR_Map);  % 18.3(b)
axis([-25 25 -25 25]); axis equal; colormap(gray(64));
xlabel('Cross Range (m)'); ylabel('Down Range (m)');
grid
%print -djpeg .jpg
