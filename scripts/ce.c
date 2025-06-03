#include <stdlib.h>
#include <stdio.h>

extern int ce(int x, int *v, int n);

int main(int argc, char **argv)
{
    int d = 5;
    // int integer = 69;
    int integer = 100;
    int v[5] = {1, 3, 69, 1222, 90};
    int result = ce(integer, v, d);
    printf("%d", result);
    return 0;
}
