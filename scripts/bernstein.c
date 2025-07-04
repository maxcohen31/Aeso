#include <stdio.h>
#include <stdint.h>

extern int bernstein(uint32_t instr1, uint32_t instr2);

int main(int argc, char **argv)
{
    uint32_t reg1 = 0x00010002;
    uint32_t reg2 = 0x00040008;
    uint32_t reg4 = 0x00020004;
    int result = bernstein(reg1, reg2); 
    int result2 = bernstein(reg1, reg4); 

    printf("Bernstein's conditions for 0x%08X and 0x%08X met: %d\n", reg1, reg2, bernstein(reg1, reg2));
    printf("Bernstein's conditions for 0x%08X and 0x%08X met: %d\n", reg1, reg4, bernstein(reg1, reg4));
    return 0;
}
