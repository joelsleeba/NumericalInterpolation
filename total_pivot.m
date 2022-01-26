A = [6 -2 2 4; 12 -8 6 10; 3 -13 9 3; -6 1 4 -18]
b = [16 26 -19 -34];
[A1, b1, colperm] = tot_pivot(A, b);
disp(A1)
disp(b1')
disp(colperm)

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

function [A, b, permlist] = tot_pivot(A, b)
    permlist = [];
    permcount = 1;
    rowlen = length(A(:, 1));
    collen = length(A(1, :));
    for i = 1:collen-1
        maxindex = [i, i];
        for j = i: rowlen
            for k = i: collen
                if abs(A(j, k)) > abs(A(maxindex(1),maxindex(2)))
                    maxindex = [j, k];
                end
            end
        end

        if maxindex(1) ~= i
            A = switch_rows(A, i, maxindex(1));
            b = switch_rows(b', i, maxindex(1))';
        end
        if maxindex(2) ~= i
            A = switch_cols(A, i, maxindex(2));
            permlist(permcount, :) = [i, maxindex(2)];
            permcount = permcount + 1;
        end
    end
end
