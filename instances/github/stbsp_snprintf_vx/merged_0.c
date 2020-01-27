int main()
{
  unsigned number;
  stbsp_snprintf(number);
}

int stbsp_snprintf(unsigned number)
{
  int CLEVER_ret_0_old = 0;
  int CLEVER_ret_0_new = 0;
  __CPROVER_assume((number > 0) && (number <= 10));
  unsigned buf = 256;
  char buffer[256];
  unsigned written_old = stbsp_snprintf_old(buf, 256, 22 + number, buffer);
  unsigned written_new = stbsp_snprintf_new(buf, 256, 22 + number, buffer);
  written_old += stbsp_snprintf_old(buf - written_old, 256 - written_old, 120, buffer);
  written_new += stbsp_snprintf_new(buf - written_new, 256 - written_new, 120, buffer);
  CLEVER_ret_0_old = written_old;
  CLEVER_ret_0_new = written_new;
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

