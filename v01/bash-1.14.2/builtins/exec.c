/* exec.c, created from exec.def. */

/*
 * #line 23 "./exec.def"
 *
 * #line 34 "./exec.def" 
 */

#include "../shell.h"
#include <sys/types.h>
#include "../posixstat.h"
#include <signal.h>
#include <errno.h>

#include "../execute_cmd.h"
#include "common.h"
#include "../flags.h"

void nt_save_exec_stdhandles(int fd_stdin, int fd_stdout, int fd_sterr); /* from nt_vc.c */

/* Not all systems declare ERRNO in errno.h... and some systems #define it! */
#if !defined (errno)
extern int errno;
#endif /* !errno */
extern int interactive;
extern REDIRECT *redirection_undo_list;

int
exec_builtin (list)
     WORD_LIST *list;
{
  int exit_value = EXECUTION_FAILURE;

  maybe_make_export_env ();

  /* First, let the redirections remain. */
  dispose_redirects (redirection_undo_list);
  redirection_undo_list = (REDIRECT *)NULL;

  nt_save_exec_stdhandles(0, 1, 2);

  if (!list)
    return (EXECUTION_SUCCESS);
  else
    {
      /* Otherwise, execve the new command with args. */
      char *command, **args;
      int dash_name = 0;

      if (list->word->word[0] == '-' && !list->word->word[1])
	{
	  /* The user would like to exec this command as if it was a
	     login command.  Do so. */
	  list = list->next;
	  dash_name++;
	}

      if (!list)
	return (EXECUTION_SUCCESS);

#if defined (RESTRICTED_SHELL)
      if (restricted)
	{
	  builtin_error ("restricted");
	  return (EXECUTION_FAILURE);
	}
#endif /* RESTRICTED_SHELL */

      args = make_word_array (list);

      /* A command with a slash anywhere in its name is not looked up in
	 the search path. */
      if (absolute_program (args[0]))
	command = args[0];
      else
	command = find_user_command (args[0]);
      if (!command)
	{
	  builtin_error ("%s: not found", args[0]);
	  exit_value = EX_NOTFOUND;	/* As per Posix.2, 3.14.6 */
	  goto failed_exec;
	}

      command = full_pathname (command);
      /* If the user wants this to look like a login shell, then
	 prepend a `-' onto the first argument (argv[0]). */
      if (dash_name)
	{
	  char *new_name = xmalloc (2 + strlen (args[0]));
	  new_name[0] = '-';
	  strcpy (new_name + 1, args[0]);
	  free (args[0]);
	  args[0] = new_name;
	}

      /* Decrement SHLVL by 1 so a new shell started here has the same value,
	 preserving the appearance.  After we do that, we need to change the
	 exported environment to include the new value. */
      adjust_shell_level (-1);
      maybe_make_export_env ();

#if defined (HISTORY)
      maybe_save_shell_history ();
#endif /* HISTORY */
      restore_original_signals ();

#if defined (JOB_CONTROL)
      end_job_control ();
#endif /* JOB_CONTROL */

      shell_execve (command, args, export_env);

      adjust_shell_level (1);

      if (!executable_file (command))
	{
	  builtin_error ("%s: cannot execute: %s", command, strerror (errno));
	  exit_value = EX_NOEXEC;	/* As per Posix.2, 3.14.6 */
	}
      else
	file_error (command);

  failed_exec:
      if (command)
	free (command);

      if (!interactive && !find_variable ("no_exit_on_failed_exec"))
	exit (exit_value);

#if defined (JOB_CONTROL)
      restart_job_control ();
#endif /* JOB_CONTROL */

      return (exit_value);
    }
}
