function ex_11()
    f(3)
    x = [1 3 5 7 9 11];
    f(x)

    function out = f(x)
        out = (x.^2).*sqrt(7*x + 1)./(x.^2+1).^2;
    end
end