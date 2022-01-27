A = [3 -3 1; 1 1 0; 1 -1 3];
b = [-1 3 2];
x = [1, 2, 0];
jacobi_soln = jacobi(A, b, x, 100)
disp((A*jacobi_soln')'-b);
gauss_soln = gauss_seidel(A, b, x, 100)
disp((A*gauss_soln')'-b);


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
