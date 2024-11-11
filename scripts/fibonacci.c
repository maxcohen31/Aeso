#include <stdlib.h>
#include <stdio.h>


int fibonacci(int n)
{
    int a = 0;
    int b = 1;

    for (int i = 2; i < n; i++)
    {
        int c = a + b;
        a = b;
        b = c;
    }
    
    return b;
}
