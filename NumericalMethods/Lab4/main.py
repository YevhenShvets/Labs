import math


def method(n, X, Y, x):
    delta = [0 for _ in range(n)]
    X1 = [val for val in Y]
    delta[0] = X1[0]
    for i in range(0, n-1):
        for j in range(0, n-i):
            if(i == 0 and j==n-1): continue
            X1[j] = (X1[j+1]-X1[j])
            print(X1[j])
        delta[i+1] = X1[0]
    print(delta)
    h = (float(X[1]) - float(X[0]))
    q = (x - X[0])/h
    S = delta[0]
    fact = 1
    d = 1
    for i in range(1, n):
        fact = fact*i
        d = d * (q - i+1)
        S = S + (delta[i]*d)/fact
    print(f"S = {S}")


def main():
    X = [1, 1.2, 1.4, 1.6]
    Y = [0, -3, 2, 0]
    n = len(X)
    x = float(input("Enter x: "))
    if(x >X[-1] or x< X[0]):
        print("Error")
    else:
        method(n, X, Y, x)


if __name__ == '__main__':
    main()
