#include <stdio.h>

int a[8] = {4, 6, 2, 1, 8, 3, 11, 7};


int main(int argc, char **argv)
{ 
    int m = a[0];
    for (int i = 1; i < 8; i++)
    {
        if (m < a[i])
        {
            m = a[i] ;
        }
    }

    printf ("max val is: %d", m);
    return 0;
}
