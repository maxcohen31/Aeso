/*
 * Programma che dato un array di struct conta quante di esse hanno una chiave dispari
*/
#include <stdio.h>

typedef struct elem {
    int k;
} elem;

extern int contaDispari(elem *v, int dim);

int main(int argc, char **argv)
{
    elem v[3] = {
        {2},
        {5},
        {3},
    };
    int result = contaDispari(v, 3);
    printf("Risultato: %d", result);
    return 0;
}

