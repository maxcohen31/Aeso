/* Calcola la potenza di un numero con una funzione ricorsiva */

#include <stdio.h>

extern int esp(int n, int pow);

int rec_exp2(int n, int pow)
{
    if (pow == 0) return 1;
    if (pow == 1) return n;
    return n * rec_exp2(n, pow - 1);
}

extern int rec_exp(int n, int pow);

int main(int argc, char **argv)
{
    int base = 2;
    int pow = 10;
    int res = rec_exp(base, pow);
    printf("%d^%d: %d\n", base, pow, res);
    return 0;
}
