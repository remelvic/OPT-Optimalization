function d = erraff(A)
% function d = erraff(A)
%
% INPUT: 
% A: m-by-n matrix
%    with data
%
% OUTPUT:
% d: m-by-1 matrix
%
[m,n] = size(A);
b0 = mean(A, 2);
A = A - b0*(ones(1,n));
[V,D] = eig(A*A');

%d = A(:,1);
for k = 1:m
    d(k) = trace(D(1:m-k, 1:m-k));
end


