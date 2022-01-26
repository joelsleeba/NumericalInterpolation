A = [60 30 20; 30 20 15; 20 15 12];
L= cholesky(A);
disp(L);
%disp(U);
L*(L')

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

function L = cholesky(A)
    rowlen = length(A(:, 1));
    collen = length(A(1, :));
    L(1, 1) = sqrt(A(1, 1));
    for j = 2:rowlen
        L(j, 1) = A(j, 1)/L(1,1);
    end
    
    for i = 2:collen-1
        tempsum = 0;
        for j = 1:i-1
            tempsum = tempsum + L(i, j)^2;
        end
        L(i, i) = sqrt(A(i, i) - tempsum);
        
        for j = i+1:rowlen
            tempsum = 0;
            for k = 1: i-1
                tempsum = tempsum + L(j, k)*L(i, k);
            end
            L(j, i) = (A(j, i) - tempsum)/L(i, i);
        end
    end

    tempsum = 0;
    for k = 1:rowlen-1
        tempsum = tempsum + L(rowlen, k)^2;
    end
    L(rowlen, collen) = sqrt(A(rowlen, collen) - tempsum);
end 
