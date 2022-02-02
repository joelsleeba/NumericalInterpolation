A = create_matrix();
b = pi*ones(1, 80);
x = ones(1,80);
jacobi_soln = jacobi(A, b, x, 10000, 1e-5, @max_norm);
gauss_soln = gauss_seidel(A, b, x, 10000, 1e-5, @max_norm);
fprintf("Jacobi Solution\n");
disp(jacobi_soln');

fprintf("\nGauss Seidel Solution\n");
disp(gauss_soln');

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

function x = jacobi(A, b, x, itermax, tol, norm_func)
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
     
function x = gauss_seidel(A, b, x, itermax, tol, norm_func)
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

%% Output
% Jacobi Solution
%     1.5387
%     0.7314
%     0.1080
%     0.1733
%     0.0406
%     0.0852
%     0.1664
%     0.1220
%     0.1012
%     0.0905
%     0.0720
%     0.0703
%     0.0688
%     0.0632
%     0.0597
%     0.0557
%     0.0519
%     0.0492
%     0.0468
%     0.0445
%     0.0425
%     0.0405
%     0.0388
%     0.0372
%     0.0357
%     0.0343
%     0.0331
%     0.0319
%     0.0308
%     0.0298
%     0.0288
%     0.0280
%     0.0271
%     0.0263
%     0.0256
%     0.0249
%     0.0242
%     0.0236
%     0.0230
%     0.0224
%     0.0218
%     0.0213
%     0.0208
%     0.0204
%     0.0199
%     0.0195
%     0.0191
%     0.0187
%     0.0183
%     0.0179
%     0.0176
%     0.0172
%     0.0169
%     0.0166
%     0.0163
%     0.0160
%     0.0157
%     0.0155
%     0.0152
%     0.0149
%     0.0147
%     0.0145
%     0.0142
%     0.0140
%     0.0138
%     0.0136
%     0.0134
%     0.0132
%     0.0130
%     0.0128
%     0.0127
%     0.0125
%     0.0124
%     0.0122
%     0.0113
%     0.0111
%     0.0122
%     0.0120
%     0.0154
%     0.0152
% 
% 
% Gauss Seidel Solution
%     1.5387
%     0.7314
%     0.1080
%     0.1733
%     0.0406
%     0.0852
%     0.1664
%     0.1220
%     0.1012
%     0.0905
%     0.0720
%     0.0703
%     0.0688
%     0.0632
%     0.0597
%     0.0557
%     0.0519
%     0.0492
%     0.0468
%     0.0445
%     0.0425
%     0.0405
%     0.0388
%     0.0372
%     0.0357
%     0.0343
%     0.0331
%     0.0319
%     0.0308
%     0.0298
%     0.0289
%     0.0280
%     0.0271
%     0.0263
%     0.0256
%     0.0249
%     0.0242
%     0.0236
%     0.0230
%     0.0224
%     0.0218
%     0.0213
%     0.0208
%     0.0204
%     0.0199
%     0.0195
%     0.0191
%     0.0187
%     0.0183
%     0.0179
%     0.0176
%     0.0172
%     0.0169
%     0.0166
%     0.0163
%     0.0160
%     0.0157
%     0.0155
%     0.0152
%     0.0149
%     0.0147
%     0.0145
%     0.0142
%     0.0140
%     0.0138
%     0.0136
%     0.0134
%     0.0132
%     0.0130
%     0.0128
%     0.0127
%     0.0125
%     0.0124
%     0.0122
%     0.0113
%     0.0111
%     0.0122
%     0.0120
%     0.0154
%     0.0152
