#include <stdio.h>
#include <stdlib.h>

struct elem 
{
    int k;
    char *s;
};

extern int lenOccorrenze(struct elem *v, int N, int key);

int main(int argc, char **argv)
{
    int n = 4;
    int k = 2;

    struct elem v[4] = {
        {1, "ciao"},
        {12, "mhanz"},
        {12, "culo"},
        {9, "pollo"}
    };

    int result = lenOccorrenze(v, 4, 12); /* chiave 12 */
    printf("# Strings length associated with key k is: %d", result);
    return 0;
}
