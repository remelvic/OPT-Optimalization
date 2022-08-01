function [x y r] = GN_iter(X, x0, y0, r0)
% [x y r] = GN_iter(X, x0, y0, r0)
%
% makes the Gauss-Newton iteration. 
%
% INPUT: 
% X: n-by-2 matrix
%    with data
% x0, y0 are the coordinates of the circle center.
% r0 is the circle radius
%
% OUTPUT: 
% coordinates and radius after one step of GN method.

x1 = x0-X(:,1);
y1 = y0-X(:,2);
s = sqrt(x1.^2 + y1.^2);

jac = [x1./s, y1./s, -ones(size(X(:,2)))];
g = dist(X,x0,y0,r0);
res = [x0 y0 r0] - g*pinv(jac)';

x = res(1);
y = res(2);
r = res(3);


end
 
