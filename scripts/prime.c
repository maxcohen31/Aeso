#include <stdio.h>


extern int isPrime(int n);

int main(int argc, char **argv)
{
    int p1 = isPrime(7);
    int p2 = isPrime(4);
    printf("%d\n", p1);
    printf("%d\n", p2);
    return 0;
}
