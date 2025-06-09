#include <stdio.h>
#include <stdlib.h>

/* tipo per l'elemento della lista: due parole contigue con informazione (intera) 
 * e puntatore al prossimo elemento della lista */

typedef struct _node
{
    int info;
    struct _node *next;
} node_t;

/* alloca una lista con un numero di elementi dato (informazione: 
 * numero pseudo casuale in [0, max) e restituisce il puntatore al primo elemento*/

void *l_alloca(int n, int max)
{
    node_t *inizio = NULL;
    srand(123);
    for (int i = 0; i < max; ++i)
    {
        /* crea nodo */
        node_t *node = malloc(sizeof(node_t));
        node->info = rand() % max; /* genera valore pseudo casuale */
        node->next = inizio; /* next è NULL */
        inizio = node; /* inizio diventa il nodo creato */
    }
    return inizio;
}

void l_stampa(node_t *p)
{
    printf("Lista generata: \n");
    while (p != NULL)
    {
        printf("%d -> ", p->info);
        p = p->next;
    }
    printf("Fine lista\n");
    return;
}
