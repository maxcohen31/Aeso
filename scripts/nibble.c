#include <stdint.h>
#include <stdio.h>
#include <sys/types.h>

extern u_int32_t multiply8(u_int32_t x, u_int32_t y);

int main(int argc, char **argv)
{
    u_int32_t a = 0x01020310;
    u_int32_t b = 0x02020110;
    u_int32_t result = multiply8(a, b);  
    printf("Result is: 0x%08x\n", result);
    return 0;
}

