#include <stdio.h>
#include <stdlib.h>

extern int *copy_array(int *a, size_t s);

void print_arr(int *a, size_t s)
{
    for (int i = 0; i < s; i++)
    {
        printf("%d ", a[i]);
    }
    printf("\n");
}

int main(int arc, char **argv)
{
    int a[10];
    for (int i = 0; i < 10; i++) a[i] = i; /* 0 1 2 3 4 5 6 7 8 9 */
    print_arr(a, 10);
    int *res = copy_array(a, 10);
    print_arr(res, 10); /* 2 3 4 5 6 7 8 9 10 11 */
    free(res);
    return 0;
}
