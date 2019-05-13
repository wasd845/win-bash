/* set.c, created from set.def. */
#line 23 "./set.def"

#include <stdio.h>
#include "../shell.h"
#include "../flags.h"

#include "bashgetopt.h"

extern int interactive;
extern int noclobber, no_brace_expansion, posixly_correct;
#if defined (READLINE)
extern int rl_editing_mode, no_line_editing;
#endif /* READLINE */

#define USAGE_STRING "set [--abefhknotuvxldHCP] [-o option] [arg ...]"

#line 110 "./set.def"

/* An a-list used to match long options for set -o to the corresponding
   option letter. */
struct {
  char *name;
  int letter;
} o_options[] = {
  { "allexport",  'a' },
  { "errexit",	  'e' },
  { "histexpand", 'H' },
  { "monitor",	  'm' },
  { "noexec",	  'n' },
  { "noglob",	  'f' },
  { "nohash",	  'd' },
#if defined (JOB_CONTROL)
  { "notify",	  'b' },
#endif /* JOB_CONTROL */
  {"nounset",	  'u' },
  {"physical",    'P' },
  {"privileged",  'p' },
  {"verbose",	  'v' },
  {"xtrace",	  'x' },
  {(char *)NULL, 0},
};

#define MINUS_O_FORMAT "%-15s\t%s\n"

void
list_minus_o_opts ()
{
  register int	i;
  char *on = "on", *off = "off";

  printf (MINUS_O_FORMAT, "braceexpand", (no_brace_expansion == 0) ? on : off);
  printf (MINUS_O_FORMAT, "noclobber", (noclobber == 1) ? on : off);

  if (find_variable ("ignoreeof") || find_variable ("IGNOREEOF"))
    printf (MINUS_O_FORMAT, "ignoreeof", on);
  else
    printf (MINUS_O_FORMAT, "ignoreeof", off);

  printf (MINUS_O_FORMAT, "interactive-comments",
	  interactive_comments ? on : off);

  printf (MINUS_O_FORMAT, "posix", posixly_correct ? on : off);

#if defined (READLINE)
  if (no_line_editing)
    {
      printf (MINUS_O_FORMAT, "emacs", off);
      printf (MINUS_O_FORMAT, "vi", off);
    }
  else
    {
      /* Magic.  This code `knows' how readline handles rl_editing_mode. */
      printf (MINUS_O_FORMAT, "emacs", (rl_editing_mode == 1) ? on : off);
      printf (MINUS_O_FORMAT, "vi", (rl_editing_mode == 0) ? on : off);
    }
#endif /* READLINE */

  for (i = 0; o_options[i].name; i++)
    {
      int *on_or_off, zero = 0;

      on_or_off = find_flag (o_options[i].letter);
      if (on_or_off == FLAG_UNKNOWN)
	on_or_off = &zero;
      printf (MINUS_O_FORMAT, o_options[i].name, (*on_or_off == 1) ? on : off);
    }
}

