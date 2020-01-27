int main()
{
  int buf_size;
  int count;
  int string_length;
  stbsp_snprintf(buf_size, count, string_length);
}

int stbsp_snprintf(int buf_size, int count, int string_length)
{
  int length_new;
  int length_old;
  int CLEVER_ret_0_old = 0;
  int CLEVER_ret_0_new = 0;
  int length;
  if ((count == 0) && (!buf_size))
  {
    length_new = (length_old = (length = string_length));
    __CPROVER_assume(length >= 0);
  }
  else
  {
    if (count == 0)
    {
      length_old = 0;
    }
    else
    {
      if (string_length >= count)
      {
        length_old = count;
      }
      else
      {
        length_old = string_length;
      }

      __CPROVER_assume((((length_old >= 0) && (length_old <= buf_size)) && (length_old <= count)) && (length_old <= string_length));
      if (length_old >= count)
      {
        length_old = length_old - 1;
      }

    }

    length_new = string_length;
    if (length_new >= count)
    {
      length_new = count - 1;
    }

    __CPROVER_assume(length_new >= 0);
  }

  CLEVER_ret_0_old = length_old;
  CLEVER_ret_0_new = length_new;
  assert(CLEVER_ret_0_old == CLEVER_ret_0_new);
}

