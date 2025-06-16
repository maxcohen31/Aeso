#include <stdio.h>
#include <stdlib.h>


int extern powerSum(int *arr, int n, int x);

int main(int argc, char **argv)
{
    int n = 4;
    int x = 3;
    int a[4] = {1, 2, 3, 4};
    int result = powerSum(a, n, x);
    printf("Somma: %d", result);
    return 0;
}
