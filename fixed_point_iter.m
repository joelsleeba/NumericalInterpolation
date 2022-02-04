tol = 1E-6;
p0 = 1.5;
f = @(x) 0.5*sqrt(10-x^3);
fixed_iter(f, p0, tol, 1000)

function x = fixed_iter(f, x, tol, itermax)
    for i = 1:itermax
        x = f(x);
        if abs(x - f(x))<tol
            return
        end
    end
end
