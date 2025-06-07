#include <stdio.h>
#include <stdlib.h>

/*
 * conta le sttostringhe 'a(b+)a di una generica stringa'
*/

extern int match(char *s);

int main(int argc, char **argv)
{
    char *s = "abaaba";
    char *s1 = "culo";
    char *s2 = "abbbbba";
    char *s3 = "culoaba";
    int result1 = match(s);
    int result2 = match(s1);
    int result3= match(s2);
    int result4 = match(s3);
    printf("Result 'abaaba': %d\n", result1);
    printf("Result 'culo': %d\n", result2);
    printf("Result 'abbbba': %d\n", result3);
    printf("Result 'culoaba': %d\n", result4);
    return 0;
}
