#include <stdio.h>
#include <stdlib.h>



extern int *squareThree(int *a, int size); /* se l'elemento i-esimo è pari ne fa il quadrato altrimento lo moltiplica per tre */

int main(int argc, char **argv)
{
    int size = 10;
    int *a = malloc(size * sizeof(int));
    if (a == NULL)
    {
        fprintf(stderr, "Error allocating memory for a\n");
        exit(1);
    }

    for (int i = 0; i < size; i++)
    {
        a[i] = i;
    }

    int *r = squareThree(a, size);

    for (int i = 0; i < size; i++)
    {
        printf("%d ", r[i]);
    }
    free(a);

    return 0;


}
