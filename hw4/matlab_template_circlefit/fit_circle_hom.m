function [d e f] = fit_circle_hom(X)
% function [d e f] = fit_circle_hom(X)
%
% INPUT: 
% X: n-by-2 vector
%    with data
%
% OUTPUT: 
% quadric coordinates of the circle
 
x = X(:,1);
y = X(:,2);

A = [zeros(size(X(:,1))) zeros(size(X(:,1))) zeros(size(X(:,1))) zeros(size(X(:,1)))];

for i = 1:size(x)
     A(i,:) = [x(i).^2+y(i).^2 x(i), y(i), 1];

end
[V, D] = eigs(A'*A,1,'SM');

a = V(1);
d = V(2) / a;
e = V(3) / a;
f = V(4) / a;



end
