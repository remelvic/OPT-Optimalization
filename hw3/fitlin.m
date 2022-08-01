function [U,C] = fitlin(A,k)
% function [U,C] = fitlin(A,k)
%
% INPUT: 
% A: m-by-n matrix
%    with data
% k: scalar, dimension of linear approximation
%
% OUTPUT:
% U: m-by-k matrix
%	columns form an orthonormal basis
% C: k-by-n matrix
%	columns contain coordinates w.r.t the basis
%

% U*U' = 1
% B = U*C
% C = U'B 
%B = U*U'*A

%delame spekttralni rozklad a dostavame ortonor. matice V a diag. mat. D
[V, D] = eig(A*A');

U = V(:,size(A,1)-k+1:end);
%U = A(:, 1:k);
%C = A(1:k, :);
C = U'*A;


