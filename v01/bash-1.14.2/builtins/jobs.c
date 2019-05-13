/* jobs.c, created from jobs.def. */

#include "../shell.h"

#if defined (JOB_CONTROL)
#include <sys/types.h>
#include <signal.h>
#include "../jobs.h"

#include "bashgetopt.h"

extern int job_control, interactive_shell;
static int execute_list_with_replacements ();

/* The `jobs' command.  Prints outs a list of active jobs.  If the
   argument `-l' is given, then the process id's are printed also.
   If the argument `-p' is given, print the process group leader's
   pid only.  If `-n' is given, only processes that have changed
   status since the last notification are printed.  If -x is given,
   replace all job specs with the pid of the appropriate process
   group leader and execute the command. */
int
jobs_builtin (list)
     WORD_LIST *list;
{
  int form = JLIST_STANDARD, execute = 0;
  int opt;
  int any_failed = 0;

  if (!job_control && !interactive_shell)
    return (EXECUTION_SUCCESS);

  reset_internal_getopt ();
  while ((opt = internal_getopt (list, "lpnx")) != -1)
    {
      switch (opt)
	{
	case 'l':
	  form = JLIST_LONG;
	  break;
	case 'p':
	  form = JLIST_PID_ONLY;
	  break;
	case 'n':
	  form = JLIST_CHANGED_ONLY;
	  break;
	case 'x':
	  if (form != JLIST_STANDARD)
	    {
	      builtin_error ("Other options not allowed with `-x'");
	      return (EXECUTION_FAILURE);
	    }
	  execute++;
	  break;

	default:
	  builtin_error ("usage: jobs [-lpn [jobspec]] [-x command [args]]");
	  return (EX_USAGE);
	}
    }

  list = loptend;

  if (execute)
    return (execute_list_with_replacements (list));

  if (!list)
    {
      list_jobs (form);
      return (EXECUTION_SUCCESS);
    }

  while (list)
    {
      int job;
      sigset_t set, oset;

      BLOCK_CHILD (set, oset);
      job = get_job_spec (list);

      if ((job == NO_JOB) || !jobs || !jobs[job])
	{
	  builtin_error ("No such job %s", list->word->word);
	  any_failed++;
	}
      else if (job != DUP_JOB)
	list_one_job ((JOB *)NULL, form, 0, job);

      UNBLOCK_CHILD (oset);
      list = list->next;
    }
  return (any_failed ? EXECUTION_FAILURE : EXECUTION_SUCCESS);
}

static int
execute_list_with_replacements (list)
     WORD_LIST *list;
{
  register WORD_LIST *l;
  int job, result;

  /* First do the replacement of job specifications with pids. */
  for (l = list; l; l = l->next)
    {
      if (l->word->word[0] == '%')	/* we have a winner */
	{
	  job = get_job_spec (l);

	  /* A bad job spec is not really a job spec! Pass it through. */
	  if (job < 0 || job >= job_slots || !jobs[job])
	    continue;

	  free (l->word->word);
	  l->word->word = itos (jobs[job]->pgrp);
	}
    }

  /* Next make a new simple command and execute it. */
  begin_unwind_frame ("jobs_builtin");
  {
    COMMAND *command = (COMMAND *)NULL;

    add_unwind_protect (dispose_command, command);

    command = make_bare_simple_command ();
    command->value.Simple->words = copy_word_list (list);
    command->value.Simple->redirects = (REDIRECT *)NULL;
    command->flags |= CMD_INHIBIT_EXPANSION;
    command->value.Simple->flags |= CMD_INHIBIT_EXPANSION;

    result = execute_command (command);
  }

  run_unwind_frame ("jobs_builtin");
  return (result);
}
#endif /* JOB_CONTROL */
