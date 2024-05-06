n=-5:5;
x=2*impseq(-2,-5,5)-impseq(4,-5,5);
stem(n,x);            %画竖线图
title('x(n)=2delta(n+2)-delta(n-4)')
ylabel('x(n)');axis([-5,5,-2,n]);