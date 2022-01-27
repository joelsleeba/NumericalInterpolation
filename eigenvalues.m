A = [2 0 -1; -2 -10 0; -1 -1 4];
f = @(A) A(1);
x = [1 1 1];
power_method(A, x, f, 10);

function power_method(A, x, f, iter)
    for i = 1:iter
        y = (A*(x)')';
        r = f(y)/f(x);
        x = y;
        disp(x);
        disp(r);
    end
end
