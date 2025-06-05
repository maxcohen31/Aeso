#include <stdio.h>
#include <stdlib.h>

typedef struct _e 
{
    int info;
    struct _e *next;
} elem;

extern elem *insert(elem *lista, int info);

int main(int argc, char **argv)
{
    /* lista nulla all'inizio */
    elem *prima = NULL;
    elem *precedente = NULL;
    /* creazione lista */
    for (int i = 0; i < 5; ++i)
    {
        elem *nodo = malloc(sizeof(elem));
        if (nodo == NULL)
        {
            perror("Error allocating memory\n");
            exit(EXIT_FAILURE);
        }
        nodo->info = i;
        if (precedente != NULL)
        {
            precedente->next = nodo;
            precedente = nodo;
        }
        else
        {
            prima = nodo;
            precedente = nodo;
        }
    }
    elem *list_result = insert(prima, 12);
    /* stampa lista */
    while (list_result != NULL)
    {
        printf("%d ", list_result->info);
        list_result = list_result->next;
    }
    return 0;

}
