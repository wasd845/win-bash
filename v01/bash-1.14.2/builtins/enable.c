/* enable.c, created from enable.def. */
#line 23 "./enable.def"

#line 33 "./enable.def"

#include "../shell.h"
#include "../builtins.h"
#include "common.h"

#define ENABLED  1
#define DISABLED 2

static int enable_shell_command ();
static void list_some_builtins ();

/* Enable/disable shell commands present in LIST.  If list is not specified,
   then print out a list of shell commands showing which are enabled and
   which are disabled. */
enable_builtin (list)
     WORD_LIST *list;
{
  int result = 0, any_failed = 0;
  int disable_p, all_p;

  disable_p = all_p = 0;

  while (list && list->word->word && list->word->word[0] == '-')
    {
      char *arg = list->word->word;

      list = list->next;

      if (ISOPTION (arg, 'n'))
	disable_p = 1;
      else if (arg[1] == 'a' && (arg[2] == 0 || strcmp (arg + 2, "ll") == 0))
	all_p = 1;
      else if (ISOPTION (arg, '-'))
        break;
      else
	{
	  bad_option (arg);
	  return (EXECUTION_FAILURE);
	}
    }

  if (!list)
    {
      int filter;

      if (all_p)
	filter = ENABLED | DISABLED;
      else if (disable_p)
	filter = DISABLED;
      else
	filter = ENABLED;

      list_some_builtins (filter);
    }
  else
    {
      while (list)
	{
	  result = enable_shell_command (list->word->word, disable_p);

	  if (!result)
	    {
	      builtin_error ("%s: not a shell builtin", list->word->word);
	      any_failed++;
	    }
	  list = list->next;
	}
    }
  return (any_failed ? EXECUTION_FAILURE : EXECUTION_SUCCESS);
}

/* List some builtins.
   FILTER is a mask with two slots: ENABLED and DISABLED. */
static void
list_some_builtins (filter)
     int filter;
{
  register int i;

  for (i = 0; i < num_shell_builtins; i++)
    {
      if (!shell_builtins[i].function)
	continue;

      if ((filter & ENABLED) &&
	  (shell_builtins[i].flags & BUILTIN_ENABLED))
	{
	  printf ("enable %s\n", shell_builtins[i].name);
	}
      else if ((filter & DISABLED) &&
	       ((shell_builtins[i].flags & BUILTIN_ENABLED) == 0))
	{
	  printf ("enable -n %s\n", shell_builtins[i].name);
	}
    }
}

/* Enable the shell command NAME.  If DISABLE_P is non-zero, then
   disable NAME instead. */
static int
enable_shell_command (name, disable_p)
     char *name;
     int disable_p;
{
  register int i;
  int found = 0;

  for (i = 0; i < num_shell_builtins; i++)
    {
      if (!shell_builtins[i].function)
	continue;

      if (STREQ (name, shell_builtins[i].name))
	{
	  found++;

	  if (disable_p)
	    shell_builtins[i].flags &= ~BUILTIN_ENABLED;
	  else
	    shell_builtins[i].flags |= BUILTIN_ENABLED;
	}
    }
  return (found);
}
