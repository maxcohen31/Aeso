#include <stdio.h>
#include <stdlib.h>

typedef struct Node
{
    int val;
    struct Node *left;
    struct Node *right;
} Node;

Node *insert(int val)
{
    Node *node = malloc(sizeof(Node));
    if (node == NULL)
    {
        perror("Error allocating memory\n");
    }
    node->val = val;
    node->left = NULL;
    node->right = NULL;
    return node; 
}

void inorder(Node *root)
{
    if (root == NULL)
    {
        return;
    }
    inorder(root->left);
    printf("%d ", root->val);
    inorder(root->right);

}

extern int cerca(Node *root, int x);

int main(int argc, char *argv[])
{
    int x = 2;
    Node *root = NULL;
    root = insert(69);
    root->left = insert(12);
    root->right = insert(1);
    root->right->left = insert(39);
    root->left->right = insert(10);
    root->left->left = insert(23);
    root->right->right = insert(99);
    
    // inorder(root);
    int result = cerca(root, 23);
    printf("%d", result);
    return 0;
}
