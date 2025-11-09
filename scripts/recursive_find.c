#include <stdio.h>


extern int find(int *a, int x, int size);

// int find2(int *a, int x, int size)
// {
//     if (size == 0)
//     {
//         return -1;
//     }
//     if (a[size] == x) { return 1; }
//     else { return find2(a, x, size - 1); }
// }


int main(int argc, char **argv)
{
    int a[10] = {222, 55, 33, 1, 3,887, 44, 11, 0, 69};
    printf("%d\n", find(a, 69, 10));
    printf("%d", find(a, 99, 10));
}
