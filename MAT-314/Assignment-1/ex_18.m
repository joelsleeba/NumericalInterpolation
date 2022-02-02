f = @(x) x.^2;
g = @(x) 3*cos(x);
h = @(x) 6*exp(x);

%represent 6e^(3cos(x^2)) with f,g,h
foo = @(x) h(g(f(x)));

x = linspace(0,4);
y = foo(x);
plot(x,y);
xlabel('x');
ylabel('$6e^{3cos(x^2)}$','Interpreter','latex');