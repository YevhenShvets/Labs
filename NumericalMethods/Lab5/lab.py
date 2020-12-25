import math


def main():
    ci = [0.1713245, 0.3607616, 0.4679140, 0.4679140, 0.3607616, 0.1713245]
    xi = [-0.9324700, -0.6612094, -0.2386142, 0.2386142, 0.6612094, 0.9324700]
    n = len(ci)
    a = -1
    b = 3
    answer = ((b-a)/2)
    answer2 = 0
    for i in range(0, n):
        temp = ci[i]*f(zi(a, b, xi[i]))
        answer2 += temp

    answer *= answer2
    print(f"Answer: {round(answer,3)}")


def zi(a, b, xi):
    return (b+a)/2+((b-a)/2)*xi


def f(x):
    return (x+1)*(x-3)


if __name__ == '__main__':
    main()
