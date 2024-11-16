#include <stdio.h>
#include <stdlib.h>


typedef struct _nodo
{
    int val;
    struct _nodo *next;

} nodo;

extern nodo *merge(nodo *prima, nodo *seconda);

int main(int argc, char **argv)
{
    // prima lista inizializzate a null
    nodo *prima = NULL;
    nodo *prec = NULL;

    // creo prima lista
    for (int i = 0; i < 5; i++)
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
            prima = elem;
            prec = elem;
        }
        elem->next = NULL;
    }

    nodo *seconda = NULL;
    nodo *sec_prec = NULL;

    for (int i = 5; i < 10; i++)
    {
        nodo *elem = malloc(sizeof(nodo));
        if (elem == NULL)
        {
            perror("Error allocating memory for second list");
            exit(2);
        }
        elem->val = i;
        if (sec_prec != NULL)
        {
            sec_prec->next = elem;
            sec_prec = elem;
        }
        else
        {
            seconda = elem;
            sec_prec = elem;
        }
        elem->next = NULL;
    }

    nodo *result_list = merge(prima, seconda);

    // stampo la lista unita
    printf("[ ");
    while (result_list != NULL) {
        printf("%d ", result_list->val);
        result_list = result_list->next;
    }
    printf("]\n");
    return 0;

}
