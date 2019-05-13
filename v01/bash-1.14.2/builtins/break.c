/* break.c, created from break.def. */
#line 23 "./break.def"

#line 30 "./break.def"

#include "../shell.h"

extern char *this_command_name;

static int check_loop_level ();

/* The depth of while's and until's. */
int loop_level = 0;

/* Non-zero when a "break" instruction is encountered. */
int breaking = 0;

/* Non-zero when we have encountered a continue instruction. */
int continuing = 0;

/* Set up to break x levels, where x defaults to 1, but can be specified
   as the first argument. */
break_builtin (list)
     WORD_LIST *list;
{
  int newbreak;

  if (!check_loop_level ())
    return (EXECUTION_FAILURE);

  newbreak = get_numeric_arg (list);

  if (newbreak <= 0)
    return (EXECUTION_FAILURE);

  if (newbreak > loop_level)
    newbreak = loop_level;

  breaking = newbreak;

  return (EXECUTION_SUCCESS);
}

#line 75 "./break.def"

/* Set up to continue x levels, where x defaults to 1, but can be specified
   as the first argument. */
continue_builtin (list)
     WORD_LIST *list;
{
  int newcont;

  if (!check_loop_level ())
    return (EXECUTION_FAILURE);

  newcont = get_numeric_arg (list);

  if (newcont <= 0)
    return (EXECUTION_FAILURE);

  if (newcont > loop_level)
    newcont = loop_level;

  continuing = newcont;

  return (EXECUTION_SUCCESS);
}

/* Return non-zero if a break or continue command would be okay.
   Print an error message if break or continue is meaningless here. */
static int
check_loop_level ()
{
#if defined (BREAK_COMPLAINS)
  if (!loop_level)
    builtin_error ("Only meaningful in a `for', `while', or `until' loop");
#endif /* BREAK_COMPLAINS */

  return (loop_level);
}
