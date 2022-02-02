A = [2 0 -1; -2 -10 0; -1 -1 4];
f = @(x) x(2);
x = [1 1 1];
[eigvec, eigval] = power_method(A, x, f, 100);
fprintf("eigenvector: \n")
disp(eigvec);
fprintf("eigenvalue: ")
disp(eigval);

function [x, r] = power_method(A, x, f, iter)
    r = 0;
    for i = 1:iter
        y = (A*(x'))';
        r = f(y)/f(x);
        x = y;
    end
end


%% Output
% eigenvector: 
%   1.0e+100 *
% 
%     0.0079    1.3266    0.0952
% 
% eigenvalue:   -10.0120
