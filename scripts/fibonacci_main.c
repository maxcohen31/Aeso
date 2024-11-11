#include <stdlib.h>
#include <stdio.h>


extern int fibonacci(int n);

int main(int argc, char **argv)
{
    printf("Insert an integer: ");
    int n;
    int e = scanf("%d", &n);
    
    for (int i = 0; i < n; i++)
    {
        printf("%d ", fibonacci(i));
    }

    return 0;
}
