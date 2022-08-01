function M = quarter2_2009(x)

data = load('mzdy.txt','-ascii');
t = data(:,1);
m = data(:,2);

x = fit_wages(t,m);

M = x(1)+2009.25*x(2);
end
