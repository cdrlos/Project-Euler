/*
Largest palindrome product
Problem 4

A palindromic number reads the same both ways. The largest palindrome made from
the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.
*/

#include <stdio.h>
#include <math.h>

int rev_int(int m){
  int tmp=m;
  int i=0;
  while(tmp!=0){
    tmp-=tmp%10;
    tmp/=10;
    i++;
  }
  tmp=0;

  for(int j=0; j<i; j++)
    tmp+=(m/((int) pow(10,i-j)))%10;

  return tmp;
}

int main() {
  printf("Answer: %i\n", rev_int(12345));
  return 0;
}
