/* return.c, created from return.def. */


#include "../shell.h"

extern int last_command_exit_value;
extern int return_catch_flag, return_catch_value;
extern jmp_buf return_catch;

/* If we are executing a user-defined function then exit with the value
   specified as an argument.  if no argument is given, then the last
   exit status is used. */
int
return_builtin (list)
     WORD_LIST *list;
{
  return_catch_value = get_numeric_arg (list);

  if (!list)
    return_catch_value = last_command_exit_value;

  if (return_catch_flag)
    LONGJMP (return_catch, 1);
  else
    {
      builtin_error ("Can only `return' from a function");
      return (EXECUTION_FAILURE);
    }
  return(0);
}
