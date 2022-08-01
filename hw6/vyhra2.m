function x=vyhra2(c,k,m)
% c = [1.27, 4.70, 9.00];
% k = 3000;
% m = 400;

f = [0 0 0 -1];
A = [-c(1) 0 0 1; 0 -c(2) 0 1; 0 0 -c(3) 1];
b = [0 0 0];

x = linprog(f,A,b,[1 1 1 0], k,[m m m k-1000],[]);
x = x(1:length(c));


end