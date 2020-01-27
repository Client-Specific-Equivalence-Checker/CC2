int main()
{
  unsigned int buf_size;
  unsigned int string_length;
  stbsp_snprintf(buf_size, string_length);
}

int stbsp_snprintf(unsigned int buf_size, unsigned int string_length)
{
  int CLEVER_ret_2_old = 0;
  int CLEVER_ret_2_new = 0;
  int CLEVER_ret_1_old = 0;
  int CLEVER_ret_1_new = 0;
  int CLEVER_ret_0_old = 0;
  int CLEVER_ret_0_new = 0;
  if (buf_size == 0)
  {
    CLEVER_ret_0_old = 0;
    CLEVER_ret_0_new = 0;
  }

  int size = (int) buf_size;
  char buffer[size];
  buffer[size - 1] = 0;
  unsigned int len_old = stbsp_snprintf_old(buf_size, size, string_length, buffer);
  unsigned int len_new = stbsp_snprintf_new(buf_size, size, string_length, buffer);
  if (((len_old <= 0) || (len_old >= size)) || (buffer[size - 1] != 0))
    CLEVER_ret_1_old = 0;

  if (((len_new <= 0) || (len_new >= size)) || (buffer[size - 1] != 0))
    CLEVER_ret_1_new = 0;

  CLEVER_ret_2_old = len_old;
  CLEVER_ret_2_new = len_new;
  assert(CLEVER_ret_0_old == CLEVER_ret_0_new);
  assert(CLEVER_ret_1_old == CLEVER_ret_1_new);
  assert(CLEVER_ret_2_old == CLEVER_ret_2_new);
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
        buf[count - 1] = 'c';
      }

      if (string_length >= count)
      {
        length = count;
      }
      else
      {
        length = string_length;
      }

      __CPROVER_assume((((length >= 0) && (length <= buf_size)) && (length <= count)) && (length <= string_length));
      if (length >= count)
      {
        length = length - 1;
      }

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
      buf[count - 1] = 'c';
    }

    length = string_length;
    if (length >= count)
    {
      length = count - 1;
    }

    __CPROVER_assume(length >= 0);
  }

  return length;
}

