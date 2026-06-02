/* 
 * Esiste una funzione “ f ” che ritorna 1 se l’argomento è una
 * vocale altrimenti 0. Si scriva una codice assembler che scorre una stringa e
 * utilizzi questa funzione per contare quante vocali ci sono nella stringa. 
*/

#include <stdio.h>

extern int conta_vocali(char *str, int (*f)(char));

int f(char s)
{
    if (s == 97 || s == 101 || s == 105 || s == 111 || s == 117) return 1;
    else return 0; 
}

int main(int argc, char **argv)
{
    char *a = "Ciao a te!";
    int res = conta_vocali(a, f);
    printf("Vocali in a: %d\n", res);
    return 0;
}
