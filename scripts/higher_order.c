#include <stdio.h>
#include <stdlib.h>

typedef int (*f)(int);

extern void higher(int *a, int size, f);

int doubling(int x)
{
    return 2 * x;
}

int main(int argc, char **argv)
{
    int arr[9] = {1, 2, 3, 4, 5, 6, 7, 8, 9};
    for (int i = 0; i < 9; i++)
    {
        printf("%d ", arr[i]);
    }
    printf("\n");

    higher(arr, 9, doubling);
    for (int i = 0; i < 9; i++)
    {
        printf("%d ", arr[i]);
    }

    return 0;
}
