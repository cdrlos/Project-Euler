/*
  Project Euler Problem 1:

  If we list all the natural numbers below 10 that are multiples of 3 or 5, we
  get 3, 5, 6 and 9. The sum of these multiples is 23.

  Find the sum of all the multiples of 3 or 5 below 1000.
 */

#include <stdbool.h>
#include <stdio.h>

bool ismultiple(int n, int m) { return (n % m) == 0; }

int main() {
  int answer_001 = 0;

  for (int i = 0; i <= 1000; ++i) {
    if (ismultiple(i, 3) || ismultiple(i, 5)) {
      sol += i;
    }
  }
  printf("SOLUTION: %i\n", sol);
}

// Answer: 234168
