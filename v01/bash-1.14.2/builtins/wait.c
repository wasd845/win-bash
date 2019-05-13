/* wait.c, created from wait.def. */


#include <sys/types.h>
#include <signal.h>
#include "../shell.h"
#include "../jobs.h"

extern int interrupt_immediately;

/* Wait for the pid in LIST to stop or die.  If no arguments are given, then
   wait for all of the active background processes of the shell and return
   0.  If a list of pids or job specs are given, return the exit status of
   the last one waited for. */
wait_builtin (list)
     WORD_LIST *list;
{
  int status = EXECUTION_SUCCESS;

  begin_unwind_frame ("wait_builtin");
  unwind_protect_int (interrupt_immediately);
  interrupt_immediately++;

  /* We support jobs or pids.
     wait <pid-or-job> [pid-or-job ...] */

  /* But wait without any arguments means to wait for all of the shell's
     currently active background processes. */
  if (!list)
    {
      wait_for_background_pids ();
      status = EXECUTION_SUCCESS;
      goto return_status;
    }

  while (list)
    {
      pid_t pid;
      char *w;

      w = list->word->word;
      if (digit (*w))
	{
	  if (all_digits (w + 1))
	    {
	      pid = (pid_t)atoi (w);
	      status = wait_for_single_pid (pid);
	    }
	  else
	    {
	      builtin_error ("`%s' is not a pid or legal job spec", w);
	      status = EXECUTION_FAILURE;
	      goto return_status;
	    }
	}
#if defined (JOB_CONTROL)
      else if (job_control && *w)
	/* Must be a job spec.  Check it out. */
	{
	  int job;
	  sigset_t set, oset;

	  BLOCK_CHILD (set, oset);
	  job = get_job_spec (list);

	  if (job < 0 || job >= job_slots || !jobs[job])
	    {
	      if (job != DUP_JOB)
		builtin_error ("No such job %s", list->word->word);
	      UNBLOCK_CHILD (oset);
	      status = 127;	/* As per Posix.2, section 4.70.2 */
	      list = list->next;
	      continue;
	    }

	  /* Job spec used.  Wait for the last pid in the pipeline. */
	  UNBLOCK_CHILD (oset);
	  status = wait_for_job (job);
	}
#endif /* JOB_CONTROL */
      else
	{
	  builtin_error ("`%s' is not a pid or legal job spec", w);
	  status = EXECUTION_FAILURE;
	}
      list = list->next;
    }
 return_status:
  run_unwind_frame ("wait_builtin");
  return (status);
}
