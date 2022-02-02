x = 0:0.1:20;
y = exp(-1*x./10).*sin(x);
plot(x,y);
xlabel('x')
ylabel('$e^{\frac{-x}{10}}sin(x)$','Interpreter','latex')
title('function plot')