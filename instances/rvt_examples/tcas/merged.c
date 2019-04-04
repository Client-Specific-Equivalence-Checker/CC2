
/*  -*- Last-Edit:  Fri Jan 29 11:13:27 1993 by Tarak S. Goradia; -*- */
/* $Log: tcas.c,v $
 * Revision 1.2  1993/03/12  19:29:50  foster
 * Correct logic bug which didn't allow output of 2 - hf
 * */

#include <stdio.h>

#define OLEV       600		/* in feets/minute */
#define MAXALTDIFF 600		/* max altitude difference in feet */
#define MINSEP     300          /* min separation in feet */
#define NOZCROSS   100		/* in feet */
				/* variables */

typedef int bool;

int Cur_Vertical_Sep;
bool High_Confidence;
bool Two_of_Three_Reports_Valid;

int Own_Tracked_Alt;
int Own_Tracked_Alt_Rate;
int Other_Tracked_Alt;

int Alt_Layer_Value;		/* 0, 1, 2, 3 */
int Positive_RA_Alt_Thresh[4];

int Up_Separation;
int Down_Separation;

				/* state variables */
int Other_RAC;			/* NO_INTENT, DO_NOT_CLIMB, DO_NOT_DESCEND */
#define NO_INTENT 0
#define DO_NOT_CLIMB 1
#define DO_NOT_DESCEND 2

int Other_Capability;		/* TCAS_TA, OTHER */
#define TCAS_TA 1
#define OTHER 2

int Climb_Inhibit;		/* true/false */

#define UNRESOLVED 0
#define UPWARD_RA 1
#define DOWNWARD_RA 2


void initialize()
{
    Positive_RA_Alt_Thresh[0] = 400;
    Positive_RA_Alt_Thresh[1] = 500;
    Positive_RA_Alt_Thresh[2] = 640;
    Positive_RA_Alt_Thresh[3] = 740;
}

int ALIM ()
{
 return Positive_RA_Alt_Thresh[Alt_Layer_Value];
}

int Inhibit_Biased_Climb ()
{
    return (Climb_Inhibit ? Up_Separation + NOZCROSS : Up_Separation);
}




bool Non_Crossing_Biased_Descend()
{
    int upward_preferred;
    int upward_crossing_situation;
    bool result;

    upward_preferred = Inhibit_Biased_Climb() > Down_Separation;
    if (upward_preferred)
    {
	result = Own_Below_Threat() && (Cur_Vertical_Sep >= MINSEP) && (Down_Separation >= ALIM());
    }
    else
    {
	result = !(Own_Above_Threat()) || ((Own_Above_Threat()) && (Up_Separation >= ALIM()));
    }
    return result;
}

bool Own_Below_Threat()
{
    return (Own_Tracked_Alt < Other_Tracked_Alt);
}

bool Own_Above_Threat()
{
    return (Other_Tracked_Alt < Own_Tracked_Alt);
}



int alt_sep_test()
{
    bool enabled, tcas_equipped, intent_not_known;
    bool need_upward_RA_old, need_upward_RA_new, need_downward_RA;
    int alt_sep;

    enabled = High_Confidence && (Own_Tracked_Alt_Rate <= OLEV) && (Cur_Vertical_Sep > MAXALTDIFF);
    tcas_equipped = Other_Capability == TCAS_TA;
    intent_not_known = Two_of_Three_Reports_Valid && Other_RAC == NO_INTENT;

    alt_sep = UNRESOLVED;

    if (enabled && ((tcas_equipped && intent_not_known) || !tcas_equipped))
    {
      bool ret_old;
      bool ret_new;
      int upward_preferred;
      int upward_crossing_situation;
      bool result_old;
      bool result_new;
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
	need_upward_RA_new = ret_new && Own_Below_Threat();
	need_upward_RA_old = ret_old && Own_Below_Threat();
	assert(need_upward_RA_new == need_upward_RA_old);
	need_downward_RA = Non_Crossing_Biased_Descend() && Own_Above_Threat();
	if (need_upward_RA_new && need_downward_RA)
        /* unreachable: requires Own_Below_Threat and Own_Above_Threat
           to both be true - that requires Own_Tracked_Alt < Other_Tracked_Alt
           and Other_Tracked_Alt < Own_Tracked_Alt, which isn't possible */
	    alt_sep = UNRESOLVED;
	else if (need_upward_RA_new)
	    alt_sep = UPWARD_RA;
	else if (need_downward_RA)
	    alt_sep = DOWNWARD_RA;
	else
	    alt_sep = UNRESOLVED;
    }


    return alt_sep;
}

main(argc, argv)
int argc;
char *argv[];
{
    if(argc < 13)
    {
	fprintf(stdout, "Error: Command line arguments are\n");
	fprintf(stdout, "Cur_Vertical_Sep, High_Confidence, Two_of_Three_Reports_Valid\n");
	fprintf(stdout, "Own_Tracked_Alt, Own_Tracked_Alt_Rate, Other_Tracked_Alt\n");
	fprintf(stdout, "Alt_Layer_Value, Up_Separation, Down_Separation\n");
	fprintf(stdout, "Other_RAC, Other_Capability, Climb_Inhibit\n");
	exit(1);
    }
    initialize();
    Cur_Vertical_Sep = nondet_int();
    High_Confidence = nondet_int();
    Two_of_Three_Reports_Valid =nondet_int();
    Own_Tracked_Alt = nondet_int();
    Own_Tracked_Alt_Rate = nondet_int();
    Other_Tracked_Alt = nondet_int();
    Alt_Layer_Value = nondet_int();
    Up_Separation = nondet_int();
    Down_Separation = nondet_int();
    Other_RAC = nondet_int();
    Other_Capability = nondet_int();
    Climb_Inhibit = nondet_int();

    alt_sep_test();
    exit(0);
}