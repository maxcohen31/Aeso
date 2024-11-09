#include <stdio.h>
#include <stdlib.h>


int even_sum(int *arr, int size)
{
    int s = 0;
    for (int i = 0; i < size; i++)
    {
        if (arr[i] % 2 == 0)
        {
            s += arr[i];
        }
    }
    return s;
}
