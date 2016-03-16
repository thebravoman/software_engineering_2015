#include<math.h>
#include<stdio.h>
int main(){
    int n;
    int j;
    scanf("%i%i",&n,&j);
    int i;
    i=n;
    if(n>j)i=j;
    bool exit =false;
    for(;i>1&&!exit;i--){
        if((n%i==0)&&(j%i==0)){printf("%i\n",i);exit=true;}
    }
}
