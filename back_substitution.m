A = [1 2; 0 4];
b = [2, 5];
back_sub_up(A, b)
back_sub_low(A', b)

function x = back_sub_up(A, b)
    collen = length(A(1, :));
    x = zeros(1, collen);
    for i = collen:-1:1
        d = b(i);
        for j = i+1:size
            d = d - A(i, j)*x(j);
        end
        x(i) = d/A(i,i);
    end
end

function x = back_sub_low(A, b)
    collen = length(A(1, :));
    x = zeros(1, collen);
    for i = 1:collen
        d = b(i);
        for j = 1:i-1
            d = d - A(i, j)*x(j);
        end
        x(i) = d/A(i,i);
    end
end
