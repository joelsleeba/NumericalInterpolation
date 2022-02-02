function ex_16()
    F2C = @(x) 5/9*(x-32);
    
    %A 
    %Converting temperatures to Centigrade bcs the RH function uses Celsius
    rh(F2C(75), F2C(69))

    %B
    rh(F2C(93), F2C(90))
end