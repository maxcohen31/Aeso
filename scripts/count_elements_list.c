/*
    Scrivere una funzione ARMv7 che prende come primo parametro il puntatore al primo elemento di una lista e restituisce il numero di elementi della lista. 
    Ogni elemento di una lista è una coppia {intero, next} con next puntatore al prossimo elemento (o NULL se questo non esiste).
*/

#include <stdio.h>
#include <stdlib.h>

typedef struct _nodo 
{
    int val;
    struct _nodo *next;

} nodo;



extern nodo *count_elements(nodo *list);

int main(int argc, char **argv)
{
    nodo *l = NULL;
    nodo *prec = NULL;

    for (int i = 0; i < 10; i++)
    {
        nodo *elem = malloc(sizeof(nodo));
        if (elem == NULL)
        {
            perror("Error allocating memory");
            exit(1);
        }

        elem->val = i;
        if (prec != NULL)
        {
            prec->next = elem;
            prec = elem;
        }
        else
        {
            l = elem;
            prec = elem;
        }
        elem->next = NULL;
    }

    int c = 0;
    while (l != NULL)
    {
        c++;
        l = l->next;
    }
    printf("Elements: %d", c);

    // rilascio memoria
    while (l != NULL)
    {
        // salvo primo elemento
        nodo* first = l;
        l = l->next;
        free(first);
    }

    return 0;
}
