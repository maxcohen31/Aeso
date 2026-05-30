#include <stddef.h>
#include <stdio.h>


void print_array(int *a, size_t size)
{
    for (int i = 0; i < size; i++)
    {
        printf("%d ", a[i]);
    }
    puts("\n");
}

extern int *copy(int *a, int *b, size_t s);

int main(int argc, char **argv)
{
    int a[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
    int b[10] = {3, 6, 9, 12, 15, 18, 21, 24, 27, 30};

    print_array(a, 10);
    copy(a, b, 10);
    printf("Array after copy\n");
    print_array(a, 10);

    return 0;
}
