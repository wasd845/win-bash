/* test.c, created from test.def. */
#line 23 "./test.def"

#line 86 "./test.def"

#line 95 "./test.def"

#if defined (HAVE_STRING_H)
#  include <string.h>
#else /* !HAVE_STRING_H */
#  include <strings.h>
#endif /* !HAVE_STRING_H */

#include "../shell.h"
extern char *this_command_name;

/* TEST/[ builtin. */
int
test_builtin (list)
     WORD_LIST *list;
{
  char **argv;
  int argc, result;
  WORD_LIST *t = list;

  /* We let Matthew Bradburn and Kevin Braunsdorf's code do the
     actual test command.  So turn the list of args into an array
     of strings, since that is what his code wants. */
  if (!list)
    {
      if (this_command_name[0] == '[' && !this_command_name[1])
	builtin_error ("missing `]'");

      return (EXECUTION_FAILURE);
    }

  /* Get the length of the argument list. */
  for (argc = 0; t; t = t->next, argc++);

  /* Account for argv[0] being a command name.  This makes our life easier. */
  argc++;
  argv = (char **)xmalloc ((1 + argc) * sizeof (char *));
  argv[argc] = (char *)NULL;

  /* this_command_name is the name of the command that invoked this
     function.  So you can't call test_builtin () directly from
     within this code, there are too many things to worry about. */
  argv[0] = savestring (this_command_name);

  for (t = list, argc = 1; t; t = t->next, argc++)
    argv[argc] = savestring (t->word->word);

  result = test_command (argc, argv);
  free_array (argv);
  return (result);
}
