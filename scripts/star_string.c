#include <stdio.h>
#include <stdlib.h>
#include <string.h>
/* public String starString(int n)
   {
       if (n == 0)
       {
           return "*";
       }
       else
       {
           return starString(n - 1) + starString(n - 1);
       }
   }
*/

char *concat(char *str1, char *str2)
{
    size_t len1 = strlen(str1);
    size_t len2 = strlen(str2);
    char *res = malloc(len1 + len2 + 1);
    if (res == NULL)
    {
        fprintf(stderr, "Memory allocation failed\n");
        exit(EXIT_FAILURE);
    }
    memcpy(res, str1, len1);
    memcpy(res + len2, str2, len2 + 1);
    return res;
}

extern char *star_string(int n);
char *star_string2(int n)
{
    if (n == 0) return "*";
    return concat(star_string2(n-1), star_string2(n-1));
}

int main(int argc, char **argv)
{
    int n = 5;
    char *res = star_string(n);
    printf("N = 5: %s", res);
    free(res);
    return 0;
}
