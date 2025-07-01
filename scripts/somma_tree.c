#include <stdio.h>
#include <stdlib.h>
#include <stddef.h>

typedef struct Node
{
    int val;
    struct Node *left;
    struct Node *right;
} Node;

extern int somma(Node *root);

Node *insert(int val)
{
    Node *node = malloc(sizeof(Node));
    node->val = val;
    node->left = NULL;
    node->right = NULL;
    return node;
}

void print_tree(Node *node) 
{
    if (!node) 
    {
        return;
    }
    printf("Node: %d\n", node->val);
    print_tree(node->left);
    print_tree(node->right);
}

int main(int argc, char **argv)
{


    Node *root = insert(5);
    root->left = insert(1);
    root->right = insert(33);
    root->left->right = insert(100);
    root->right->left = insert(9);
    print_tree(root);

    printf("Size of int: %zu\n", sizeof(int));
    printf("Size of pointer: %zu\n", sizeof(struct Node*));
    printf("Size of Node: %zu\n", sizeof(Node));
    printf("Offset of val: %zu\n", offsetof(Node, val));
    printf("Offset of left: %zu\n", offsetof(Node, left));
    printf("Offset of right: %zu\n", offsetof(Node, right));
    
    int result = somma(root);
    printf("Somma nodi: %d\n", result);
    return 0;
}
