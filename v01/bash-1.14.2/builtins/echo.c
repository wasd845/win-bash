/* echo.c, created from echo.def. */
#line 23 "./echo.def"
#include <stdio.h>
#include "../shell.h"

#line 47 "./echo.def"

#line 54 "./echo.def"

#if defined (V9_ECHO)
#  define VALID_ECHO_OPTIONS "neE"
#else /* !V9_ECHO */
#  define VALID_ECHO_OPTIONS "n"
#endif /* !V9_ECHO */

/* Print the words in LIST to standard output.  If the first word is
   `-n', then don't print a trailing newline.  We also support the
   echo syntax from Version 9 unix systems. */
echo_builtin (list)
     WORD_LIST *list;
{
  int display_return = 1, do_v9 = 0;

#if defined (DEFAULT_ECHO_TO_USG)
/* System V machines already have a /bin/sh with a v9 behaviour.  We
   give Bash the identical behaviour for these machines so that the
   existing system shells won't barf. */
  do_v9 = 1;
#endif /* DEFAULT_ECHO_TO_USG */

  while (list && list->word->word[0] == '-')
    {
      register char *temp;
      register int i;

      /* If it appears that we are handling options, then make sure that
	 all of the options specified are actually valid.  Otherwise, the
	 string should just be echoed. */
      temp = &(list->word->word[1]);

      for (i = 0; temp[i]; i++)
	{
	  if (strchr (VALID_ECHO_OPTIONS, temp[i]) == 0)
	    goto just_echo;
	}

      if (!*temp)
	goto just_echo;

      /* All of the options in TEMP are valid options to ECHO.
	 Handle them. */
      while (*temp)
	{
	  if (*temp == 'n')
	    display_return = 0;
#if defined (V9_ECHO)
	  else if (*temp == 'e')
	    do_v9 = 1;
	  else if (*temp == 'E')
	    do_v9 = 0;
#endif /* V9_ECHO */
	  else
	    goto just_echo;

	  temp++;
	}
      list = list->next;
    }

just_echo:

  if (list)
    {
#if defined (V9_ECHO)
      if (do_v9)
	{
	  while (list)
	    {
	      register char *s = list->word->word;
	      register int c;

	      while (c = *s++)
		{
		  if (c == '\\' && *s)
		    {
		      switch (c = *s++)
			{
			case 'a': c = '\007'; break;
			case 'b': c = '\b'; break;
			case 'c': display_return = 0; continue;
			case 'f': c = '\f'; break;
			case 'n': c = '\n'; break;
			case 'r': c = '\r'; break;
			case 't': c = '\t'; break;
			case 'v': c = (int) 0x0B; break;
			case '0': case '1': case '2': case '3':
			case '4': case '5': case '6': case '7':
			  c -= '0';
			  if (*s >= '0' && *s <= '7')
			    c = c * 8 + (*s++ - '0');
			  if (*s >= '0' && *s <= '7')
			    c = c * 8 + (*s++ - '0');
			  break;
			case '\\': break;
			default:  putchar ('\\'); break;
			}
		    }
		  putchar(c);
		}
	      list = list->next;
	      if (list)
		putchar(' ');
	    }
	}
      else
#endif /* V9_ECHO */
	print_word_list (list, " ");
    }
  if (display_return)
    printf ("\n");
  fflush (stdout);
  return (EXECUTION_SUCCESS);
}
