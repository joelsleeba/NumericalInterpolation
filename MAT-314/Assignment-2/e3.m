x = linspace(3,5,10000);
f = @(x) 1./sqrt(x.^2 - 4);
y = f(x);
fprintf('trapezoidal integration: %f\n', comp_trapezoidal(x, y));
fprintf('simpsons integration: %f\n', comp_simpson(x, y));

function val = simpson(x, y) %3 point simpsons rule
    h = x(2) - x(1);
    val = h/3*(y(1) + 4*y(2) + y(3));
end

function val = trapezoidal(x, y) %3 point simpsons rule
    h = x(2) - x(1);
    val = h/2*(y(1) + y(2));
end

function val = comp_simpson(x, y)
    val = 0;
    i = 1;
    while i+2<=length(x)
        val = val + simpson(x(i:i+2), y(i:i+2));
        i = i+2;
    end
end

function val = comp_trapezoidal(x, y)
    val = 0;
    i = 1;
    while i+1<=length(x)
        val = val + trapezoidal(x(i:i+1), y(i:i+1));
        i = i+1;
    end
end