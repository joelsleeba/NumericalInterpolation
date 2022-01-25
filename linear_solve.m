A = [4 -1 1; 2 5 2; 1 2 4];
b = [8, 3, 11];
disp(solve(A, b));

function x = solve(A, b)
    [A1, b1] = gauss_elim(A, b);
    x = back_sub(A1, b1);
end

function [A, b] = gauss_elim(A, b)
    for i = 1:length(A)-1
        for j = i+1:length(A)
            d = A(j, i)/A(i, i);
            for k = i:length(A(j, :))
                A(j, k) = A(j, k) - d*A(i, k);
            end
            b(j) = b(j) - d*b(i);
        end
    end
end

function x = back_sub(A, b)
    size = length(A(1, :));
    x = zeros(1, size);
    for i = size:-1:1
        d = b(i);
        for j = i+1:size
            d = d - A(i, j)*x(j);
        end
        x(i) = d/A(i,i);
    end
end