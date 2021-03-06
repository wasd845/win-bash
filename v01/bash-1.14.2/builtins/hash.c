/* hash.c, created from hash.def. */
#line 23 "./hash.def"

#line 32 "./hash.def"

#include <sys/types.h>
#include "../posixstat.h"

#include <stdio.h>

#if defined (HAVE_STRING_H)
#  include <string.h>
#else /* !HAVE_STRING_H */
#  include <strings.h>
#endif /* !HAVE_STRING_H */

#include "../shell.h"
#include "../builtins.h"
#include "../flags.h"
#include "hashcom.h"
#include "common.h"
#include "../execute_cmd.h"

extern int dot_found_in_search;

void
initialize_filename_hashing ()
{
  hashed_filenames = make_hash_table (FILENAME_HASH_BUCKETS);
}

/* Print statistics on the current state of hashed commands.  If LIST is
   not empty, then rehash (or hash in the first place) the specified
   commands. */
hash_builtin (list)
     WORD_LIST *list;
{
  int expunge_hash_table = 0;
  int any_failed = 0;

  if (hashing_disabled)
    {
      builtin_error ("hashing disabled");
      return (EXECUTION_FAILURE);
    }

  while (list)
    {
      char *arg = list->word->word;

      if (ISOPTION (arg, 'r'))
	{
	  expunge_hash_table = 1;
	  list = list->next;
	}
      else if (ISOPTION (arg, '-'))
	{
	  list = list->next;
	  break;
	}
      else if (*arg == '-')
	{
	  bad_option (list->word->word);
	  builtin_error ("usage: hash [-r] [command ...]");
	  return (EX_USAGE);
	}
      else
	break;
    }

  /* We want hash -r to be silent, but hash -- to print hashing info.  That
     is the reason for the !expunge_hash_table. */
  if (!list && !expunge_hash_table)
    {
      /* Print information about current hashed info. */
      int any_printed = 0;
      int bucket = 0;
      register BUCKET_CONTENTS *item_list;

      while (bucket < hashed_filenames->nbuckets)
	{
	  item_list = get_hash_bucket (bucket, hashed_filenames);
	  if (item_list)
	    {
	      if (!any_printed)
		{
		  printf ("hits\tcommand\n");
		  any_printed++;
		}
	      while (item_list)
		{
		  printf ("%4d\t%s\n",
			  item_list->times_found, pathdata(item_list)->path);
		  item_list = item_list->next;
		}
	    }
	  bucket++;
	}

      if (!any_printed)
	printf ("No commands in hash table.\n");

      return (EXECUTION_SUCCESS);
    }

  if (expunge_hash_table)
    {
      int bucket = 0;
      register BUCKET_CONTENTS *item_list, *prev;

      while (bucket < hashed_filenames->nbuckets)
	{
	  item_list = get_hash_bucket (bucket, hashed_filenames);
	  if (item_list)
	    {
	      while (item_list)
		{
		  prev = item_list;
		  free (item_list->key);
		  free (pathdata(item_list)->path);
		  free (item_list->data);
		  item_list = item_list->next;
		  free (prev);
		}
	      hashed_filenames->bucket_array[bucket] = (BUCKET_CONTENTS *)NULL;
	    }
	  bucket++;
	}
    }

  while (list)
    {
      /* Add or rehash the specified commands. */
      char *word;
      char *full_path;
      SHELL_VAR *var;

      word = list->word->word;
      if (absolute_program (word))
	{
	  list = list->next;
	  continue;
	}
      full_path = find_user_command (word);
      var = find_function (word);

      if (!find_shell_builtin (word) && (!var))
	{
	  if (full_path && executable_file (full_path))
	    remember_filename (word, full_path, dot_found_in_search, 0);
	  else
	    {
	      builtin_error ("%s: not found", word);
	      any_failed++;
	    }
	}
      if (full_path)
	free (full_path);

      list = list->next;
    }

  fflush (stdout);

  if (any_failed)
    return (EXECUTION_FAILURE);
  else
    return (EXECUTION_SUCCESS);
}

/* Place FILENAME (key) and FULL_PATHNAME (data->path) into the
   hash table.  CHECK_DOT if non-null is for future calls to
   find_hashed_filename ().  FOUND is the initial value for
   times_found. */
void
remember_filename (filename, full_pathname, check_dot, found)
     char *filename, *full_pathname;
     int check_dot, found;
{
  register BUCKET_CONTENTS *item;

  if (hashing_disabled)
    return;
  item = add_hash_item (filename, hashed_filenames);
  if (item->data)
    free (pathdata(item)->path);
  else
    {
      item->key = savestring (filename);
      item->data = (char *)xmalloc (sizeof (PATH_DATA));
    }
  pathdata(item)->path = savestring (full_pathname);
  pathdata(item)->check_dot = check_dot;
  item->times_found = found;
}
