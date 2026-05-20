/*
 *  Si fornisca il codice ARMv7 di una funzione con firma void conta(istr_t *p, int n) che stampa,
 *  chiamando una printf, il numero di istruzioni operative, di load/store e di salto nel segmento di codice
 *  ARMv7 di n>0 istruzioni che cominciano all’indirizzo p. Si utilizzino tutte le convenzioni relative
 *  alla codifica delle funzioni di ARMv7. */

#include <stdint.h>

/* Le istruzioni operative hanno codice 00, 01 per quelle di memoria e 10 per i salti */

typedef int32_t istr_t;

extern void conta(istr_t *p, int n);


int main(int argc, char **argv)
{
    int n = 5; /* Numero di istruzioni che cominciano all'indirizzo *p  */
    istr_t p[n];

    istr_t codice[] = {0xE59F0000, 0xE1A01002, 0xEA000005, 0x05910000, 0xE2800001};
    conta(codice, n);

    return 0;
}
