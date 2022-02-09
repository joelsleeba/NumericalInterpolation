import math

f = lambda x: x**3 -5*x +1
f1 = lambda x: 3*x**2 - 5

def newton_raphson(x):
    for i in range(12):
        print(x)
        x =  x - f(x)/f1(x)

newton_raphson(0)
