#include <stdint.h>
#include <stdio.h>

extern int one_bit_count(int n, int(*f)(int));

int f(int n)
{
    int res = 0;
    while (n > 0)
    {
        res += n & 1;
        n = n >> 1;
    }
    return res;
}

int main(int argc, char **argv)
{
    int x = 86; // 4 bit a uno
    int res = one_bit_count(x, f);
    printf("Number of 1 bits: %d\n", res);
    return 0;
}
