#include <stdio.h>
#include <stdlib.h>

#define MAX_LENGTH 5

extern int myatoi(char *p); /* simply atoi */
extern int map(char **v, int n); /* */

int main(int argc, char **argv)
{
    char *s = "123";
    int n = 3;

    char **v = malloc(sizeof(char*) * n);
    if (v == NULL) { perror("malloc v"); exit (1); }

    for (int i = 0; i < n; i++)
    {
        /* allocate memory for strings */
        v[i] = malloc(sizeof(char) * MAX_LENGTH);
        if (v[i] == NULL) { perror("malloc v[i]"); exit(2); }
        sprintf(v[i], "12%d", i);   /* produces "120","121","122" */
    }

    int new_s = myatoi(s);
    int r = map(v, n);

    printf("%s to int is equal to: %d\n", s, new_s);
    printf("Result of map: %d\n", r);

    for (int i = 0; i < n; i++) free(v[i]);
    free(v);
    return 0;
}

