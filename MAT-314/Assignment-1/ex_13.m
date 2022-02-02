%% call the function with the integer to find factorial of
function ex_13(x)    
    
    function fact = f(x)
    fact = 1;
        for i = 1:x
            fact = fact*i;
        end
    end
    
    if f(x) == factorial(x)
        fprintf("%d! = %d, factorial function successful", [x, f(x)]);
    else
        disp("factorial function fails");
    end
end
