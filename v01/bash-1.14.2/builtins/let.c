/* let.c, created from let.def. */
#line 52 "./let.def"

#include "../shell.h"

/* Arithmetic LET function. */
let_builtin (list)
     WORD_LIST *list;
{
  long ret = 0L;

  if (!list)
    {
      builtin_error ("argument (expression) expected");
      return (EXECUTION_FAILURE);
    }

  while (list)
    {
      ret = evalexp (list->word->word);
      list = list->next;
    }

  if (ret == 0L)
    return (EXECUTION_FAILURE);
  else
    return (EXECUTION_SUCCESS);
}
