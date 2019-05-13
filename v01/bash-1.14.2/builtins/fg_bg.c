/* fg_bg.c, created from fg_bg.def. */

#include <sys/types.h>
#include <signal.h>
#include "../shell.h"
#include "../jobs.h"

#if defined (JOB_CONTROL)
extern char *this_command_name;

static int fg_bg ();

/* How to bring a job into the foreground. */
int
fg_builtin (list)
     WORD_LIST *list;
{
  int fg_bit = 1;
  register WORD_LIST *t = list;

  if (!job_control)
    {
      builtin_error ("no job control");
      return (EXECUTION_FAILURE);
    }

  /* If the last arg on the line is '&', then start this job in the
     background.  Else, fg the job. */

  while (t && t->next)
    t = t->next;

  if (t && t->word->word[0] == '&' && !t->word->word[1])
    fg_bit = 0;

  return (fg_bg (list, fg_bit));
}
#endif /* JOB_CONTROL */

#line 78 "./fg_bg.def"

#if defined (JOB_CONTROL)
/* How to put a job into the background. */
int
bg_builtin (list)
     WORD_LIST *list;
{
  if (!job_control)
    {
      builtin_error ("no job control");
      return (EXECUTION_FAILURE);
    }

  return (fg_bg (list, 0));
}

/* How to put a job into the foreground/background. */
static int
fg_bg (list, foreground)
     WORD_LIST *list;
     int foreground;
{
  sigset_t set, oset;
  int job, status = EXECUTION_SUCCESS, old_async_pid;

  BLOCK_CHILD (set, oset);
  job = get_job_spec (list);

  if (job < 0 || job >= job_slots || !jobs[job])
    {
      if (job != DUP_JOB)
	builtin_error ("No such job %s", list ? list->word->word : "");

      goto failure;
    }

  /* Or if jobs[job]->pgrp == shell_pgrp. */
  if (!(jobs[job]->flags & J_JOBCONTROL))
    {
      builtin_error ("job %%%d started without job control", job + 1);
      goto failure;
    }

  if (!foreground)
    {
      old_async_pid = last_asynchronous_pid;
      last_asynchronous_pid = jobs[job]->pgrp;	/* As per Posix.2 5.4.2 */
    }

  status = start_job (job, foreground);

  if (status >= 0)
    {
    /* win: */
      UNBLOCK_CHILD (oset);
      return (status);
    }
  else
    {
      if (!foreground)
	last_asynchronous_pid = old_async_pid;

    failure:
      UNBLOCK_CHILD (oset);
      return (EXECUTION_FAILURE);
    }
}
#endif /* JOB_CONTROL */
