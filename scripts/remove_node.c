#include <stdio.h>
#include <stdlib.h>

typedef struct node
{
    int val;
    struct node *next;
} node;

extern int remove_node(node *list, int x);

void printList(node *l)
{
    while (l != NULL)
    {
        printf("%d ", l->val);
        l = l->next;
    }
    printf("\n");
}

int main(int argc, char **argv)
{
    node *prima = NULL;
    node *precedente = NULL;

    for (int i = 0; i < 5; ++i)
    {
        node *element = malloc(sizeof(node)); 
        if (element == NULL)
        {
            fprintf(stderr, "Error allocating memory\n");
        }
        element->val = i;
        if (precedente != NULL)
        {
            precedente->next = element;
            precedente = element; 
        }
        else
        {
            prima = element;
            precedente = prima;
        }
    }
    
    printList(prima);
    remove_node(prima, 3);
    printf("List after remove calling:\n");
    printList(prima);
    return 0;
}
