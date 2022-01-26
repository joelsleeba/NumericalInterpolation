A = [6 -2 2 4; 12 -8 6 10; 3 -13 9 3; -6 1 4 -18];
b = [16 26 -19 -34];
[A1, b1] = part_pivot(A, b);
disp(A1)
disp(b1')

function A = switch_rows(A, x, y)
    if 0<x<length(A) && 0<y<length(A)
        temp = A(y, :);
        A(y, :) = A(x, :);
        A(x, :) = temp;
    end
end

function [A, b] = part_pivot(A, b)
    rowlen = length(A(:, 1));
    collen = length(A(1, :));
    for i = 1:collen-1
        colmaxindex = i;
        for j = i+1: rowlen
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
