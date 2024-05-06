fofr=0:0.001:1;
f1=4.*fofr;
f2=5.*fofr;
arg1=pi.*f1;
arg2=pi.*f2;
resp1=abs(sin(arg1));
%resp1=resp11.*resp11;
%resp22=(sin(arg2).*sin(arg2));
resp2=abs(sin(arg2));
resp=resp1+resp2;
max1=max(resp);
resp=resp./max1;
plot(fofr,resp1,'k');
grid
xlabel('normalized frequency')
ylabel('filter response')