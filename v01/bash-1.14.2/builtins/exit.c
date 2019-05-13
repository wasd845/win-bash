/* exit.c, created from exit.def. */
#include <stdio.h>
#include <sys/types.h>
#include "../shell.h"
#include "../jobs.h"

#include "builtext.h"	/* for jobs_builtin */

extern int interactive, login_shell;
extern int last_command_exit_value;

static int exit_or_logout ();

int
exit_builtin (list)
     WORD_LIST *list;
{
  if (interactive)
    {
      fprintf (stderr, login_shell ? "logout\n" : "exit\n");
      fflush (stderr);
    }

  return (exit_or_logout (list));
}

#line 61 "./exit.def"

/* How to logout. */
int
logout_builtin (list)
     WORD_LIST *list;
{
  if (!login_shell && interactive)
    {
      builtin_error ("Not login shell: use `exit' or `bye'");
      return (EXECUTION_FAILURE);
    }
  else
    return (exit_or_logout (list));
}

/* Clean up work for exiting or logging out. */
Function *last_shell_builtin = (Function *)NULL;
Function *this_shell_builtin = (Function *)NULL;

static int
exit_or_logout (list)
     WORD_LIST *list;
{
  int exit_value;

#if defined (JOB_CONTROL)
  int exit_immediate_okay;

  exit_immediate_okay = (!interactive ||
			 last_shell_builtin == exit_builtin ||
			 last_shell_builtin == logout_builtin ||
			 last_shell_builtin == jobs_builtin);

  /* Check for stopped jobs if the user wants to. */
  if (!exit_immediate_okay)
    {
      register int i;
      for (i = 0; i < job_slots; i++)
	if (jobs[i] && (jobs[i]->state == JSTOPPED))
	  {
	    fprintf (stderr, "There are stopped jobs.\n");

	    /* This is NOT superfluous because EOF can get here without
	       going through the command parser.  Set both last and this
	       so that either `exit', `logout', or ^D will work to exit
	       immediately if nothing intervenes. */
	    this_shell_builtin = last_shell_builtin = exit_builtin;
	    return (EXECUTION_FAILURE);
	  }
    }
#endif /* JOB_CONTROL */

  /* Get return value if present.  This means that you can type
     `logout 5' to a shell, and it returns 5. */
  if (list)
    exit_value = get_numeric_arg (list);
  else
    exit_value = last_command_exit_value;

  /* Run our `~/.bash_logout' file if it exists, and this is a login shell. */
  if (login_shell)
    maybe_execute_file ("~/.bash_logout", 1);

  last_command_exit_value = exit_value;

  /* Exit the program. */
  LONGJMP (top_level, EXITPROG);
  return(0);
}
