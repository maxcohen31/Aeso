#include <stdio.h>
#include <stdlib.h>

typedef struct node
{
    int val;
    struct node *left;
    struct node *right;
} node;

extern int somma_pari(node *root);

node *insert(int val)
{
    node *el = malloc(sizeof(node));
    if (el == NULL)
    {
        perror("Error allocating malloc\n");
        exit(1);
    }
    el->val = val;
    el->left = NULL;
    el->right = NULL;
    return  el;
}

void inorder(node *root)
{
    if (root == NULL)
    {
        return;
    }
    inorder(root->left);
    printf("%d ", root->val);
    inorder(root->right);
}

int main(int argc, char **argv)
{
    node *root = insert(4);
    root->left = insert(3);
    root->right = insert(5);
    root->right->right = insert(8);
    root->left->left = insert(1);
    root->left->right = insert(10);

    int result = somma_pari(root);
    printf("Somma nodi pari: %d", result);
    return 0;

}
