 '''
'''

def is_multiple(n,m):
    return n % m == 0

solution = 0
for x in range(1000):
    if (is_multiple(x,3) or is_multiple(x,5)):
        solution += x

print("Answer: " + str(solution) + "\n")

## Answer: 233168
