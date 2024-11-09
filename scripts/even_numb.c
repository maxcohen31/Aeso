#include <stdio.h>
#include <stdlib.h>


int even_range(int n)
{
    int res = 0;
    for (int i = 0; i < n; i++)
    {
        if (i % 2 == 0)
        {
            res += i;
        }
    }
    return res;
}
