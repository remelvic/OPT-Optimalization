function d = dist(X,x0,y0,r)
% function d = dist(X,x0,y0,r)
%
% INPUT: 
% X: n-by-2 vector
%    with data
% x0, y0 are the coordinates of the circle center.
% r is the circle radius
%
% OUTPUT: 
% d: 1-by-N vector of *signed* distances of all points 
%    from the circumference. 
 
[N ~] = size(X);
 
d = zeros(1,N);
 
x = X(:,1);
y = X(:,2);
 
for i = 1:N
   d(i) = sqrt((x0-x(i))^2 + (y0-y(i))^2) - r;
end


