#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

extern int palindrome(char *s);

int main(int argc, char **argv)
{
    char *s1 = "anna";
    char *s2 = "palla";
    int result1 = palindrome(s1);
    int result2 = palindrome(s2);
    printf("%s is palindrome: %d\n", s1, result1);
    printf("%s is palindrome: %d", s2, result2);
    return 0;
}
