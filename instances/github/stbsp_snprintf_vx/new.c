int vxLogBufPrint(int number) {
        //since the string representation of uint is at most 10 digits
        __CPROVER_assume(number > 0 && number <= 10);
        int buf = 256;
        //int written = stbsp_snprintf(buf, 256, "Engine log for frame %ju:\n", vxFrameNumber);
        int written = stbsp_snprintf(buf, 256, 22 + number);
        written += stbsp_snprintf(buf - written, 256 - written, 120);
        return written;
}




 //this library abstract away buff writing and string formatting with uninterrupted function with general assumptions.
 int stbsp_snprintf(int buf_size, int count, int string_length){
  int length;
  if ( (count == 0) && !buf_size ){
        //compute_length computes the number of in the formatted string
        length = string_length;
        __CPROVER_assume(length >= 0 );
  }else{
    //compute_length computes the number of character written into the buf
        length = string_length;
        if (length >= count){
            length = count -1;
        }
        __CPROVER_assume(length >= 0 );
  }

  return length;
 }