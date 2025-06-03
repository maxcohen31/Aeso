#include <stdio.h>
#include <stdlib.h>


extern int conta_bit_a_uno(int x);
extern void pot(int n);

int main(int argc, char **argv)
{
    int n;
    printf("Insert a positive integer: ");
    scanf("%d", &n);
    int result = conta_bit_a_uno(n);
    pot(n);
    printf("Bit set to one: %d", result);
    return 0;
}
