#include <stdio.h>

int main(void){
	int i1=0, i2=1, n, res;
	scanf("%d",&n);
	for(;n;--n){ res=i2; i2+=i1; i1=res; }
	printf("%d\n",res);
}
