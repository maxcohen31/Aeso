#include <stdio.h>
#include <stdlib.h>


extern void bubbleSort(int *arr, int n);

int main(int argc, char **argv)
{
    int a[5] = {44, 4, 99, 1, 10};
    bubbleSort(a, 5);
    printf("sorted array: ");
    for (int i = 0; i < 5; ++i)
    {
        printf(" %d ", a[i]);
    }
    return 0;
}
