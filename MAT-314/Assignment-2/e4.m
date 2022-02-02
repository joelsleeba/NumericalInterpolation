f = @(x) cos(2*x)./(1+sin(x));
fprintf('Proper integral is : %f \n', integral(f,2,3))
g = @(t) 0.5*cos(2*(5/2 + t/2))./(1+sin(5/2 + t/2));
fprintf('Proper integral is : %f \n', integral(g,-1, 1));
fprintf('Gaussian estimate: %f', g(1/sqrt(3))+g(-1/sqrt(3)));