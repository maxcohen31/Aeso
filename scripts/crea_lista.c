#include <stdio.h>
#include <stdlib.h>

typedef struct nodo 
{
    int valore;
    struct nodo *next;
} nodo;

extern nodo *creaLista(int *arr, int n);

void printList(nodo *lista)
{
    nodo *current = lista;
    while (current != NULL)
    {
        printf("%d ", current->valore);
        current = current->next;
    }
}

int main(int argc, char **argv)
{
    int arr[5] = {0, 12, 3, 44, 99};
    int n = 5;
    nodo * lis = creaLista(arr, n);
    printList(lis);
    return 0;
}

