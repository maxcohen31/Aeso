/*
    Input: Array ordinato di n interi distinti;
    Output: T se esiste i tale che 1 <= i <= n, a[i] = i; F altrimenti
*/

#include <stdio.h>

extern int cerca(int *a, int size);

int main(int argc, char **argv)
{
    int a[6] = {2, 3, 4, 7, 8, 9};
    int size = 6;
    int r1 = cerca(a, size);
    printf("%d\n", r1);
    return 0;
}
