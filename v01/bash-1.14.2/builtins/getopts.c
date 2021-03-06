/* getopts.c, created from getopts.def. */
#line 23 "./getopts.def"

#line 59 "./getopts.def"

#include <stdio.h>

#if defined (HAVE_STRING_H)
#  include <string.h>
#else /* !HAVE_STRING_H */
#  include <strings.h>
#endif /* !HAVE_STRING_H */

#include "../shell.h"

#if defined (GETOPTS_BUILTIN)
#include "getopt.h"

#define G_EOF		(-1)
#define G_ILLEGAL_OPT	(-2)
#define G_ARG_MISSING	(-3)

/* getopt.c is not compiled if __GNU_LIBRARY__ is defined, so this
   function will come up as undefined.  More's the pity; the default
   behavior of the GNU getopt() is not Posix.2 compliant. */
#if defined (__GNU_LIBRARY__) || defined(__NT_VC__)
#  define getopt_set_posix_option_order(x)
#endif

extern char *this_command_name;
extern WORD_LIST *rest_of_args;

/* getopts_reset is magic code for when OPTIND is reset.  N is the
   value that has just been assigned to OPTIND. */
void
getopts_reset (newind)
     int newind;
{
  optind = newind;
}

/* Error handling is now performed as specified by Posix.2, draft 11
   (identical to that of ksh-88).  The special handling is enabled if
   the first character of the option string is a colon; this handling
   disables diagnostic messages concerning missing option arguments
   and illegal option characters.  The handling is as follows.

   ILLEGAL OPTIONS:
        name -> "?"
        if (special_error) then
                OPTARG = option character found
                no error output
        else
                OPTARG unset
                diagnostic message
        fi
 
  MISSING OPTION ARGUMENT;
        if (special_error) then
                name -> ":"
                OPTARG = option character found
        else
                name -> "?"
                OPTARG unset
                diagnostic message
        fi
 */

static int
dogetopts (argc, argv)
     int argc;
     char **argv;
{
  int ret, special_error, old_opterr = 0, i, n;
  char strval[2], numval[16];
  char *optstr;			/* list of options */
  char *name;			/* variable to get flag val */
  char *t;

  if (argc < 3)
    {
      builtin_error("usage: getopts optstring name [arg]");
      return (EX_USAGE);
    }

  /* argv[0] is "getopts". */

  optstr = argv[1];
  name = argv[2];
  argc -= 2;
  argv += 2;

  special_error = optstr[0] == ':';

  if (special_error)
    {
      old_opterr = opterr;
      optstr++;
      opterr = 0;		/* suppress diagnostic messages */
    }

  if (argc > 1)
    {
      t = argv[0];
      argv[0] = dollar_vars[0];
      ret = getopt (argc, argv, optstr);
      argv[0] = t;
    }
  else if (rest_of_args == (WORD_LIST *)NULL)
    {
      register int i;

      for (i = 0; dollar_vars[i]; i++);
      ret = getopt (i, dollar_vars, optstr);
    }
  else
    {
      register int i;
      register WORD_LIST *words;
      char **v;

      for (i = 0; dollar_vars[i]; i++);
      for (words = rest_of_args; words; words = words->next, i++);
      v = (char **)xmalloc ((i + 1) * sizeof (char *));
      for (i = 0; dollar_vars[i]; i++)
        v[i] = dollar_vars[i];
      for (words = rest_of_args; words; words = words->next, i++)
        v[i] = words->word->word;
      v[i] = (char *)NULL;
      ret = getopt (i, v, optstr);
      free (v);
    }

  if (special_error)
    opterr = old_opterr;

  /* Set the OPTIND variable in any case, to handle "--" skipping. */
  if (optind < 10)
    {
      numval[14] = optind + '0';
      numval[15] = '\0';
      i = 14;
    }
  else
    {
      numval[i = 15] = '\0';
      n = optind;
      do
	{
	  numval[--i] = (n % 10) + '0';
	}
      while (n /= 10);
    }
  bind_variable ("OPTIND", numval + i);

  /* If an error occurred, decide which one it is and set the return
     code appropriately.  In all cases, the option character in error
     is in OPTOPT.  If an illegal option was encountered, OPTARG is
     NULL.  If a required option argument was missing, OPTARG points
     to a NULL string (that is, optarg[0] == 0). */
  if (ret == '?')
    {
      if (optarg == NULL)
	ret = G_ILLEGAL_OPT;
      else if (optarg[0] == '\0')
	ret = G_ARG_MISSING;
    }
	    
  if (ret == G_EOF)
    {
      bind_variable (name, "?");
      return (EXECUTION_FAILURE);
    }

  if (ret == G_ILLEGAL_OPT)
    {
      /* Illegal option encountered. */
      strval[0] = '?';
      strval[1] = '\0';
      bind_variable (name, strval);

      if (special_error)
	{
	  strval[0] = (char) optopt;
	  strval[1] = '\0';
	  bind_variable ("OPTARG", strval);
	}
      else
	makunbound ("OPTARG", shell_variables);
      return (EXECUTION_SUCCESS);
    }

  if (ret == G_ARG_MISSING)
    {
      /* Required argument missing. */
      if (special_error)
	{
	  strval[0] = ':';
	  strval[1] = '\0';
	  bind_variable (name, strval);

	  strval[0] = (char) optopt;
	  strval[1] = '\0';
	  bind_variable ("OPTARG", strval);
	}
      else
	{
	  strval[0] = '?';
	  strval[1] = '\0';
	  bind_variable (name, strval);
	  makunbound ("OPTARG", shell_variables);
	}
      return (EXECUTION_SUCCESS);
    }			

  bind_variable ("OPTARG", optarg);

  strval[0] = (char) ret;
  strval[1] = '\0';
  bind_variable (name, strval);

  return (EXECUTION_SUCCESS);
}

/* The getopts builtin.  Build an argv, and call dogetopts with it. */
int
getopts_builtin (list)
     WORD_LIST *list;
{
  register int	i;
  char **av;
  int ac, ret;
  WORD_LIST *t = list;
  static int order_set = 0;

  if (!list)
    return EXECUTION_FAILURE;

  for (ac = 0; t; t = t->next, ac++);

  ac++;
  av = (char **)xmalloc ((1 + ac) * sizeof (char *));
  av[ac] = (char *) NULL;
  av[0] = savestring (this_command_name);

  for (t = list, i = 1; t; t = t->next, i++)
    av[i] = savestring (t->word->word);

  if (order_set == 0)
    {
      getopt_set_posix_option_order (1);
      order_set++;
    }

  ret = dogetopts (ac, av);
  free_array (av);
  return (ret);
}
#endif /* GETOPTS_BUILTIN */
