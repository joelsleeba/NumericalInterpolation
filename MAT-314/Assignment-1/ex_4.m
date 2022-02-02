function ex_4()
    r = 0.5;
    limit = 1/(1-r);

    for n = [10 50 100]
        s = sum(r.^(0:n));
        fprintf("Sum of first %d terms is %d \n",[n, s]);
    end

    fprintf("and the limit of series is %d", [limit]);

end


