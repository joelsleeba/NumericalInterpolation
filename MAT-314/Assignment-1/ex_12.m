function mini = ex_12()
    x = input("Enter 1st number: ");
    y = input("Enter 2nd number: ");
    z = input("Enter 3rd number: ");
    fprintf("least number is %d", min(x,y,z));

    function least = min(x,y,z)
        if x<=y && x<=z
            least = x;
        elseif y<=x && y<=z
                least = y;
        else 
            least = z;
        end
    end
end