set_minus_o_option (on_or_off, option_name)
     int on_or_off;
     char *option_name;
{
  int option_char = -1;

  if (STREQ (option_name, "braceexpand"))
    {
      if (on_or_off == FLAG_ON)
	no_brace_expansion = 0;
      else
	no_brace_expansion = 1;
    }
  else if (STREQ (option_name, "noclobber"))
    {
      if (on_or_off == FLAG_ON)
	bind_variable ("noclobber", "");
      else
	unbind_variable ("noclobber");
      stupidly_hack_special_variables ("noclobber");
    }
  else if (STREQ (option_name, "ignoreeof"))
    {
      unbind_variable ("ignoreeof");
      unbind_variable ("IGNOREEOF");
      if (on_or_off == FLAG_ON)
	bind_variable ("IGNOREEOF", "10");
      stupidly_hack_special_variables ("IGNOREEOF");
    }
  
#if defined (READLINE)
  else if ((STREQ (option_name, "emacs")) || (STREQ (option_name, "vi")))
    {
      if (on_or_off == FLAG_ON)
	{
	  rl_variable_bind ("editing-mode", option_name);

	  if (interactive)
	    with_input_from_stdin ();
	  no_line_editing = 0;
	}
      else
	{
	  int isemacs = (rl_editing_mode == 1);
	  if ((isemacs && STREQ (option_name, "emacs")) ||
	      (!isemacs && STREQ (option_name, "vi")))
	    {
	      if (interactive)
		with_input_from_stream (stdin, "stdin");
	      no_line_editing = 1;
	    }
	  else
	    builtin_error ("not in %s editing mode", option_name);
	}
    }
#endif /* READLINE */
  else if (STREQ (option_name, "interactive-comments"))
    interactive_comments = (on_or_off == FLAG_ON);
  else if (STREQ (option_name, "posix"))
    {
      posixly_correct = (on_or_off == FLAG_ON);
      unbind_variable ("POSIXLY_CORRECT");
      unbind_variable ("POSIX_PEDANTIC");
      if (on_or_off == FLAG_ON)
	{
	  bind_variable ("POSIXLY_CORRECT", "");
	  stupidly_hack_special_variables ("POSIXLY_CORRECT");
	}
    }
  else
    {
      register int i;
      for (i = 0; o_options[i].name; i++)
	{
	  if (STREQ (option_name, o_options[i].name))
	    {
	      option_char = o_options[i].letter;
	      break;
	    }
	}
      if (option_char == -1)
	{
	  builtin_error ("%s: unknown option name", option_name);
	  return (EXECUTION_FAILURE);
	}
      if (change_flag (option_char, on_or_off) == FLAG_ERROR)
	{
	  bad_option (option_name);
	  return (EXECUTION_FAILURE);
	}
    }
  return (EXECUTION_SUCCESS);
}

/* Set some flags from the word values in the input list.  If LIST is empty,
   then print out the values of the variables instead.  If LIST contains
   non-flags, then set $1 - $9 to the successive words of LIST. */
set_builtin (list)
     WORD_LIST *list;
{
  int on_or_off, flag_name, force_assignment = 0;

  if (!list)
    {
      SHELL_VAR **vars;

      vars = all_shell_variables ();
      if (vars)
	{
	  print_var_list (vars);
	  free (vars);
	}

      vars = all_shell_functions ();
      if (vars)
	{
	  print_var_list (vars);
	  free (vars);
	}

      return (EXECUTION_SUCCESS);
    }

  /* Check validity of flag arguments. */
  if (*list->word->word == '-' || *list->word->word == '+')
    {
      register char *arg;
      WORD_LIST *save_list = list;

      while (list && (arg = list->word->word))
	{
	  char c;

	  if (arg[0] != '-' && arg[0] != '+')
	    break;

	  /* `-' or `--' signifies end of flag arguments. */
	  if (arg[0] == '-' &&
	      (!arg[1] || (arg[1] == '-' && !arg[2])))
	    break;

	  while (c = *++arg)
	    {
	      if (find_flag (c) == FLAG_UNKNOWN && c != 'o')
		{
		  char s[2];
		  s[0] = c; s[1] = '\0';
		  bad_option (s);
		  if (c == '?')
		    printf ("usage: %s\n", USAGE_STRING);
		  return (c == '?' ? EXECUTION_SUCCESS : EXECUTION_FAILURE);
		}
	    }
	  list = list->next;
	}
      list = save_list;
    }

  /* Do the set command.  While the list consists of words starting with
     '-' or '+' treat them as flags, otherwise, start assigning them to
     $1 ... $n. */
  while (list)
    {
      char *string = list->word->word;

      /* If the argument is `--' or `-' then signal the end of the list
	 and remember the remaining arguments. */
      if (string[0] == '-' && (!string[1] || (string[1] == '-' && !string[2])))
	{
	  list = list->next;

	  /* `set --' unsets the positional parameters. */
	  if (string[1] == '-')
	    force_assignment = 1;

	  /* Until told differently, the old shell behaviour of
	     `set - [arg ...]' being equivalent to `set +xv [arg ...]'
	     stands.  Posix.2 says the behaviour is marked as obsolescent. */
	  else
	    {
	      change_flag ('x', '+');
	      change_flag ('v', '+');
	    }

	  break;
	}

      if ((on_or_off = *string) &&
	  (on_or_off == '-' || on_or_off == '+'))
	{
	  int i = 1;
	  while (flag_name = string[i++])
	    {
	      if (flag_name == '?')
		{
		  printf ("usage: %s\n", USAGE_STRING);
		  return (EXECUTION_SUCCESS);
		}
	      else if (flag_name == 'o') /* -+o option-name */
		{
		  char *option_name;
		  WORD_LIST *opt;

		  opt = list->next;

		  if (!opt)
		    {
		      list_minus_o_opts ();
		      continue;
		    }

		  option_name = opt->word->word;

		  if (!option_name || !*option_name || (*option_name == '-'))
		    {
		      list_minus_o_opts ();
		      continue;
		    }
		  list = list->next; /* Skip over option name. */

		  if (set_minus_o_option (on_or_off, option_name) != EXECUTION_SUCCESS)
		    return (EXECUTION_FAILURE);
		}
	      else
		{
		  if (change_flag (flag_name, on_or_off) == FLAG_ERROR)
		    {
		      char opt[3];
		      opt[0] = on_or_off;
		      opt[1] = flag_name;
		      opt[2] = '\0';
		      bad_option (opt);
		      return (EXECUTION_FAILURE);
		    }
		}
	    }
	}
      else
	{
	  break;
	}
      list = list->next;
    }

  /* Assigning $1 ... $n */
  if (list || force_assignment)
    remember_args (list, 1);
  return (EXECUTION_SUCCESS);
}

