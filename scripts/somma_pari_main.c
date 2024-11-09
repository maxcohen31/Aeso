#include <stdio.h>
#include <stdlib.h>

extern int even_sum(int *arr, int size);


int main(int argc, char **argv)
{

    int size = 10;
    int a[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9};
    printf("Sum of even numbers is: %d", even_sum(a, size));
    return 0;
}

