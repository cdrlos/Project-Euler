"""
Largest palindrome product
Problem 4
"""


def is_palindrome(num):
    rev = 0
    tmp = num
    while tmp != 0:
        rev = 10 * rev + (tmp % 10)
        tmp //= 10
    return num == rev


print("Answer: " + str(answer_004) + "\n")
