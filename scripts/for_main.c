#include <stdlib.h>
#include <stdio.h>

extern unsigned int sum(unsigned int n);

int main(int argc, char **argv)
{
    int a = atoi(argv[1]);
    printf("Sum: %d", sum(a));
    return 0;
}
