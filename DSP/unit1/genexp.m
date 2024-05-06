function y = genexp(b,n0,L)
% GENEP generate an exponential signal:b^n
% usage: Y = genexp(B,N0,L)
% B input scalar giving ratio between terms
% N0 starting index(integer)
% L length of generated signal
% Y output signal Y(1 :L)
if (L<=0)
    error('GENEXP:length not positive')
end
nn = n0 +(1:L)'-1;
y = b.^nn;
end