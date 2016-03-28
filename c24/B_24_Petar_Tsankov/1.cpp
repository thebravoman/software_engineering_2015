#include<math.h>
#include<stdio.h>
int main(){
    int n;
    scanf("%i",&n);
    for(int i=2;i<sqrt(n);i++){
        if(i%2==0&&i!=2)i++;
        if(n%i==0)printf("%i\n",i);
    }
}
