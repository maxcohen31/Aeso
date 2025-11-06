#include <stdio.h>
#include <stdlib.h>


extern int f(int n, int k);
// {
//     int b;
//     b = k + 2;
//     if (n == 0) { b = 10; }
//     else 
//     {
//         b = b + (n * n) + f(n - 1, k + 1);
//     }
//     return b * k;
// }

int main(int argc, char **argv)
{
    int res = f(2, 4);
    printf("%d", res);
}
