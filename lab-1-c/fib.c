#include <stdio.h>
#define TIMES 1000000

int recursive(int n){ return n<3 ? 1 : recursive(n-1)+recursive(n-2); }

int tail_rec(int n,int a,int b){ return n==0 ? b : tail_rec(n-1,a+b,a); }

int iterative(int n){
	int i1=0, i2=1, res;
	for(;n;--n){ res=i2; i2+=i1; i1=res; }
	return res;
}

int main(int argc, char* argv[]){
	int n=atoi(argv[1]),i;
	for(i=0;i<TIMES;++i){
		recursive(n);
		tail_rec(n,1,0);
		iterative(n);
	}
}

