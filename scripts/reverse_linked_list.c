#include <stdio.h>
#include <stdlib.h>

typedef struct node 
{
    int value;
    struct node *next;
} node;

extern node *reverseList(node *list); /* ARMv7  */

node *reverseListC(node *list);
void printList(node *list);

int main(int argc, char **argv)
{

    node *head= NULL; /* puntatore alla testa della lista */
    node* prec = NULL; /* puntatore al nodo precedente */
    for (int i = 0; i < 5; ++i)
    {
        node *new = malloc(sizeof(node));
        if (!new)
        {
            perror("Error allocating memory\n");
            exit(1);
        }

        new->value = i;
        new->next = NULL; /* next è NULL all'inizio */

        if (prec != NULL) /* se non siamo al primo nodo */
        {
            prec->next = new; /* il nodo precedente punta a quello nuovo */
            prec = new;; /* aggoirna precedente */
        }
        else /* la lista è vuota */
        {
            head = new; /* la testa diventa il nuovo nodo */
            prec = new; /* anche prec diventa il nuovo nodo  */
        }
    }
    printList(head);
    node* newList = reverseList(head);
    puts("\nReversed list: ");
    printList(newList);
    return 0;
}

void printList(node *list)
{
    node *current = list;
    while (current != NULL)
    {
        printf("%d ", current->value);
        current = current->next;
    }
}

// node* reverseListC(node *list)
// {
//     node *current = list;
//     node* prec = NULL;
//     node *next = NULL;
//     while (current != NULL)
//     {
//         next = current->next; /* salva il nodo succesivo */
//         current->next = prec; /* il nodo attuale punta al precedente */
//         prec = current; /* il nodo precedente diventa quello corrente */
//         current = next; /* il nodo corrente diventa il prossimo nodo */
//     }
//     return prec;
// }
