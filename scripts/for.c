#include <stdlib.h>
#include <stdio.h>


unsigned int sum(unsigned int n)
{
    unsigned int res = 0;
    for (int i = 0; i < n; i++)
    {
        res += i;
    }
    return res;
}
