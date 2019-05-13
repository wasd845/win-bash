/* read.c, created from read.def. */

#include <stdio.h>
#include "../shell.h"
#include "common.h"

static int stream_close ();

extern int interrupt_immediately;

/* Read the value of the shell variables whose names follow.
   The reading is done from the current input stream, whatever
   that may be.  Successive words of the input line are assigned
   to the variables mentioned in LIST.  The last variable in LIST
   gets the remainder of the words on the line.  If no variables
   are mentioned in LIST, then the default variable is $REPLY.

   S. R. Bourne's shell complains if you don't name a variable
   to receive the stuff that is read.  GNU's shell doesn't.  This
   allows you to let the user type random things. */
read_builtin (list)
     WORD_LIST *list;
{
  register char *varname;
  int size, c, i, fildes, raw_mode, pass_next, saw_escape, retval;
  char *input_string, *orig_input_string, *ifs_chars;
  FILE *input_stream;

  i = 0;		/* Index into the string that we are reading. */
  raw_mode = 0;		/* Not reading raw input be default. */

  while (list)
  {
     if (ISOPTION (list->word->word, 'r'))
     {
        raw_mode = 1;
        list = list->next;
     }
     else if (ISOPTION (list->word->word, '-'))
     {
        list = list->next;
        break;
     }
     else if (*list->word->word == '-')
     {
        bad_option (list->word->word);
        builtin_error ("usage: read [-r] [name ...]");
        return (EX_USAGE);
     }
     else
        break;
  }
  
  /* We need unbuffered input from stdin.  So we make a new stream with
     the same file descriptor as stdin, then unbuffer it. */
  fildes = dup(fileno (stdin));

  if (fildes == -1)
  {
    return (EXECUTION_FAILURE);
  }

  input_stream = FDOPEN(fildes, "r");

  if (!input_stream)
    {
      close(fildes);
      return (EXECUTION_FAILURE);
    }

  ifs_chars = get_string_value ("IFS");
  input_string = xmalloc (size = 128);

  setbuf (input_stream, (char *)NULL);

  begin_unwind_frame ("read_builtin");
  add_unwind_protect (xfree, input_string);
  add_unwind_protect (stream_close, input_stream);
  interrupt_immediately++;

  pass_next = 0;	/* Non-zero signifies last char was backslash. */
  saw_escape = 0;	/* Non-zero signifies that we saw an escape char */

  
  while ((c = fgetc(input_stream)) != EOF)
    {      
       if ('\r' == c)  continue;

       if (i + 2 >= size)
          input_string = xrealloc (input_string, size += 128);

       /* If the next character is to be accepted verbatim, a backslash
          newline pair still disappears from the input. */
       if (pass_next)
       {
          if (c == '\n')
             i--;		/* back up over the CTLESC */
          else
             input_string[i++] = c;
          pass_next = 0;
          continue;
       }
       
       if (c == '\\' && !raw_mode)
       {
          pass_next++;
          saw_escape++;
          input_string[i++] = CTLESC;
          continue;
       }
       
       if (c == '\n')
          break;
       
       if (c == CTLESC || c == CTLNUL)
          input_string[i++] = CTLESC;
       
       input_string[i++] = c;
    }

  input_string[i] = '\0';
  
  interrupt_immediately--;
  discard_unwind_frame ("read_builtin");

  if ((c != EOF) && (ftell(input_stream) != tell(fildes)))
  {
     _lseek(fildes, ftell(input_stream), SEEK_SET);
  }

  fclose (input_stream);
  fildes = -1; /* fclose closes fildes */

  if (c == EOF)
    {
      retval = EXECUTION_FAILURE;
      input_string[0] = '\0';
    }
  else
    retval = EXECUTION_SUCCESS;

  if (!list)
    {
      SHELL_VAR *var;
      char *t;

      if (saw_escape)
      {
         t = dequote_string (input_string);
         var = bind_variable ("REPLY", t);
         free (t);
      }
      else
         var = bind_variable ("REPLY", input_string);
      var->attributes &= ~att_invisible;
      free (input_string);
    }
  else
  {
     SHELL_VAR *var;
     char *t;
     /* This code implements the Posix.2 spec for splitting the words
        read and assigning them to variables.  If $IFS is unset, we
        use the default value of " \t\n". */
      if (!ifs_chars)
         ifs_chars = "";
      
      orig_input_string = input_string;
      while (list->next)
      {
         char *e, *t1;
         
         varname = list->word->word;

         /* If there are more variables than words read from the input,
            the remaining variables are set to the empty string. */
	  if (*input_string)
     {
        /* This call updates INPUT_STRING. */
        t = get_word_from_string (&input_string, ifs_chars, &e);
        if (t)
           *e = '\0';
        /* Don't bother to remove the CTLESC unless we added one
           somewhere while reading the string. */
        if (t && saw_escape)
        {
           t1 = dequote_string (t);
           var = bind_variable (varname, t1);
           free (t1);
        }
        else
           var = bind_variable (varname, t);
     }
	  else
     {
        t = (char *)0;
        var = bind_variable (varname, "");
     }
     
	  stupidly_hack_special_variables (varname);
	  var->attributes &= ~att_invisible;
     
	  if (t)
        free (t);
     
	  list = list->next;
      }
      
      if (saw_escape)
      {
         t = dequote_string (input_string);
         var = bind_variable (list->word->word, t);
	  free (t);
      }
      else
         var = bind_variable (list->word->word, input_string);
      stupidly_hack_special_variables (list->word->word);
      var->attributes &= ~att_invisible;
      free (orig_input_string);
  }

  return (retval);
}

/* This way I don't have to know whether fclose () is a
   function or a macro. */
static int
stream_close (file)
     FILE *file;
{
  return (fclose (file));
}
