#include <stdio.h>
#include <stdlib.h>

#define SIZE 7

extern int binary_search(int *arr, int element, int size);

int main(int argc, char **argv)
{
    int arr[SIZE] = {0, 2, 4, 5, 6, 7, 8};
    int target = 2;
    int risultato = binary_search(arr, target, SIZE);
    printf("L'elemento cercato è alla posizione %d", risultato);
    return 0;

}
