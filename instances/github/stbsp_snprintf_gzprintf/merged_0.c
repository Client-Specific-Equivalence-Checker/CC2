int main()
{
  unsigned int buf_size;
  unsigned int string_length;
  stbsp_snprintf(buf_size, string_length);
}

int stbsp_snprintf(unsigned int buf_size, unsigned int string_length)
{
  unsigned int len_new;
  unsigned int len_old;
  int CLEVER_ret_0_old = 0;
  int CLEVER_ret_0_new = 0;
  __CPROVER_assume(buf_size <= 8192);
  unsigned int len = len_new = (len_old = 0);
  if (buf_size == 0)
  {
    len_new = (len_old = (len = 0));
  }
  else
  {
    int size = (int) buf_size;
    char buffer[size];
    buffer[size - 1] = 0;
    len_old = stbsp_snprintf_old(buf_size, size, string_length, buffer);
    len_new = stbsp_snprintf_new(buf_size, size, string_length, buffer);
    if (((len_old <= 0) || (len_old >= size)) || (buffer[size - 1] != 0))
      len_old = 0;

    if (((len_new <= 0) || (len_new >= size)) || (buffer[size - 1] != 0))
      len_new = 0;

  }

  CLEVER_ret_0_old = len_old;
  CLEVER_ret_0_new = len_new;
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

