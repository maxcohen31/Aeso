#include <stdio.h>
#include <stdlib.h>


int bin_search(int arr[], int element, int size)
{
    int result = -1;
    int i = 0;
    int j = size;

    while (i < j)
    {
        int m = (i+j) / 2; 

        if (arr[m] == element)
        {
            return m;
        }
        else if (arr[m] < element)
        {
            i = m + 1;
        }
        else if (arr[m] > element)
        {
            j = m - 1;
        }
    }
    return result;
}
