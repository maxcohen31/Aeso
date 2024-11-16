#include <stdlib.h>
#include <stdio.h>
#include <string.h>



extern int max_length(char **arr, int size);

int main(int argc, char **argv)
{
    if (argc <= 1)
    {
        printf("Uso: %s word1 word2 ...\n", argv[0]);
        exit(1);
    }

    char **parole = malloc((argc-1)*sizeof(char*));
    if (parole == NULL)
    {
        perror("Error allocating memory");
        exit(2);
    }

    for (int i = 1; i < argc; i++)
    {
        parole[i-1] = malloc((strlen(argv[i])+1)*sizeof(char));
        if (parole[i-1] == NULL)
        {
            perror("Error allocating memory");
            exit(2);
        }
        strcpy(parole[i-1], argv[i]);
    }

    for (int j = 0; j < argc-1; j++)
    {
        printf("parole[%d]: %s\n", j, parole[j]);
    }

    printf("La parola di lunghezza massima si trova all'indice %d", max_length(parole, argc-1));

    for (int i = 0; i < argc-1; i++)
    {
        free(parole[i]);
    }
    free(parole);

    return 0;
}
