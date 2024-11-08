#include <stdio.h>
#include <stdlib.h>


extern void maius(char *str);


int main(int argc, char **argv)
{
    printf("stringa originale: %s", argv[1]);

    maius(argv[1]);

    printf("stringa modificata: %s", argv[1]);

    return 0;
}

