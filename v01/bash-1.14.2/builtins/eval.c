/* eval.c, created from eval.def. */
#line 23 "./eval.def"

#line 29 "./eval.def"

#include "../shell.h"

/* Parse the string that these words make, and execute the command found. */
int
eval_builtin (list)
     WORD_LIST *list;
{
  int result;

  /* Note that parse_and_execute () frees the string it is passed. */
  if (list)
    result = parse_and_execute (string_list (list), "eval", -1);
  else
    result = EXECUTION_SUCCESS;
  return (result);
}
