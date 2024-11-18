#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>



extern bool is_palindrome(char *string);


int main(int argc, char **argv)
{
    if (argc != 2)
    {
        printf("Uso: %s word1\n",argv[0]);
    }

    printf("%d", is_palindrome(argv[1]));

    return 0;
}
