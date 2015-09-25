#include <stdio.h>
#define times 10000000

int fib(int n,int a,int b){ return n==0 ? b : fib(n-1,a+b,a); }

int main(void){
	int n,i;
	scanf("%d",&n);
	for(i=0;i<times;++i) fib(n,1,0);
//	printf("%d\n",fib(n,1,0));
}

