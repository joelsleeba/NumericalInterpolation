f = @(x) 10*exp(-2*x);
x = linspace(0,2);
y = f(x);
plot(x,y);
xlabel('x');
ylabel('$10e^{-2x}$', 'Interpreter','latex');