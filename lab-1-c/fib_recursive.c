#include <stdio.h>

int fib(int n){ return n<3 ? 1 : fib(n-1)+fib(n-2); }

int main(void){
	int n;
	scanf("%d",&n);
	printf("%d\n",fib(n));
}
