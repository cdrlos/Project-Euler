// Problem 3

#include <math.h>
#include <stdio.h>

int largest_prime_factor(long n) {
  int largest = 2;
  if (n == 1)
    return n;

  while (n > 1) {
    if (n % largest == 0)
      n /= largest;
    else
      largest += 1;
  }
  return largest;
}

int main() {
  int sol = 0;

  sol = largest_prime_factor(600851475143);
  printf("SOLUTION: %i\n", (int)sol);
}

// SOLUTION: 4613732
