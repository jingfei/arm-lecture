#include <stdio.h>

int fib(int n,int a,int b){ return n==0 ? b : fib(n-1,a+b,a); }

int main(void){
	int n;
	scanf("%d",&n);
	printf("%d\n",fib(n,1,0));
}

