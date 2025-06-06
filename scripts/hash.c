#include <stdio.h>
#include <stdlib.h>

extern int hash(int x);

int main(int argc, char **argv)
{
    int x = 0x10372841;
    int result = hash(x);
    printf("Result: %d", result);
    return 0;
}
