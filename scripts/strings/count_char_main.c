#include <stdio.h>
#include <stdlib.h>

extern int counter(char *string, char c);


int main(int argc, char **argv)
{
    
    if (argc != 2)
    {
        exit(1);
    }
    printf("Enter a character: ");
    char c = getchar();
    getchar();
    int result = counter(argv[1], c);
    
    printf("Counter -> %d", result);
    return 0;
}
