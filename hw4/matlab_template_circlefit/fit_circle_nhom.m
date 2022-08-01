function [d e f] = fit_circle_nhom(X)
% function [d e f] = fit_circle_nhom(X)
%
% INPUT: 
% X: n-by-2 vector
%    with data
%
%
% OUTPUT: 
% quadric coordinates of the circle

x = X(:,1);
y = X(:,2);

A = [zeros(size(X(:,1))), zeros(size(X(:,1))), zeros(size(X(:,1)))];
b = [ones(size(X(:,1)))];

for i = 1:size(x)
   A(i,:) = [x(i), y(i), 1];
   b(i) = [-x(i).^2-y(i).^2];
end

z = A\b;

d = z(1);
e = z(2);
f = z(3);

end
