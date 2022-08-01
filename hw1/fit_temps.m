function x = fit_temps(t,T,omega)

data = load('teplota.txt','-ascii');
t = data(:,1);
T = data(:,2);
omega = 2*pi/365;

% x = matice / b

A = [ones(size(t)), t, sin(omega*t), cos(omega*t)];

x = A\T;

end
