function [H,W]=dtft(h,N)           %定义一个dtft函数
%DTFT caculate DTFT at N equally spaced frequencies
%Usage:
%[H,W]=dtft(h,N)
%h:finite-length input vector, whose length is L
%N:number of frequencies for evaluation over [-pi,pi)
%==>constraint:N>=L
%H:DTFT values (complex)
%W:(2nd output)vector of freqs where DTFT is computed
%
N=fix(N);
L=length(h);   h=h(:);
if(N<L)
    error('DTFT:#data samples cannot exceed # freq samples')
end
W=(2*pi/N)*(0:(N-1))';
mid=ceil(N/2)+1;
W(mid:N)=W(mid:N)-2*pi;%move[pi,2pi)to[-pi,0)
W=fftshift(W);
H=fftshift(fft(h,N));%move nagative freq components