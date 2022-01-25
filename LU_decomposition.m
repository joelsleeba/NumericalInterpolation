A = [6 -2 2 4; 12 -8 6 10; 3 -13 9 3; -6 1 4 -18];
%A = [1 1; 2 1];
[L, U] = LU_decomp(A);
disp(L*U == A);

function [L, A] = LU_decomp(A)
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
