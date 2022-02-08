def rk4(f, y0, t0, h, y):
    yn, tn = y0, t0
    for i in range(int(abs((y-y0)/h))):
        k1 = h*f(tn, yn)
        k2 = h*f(tn+h/2, yn+k1/2)
        k3 = h*f(tn+h/2, yn+k2/2)
        k4 = h*f(tn+h, yn+k3)
        tn, yn = tn+h, yn+1/6*(k1 + 2*(k2+k3) + k4)
        print(tn, yn)
        
f = lambda t, y: -2*t*y**2
rk4(f, 1, 0, 0.2, 0.4)
