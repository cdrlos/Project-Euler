// Problem 4

#include <math.h>
#include <stdio.h>

int rev_int(int m) {
  int tmp = m;
  int i = 0;
  while (tmp != 0) {
    tmp -= tmp % 10;
    tmp /= 10;
    i++;
  }
  tmp = 0;

  for (int j = 0; j < i; j++)
    tmp += (m / ((int)pow(10, i - j))) % 10;

  return tmp;
}

int main() {
  printf("SOLUTION: %i\n", rev_int(12345));
  return 0;
}

//
