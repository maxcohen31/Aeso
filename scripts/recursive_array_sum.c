#include <stdio.h>

extern int recSum(int *arr, int n);

int main(int argc, char **argv)
{
    int n = 5;
    int a[5] = {3, 6, 9, 12, 15};
    int result = recSum(a, n);
    printf("Sum is : %d\n", result);
    return 0;
}
