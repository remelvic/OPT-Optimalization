
function [a,b,r] = minimaxfit(x,y)
x = [1 2 3 3 2 ; 4 1 2 5 6; 7 8 9 -5 7];
y = [7 4 1 2 5];

[n,m] = size(x);

f = [zeros(n,1)' 0 1];
A = [x', ones(m,1), -ones(m,1); -x' -ones(m,1) -ones(m,1)];
disp(A)
b = [y -y];
disp(b)

disp(f)
res = linprog(f,A,b);

a = res(1:n);
b = res(n+1);
r = res(n+2);
end