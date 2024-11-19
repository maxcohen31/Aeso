#include <stdio.h>

extern int pari(int *arr, int dim);
// extern int dispari(int *arr, int dim);


int main(int argc, char **argv)
{
    int a[11] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11};

    // int dispari = odd(a, 10);
    int even = pari(a, 11);


    // printf("Elementi dispari: %d", odd);
    printf("Elementi pari: %d", even);
    
    return 0;
}
