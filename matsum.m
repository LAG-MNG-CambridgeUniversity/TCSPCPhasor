function msum = matsum(A,n)   %where A is the input matrix, n is the number of repeats
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
if n==1
    msum=A;
else

for i=1:size(A,1)/n  %number of rows
for j=1:size(A,2)  %number of columns
msum(i,j) = sum(A(i*n-1:i*n,j));
end
end
end
end

