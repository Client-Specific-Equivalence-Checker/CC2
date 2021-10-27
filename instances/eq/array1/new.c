int lib(int *array, int n) {
    for (int i = 0; i < n; ++i) {
        if (i % 2 == 0) {
            array[i] += 1;
        }
    }
    int sum = 0;
    for (int i = 0; i < n; ++i) {
        sum += array[i];
    }
    return sum;
}

int client(int k) {
    int array[] = {23, -121, 12, 3, -13, 0, 335, -22};
    return lib(array, sizeof(array) / sizeof(array[0]));
}
