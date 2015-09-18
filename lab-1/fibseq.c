/* * The fibonacci function call here,
   * there are three arguments:  fibonacci(int x, int y, int z)
   * 	x: request for the xth Fibonacci number
   *    y: the last Fibonacci number we've known (fib 1 = 1)
   *    z: the second last Fibonacci number (fib0 = 0)
   */

#include <stdio.h>

extern int fibonacci(int x, int y, int z);

int main(int argc, char **argv)
{
  int number=0;
  int result=0;

  scanf("%d",&number);
  result = fibonacci(number,1,0);   
  printf("The fibonacci sequence at %d is: %d\n", number, result);
}

