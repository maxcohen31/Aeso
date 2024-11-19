#include <stdio.h>

extern void reverse(int *a, int size);

int main(int argc, char **argv)
{
    int size = 10;
    int a[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};

    reverse(a, size);

    for (int i = 0; i < size; i++)
    {
        printf("%d ", a[i]);
    }
    return 0;
}
