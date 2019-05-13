/* bind.c, created from bind.def. */
#line 23 "./bind.def"

#line 43 "./bind.def"

#include <stdio.h>
#include "../shell.h"
#if defined (READLINE)
#include <errno.h>
#if !defined (errno)
extern int errno;
#endif /* !errno */
#include <readline/readline.h>
#include <readline/history.h>
#include "bashgetopt.h"

static int query_bindings ();

extern int bash_readline_initialized;
extern int no_line_editing;

#define BIND_RETURN(x)  do { return_code = x; goto bind_exit; } while (0)

#define USAGE "usage: bind [-lvd] [-m keymap] [-f filename] [-q name] [keyseq:readline_func]"

int
bind_builtin (list)
     WORD_LIST *list;
{
  int return_code = EXECUTION_SUCCESS;
  FILE *old_rl_outstream;
  Keymap kmap, saved_keymap;
  int lflag, dflag, fflag, vflag, qflag, mflag, opt;
  char *initfile, *map_name, *fun_name;

  if (no_line_editing)
    return (EXECUTION_FAILURE);

  kmap = saved_keymap = (Keymap) NULL;
  lflag = dflag = vflag = fflag = qflag = mflag = 0;
  initfile = map_name = fun_name = (char *)NULL;

  if (!bash_readline_initialized)
    initialize_readline ();

  /* Cannot use unwind_protect_pointer () on "FILE *", it is only
     guaranteed to work for strings. */
  /* XXX -- see if we can use unwind_protect here */
  old_rl_outstream = rl_outstream;
  rl_outstream = stdout;

  reset_internal_getopt ();  
  while ((opt = internal_getopt (list, "lvdf:q:m:")) != EOF)
    {
      switch (opt)
	{
	case 'l':
	  lflag++;
	  break;

	case 'v':
	  vflag++;
	  break;

	case 'd':
	  dflag++;
	  break;

	case 'f':
	  fflag++;
	  initfile = list_optarg;
	  break;

	case 'm':
	  mflag++;
	  map_name = list_optarg;
	  break;

	case 'q':
	  qflag++;
	  fun_name = list_optarg;
	  break;

	default:
	  builtin_error (USAGE);
	  BIND_RETURN (EX_USAGE);
	}
    }

  list = loptend;

  /* First, see if we need to install a special keymap for this
     command.  Then start on the arguments. */

  if (mflag && map_name)
    {
      kmap = rl_get_keymap_by_name (map_name);
      if (!kmap)
        {
          builtin_error ("`%s': illegal keymap name", map_name);
	  BIND_RETURN (EXECUTION_FAILURE);
        }
    }

  if (kmap)
    {
      saved_keymap = rl_get_keymap ();
      rl_set_keymap (kmap);
    }

  /* XXX - we need to add exclusive use tests here.  It doesn't make sense
     to use some of these options together. */
  /* Now hack the option arguments */
  if (lflag)
    rl_list_funmap_names (0);

  if (vflag)
    rl_function_dumper (0);

  if (dflag)
    rl_function_dumper (1);

  if (fflag && initfile)
    {
      if (rl_read_init_file (initfile) != 0)
	{
	  builtin_error ("cannot read %s: %s\n", initfile, strerror (errno));
	  BIND_RETURN (EXECUTION_FAILURE);
	}
    }

  if (qflag && fun_name)
    return_code = query_bindings (fun_name);

  /* Process the rest of the arguments as binding specifications. */
  while (list)
    {
      rl_parse_and_bind (list->word->word);
      list = list->next;
    }

  if (saved_keymap)
    rl_set_keymap (saved_keymap);

 bind_exit:
  rl_outstream = old_rl_outstream;
  return (return_code);
}

static int
query_bindings (name)
     char *name;
{
  Function *function;
  char **keyseqs;
  int j;

  function = rl_named_function (name);
  if (!function)
    {
      builtin_error ("unknown function name `%s'", name);
      return EXECUTION_FAILURE;
    }

  keyseqs = rl_invoking_keyseqs (function);

  if (!keyseqs)
    {
      printf ("%s is not bound to any keys.\n", name);
      return EXECUTION_FAILURE;
    }

  printf ("%s can be invoked via ", name);
  for (j = 0; j < 5 && keyseqs[j]; j++)
    printf ("\"%s\"%s", keyseqs[j], keyseqs[j + 1] ? ", " : ".\n");
  if (keyseqs[j])
    printf ("...\n");
  free_array (keyseqs);
  return EXECUTION_SUCCESS;
}
#endif /* READLINE */
