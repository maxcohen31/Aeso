#include <stdio.h>


extern int *moveZeros(int *a, int size);
  // {
  //     int j = 0;
  //     for (int i = 0; i < size; i++)
  //     {
  //         /* se un elemento dell'array è diverso da zero a[j] diventa a[i] */
  //         if (a[i] != 0)
  //         {
  //             a[j] = a[i];
  //             j++;
  //         }
  //     }
  //     /* scrive j zeri in fondo all'array */
  //     while (j < size)
  //     {
  //         a[j] = 0;
  //         j++;
  //     }
  //     return a;
  // }


int main(int argc, char **argv)
{
    int a[6] = {1, 2, 0, 3, 0, 1};
    int *r = moveZeros(a, 6);

    for (int i = 0; i < 6; i++) { printf("%d ", r[i]); }
    return 0;
}
