/* history.c, created from history.def. */

#include "../shell.h"
#if defined (HISTORY)
#include <sys/types.h>
#include <sys/file.h>
#include "../filecntl.h"
#include "../posixstat.h"
#include "../bashhist.h"
#include <readline/history.h>

/* History.  Arg of -w FILENAME means write file, arg of -r FILENAME
   means read file.  Arg of N means only display that many items. */

history_builtin (list)
     WORD_LIST *list;
{
  register int i;
  int limited = 0, limit = 0;
  HIST_ENTRY **hlist;

  while (list)
  {
     char *arg = list->word->word;
     
     if ((arg[0] == '-') &&
         (strlen (arg) == 2) &&
         (member (arg[1], "rwan")))
     {
        char *file;
        int result = EXECUTION_SUCCESS;
        
        if (list->next)
           file = list->next->word->word;
        else
           file = get_string_value ("HISTFILE");
        
        switch (arg[1])
	    {
          case 'a':		/* Append `new' lines to file. */
          {
             if (history_lines_this_session)
             {
                void using_history ();
                
                if (history_lines_this_session < where_history ())
                {
                   /* If the filename was supplied, then create it
                      if it doesn't already exist. */
                   if (file)
                   {
                      struct stat buf;
                      
                      if (stat (file, &buf) == -1)
                      {
                         int tem;
                         
                         tem = OPEN3 (file, O_CREAT, 0666);
                         if (-1 != tem)
                         {
                            CLOSE(tem);
                         }
                      }
                   }
                   
                   result =
                      append_history (history_lines_this_session, file);
                   history_lines_in_file += history_lines_this_session;
                   history_lines_this_session = 0;
                }
             }
             break;
          }
          
          case 'w':		/* Write entire history. */
          {
             result = write_history (file);
             break;
          }
          
          case 'r':		/* Read entire file. */
          {
             result = read_history (file);
             break;
          }
          
          case 'n':		/* Read `new' history from file. */
          {
             /* Read all of the lines in the file that we haven't
                already read. */
             using_history ();
             result = read_history_range (file, history_lines_in_file, -1);
             using_history ();
             history_lines_in_file = where_history ();
             
             break;
          }
	    }
        return (result ? EXECUTION_FAILURE : EXECUTION_SUCCESS);
     }
     else if (strcmp (list->word->word, "--") == 0)
     {
        list = list->next;
        break;
     }
     else if (*list->word->word == '-')
     {
        bad_option (list->word->word);
        builtin_error ("usage: history [n] [-rwan [filename]]");
        return (EX_USAGE);
     }
     else
        break;
  }
  
  if (list)
  {
     limited = 1;
     limit = get_numeric_arg (list);
  }
  
  hlist = history_list ();
  
  if (hlist)
  {
     for (i = 0;  hlist[i]; i++);
     
     if (limit < 0)
        limit = -limit;
     
     if (!limited)
        i = 0;
     else
        if ((i -= limit) < 0)
           i = 0;
     
     while (hlist[i])
     {
        QUIT;
        printf ("%5d%c %s\n", i + history_base,
                hlist[i]->data ? '*' : ' ', hlist[i]->line);
        i++;
     }
  }
  return (EXECUTION_SUCCESS);
}
#endif /* HISTORY */
