#include <stdio.h>

/*
 * f1(int a, int b)
 * {
 *      int x, i;
 *      x = (a + b) * (a - b)
 *      for (i = 0: i < a; i++)
 *      {
 *          x = x + f2(b+i)
 *      }
 * }
 *
 * f2(int p) 
 * {
 *      int r;
 *      r = p + 5;
 *      return r + p;
 * }
 */

extern int f1(int x, int b);
extern int f2(int p);

int main(int argc, char **argv)
{
    int res = f1(3, 4);
    printf("Res: %d\n", res);
    return 0;
}
