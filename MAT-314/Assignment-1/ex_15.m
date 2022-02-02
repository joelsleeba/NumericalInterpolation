a = 1;
b = 1.5;
c = 0.3;
x = linspace(0,2*pi);
y = a*cos(x) + sqrt(b^2 - (a*sin(x)-c).^2);
plot(x,y);
xlabel('x');
ylabel('$cos(x) + \sqrt{1.5^2 - (sin(x) - 0.3)^2}$', 'Interpreter','latex');
title('Another plot');