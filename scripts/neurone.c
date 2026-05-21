/*
 * Le reti neurali utilizzano un modello di neurone che calcola il proprio output come risultato di una funzione di attivazione 
 * calcolata sulla media pesata degli ingressi:
 *
 *              out = f( sommatoria per i che va da 0 a n-1 di (wi * xi) ) 
 * 
 * fornisca il codice ARMv7 che implementa una funzione di signature
 * int neurone(int * x, int * w, int n, int (*f) (int))
 * che calcola l’output di un neurone con pesi w, ingressi x e funzione di attivazione f. n è il numero degli ingressi e dei pesi. 
 * */


#include <stdio.h>

extern int neurone(int *x, int *w, int n, int (*f)(int)); 

int f(int x) { return x + 1; } /* Funzione a caso */

int main(int argc, char **argv)
{
    int ingressi[3] = {4, 5, 6};
    int pesi[3] = {1, 2, 3};
    int res = neurone(ingressi, pesi, 3, f);
    printf("Res: %d\n", res);
    return 0;
}
