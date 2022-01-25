import math

f = lambda x: math.pi + math.sin(x/2)/2

def fix_point(x):
    for i in range(7):
        print(x)
        x = f(x)

fix_point(math.pi)
