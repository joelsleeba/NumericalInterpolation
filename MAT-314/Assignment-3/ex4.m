A = [3 20 -1; 2 -3 20; 20 1 -2];
b = [-18 25 17];
x = [10, 0, 20];

fprintf("Jacobi's Method")
jacobi_soln = jacobi_solve(A, b, x, 100)
fprintf("residual error is :")
disp((A*jacobi_soln')'-b);

fprintf("Gauss-Seidel_method")
gauss_soln = gauss_solve(A, b, x, 100)
fprintf("residual error is :")
disp((A*gauss_soln')'-b);

function x = jacobi_solve(A, b, x, iter)
    [A1, b1] = scaled_part_pivot(A, b);
    x = jacobi(A1, b1, x, iter);
end

function x = gauss_solve(A, b, x, iter)
    [A1, b1] = scaled_part_pivot(A, b);
    x = gauss_seidel(A1, b1, x, iter);
end

function A = switch_rows(A, x, y)
    if 0<x<length(A(:,1)) && 0<y<length(A(:, 1))
        temp = A(y, :);
        A(y, :) = A(x, :);
        A(x, :) = temp;
    end
end

function A = switch_cols(A, x, y)
    if 0<x<length(A(1,:)) && 0<y<length(A(1,:))
        temp = A(:, y);
        A(:, y) = A(:, x);
        A(:, x) = temp;
    end
end

function [A, b] = scaled_part_pivot(A, b)
    for i = 1:length(A)-1 %fix a column
        colmaxindex = i;
        rowmax = max(abs(A(i, :)));
        for j = i+1:length(A)  % fix a row
            jrowmax = max(abs(A(j, :)));
            if abs(A(j, i))/jrowmax > abs(A(colmaxindex, i))/rowmax
                colmaxindex = j;
                rowmax = jrowmax;
            end
        end
        if colmaxindex ~= i
            A = switch_rows(A, i, colmaxindex);
            b = switch_rows(b', i, colmaxindex)';
        end
    end
end

function xnew = jacobi(A, b, x, iter)
    xnew = zeros(1, length(A(1, :)));
    for s = 1:iter
        for i = 1: length(A(1, :))
            tempsum = 0;
            for j = 1:length(A(1, :))
                if i == j
                    continue
                else
                    tempsum = tempsum + A(i, j)*x(j);
                end
            end
            xnew(i) = (b(i) - tempsum)/A(i, i);
        end
        x = xnew;
        %disp(x);
    end
end
     
function x = gauss_seidel(A, b, x, iter)
    for s = 1:iter
        for i = 1: length(A(1, :))
            tempsum = 0;
            for j = 1:length(A(1, :))
                if i == j
                    continue
                else
                    tempsum = tempsum + A(i, j)*x(j);
                end
            end
            x(i) = (b(i) - tempsum)/A(i, i);
        end
        %disp(x);
    end
end


%% Output
% Jacobi's Method
% jacobi_soln =
% 
%      1    -1     1
% 
% residual error is :      0     0     0
% 
% Gauss-Seidel_method
% gauss_soln =
% 
%      1    -1     1
% 
% residual error is :      0     0     0
