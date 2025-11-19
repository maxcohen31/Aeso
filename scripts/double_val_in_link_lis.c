#include <stdio.h>
#include <stdlib.h>


typedef struct node
{
    int k;
    int val;
    struct node *next;
} node;

extern node *findAndDouble(node *list);
void printList(node *list);
void destroy(node *list);

int main(int argc, char **argv)
{
    node *head = NULL;
    node *prev = NULL;

    for (int i = 0; i < 5; i++)
    {
        node *el = malloc(sizeof(node));
        if (el == NULL)
        {
            fprintf(stderr, "Error allocating memory\n");
            exit(1);
        }

        el->k = i + 1;
        el->val = i;
        el->next = NULL;
        
        if (prev != NULL) /* se non siamo al primo nodo */
        {
            prev->next = el;
            prev = el;
        }
        else /* lista vuota */
        {
            head = el;
            prev = el;
        }
        
    }

    printList(head);
    node *l = findAndDouble(head);
    printf("\n");
    printList(l);
    destroy(head);
    
    return 0;
}

void printList(node *list)
{
    node *current = list;
    while (current != NULL)
    {
        printf("%d ", current->val);
        current = current->next;
    }
}

void destroy(node *list)
{
    node *tmp = list;
    while (list != NULL) 
    {
        tmp = list;
        list = list->next;
        free(tmp);
    }
    free(list);
}
