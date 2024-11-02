#include <stdio.h>
#include <stdlib.h>



unsigned int fact(unsigned int n)
{
    unsigned int result = 1;
    while (n != 0)
    {
        result *= n;
        n--;
    }
    return result;
}
