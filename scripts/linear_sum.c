#include <stdio.h>

extern int linearSum(int *a, int size, int target);


int main(int argc, char **argv)
{
    int s = 6;
    int arr[6] = {1, 3, 5, 9, 10, 11};
    int res = linearSum(arr, s, 15);
    int res2 = linearSum(arr, s, 14);
    int res3= linearSum(arr, s, 99);

    printf("%d\n", res);
    printf("%d\n", res2);
    printf("%d\n", res3);
    return 0;
}