#line 441 "./set.def"

unset_builtin (list)
  WORD_LIST *list;
{
  int unset_function = 0, unset_variable = 0, opt;
  int any_failed = 0;
  char *name;

  reset_internal_getopt ();
  while ((opt = internal_getopt (list, "fv")) != -1)
    {
      switch (opt)
	{
	case 'f':
	  unset_function = 1;
	  break;
	case 'v':
	  unset_variable = 1;
	  break;
	default:
	  return (EXECUTION_FAILURE);
	}
    }

  list = loptend;

  if (unset_function && unset_variable)
    {
      builtin_error ("cannot simultaneously unset a function and a variable");
      return (EXECUTION_FAILURE);
    }

  while (list)
    {
      name = list->word->word;

      if (!unset_function &&
	  find_name_in_list (name, non_unsettable_vars) > -1)
	{
	  builtin_error ("%s: cannot unset", name);
	  any_failed++;
	}
      else
	{
	  SHELL_VAR *var;
	  int tem;

	  var = unset_function ? find_function (name) : find_variable (name);

	  /* Posix.2 says that unsetting readonly variables is an error. */
	  if (var && readonly_p (var))
	    {
	      builtin_error ("%s: cannot unset: readonly %s",
			     name, unset_function ? "function" : "variable");
	      any_failed++;
	      list = list->next;
	      continue;
	    }

	  /* Unless the -f option is supplied, the name refers to a
	     variable. */
	  tem = makunbound
	    (name, unset_function ? shell_functions : shell_variables);

	  /* This is what Posix.2 draft 11+ says.  ``If neither -f nor -v
	     is specified, the name refers to a variable; if a variable by
	     that name does not exist, a function by that name, if any,
	     shall be unset.'' */
	  if ((tem == -1) && !unset_function && !unset_variable)
	    tem = makunbound (name, shell_functions);

	  if (tem == -1)
	    any_failed++;
	  else if (!unset_function)
	    stupidly_hack_special_variables (name);
	}
      list = list->next;
    }

  if (any_failed)
    return (EXECUTION_FAILURE);
  else
    return (EXECUTION_SUCCESS);
}
