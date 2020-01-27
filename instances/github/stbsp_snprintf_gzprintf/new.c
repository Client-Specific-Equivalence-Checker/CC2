int gzprintf(unsigned int buf_size, unsigned int string_length) {
    if (buf_size ==0){
        return 0;
    }

    int size = (int) buf_size;
    char buffer[size];
    buffer[size - 1] = 0;
    unsigned int len = stbsp_snprintf(buf_size, size, string_length, buffer);

    if (len <= 0 || len >= size || buffer[size - 1] != 0)
        return 0;

    return len;

}




 //this library abstract away buff writing and string formatting with uninterrupted function with general assumptions.
 unsigned int stbsp_snprintf(unsigned int buf_size, unsigned int count, unsigned int string_length, char* buf){
  unsigned int length;
  if ( (count == 0) && !buf_size ){
        //compute_length computes the number of character written into the buf
        length = string_length;
        __CPROVER_assume(length >= 0 );
  }else{
    //compute_length computes the number of character written into the buf
        if (string_length >= count){
            //if the buffer is not large enough, some character is written to the last pos
            buf[count -1] = 'c';
        }
        length = string_length;
        if (length >= count){
            length = count -1;
        }
        __CPROVER_assume(length >= 0 );
  }

  return length;
 }