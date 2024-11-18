#include <stdio.h>

extern void map(int *arr, int size, int(*f)(int));

int doubling(int x)
{
    return 2*x;
}

int main(int argc, char **argv)
{

    int size = 10;
    int a[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};

    map(a, size, doubling);

    for (int j = 0; j < size; j++)
    {
        printf("%d ", a[j]);
    }

    return 0;
}
