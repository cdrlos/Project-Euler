// Problem 2

#include <stdio.h>

int fibonacci(int n) {
  int fib1 = 0;
  int fib2 = 1;
  int tmp = 0;

  while (n > 0) {
    n--;
    tmp = fib1;
    fib1 = fib2;
    fib2 += tmp;
  }

  return fib1;
}

int main() {
  int answer_002 = 0;
  int i = 0;
  int fib = fibonacci(i);

  while (fib <= 4000000) {
    if (fib % 2 == 0)
      answer_002 += fib;
    fib = fibonacci(i);
    i++;
  }

  printf("SOLUTION: %i\n", answer_002);
}

// SOLUTION: 4613732
