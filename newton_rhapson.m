tol = 1E-6;
p0 = 1.5;
f = @(x) x^3 + 4*x^2 -10;
fp = @(x) 3*x^2 + 8*x;
newton_rhap(f, fp, p0, tol, 1000)

function root = newton_rhap(f, fp, x, tol, itermax)
    for i = 1:itermax
        temproot = x - f(x)/fp(x);
        if abs(temproot - x) < tol
            root = temproot;
            return
        end
        x = temproot;
    end
    root = nan;
end
