A = [1 1 1; 4 3 -1; 3 5 3];
b = [1 6 4];
x1 = gauss_solve(A, b);
x2 = doolittle_solve(A, b);
x3 = crout_solve(A, b);

fprintf("Gauss-elimination solution: ");
disp(x1);
fprintf("Gauss-elimination residual error is :")
disp((A*x1')'-b);

fprintf("\nDoolittles' solution: ")
disp(x2);
fprintf("Doolittles'solution's residual error is :")
disp((A*x2')'-b);

fprintf("\nCrouts' solution: ")
disp(x3);
fprintf("Crout's solution's residual error is :")
disp((A*x3')'-b);


function x = gauss_solve(A, b)
    [A2, b2] = gauss_elim(A, b);
    x = back_sub_up(A2, b2);
end

function x = doolittle_solve(A, b)
    [L, U] = doolittle(A);
    y = back_sub_low(L, b);
    x = back_sub_up(U, y);
end

function x = crout_solve(A, b)
    [L, U] = crout(A);
    y = back_sub_low(L, b);
    x = back_sub_up(U, y);
end

function [L, A] = doolittle(A)
    rowlen = length(A(:, 1));
    collen = length(A(1, :));
    L = eye(rowlen, collen);
    for i = 1:collen-1
        for j = i+1:rowlen
            d = A(j, i)/A(i, i);
            A(j, i) = d;
            for k = i+1:length(A(j, :))
                A(j, k) = A(j, k) - d*A(i, k);
            end
        end
    end

    for i = rowlen-1:-1:1
        for j = rowlen:-1:i+1
            L(j, :) = L(j, :) + A(j, i)*L(i, :);
            A(j, i) = 0;
        end
    end
end

function [L, U] = crout(A)
    [L1,U1] = doolittle(A');
    L = U1';
    U = L1';
end

function [A, b] = gauss_elim(A, b)
    for i = 1:length(A(1, :))-1
        for j = i+1:length(A(:, 1))
            d = A(j, i)/A(i, i);
            for k = i:length(A(j, :))
                A(j, k) = A(j, k) - d*A(i, k);
            end
            b(j) = b(j) - d*b(i);
        end
    end
end

function x = back_sub_up(A, b)
    collen = length(A(1, :));
    x = zeros(1, collen);
    for i = collen:-1:1
        d = b(i);
        for j = i+1:collen
            d = d - A(i, j)*x(j);
        end
        x(i) = d/A(i,i);
    end
end

function x = back_sub_low(A, b)
    collen = length(A(1, :));
    x = zeros(1, collen);
    for i = 1:collen
        d = b(i);
        for j = 1:i-1
            d = d - A(i, j)*x(j);
        end
        x(i) = d/A(i,i);
    end
end

%% Output
% Gauss-elimination solution:     1.0000    0.5000   -0.5000
% 
% Gauss-elimination residual error is :     0     0     0
% 
% 
% Doolittles' solution:     1.0000    0.5000   -0.5000
% 
% Doolittles'solution's residual error is :     0     0     0
% 
% 
% Crouts' solution:     1.0000    0.5000   -0.5000
% 
% Crout's solution's residual error is :     0     0     0
