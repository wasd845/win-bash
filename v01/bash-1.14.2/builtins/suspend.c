/* suspend.c, created from suspend.def. */
#line 23 "./suspend.def"

#line 32 "./suspend.def"

#include <sys/types.h>
#include <signal.h>
#include "../shell.h"
#include "../jobs.h"

#if defined (JOB_CONTROL)
extern int job_control;

static SigHandler *old_cont, *old_tstp;

/* Continue handler. */
sighandler
suspend_continue (sig)
     int sig;
{
  set_signal_handler (SIGCONT, old_cont);
  set_signal_handler (SIGTSTP, old_tstp);
#if !defined (VOID_SIGHANDLER)
  return (0);
#endif /* !VOID_SIGHANDLER */
}

/* Suspending the shell.  If -f is the arg, then do the suspend
   no matter what.  Otherwise, complain if a login shell. */
int
suspend_builtin (list)
     WORD_LIST *list;
{
  if (!job_control)
    {
      builtin_error ("Cannot suspend a shell without job control");
      return (EXECUTION_FAILURE);
    }

  if (list)
    if (strcmp (list->word->word, "-f") == 0)
      goto do_suspend;

  no_args (list);

  if (login_shell)
    {
      builtin_error ("Can't suspend a login shell");
      return (EXECUTION_FAILURE);
    }

do_suspend:
  old_cont = (SigHandler *)set_signal_handler (SIGCONT, suspend_continue);
  old_tstp = (SigHandler *)set_signal_handler (SIGTSTP, SIG_DFL);
  killpg (shell_pgrp, SIGTSTP);
  return (EXECUTION_SUCCESS);
}

#endif /* JOB_CONTROL */
