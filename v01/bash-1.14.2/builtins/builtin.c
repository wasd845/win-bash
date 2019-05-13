/* builtin.c, created from builtin.def. */
#line 23 "./builtin.def"

#line 31 "./builtin.def"

#include "../shell.h"

#include "common.h"

extern char *this_command_name;

/* Run the command mentioned in list directly, without going through the
   normal alias/function/builtin/filename lookup process. */
builtin_builtin (list)
     WORD_LIST *list;
{
  Function *function;
  register char *command;

  if (!list)
    return (EXECUTION_SUCCESS);

  command = (list->word->word);
#if defined (DISABLED_BUILTINS)
  function = builtin_address (command);
#else /* !DISABLED_BUILTINS */
  function = find_shell_builtin (command);
#endif /* !DISABLED_BUILTINS */

  if (!function)
    {
      builtin_error ("%s: not a shell builtin", command);
      return (EXECUTION_FAILURE);
    }
  else
    {
      this_command_name = command;
      list = list->next;
      return ((*function) (list));
    }
}
