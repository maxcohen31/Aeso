#include <stdint.h>
#include <stdio.h>
#include <string.h>


extern void concat(char *str1, char *str2, char *result);

int main(int argc, char **argv)
{
    char res[255];
    memset(res, 0, sizeof(res));
    concat("Ciao", "Ema!", res);
    printf("Result: %s", res);

    return 0;
}
