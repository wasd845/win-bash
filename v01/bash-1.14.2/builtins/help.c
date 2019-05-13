/* help.c, created from help.def. */
#line 23 "./help.def"

#line 31 "./help.def"

#include <stdio.h>
#include "../shell.h"
#include "../builtins.h"

#if defined (USE_GLOB_LIBRARY)
#  include <glob/glob.h>
#else
#  define FNM_NOMATCH 1
#endif /* USE_GLOB_LIBRARY */

/* Print out a list of the known functions in the shell, and what they do.
   If LIST is supplied, print out the list which matches for each pattern
   specified. */
help_builtin (list)
     WORD_LIST *list;
{
  if (!list)
    {
      register int i, j;
      char blurb[256];

      show_shell_version ();
      printf (
"Shell commands that are defined internally.  Type `help' to see this list.\n\
Type `help name' to find out more about the function `name'.\n\
Use `info bash' to find out more about the shell in general.\n\
\n\
A star (*) next to a name means that the command is disabled.\n\
\n");

      for (i = 0; i < num_shell_builtins; i++)
	{
	  QUIT;
	  sprintf (blurb, "%c%s",
		   (shell_builtins[i].flags & BUILTIN_ENABLED) ? ' ' : '*',
		   shell_builtins[i].short_doc);

	  blurb[35] = '\0';
	  printf ("%s", blurb);

	  if (i % 2)
	    printf ("\n");
	  else
	    for (j = strlen (blurb); j < 35; j++)
	      putc (' ', stdout);

	}
      if (i % 2)
	printf ("\n");
    }
  else
    {
      int match_found = 0;
      char *pattern = "";

      if (glob_pattern_p (list->word->word))
	{
	  printf ("Shell commands matching keyword%s `",
		  list->next ? "s" : "");
	  print_word_list (list, ", ");
	  printf ("'\n\n");
	}

      while (list)
	{
	  register int i = 0, plen;
	  char *name;

	  pattern = list->word->word;
	  plen = strlen (pattern);

	  while (name = shell_builtins[i].name)
	    {
	      int doc_index;

	      QUIT;
	      if ((strncmp (pattern, name, plen) == 0) ||
		  (fnmatch (pattern, name, 0) != FNM_NOMATCH))
		{
		  printf ("%s: %s\n", name, shell_builtins[i].short_doc);

		  for (doc_index = 0;
		       shell_builtins[i].long_doc[doc_index]; doc_index++)
		    printf ("    %s\n", shell_builtins[i].long_doc[doc_index]);

		  match_found++;
		}
	      i++;
	    }
	  list = list->next;
	}

      if (!match_found)
	{
	  fprintf (stderr, "No help topics match `%s'.  Try `help help'.\n",
		   pattern);
	  fflush (stderr);
	  return (EXECUTION_FAILURE);
	}
    }
  fflush (stdout);
  return (EXECUTION_SUCCESS);
}
