function drawfitline(A)
% function drawfitline(A)
%
% INPUT: 
% A: m-by-2 matrix
%    with data
%
%A(1,:) -> x
%A(2,:) -> y
%
[U,C,b0] = fitaff(A,1);

Bi = U*C+b0;

hold on
plot(A(1,:), A(2,:), 'rx'); %draw cross
%plot(x,y) y -> (u2/u1) *(x - b0(1)) +b0(2) draw green line
plot(1:9,(U(2)/U(1))*((1:9)-b0(1))+b0(2), 'g');  

for i = 1 : size(A,2)
    plot([A(1,i) Bi(1,i)],[A(2,i) Bi(2,i)],'r-')
end

axis equal

return

