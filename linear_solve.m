A = [6 -2 2 4; 12 -8 6 10; 3 -13 9 3; -6 1 4 -18];
b = [16 26 -19 -34];
x = solve(A, b);
disp(x);

function x = solve(A, b)
    [A1, b1] = sclaed_part_pivot(A, b)
    [A2, b2] = gauss_elim(A1, b1);
    x = back_sub(A2, b2);
end

function A = switch_rows(A, x, y)
    if 0<x<length(A) && 0<y<length(A)
        temp = A(y, :);
        A(y, :) = A(x, :);
        A(x, :) = temp;
    end
end

function [A, b] = part_pivot(A, b)
    for i = 1:length(A)-1
        colmaxindex = i;
        for j = i+1:length(A)
            if abs(A(j, i)) > abs(A(colmaxindex, i))
                colmaxindex = j;
            end
        end
        if colmaxindex ~= i
            A = switch_rows(A, i, colmaxindex);
            b = switch_rows(b', i, colmaxindex)';
        end
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
