#include <stdio.h>


extern char *removeSpace(char *s);

int main(int argc, char **argv)
{
    char s1[] = "I love you";
    printf("%s\n", s1);
    char *r = removeSpace(s1);
    printf("%s\n", r);
    return 0;
}
