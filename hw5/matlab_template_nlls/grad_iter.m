function [x y r] = grad_iter(X, x0, y0, r0, a)
% [x y r] = grad_iter(X, x0, y0, r0, a)
%
% makes the gradient method iteration. 
%
% INPUT: 
% X: n-by-2 matrix
%    with data
% x0, y0 are the coordinates of the circle center.
% r0 is the circle radius
% a is the stepsize
%
% OUTPUT: 
% coordinates and radius after one step of gradient method.

x1 = x0-X(:,1);
y1 = y0-X(:,2);
s = sqrt(x1.^2 + y1.^2);

jac = [x1./s, y1./s, -ones(size(X(:,2)))];
g = dist(X,x0,y0,r0);

result = [x0 y0 r0] - a*2*(g*jac);
x = result(1);
y = result(2);
r = result(3);

end
 
