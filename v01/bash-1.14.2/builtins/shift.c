/* shift.c, created from shift.def. */
#line 23 "./shift.def"

#if defined (HAVE_STRING_H)
#  include <string.h>
#else /* !HAVE_STRING_H */
#  include <strings.h>
#endif /* !HAVE_STRING_H */

#include "../shell.h"

#line 38 "./shift.def"

/* Shift the arguments ``left''.  Shift DOLLAR_VARS down then take one
   off of REST_OF_ARGS and place it into DOLLAR_VARS[9].  If LIST has
   anything in it, it is a number which says where to start the
   shifting.  Return > 0 if `times' > $#, otherwise 0. */
int
shift_builtin (list)
     WORD_LIST *list;
{
  int times = get_numeric_arg (list);
  int number, r;
  WORD_LIST *args;

  if (!times)
    return (EXECUTION_SUCCESS);

  if (times < 0)
    {
      builtin_error ("shift count must be >= 0");
      return (EXECUTION_FAILURE);
    }

  args = list_rest_of_args ();
  number = list_length (args);
  dispose_words (args);

  r = EXECUTION_SUCCESS;

  if (times > number)
    {
      times = number;
      r = EXECUTION_FAILURE;
    }

  while (times-- > 0)
    {
      register int count;

      if (dollar_vars[1])
	free (dollar_vars[1]);

      for (count = 1; count < 9; count++)
	dollar_vars[count] = dollar_vars[count + 1];

      if (rest_of_args)
	{
	  WORD_LIST *temp = rest_of_args;

	  dollar_vars[9] = savestring (temp->word->word);
	  rest_of_args = rest_of_args->next;
	  temp->next = (WORD_LIST *)NULL;
	  dispose_words (temp);
	}
      else
	dollar_vars[9] = (char *)NULL;
    }
  return (r);
}
