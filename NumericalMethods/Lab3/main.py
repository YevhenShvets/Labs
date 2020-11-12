import numpy
import math

def answer(C, X, n):
    ans = [0 for _ in range(n)]
    for i in range(n):
        s = 0
        for j in range(n):
            s= s+C[i][j]*X[i]
        ans[i] = s
    print("Answer", ans)


def algo(A, b, n):
    A1 = [[0 for _ in range(n)] for _ in range(n)]
    b1 = [0 for _ in range(n)]
    X0 = [0 for _ in range(n)]
    X = [0 for _ in range(n)]

    for i in range(0, n):
        for j in range(0, n):
            if i != j:
                A1[i][j] = -(A[i][j]/A[i][i])
        b1[i] = b[i]/A[i][i]
        X0[i] = b1[i]

    k = 0
    e = 0.000000000001
    max_iter = 100
    max_ = 0

    while max_ < e or k > max_iter:
        max_ = 0
        for i in range(n):
            S = 0
            for j in range(n):
                S = S + A1[i][j] * X0[j]
            X[i] = b1[i] + S
        for i in range(n):
            if math.fabs(X[i]-X0[i]) > max_:
                max_ = math.fabs(X[i]-X0[i])
            X0[i] = X[i]
        k = k + 1
    print(f"X: {X}")
    print(f"K: {k}")

    answer(A, X, n)

def main():
    n = 3
    C = [
            [1900, 4, -5],
            [9.5, 3800, 0.5],
            [9, -9, 5700]
        ]
    d = [76960, 72240, -22940]

    algo(C, d, n)


if __name__ == '__main__':
    main()