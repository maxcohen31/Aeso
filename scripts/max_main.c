#include <stdlib.h>
#include <stdio.h>

extern int max(int a, int b, int c);

int main(int argc, char **argv)
{
    int a = atoi(argv[1]);
    int b = atoi(argv[2]);
    int c = atoi(argv[3]);

    printf("Maximum among %d %d %d is %d", a, b, c, max(a, b, c));
    return 0;
}
