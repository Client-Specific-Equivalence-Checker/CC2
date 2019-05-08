int foo(int a, int b);

int client(int n) {
    int count = 0;
    while (n >= 1000){
        n = n /1000;
        count+= (lib(n));
        count += 3;
    }
    int digit = count + lib(n);
    if ((n % 10) != 0){
        return digit;
    }else{
        return 0;
    }
}

int lib(int n) {
	if (n < 0)
	    return -1;
	else if (n <= 10)
	    return 1;
	else if (n <= 100)
	    return 2;
	else if (n <= 1000)
	    return 3;
    else
        return -1;
}