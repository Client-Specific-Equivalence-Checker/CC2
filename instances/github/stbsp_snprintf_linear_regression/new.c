int generate_line(unsigned int precision, unsigned int number) {
        //since the string representation of uint is at most 10 digits
        //the default precision of %f is 6
        __CPROVER_assume(number > 0 && number <= 6);
        __CPROVER_assume(precision > 0 );
        unsigned int line_size = precision * 2 +2;
        //int res = stbsp_snprintf((buffer), config.precision, "%f", x);;
        unsigned int res = stbsp_snprintf(line_size, precision, number);
        res = stbsp_snprintf(line_size-res-1, precision, number);
        return res;
}




 //this library abstract away buff writing and string formatting with uninterrupted function with general assumptions.
 unsigned int stbsp_snprintf(unsigned int buf_size, unsigned int count, unsigned int string_length){
  unsigned int length;
  if ( (count == 0) && !buf_size ){
        //compute_length computes the number of character written into the buf
        length = string_length;
        __CPROVER_assume(length >= 0 );
  }else{
    //compute_length computes the number of character written into the buf
        length = string_length;

        __CPROVER_assume(length >= 0 );
  }

  return length;
 }