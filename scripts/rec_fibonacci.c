#include <stdio.h>
#include <stdlib.h>

extern int fibonacciRec(int n);

int main(int argc, char **argv)
{
    int result = fibonacciRec(10);
    printf("Result: %d", result);
    return 0;
}
