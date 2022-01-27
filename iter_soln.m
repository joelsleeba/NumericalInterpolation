A = [3 -3 1; 1 1 0; 1 -1 3];
b = [-1 3 2];
x = [1, 2, 0];
jacobi_soln = jacobi(A, b, x, 100)
disp((A*jacobi_soln')'-b);
gauss_soln = gauss_seidel(A, b, x, 100)
disp((A*gauss_soln')'-b);

fprintf("Another example\n\n");
B = create_matrix();
c = pi*ones(1, 80);
y = ones(1,80);
jacobi1_soln = jacobi1(B, c, y, 10000, 1e-5, @max_norm);
gauss1_soln = gauss_seidel1(B, c, y, 10000, 1e-5, @max_norm);
fprintf("Jacobi Solution\n");
disp((B*jacobi1_soln')'-c);
fprintf("Gauss Seidel Solution\n");
disp((B*gauss1_soln')'-c);

function maxsum = matrix_max_norm(A)
    rowlen = length(A(:, 1));
    maxsum = 0;
    for i = 1 : rowlen
        tempsum = sum(abs(A(i, :)));
        if tempsum > maxsum
            maxsum = tempsum;
        end
    end
end

function maxsum = max_norm(x)
    maxsum = max(abs(x));
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


function A = create_matrix()
    A = zeros(80);
    for i = 1:80
        for j = 1:80
            if j==i
                A(i, j) = 2*i;
            elseif j==i+2 || j==i-2
                A(i, j) = 0.5*i;
            elseif j == i+4 || j == i-4
                A(i, j) = 0.25*i;
            else
                A(i, j) = 0;
            end
        end
    end
end

function x = jacobi1(A, b, x, itermax, tol, norm_func)
    xnew = zeros(1, length(A(1, :)));
    for s = 1:itermax
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
        if norm_func(x-xnew) < tol %vector maxnorm
            x = xnew;
            break
        else
            x = xnew;
        end
        %disp(x);
    end
end
     
function x = gauss_seidel1(A, b, x, itermax, tol, norm_func)
    xnew = zeros(1, length(A(1, :)));
    for s = 1:itermax
        for i = 1: length(A(1, :))
            tempsum = 0;
            for j = 1:length(A(1, :))
                if j<i
                    tempsum = tempsum + A(i, j)*xnew(j);
                elseif i<j
                    tempsum = tempsum + A(i, j)*x(j);
                else
                    continue;
                end
            end
            xnew(i) = (b(i) - tempsum)/A(i, i);
        end
        if norm_func(x-xnew) < tol %vector max norm
            x = xnew;
            break
        else
            x = xnew;
        end
    end
end