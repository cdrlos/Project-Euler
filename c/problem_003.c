/*
Largest prime factor
Problem 3

The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143 ?
*/

#include <stdio.h>
#include <math.h>

int largest_prime_factor(long n){
  int largest = 2;
  if(n == 1)
    return n;

  while(n > 1){
    if (n % largest == 0)
      n /= largest;
    else
      largest += 1;
  }
  return largest;
}

int main() {
  int answer_003 = 0;

  answer_003 = largest_prime_factor(600851475143);
  printf("Answer: %i\n", (int)answer_003);
}

// Answer: 4613732
