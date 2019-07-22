bool lib()
{
  int ret_old;
  int ret_new;
  int upward_preferred;
  int upward_crossing_situation;
  bool result;
  upward_preferred = Inhibit_Biased_Climb() > Down_Separation;
  if (upward_preferred)
  {
    result_old = (!Own_Below_Threat()) || (Own_Below_Threat() && (!(Down_Separation >= ALIM())));
    result_new = (!Own_Below_Threat()) || (Own_Below_Threat() && (!(Down_Separation > ALIM())));
  }
  else
  {
    result_old = (Own_Above_Threat() && (Cur_Vertical_Sep >= 300)) && (Up_Separation >= ALIM());
    result_new = (Own_Above_Threat() && (Cur_Vertical_Sep >= 300)) && (Up_Separation >= ALIM());
  }

  ret_old = result_old;
  ret_new = result_new;
}