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
  char buffer[line_size];
  unsigned int res_old = stbsp_snprintf_old(line_size, precision, number, buffer);
  unsigned int res_new = stbsp_snprintf_new(line_size, precision, number, buffer);
  res_old = stbsp_snprintf_old((line_size - res_old) - 1, precision, number, buffer);
  res_new = stbsp_snprintf_new((line_size - res_new) - 1, precision, number, buffer);
  CLEVER_ret_0_old = res_old;
  CLEVER_ret_0_new = res_new;
  assert(CLEVER_ret_0_old == CLEVER_ret_0_new);
}

unsigned int stbsp_snprintf_old(unsigned int buf_size, unsigned int count, unsigned int string_length, char *buf)
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
        buf[count - 1] = 1;
      }
      else
      {
        buf[string_length] = 1;
      }

      if (string_length >= count)
      {
        length = count;
      }
      else
      {
        length = string_length;
      }

      if (length >= count)
      {
        length = length - 1;
      }

      buf[length] = 0;
    }

  }

  return length;
}

unsigned int stbsp_snprintf_new(unsigned int buf_size, unsigned int count, unsigned int string_length, char *buf)
{
  unsigned int length;
  if ((count == 0) && (!buf_size))
  {
    length = string_length;
    __CPROVER_assume(length >= 0);
  }
  else
  {
    if (string_length >= count)
    {
      buf[count - 1] = 1;
    }
    else
    {
      buf[string_length] = 1;
    }

    int l;
    length = string_length;
    l = (int) string_length;
    if (l >= count)
    {
      l = count - 1;
    }

    buf[l] = 0;
  }

  return length;
}

