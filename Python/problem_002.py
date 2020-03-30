'''
'''
# Answer: 4613732

def fibonacci(n):
    (i, tmp, fib1, fib2) = (0, 0, 0, 1)
    while i < n:
        i += 1
        tmp = fib1
        fib1 = fib2
        fib2 = tmp + fib2
    return fib2

def fibonacci_lesseq(n):
    fibs = []
    i = 0
    while fibonacci(i) <= n:
        fibs.append(fibonacci(i))
        i += 1
    return fibs

def is_even(n):
    return 0 == n % 2

answer_002 = sum(filter(is_even, fibonacci_lesseq(4000000)))

print("Answer: " + str(answer_002) + "\n")
