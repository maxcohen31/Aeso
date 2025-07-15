#include <stdio.h>
#include <stdio.h>
#include <stdlib.h>

typedef struct Node
{
    int value;
    struct Node *next;  
} Node;

/* assembly functions */
extern int check(Node *l1, int x); 
extern Node *addDistinct(Node *l1, Node *l2);

/* Implementazione temporanea di check per test */
int check_c(Node *l1, int x) {
    printf("Checking for %d in list: ", x);
    while (l1 != NULL) {
        printf("%d ", l1->value);
        if (l1->value == x) {
            printf("-> FOUND\n");
            return 1;
        }
        l1 = l1->next;
    }
    printf("-> NOT FOUND\n");
    return 0;
}

void printList(Node *head, const char *name) 
{
    printf("%s: ", name);
    Node *current = head;
    int count = 0;
    while (current != NULL && count < 20) {  // Limite per evitare loop infiniti
        printf("%d ", current->value);
        current = current->next;
        count++;
    }
    if (count >= 20) {
        printf("... (possibile loop infinito!)");
    }
    printf("\n");
}

int main(int argc, char **argv)
{
    Node *prima = NULL;
    Node *prec = NULL;
    
    printf("=== CREAZIONE LISTA 1 ===\n");
    /* crea lista 1 */
    for (int i = 0; i < 5; ++i)
    {
        Node *nodo = malloc(sizeof(Node));
        if (nodo == NULL)
        {
            perror("Error allocating memory\n");
            exit(1);
        }
        nodo->value = i;
        nodo->next = NULL;  // IMPORTANTE!
        
        if (prec != NULL)
        {
            prec->next = nodo;
            prec = nodo;
        }
        else
        {
            prima = nodo;
            prec = nodo;
        }
        printf("Aggiunto nodo %d\n", i);
    }
    
    Node *prima2 = NULL;
    Node *prec2 = NULL;
    
    printf("\n=== CREAZIONE LISTA 2 ===\n");
    /* crea lista 2 */
    for (int i = 0; i < 10; ++i)
    {
        if (i % 2 == 0)
        {
            Node *nodo2 = malloc(sizeof(Node));
            if (nodo2 == NULL)
            {
                perror("Error allocating memory\n");
                exit(1);
            }
            nodo2->value = i;
            nodo2->next = NULL;  // IMPORTANTE!
            
            if (prec2 != NULL)
            {
                prec2->next = nodo2;
                prec2 = nodo2;
            }
            else
            {
                prima2 = nodo2;
                prec2 = nodo2;
            }
            printf("Aggiunto nodo %d\n", i);
        }
    }
    
    printf("\n=== LISTE INIZIALI ===\n");
    printList(prima, "Lista 1");
    printList(prima2, "Lista 2");
    
    printf("\n=== TEST CHECK FUNCTION ===\n");
    printf("check(L1, 2) = %d\n", check(prima, 2));
    printf("check(L1, 6) = %d\n", check(prima, 6));
    
    printf("\n=== CHIAMATA addDistinct ===\n");
    Node* list_result = addDistinct(prima, prima2);
    printf("addDistinct completato\n");
    
    printf("\n=== RISULTATO ===\n");
    printList(list_result, "Risultato");
    
    return 0;  
}
