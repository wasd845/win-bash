/* trap.c, created from trap.def. */
#line 23 "./trap.def"

#line 38 "./trap.def"

#include <sys/types.h>
#include <signal.h>
#include "../shell.h"
#include "../trap.h"
#include "common.h"

/* The trap command:

   trap <arg> <signal ...>
   trap <signal ...>
   trap -l
   trap [--]

   Set things up so that ARG is executed when SIGNAL(s) N is recieved.
   If ARG is the empty string, then ignore the SIGNAL(s).  If there is
   no ARG, then set the trap for SIGNAL(s) to its original value.  Just
   plain "trap" means to print out the list of commands associated with
   each signal number.  Single arg of "-l" means list the signal names. */

/* Possible operations to perform on the list of signals.*/
#define SET 0			/* Set this signal to first_arg. */
#define REVERT 1		/* Revert to this signals original value. */
#define IGNORE 2		/* Ignore this signal. */

extern int interactive;

trap_builtin (list)
     WORD_LIST *list;
{
  register int i;
  int list_signal_names = 0;

  while (list)
    {
      if (ISOPTION (list->word->word, 'l'))
	{
	  list_signal_names++;
	  list = list->next;
	}
      else if (ISOPTION (list->word->word, '-'))
	{
	  list = list->next;
	  break;
	}
      else if ((*list->word->word == '-') && list->word->word[1])
	{
	  bad_option (list->word->word);
	  builtin_error ("usage: trap [-l] [arg] [sigspec]");
	  return (EX_USAGE);
	}
      else
	break;
    }

  if (list_signal_names)
    {
      int column = 0;

      for (i = 0; i < NSIG; i++)
	{
	  printf ("%2d) %s", i, signal_name (i));
	  if (++column < 4)
	    printf ("\t");
	  else
	    {
	      printf ("\n");
	      column = 0;
	    }
	}
      if (column != 0)
	printf ("\n");
      return (EXECUTION_SUCCESS);
    }

  if (list)
    {
      char *first_arg = list->word->word;
      int operation = SET, any_failed = 0;

      if (signal_object_p (first_arg))
	operation = REVERT;
      else
	{
	  list = list->next;
	  if (*first_arg == '\0')
	    operation = IGNORE;
	  else if (first_arg[0] == '-' && !first_arg[1])
	    operation = REVERT;
	}

      while (list)
	{
	  int sig;

	  sig = decode_signal (list->word->word);

	  if (sig == NO_SIG)
	    {
	      builtin_error ("%s: not a signal specification",
			     list->word->word);
	      any_failed++;
	    }
	  else
	    {
	      switch (operation)
		{
		  case SET:
		    set_signal (sig, first_arg);
		    break;

		  case REVERT:
		    restore_default_signal (sig);

		    /* Signals that the shell treats specially need special
		       handling. */
		    switch (sig)
		      {
		      case SIGINT:
			if (interactive)
			  signal (SIGINT, sigint_sighandler);
			else
			  signal (SIGINT, termination_unwind_protect);
			break;

#ifdef SIGQUIT
		      case SIGQUIT:
			/* Always ignore SIGQUIT. */
			signal (SIGQUIT, SIG_IGN);
			break;
#endif
		      case SIGTERM:
#if defined (JOB_CONTROL)
		      case SIGTTIN:
		      case SIGTTOU:
		      case SIGTSTP:
#endif /* JOB_CONTROL */
			if (interactive)
			  signal (sig, SIG_IGN);
			break;
		      }
		    break;

		  case IGNORE:
		    ignore_signal (sig);
		    break;
		}
	    }
	  list = list->next;
	}
      return ((!any_failed) ? EXECUTION_SUCCESS : EXECUTION_FAILURE);
    }

  for (i = 0; i < NSIG; i++)
    {
      char *t, *p;

      p = trap_list[i];

      if (p == (char *)DEFAULT_SIG)
	continue;

      t = (p == (char *)IGNORE_SIG) ? (char *)NULL : single_quote (p);
      printf ("trap -- %s %s\n", t ? t : "''", signal_name (i));
      if (t)
	free (t);
    }
  return (EXECUTION_SUCCESS);
}
