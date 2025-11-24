import math
def func(x):
    return x**3-12*x-11
def golden_section_search(f, a, b, epsilon):
    golden_ratio = (3 - math.sqrt(5)) / 2
    print(golden_ratio)
    x1 = a + golden_ratio * (b - a)
    x2 = b - golden_ratio * (b - a)
    f1 = f(x1)
    f2 = f(x2)
    while abs(b - a) > epsilon:
        if f1 < f2:
            b = x2
            x2 = x1
            f2 = f1
            x1 = a + golden_ratio * (b - a)
            f1 = f(x1)
        else :
            a = x1
            x1 = x2
            f1 = f2
            x2 = b - golden_ratio * (b - a)
            f2 = f(x2)
    xmin = (a + b) / 2
    fmin = f(xmin)
    return xmin, fmin

if __name__ == "__main__":
    a = 0
    b = 10
    epsilon = 0.01
    xmin, fmin = golden_section_search(func, a, b, epsilon)
    print("The minimum value of the function is:", fmin)
    print("The minimum point is:", xmin)
