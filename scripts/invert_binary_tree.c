#include <stdio.h>
#include <stdlib.h>

typedef struct node {
    int val;
    struct node *sx;
    struct node *dx;
} node;

extern void swapTree(node *root);

node *addNode(int data)
{
    node *new = malloc(sizeof(node));
    if (!new)
    {
        perror("Error allocating memory\n");
    }
    new->val = data;
    new->sx = NULL;
    new->dx = NULL;
    return new;
}

void printTree(node *root)
{
    if (!root)
    {
        return;
    }
    printf("%d ", root->val);
    printTree(root->sx);
    printTree(root->dx);
}

int main(int argc, char **argv)
{
    
    node *root = addNode(1);    
    root->sx = addNode(3);
    root->dx = addNode(5);
    root->sx->sx = addNode(10);
    root->sx->dx = addNode(13);
    root->dx->sx = addNode(20);

    swapTree(root);
    printTree(root);
    return 0;
}
