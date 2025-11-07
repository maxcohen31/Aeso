/*

    Scrivere una funzione che prende una array di 10 elementi costituiti da numeri interi a 32 bit memorizzati in modalità
    little-endian e lo converte in modalità big-endian.

*/

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

/* function that returns a unsigned 32 integer converted to its little-endian representation */
extern uint32_t applySwap(uint32_t num);
// {
//     uint32_t res;
//     uint32_t r0 = (num & 0x000000ff) << 24; /* take lowest 8 bits (byte 0) and move to highest position */
//     uint32_t r1 = (num & 0x0000ff00) << 8; /* take next 8 bits (byte 1) and move to byte 2 position */
//     uint32_t r2 = (num & 0x00ff0000) >> 8; /* take next 8 bits (byte 2) and move to byte 1 position */
//     uint32_t r3 = (num & 0xff000000) >> 24; /* take next 8 bits (byte 3) and move to lowest posistion */
// 
//     res = r0 | r1 | r2 | r3; /* combinig all results together */
//     return res;
// }

void littleToBig(uint32_t *arr, uint32_t *res)
{
    for (int i = 0; i < 10; i++)
    {
        res[i] = applySwap(arr[i]);
    }
}

int main(int argc, char **argv)
{
    uint32_t data[10] = {
    0x11223344,
    0xAABBCCDD,
    0x12345678,
    0xDEADBEEF,
    0x00FF00FF,
    0xCAFEBABE,
    0x01020304,
    0x55667788,
    0x223AA000,
    0x00000001
    };

    uint32_t r[10];
    littleToBig(data, r);

    for (int i = 0; i < 10; i++)
    {
        printf("%08x\n" , r[i]);
    }

    return 0;
}



