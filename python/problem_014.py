'''
Longest Collatz sequence
Problem 14

The following iterative sequence is defined for the set of positive integers:

n → n/2 (n is even)
n → 3n + 1 (n is odd)

Using the rule above and starting with 13, we generate the following sequence:
13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1

It can be seen that this sequence (starting at 13 and finishing at 1) contains
10 terms. Although it has not been proved yet (Collatz Problem), it is thought
that all starting numbers finish at 1.

Which starting number, under one million, produces the longest chain?

NOTE: Once the chain starts the terms are allowed to go above one million.
'''

def collatz_chain_length(n):
    i = 0
    m = n
    while not m == 1:
        if (m%2)==0:
            i += 1
            m /= 2
        else:
            i += 1
            m = 3*m + 1
    return i

longest_chain_so_far = 1
starting_number_with_longest_chain = 1
for i in range(1,1000001):
    if i == 1000000:
        starting_number_with_longest_chain
    else:
        current_chain_length = collatz_chain_length(i)
        if current_chain_length > longest_chain_so_far:
            longest_chain_so_far = current_chain_length
            starting_number_with_longest_chain = i

answer_014 = starting_number_with_longest_chain
print("Answer: " + str(answer_014) + "\n")
