function [a] = ar_fit_model(y, p)
% function [a] = ar_fit_model(y,p)
%
% INPUT:
% y : N-by-1 vector, sound signal
%
% p : required order of AR model
%
% OUTPUT:
% a: (p+1)-by-1 vector, estimated parameters of AR model 
% 
% ordering of vector *a* is such that: 
%   a(1) = a_0 [ from Eq. (2) in this Task description ]
%   a(2) = a_1 [ from Eq. (2) in this Task description ]
%   .
%   .
%   a(p+1) = a_p [ from Eq. (2) in this Task description ]
%
% M, b: matrix and vector as in the Task description, 
%       M*a = b (in LSQ sense) 
% discard the code from here and implement the functionality:

%p = 300;
%[y, Fs] = audioread('gong.wav');
 
T = length(y) - p; % rows column -> p+1
 
%a = zeros(p+1,1);
M = [ones(T, 1), ones(T, p)];

for x = 2 : p+1
    M(:, x) = y(p - x + 2 : T+p - x + 1);
end

a = M\y(p+1 : T+p);


end
