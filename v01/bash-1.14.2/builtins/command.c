/* command.c, created from command.def. */
#line 23 "./command.def"

#line 34 "./command.def"

#if defined (HAVE_STRING_H)
#  include <string.h>
#else /* !HAVE_STRING_H */
#  include <strings.h>
#endif /* !HAVE_STRING_H */

#include "../shell.h"
#include "bashgetopt.h"

extern int subshell_environment;

static void restore_path ();
static char *get_standard_path ();

/* Run the commands mentioned in LIST without paying attention to shell
   functions. */
int
command_builtin (list)
     WORD_LIST *list;
{
  int result, verbose = 0, use_standard_path = 0, opt;
  char *old_path;
  
  reset_internal_getopt ();
  while ((opt = internal_getopt (list, "pvV")) != -1)
    {
      switch (opt)
	{
	case 'p':
	  use_standard_path = 1;
	  break;
	case 'V':
	  verbose = 2;
	  break;
	case 'v':
	  verbose = 4;
	  break;

	default:
	  report_bad_option ();
	  builtin_error ("usage: command [-pvV] [command [arg...]]");
	  return (EX_USAGE);
	}
    }
  list = loptend;

  if (!list)
    return (EXECUTION_SUCCESS);

  if (verbose)
    {
      int found, any_found = 0;

      while (list)
	{

	  found = describe_command (list->word->word, verbose, 0);

	  if (!found)
	    builtin_error ("%s: not found", list->word->word);

	  any_found += found;
	  list = list->next;
	}
      return (any_found ? EXECUTION_SUCCESS : EXECUTION_FAILURE);
    }

  begin_unwind_frame ("command_builtin");

  /* We don't want this to be reparsed (consider command echo 'foo &'), so
     just make a simple_command structure and call execute_command with it. */
  {
    COMMAND *command;

    if (use_standard_path)
      {
	char *standard_path;

	old_path = get_string_value ("PATH");
	if (old_path)
	  old_path = savestring (old_path);
	else
	  old_path = savestring ("");
	add_unwind_protect ((Function *)restore_path, old_path);

	standard_path = get_standard_path ();
	bind_variable ("PATH", standard_path);
	free (standard_path);
      }
    command = make_bare_simple_command ();
    command->value.Simple->words = (WORD_LIST *)copy_word_list (list);
    command->value.Simple->redirects = (REDIRECT *)NULL;
    command->flags |= (CMD_NO_FUNCTIONS | CMD_INHIBIT_EXPANSION);
    command->value.Simple->flags |= (CMD_NO_FUNCTIONS | CMD_INHIBIT_EXPANSION);
    /* If we're in a subshell, see if we can get away without forking
       again, since we've already forked to run this builtin. */
    if (subshell_environment)
      {
	command->flags |= CMD_NO_FORK;
	command->value.Simple->flags |= CMD_NO_FORK;
      }
    add_unwind_protect ((char *)dispose_command, command);
    result = execute_command (command);
  }

  run_unwind_frame ("command_builtin");

  return (result);
}

/* Restore the value of the $PATH variable after replacing it when
   executing `command -p'. */
static void
restore_path (var)
     char *var;
{
  bind_variable ("PATH", var);
  free (var);
}

/* Return a value for PATH that is guaranteed to find all of the standard
   utilities.  This uses Posix.2 configuration variables, if present.  It
   uses a value defined in config.h as a last resort. */
static char *
get_standard_path ()
{
#if defined (_CS_PATH) && !defined (hpux_7) && !defined (NetBSD)
  char *p;
  size_t len;

  len = (size_t)confstr (_CS_PATH, (char *)NULL, (size_t)0);
  p = xmalloc ((int)len + 2);
  *p = '\0';
  confstr (_CS_PATH, p, len);
  return (p);
#else /* !_CSPATH || hpux_7 || NetBSD */
#  if defined (CS_PATH)
  return (savestring (CS_PATH));
#  else
  return (savestring (STANDARD_UTILS_PATH));
#  endif /* !CS_PATH */
#endif /* !_CS_PATH || hpux_7 */
}
