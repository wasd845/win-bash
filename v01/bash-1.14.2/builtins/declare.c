/* declare.c, created from declare.def. */
#line 23 "./declare.def"

#line 43 "./declare.def"

#line 49 "./declare.def"

#include <stdio.h>

#if defined (HAVE_STRING_H)
#  include <string.h>
#else /* !HAVE_STRING_H */
#  include <strings.h>
#endif /* !HAVE_STRING_H */

#include "../shell.h"

extern int variable_context, array_needs_making;

static int declare_internal ();

/* Declare or change variable attributes. */
int
declare_builtin (list)
     register WORD_LIST *list;
{
  return (declare_internal (list, 0));
}

#line 79 "./declare.def"
int
local_builtin (list)
     register WORD_LIST *list;
{
  if (variable_context)
    return (declare_internal (list, 1));
  else
    {
      builtin_error ("Can only be used in a function");
      return (EXECUTION_FAILURE);
    }
}

/* The workhorse function. */
static int
declare_internal (list, local_var)
     register WORD_LIST *list;
     int local_var;
{
  int flags_on = 0, flags_off = 0;
  int any_failed = 0;

  while (list)
    {
      register char *t = list->word->word;
      int *flags;

      if (t[0] == '-' && t[1] == '-' && t[2] == '\0')
	{
	  list = list->next;
	  break;
	}

      if (*t != '+' && *t != '-')
	break;

      if (*t == '+')
	flags = &flags_off;
      else
	flags = &flags_on;

      t++;

      while (*t)
	{
	  if (*t == 'f')
	    *flags |= att_function, t++;
	  else if (*t == 'x')
	    *flags |= att_exported, t++, array_needs_making = 1;
	  else if (*t == 'r')
	    *flags |= att_readonly, t++;
	  else if (*t == 'i')
	    *flags |= att_integer, t++;
	  else
	    {
	      builtin_error ("unknown option: `-%c'", *t);
	      return (EX_USAGE);
	    }
	}

      list = list->next;
    }

  /* If there are no more arguments left, then we just want to show
     some variables. */
  if (!list)
    {
      /* Show local variables defined at this context level if this is
	 the `local' builtin. */
      if (local_var)
	{
	  register SHELL_VAR **vlist;
	  register int i;

	  vlist = map_over (variable_in_context, shell_variables);

	  if (vlist)
	    {
	      for (i = 0; vlist[i]; i++)
		print_assignment (vlist[i]);

	      free (vlist);
	    }
	}
      else
	{
	  if (!flags_on)
	    set_builtin ((WORD_LIST *)NULL);
	  else
	    set_or_show_attributes ((WORD_LIST *)NULL, flags_on);
	}

      fflush (stdout);
      return (EXECUTION_SUCCESS);
    }

#define NEXT_VARIABLE() free (name); list = list->next; continue

  /* There are arguments left, so we are making variables. */
  while (list)
    {
      char *value, *name = savestring (list->word->word);
      int offset = assignment (name);

      if (offset)
	{
	  name[offset] = '\0';
	  value = name + offset + 1;
	}
      else
	value = "";

      if (legal_identifier (name) == 0)
	{
	  builtin_error ("%s: not a legal variable name", name);
	  any_failed++;
	  NEXT_VARIABLE ();
	}

      /* If VARIABLE_CONTEXT has a non-zero value, then we are executing
	 inside of a function.  This means we should make local variables,
	 not global ones. */

      if (variable_context)
	make_local_variable (name);

      /* If we are declaring a function, then complain about it in some way.
	 We don't let people make functions by saying `typeset -f foo=bar'. */

      /* There should be a way, however, to let people look at a particular
	 function definition by saying `typeset -f foo'. */

      if (flags_on & att_function)
	{
	  if (offset)
	    {
	      builtin_error ("Can't use `-f' to make functions");
	      return (EXECUTION_FAILURE);
	    }
	  else
	    {
	      SHELL_VAR *find_function (), *funvar;
	      funvar = find_function (name);

	      if (funvar)
		{
		  char *result = named_function_string
		    (name, (COMMAND *)function_cell (funvar), 1);
		  printf ("%s\n", result);
		}
	      else
		any_failed++;
	      NEXT_VARIABLE ();
	    }
	}
      else
	{
	  SHELL_VAR *var;

	  var = find_variable (name);

	  if (!var)
	    var = bind_variable (name, "");

	  /* We are not allowed to rebind readonly variables that
	     already are readonly unless we are turning off the
	     readonly bit. */
	  if (flags_off & att_readonly)
	    flags_on &= ~att_readonly;

	  if (value && readonly_p (var) && (!(flags_off & att_readonly)))
	    {
	      builtin_error ("%s: readonly variable", name);
	      any_failed++;
	      NEXT_VARIABLE ();
	    }

	  var->attributes |= flags_on;
	  var->attributes &= ~flags_off;

	  if (offset)
	    {
	      free (var->value);
	      if (integer_p (var))
		{
		  long val, evalexp ();
		  char *itos ();

		  val = evalexp (value);
		  var->value = itos ((int)val);
		}
	      else
		var->value = savestring (value);
	    }
	}

      stupidly_hack_special_variables (name);

      NEXT_VARIABLE ();
    }
  return (any_failed ? EXECUTION_FAILURE : EXECUTION_SUCCESS);
}
