#include <stdio.h>
#include <stdlib.h>

typedef struct _el
{
    char c;
    int occ;
    struct _el *next;
} el;

extern el *aggiungi(char c, el *lista);

int main(int argc, char **argv)
{
    el *prima = NULL;
    el *prec = NULL;
    for (int i = 0; i < 3; ++i)
    {
        el *node = malloc(sizeof(el));
        if (node == NULL)
        {
            perror("Malloc fallita\n");
            exit(1);
        }
        if (i == 0)
        {
            node->c = 'a';
            node->occ = 2;
            node->next = NULL;
        }
        else if (i == 1)
        {
            node->c = 'b';
            node->occ = 12;
            node->next = NULL;
        }
        else
        {
            node->c = 'c';
            node->occ = 10;
            node->next = NULL;
        }
        if (prec != NULL) /* se non è il primo nodo allora collega il precedente al nuovo nodo */
        {
            prec->next = node;
            prec = node;
        }
        else /* se primo nodo lo salviamo come testa */
        {
            prima = node;
            prec = prima;
        }  
    }

    el *updated_list = aggiungi('x', prima);
    while (updated_list != NULL)
    {
        printf("%c - %d\n", updated_list->c, updated_list->occ);
        updated_list = updated_list->next;
    }
    return 0;

}
