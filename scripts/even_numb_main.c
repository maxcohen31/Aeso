#include <stdlib.h>
#include <stdio.h>

extern int even_range(int n);

int main(int argc, char **argv)
{

    int n;
    printf("Inserisci un valore positivo: ");
    int e = scanf("%d", &n);

    printf("La somma dei numeri pari tra 0 e %d è: %d", n, even_range(n));
    return 0;
}
