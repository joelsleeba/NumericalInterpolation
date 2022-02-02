format long;
f = @(x) (exp(x) - 1)./x;
x = 10.^-[1:15]';
disp([x, f(x)]);

y = 10.^-[1:20]';
disp([y, f(y)]);