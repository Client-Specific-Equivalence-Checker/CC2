int main()
{
  unsigned int precision;
  unsigned int number;
  stbsp_snprintf(precision, number);
}

int stbsp_snprintf(unsigned int precision, unsigned int number)
{
  int CLEVER_ret_0_old = 0;
  int CLEVER_ret_0_new = 0;
  __CPROVER_assume((number > 0) && (number <= 6));
  __CPROVER_assume(precision > 0);
  unsigned int line_size = (precision * 2) + 2;
  unsigned int res_old = stbsp_snprintf_old(line_size, precision, number);
  unsigned int res_new = stbsp_snprintf_new(line_size, precision, number);
  res_old = stbsp_snprintf_old((line_size - res_old) - 1, precision, number);
  res_new = stbsp_snprintf_new((line_size - res_new) - 1, precision, number);
  CLEVER_ret_0_old = res_old;
  CLEVER_ret_0_new = res_new;
  assert(CLEVER_ret_0_old == CLEVER_ret_0_new);
}

unsigned int stbsp_snprintf_old(unsigned int buf_size, unsigned int count, unsigned int string_length)
{
  unsigned int length;
  if ((count == 0) && (!buf_size))
  {
    length = string_length;
    __CPROVER_assume(length >= 0);
  }
  else
  {
    if (count == 0)
    {
      length = 0;
    }
    else
    {
      if (string_length >= count)
      {
        length = count;
      }
      else
      {
        length = string_length;
      }

      __CPROVER_assume((((length >= 0) && (length <= buf_size)) && (length <= count)) && (length <= string_length));
    }

  }

  return length;
}

unsigned int stbsp_snprintf_new(unsigned int buf_size, unsigned int count, unsigned int string_length)
{
  unsigned int length;
  if ((count == 0) && (!buf_size))
  {
    length = string_length;
    __CPROVER_assume(length >= 0);
  }
  else
  {
    length = string_length;
    __CPROVER_assume(length >= 0);
  }

  return length;
}

