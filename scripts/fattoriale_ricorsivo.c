/* Fattoriale ricorsivo */

#include <stdio.h>

extern int fact(int n);

int fact2(int x)
{
    if (x == 0) return 1;
    if (x == 1) return 1;
    return x * fact2(x-1);
}

int main(int argc, char **argv)
{
    int x = 5; 
    int y = 1; 
    int res = fact(x);
    int res2 = fact(y);
    printf("5! = %d\n", res);
    printf("1! = %d\n", res2);
    return 0;
}
