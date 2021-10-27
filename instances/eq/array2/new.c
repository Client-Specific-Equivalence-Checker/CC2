#include <malloc.h>

int lib(int array1[], int array2[], int n) {
    int *array = array2;
    int sum = 0;
    for (int i = 0; i < n; ++i) {
        sum += array[i];
    }
    return sum;
}

int client(int n) {
    int *array1 = malloc(n * sizeof(int));
    int *array2 = malloc(n * sizeof(int));

    for (int i = 0; i < n; ++i) {
        array1[i] = i;
        array2[i] = n - i - 1;
    }

    int sum = lib(array1, array2, n);
    free(array1);
    free(array2);
    return sum;
}
