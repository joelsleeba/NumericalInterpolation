A = [1 2; 0 4];
b = [2, 5];
back_sub(A, b)

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