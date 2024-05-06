function amn = rec_to_circ(N)
midpoint = (N-1)/2 + 1;
amn = zeros(N);
array1(midpoint,midpoint) = N;
x0 = midpoint;
y0 = x0;
for i = 1:N
    for j = 1:N
        distance(i,j) = sqrt((x0-i)^2 + (y0-j)^2);
    end
end
idx = find(distance < (N-1)/2 + .025);
amn (idx) = 1;
return