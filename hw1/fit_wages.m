function x = fit_wages(t, M)

%Sdata
data = load('mzdy.txt','-ascii');
t = data(:, 1);
M = data(:, 2);

A = [ones(size(t)), t];
x = A\M;

end

