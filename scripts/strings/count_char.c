#include <stdio.h>
#include <stdlib.h>
#include <string.h>


int counter(char *string, char c)
{
    int res = 0;
    for (int i = 0; i < strlen(string); i++)
    {
        if (string[i] == c)
        {
            res++;
        }
    }
    return res;
}
