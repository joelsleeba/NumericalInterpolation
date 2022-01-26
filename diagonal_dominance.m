A = [6 -2 2 4; 12 -8 6 10; 3 -13 9 3; -6 1 4 -18];
isdiag_dom(A)

function flag = isdiag_dom(A)
    flag = true;
    rowlen = length(A(:, 1));
    for i = 1:rowlen
        if abs(A(i, i)) <= (sum(abs(A(i, :))) - abs(A(i, i)))
            flag = false;
            break;
        end
    end
end

%% strict diagonal dominant?
function flag = isDiag_dom(A)
    flag = true;
    rowlen = length(A(:, 1));
    for i = 1:rowlen
        if abs(A(i, i)) < (sum(abs(A(i, :))) - abs(A(i, i)))
            flag = false;
            disp(i);
            break;
        end
    end
end
