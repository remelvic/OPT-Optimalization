% function [x0 y0 r] = fit_circle_ransac(X, num_iter, threshold)
% % function [x0 y0 r] = fit_circle_ransac(X, num_iter, threshold)
% %
% % INPUT: 
% % X: n-by-2 vector
% %    with data
% % num_iter: number of RANSAC iterations -> k
% % threshold: maximal  distance of an inlier from the circumference -> theta
% %
% % OUTPUT: 
% % cartesian coordinates of the circle
% 
% x = X(:,1);
% y = X(:,2);
% 
% best = -5000;
% 
% for i = 1:num_iter
%     
%     result = 0;
%     vect1 = X(randi(size(X,1)),:);
%     vect2 = X(randi(size(X,1)),:);
%     vect3 = X(randi(size(X,1)),:);
% 
%     vect = [vect1;vect2;vect3];
% 
%     [d e f] = fit_circle_hom(vect);
%     
%     [x0 y0 r] = quad_to_center(d, e, f);
%     res = dist(X,x0,y0,r);
%     
%     for j = res
%        
%         if(abs(j) > threshold)
%             result = result - 1;
%         end
%     end
%     if(result > best)
%         best = result;
%         best_x0 = x0;
%         best_y0 = y0;
%         best_r = r; 
%     end
% end
% 
% x0 = best_x0;
% y0 = best_y0;
% r = best_r;
% 
% end
function [x0 y0 r] = fit_circle_ransac(X, num_iter, threshold)
% function [x0 y0 r] = fit_circle_ransac(X, num_iter, threshold)
%
% INPUT: 
% X: n-by-2 vector
%    with data
% num_iter: number of RANSAC iterations
% threshold: maximal  distance of an inlier from the circumference
%
% OUTPUT: 
% cartesian coordinates of the circle

x0 = 0;
y0 = 0;
r = 0;
inliners = 0;

%num_iter
siz = size(X, 1);

for i = 1:num_iter(1,1)
    a = randi([1,siz],1,1);
    b = randi([1,siz],1,1);
    while b == a
        b = randi([1,siz],1,1);
    end
    c = randi([1,siz],1,1);
    while c == a | c == b
        c = randi([1,siz],1,1);
    end

    A = [X(a,1) X(a,2); X(b,1) X(b,2); X(c,1) X(c,2)];
    [d e f] = fit_circle_nhom(A);
    [x0_tmp y0_tmp r_tmp] = quad_to_center(d, e, f);
    N = dist(X, x0_tmp, y0_tmp, r_tmp);

    count = 0;
    for j = 1:size(N, 1)
        if N(j, 1) < threshold
            count = count + 1;
        end
    end

    if count > inliners
        inliners = count;
        x0 = x0_tmp;
        y0 = y0_tmp;
        r = r_tmp;
    end
    count = 0;
    
end

%threshold
%inliners
%x0
%y0
%r

end
