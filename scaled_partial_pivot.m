A = [6 -2 2 4; 12 -8 6 10; 3 -13 9 3; -6 1 4 -18];
b = [16 26 -19 -34];
[A1, b1] = scaled_part_pivot(A, b);
disp(A1)
disp(b1')

function A = switch_rows(A, x, y)
    if 0<x<length(A) && 0<y<length(A)
        temp = A(y, :);
        A(y, :) = A(x, :);
        A(x, :) = temp;
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
