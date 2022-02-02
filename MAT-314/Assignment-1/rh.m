function RH = rh(Td, Tw)
    
    RH = vp(Td, Tw)/svp(Td)*100;

    C2F = @(x) 1.8*x+32;
    F2C = @(x) 5/9*(x-32);

    function VP = vp(Td, Tw)
        VP = exp((16.78*Tw - 116.9)/(Tw + 237.3)) - 0.066858*(1 + 0.00115*Tw)*(Td - Tw);
    end

    function SVP = svp(Td)
        SVP = exp((16.78*Td - 116.9)/(Td + 237.3));
    end

end
