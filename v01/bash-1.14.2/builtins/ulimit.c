/* ulimit.c, created from ulimit.def. */

#if defined (HAVE_RESOURCE)
#  include <sys/time.h>
#  include <sys/resource.h>
#else
#  include <sys/times.h>
#endif

#include <stdio.h>
#include <sys/types.h>
#include <sys/param.h>
#include <errno.h>
#include "../shell.h"
#include "pipesize.h"

#if !defined (errno)
extern int errno;
#endif

#if defined (_POSIX_VERSION)
#  include <limits.h>
#endif

/* Check for the most basic symbols.  If they aren't present, this
   system's <sys/resource.h> isn't very useful to us. */
#if !defined (RLIMIT_FSIZE) || defined (GETRLIMIT_MISSING)
#  undef HAVE_RESOURCE
#endif

/* **************************************************************** */
/*								    */
/*			Ulimit builtin and Hacks.       	    */
/*								    */
/* **************************************************************** */

/* Block size for ulimit operations. */
#define ULIMIT_BLOCK_SIZE ((long)1024)

#define u_FILE_SIZE 		0x001
#define u_MAX_BREAK_VAL		0x002
#define u_PIPE_SIZE		0x004
#define u_CORE_FILE_SIZE	0x008
#define u_DATA_SEG_SIZE		0x010
#define u_PHYS_MEM_SIZE		0x020
#define u_CPU_TIME_LIMIT	0x040
#define u_STACK_SIZE		0x080
#define u_NUM_OPEN_FILES	0x100
#define u_MAX_VIRTUAL_MEM	0x200
#define u_MAX_USER_PROCS	0x400

#define u_ALL_LIMITS		0x7ff

#if !defined (RLIM_INFINITY)
#  define RLIM_INFINITY  0x7fffffff
#endif

/* Some systems use RLIMIT_NOFILE, others use RLIMIT_OFILE */
#if defined (HAVE_RESOURCE) && defined (RLIMIT_OFILE) && !defined (RLIMIT_NOFILE)
#  define RLIMIT_NOFILE RLIMIT_OFILE
#endif /* HAVE_RESOURCE && RLIMIT_OFILE && !RLIMIT_NOFILE */

#define LIMIT_HARD 0x01
#define LIMIT_SOFT 0x02

static long shell_ulimit ();
static long pipesize ();
static long open_files ();

#if defined (HAVE_RESOURCE)
static long getmaxvm ();
#endif /* HAVE_RESOURCE */

static void print_specific_limits ();
static void print_all_limits ();

static char t[2];

/* Return 1 if the limit associated with CMD can be raised from CURRENT
   to NEW.  This is for USG systems without HAVE_RESOURCE, most of which
   do not allow any user other than root to raise limits.  There are,
   however, exceptions. */
#if !defined (HAVE_RESOURCE)
static int
canraise (cmd, current, new)
     int cmd;
     long current, new;
{
#  if defined (HAVE_SETDTABLESIZE)
  if (cmd == u_NUM_OPEN_FILES)
    return (1);
#  endif /* HAVE_SETDTABLSIZE */

  return ((current > new) || (current_user.uid == 0));
}
#endif /* !HAVE_RESOURCE */

/* Report or set limits associated with certain per-process resources.
   See the help documentation in builtins.c for a full description.

   Rewritten by Chet Ramey 6/30/91. */
int
ulimit_builtin (list)
     register WORD_LIST *list;
{
  register char *s;
  int c, setting, cmd, mode, verbose_print, opt_eof;
  int all_limits, specific_limits;
  long current_limit, real_limit, limit = -1L;
  long block_factor;

  c = mode = verbose_print = opt_eof = 0;

  do
    {
      cmd = setting = all_limits = specific_limits = 0;
      block_factor = ULIMIT_BLOCK_SIZE;

      /* read_options: */
      if (list && !opt_eof && *list->word->word == '-')
	{
	  s = &(list->word->word[1]);
	  list = list->next;

	  while (*s && (c = *s++))
	    {
	      switch (c)
		{
#define ADD_CMD(x) { if (cmd) specific_limits++; cmd |= (x); }

		case '-':	/* ulimit -- */
		  opt_eof++;
		  break;
		  
		case 'a':
		  all_limits++;
		  break;

		case 'f':
		  ADD_CMD (u_FILE_SIZE);
		  break;

#if defined (HAVE_RESOURCE)
		/* -S and -H are modifiers, not real options.  */
		case 'S':
		  mode |= LIMIT_SOFT;
		  break;

		case 'H':
		  mode |= LIMIT_HARD;
		  break;

		case 'c':
		  ADD_CMD (u_CORE_FILE_SIZE);
		  break;

		case 'd':
		  ADD_CMD (u_DATA_SEG_SIZE);
		  break;

#if !defined (USGr4)
		case 'm':
		  ADD_CMD (u_PHYS_MEM_SIZE);
		  break;
#endif /* USGr4 */

		case 't':
		  ADD_CMD (u_CPU_TIME_LIMIT);
		  block_factor = 1;	/* seconds */
		  break;

		case 's':
		  ADD_CMD (u_STACK_SIZE);
		  break;

		case 'v':
		  ADD_CMD (u_MAX_VIRTUAL_MEM);
		  block_factor = 1;
		  break;

		case 'u':
		  ADD_CMD (u_MAX_USER_PROCS);
		  block_factor = 1;
		  break;

#endif /* HAVE_RESOURCE */

		case 'p':
		  ADD_CMD (u_PIPE_SIZE);
		  block_factor = 512;
		  break;

		case 'n':
		  ADD_CMD (u_NUM_OPEN_FILES);
		  block_factor = 1;
		  break;

		default:		/* error_case: */
		  t[0] = c;
		  t[1] = '\0';
		  bad_option (t);
#if !defined (HAVE_RESOURCE)
		  builtin_error("usage: ulimit [-afnp] [new limit]");
#else
		  builtin_error("usage: ulimit [-SHacmdstfnpuv] [new limit]");
#endif
		  return (EX_USAGE);
		}
	    }
	}

	if (all_limits)
	  {
	    print_all_limits (mode);
	    return (EXECUTION_SUCCESS);
	  }

	if (specific_limits)
	  {
	    print_specific_limits (cmd, mode);
	    if (list)
	      verbose_print++;
	    continue;
	  }

	if (cmd == 0)
	  cmd = u_FILE_SIZE;

 	/* If an argument was supplied for the command, then we want to
	   set the limit.  Note that `ulimit something' means a command
	   of -f with argument `something'. */
	if (list)
	  {
	    if (opt_eof || (*list->word->word != '-'))
	      {
		s = list->word->word;
		list = list->next;

		if (STREQ (s, "unlimited"))
		  limit = RLIM_INFINITY;
		else if (all_digits (s))
		  limit = string_to_long (s);
		else
		  {
		    builtin_error ("bad non-numeric arg `%s'", s);
		    return (EXECUTION_FAILURE);
		  }
		setting++;
	      }
	    else if (!opt_eof)
	      verbose_print++;
	  }

      if (limit == RLIM_INFINITY)
	block_factor = 1;

      real_limit = limit * block_factor;

      /* If more than one option is given, list each in a verbose format,
	 the same that is used for -a. */
      if (!setting && verbose_print)
	{
	  print_specific_limits (cmd, mode);
	  continue;
	}

      current_limit = shell_ulimit (cmd, real_limit, 0, mode);

      if (setting)
	{
#if !defined (HAVE_RESOURCE)
	  /* Most USG systems do not most allow limits to be raised by any
	     user other than root.  There are, however, exceptions. */
	  if (canraise (cmd, current_limit, real_limit) == 0)
	    {
	      builtin_error ("cannot raise limit: %s", strerror (EPERM));
	      return (EXECUTION_FAILURE);
	    }
#endif /* !HAVE_RESOURCE */

	  if (shell_ulimit (cmd, real_limit, 1, mode) == -1L)
	    {
	      builtin_error ("cannot raise limit: %s", strerror (errno));
	      return (EXECUTION_FAILURE);
	    }

	  continue;
	}
      else
	{
	  if (current_limit < 0)
	    builtin_error ("cannot get limit: %s", strerror (errno));
	  else if (current_limit != RLIM_INFINITY)
	    printf ("%ld\n", (current_limit / block_factor));
	  else
	    printf ("unlimited\n");
	}
    }
  while (list);

  return (EXECUTION_SUCCESS);
}

/* The ulimit that we call from within Bash.

   WHICH says which limit to twiddle; SETTING is non-zero if NEWLIM
   contains the desired new limit.  Otherwise, the existing limit is
   returned.  If mode & LIMIT_HARD, the hard limit is used; if
   mode & LIMIT_SOFT, the soft limit.  Both may be set by specifying
   -H and -S; if both are specified, or if neither is specified, the
   soft limit will be returned.

   Systems without BSD resource limits can specify only u_FILE_SIZE.
   This includes most USG systems.

   Chet Ramey supplied the BSD resource limit code. */
static long
shell_ulimit (which, newlim, setting, mode)
     int which, setting, mode;
     long newlim;
{
#if defined (HAVE_RESOURCE)
  struct rlimit limit;
  int cmd;

  if (mode == 0)
    mode |= LIMIT_SOFT;
#endif

  switch (which)
    {
#if !defined (HAVE_RESOURCE)

    case u_FILE_SIZE:
      if (!setting)
	{
	  /* ulimit () returns a number that is in 512 byte blocks, thus we
	     must multiply it by 512 to get back to bytes.  This is false
	     only under HP/UX 6.x. */
	  long result;

	  result = ulimit (1, 0L);

#  if defined (hpux) && !defined (_POSIX_VERSION)
	  return (result);
#  else
	  return (result * 512);
#  endif /* hpux 6.x */
	}
      else
	return (ulimit (2, newlim / 512L));

      break;

#else /* defined (HAVE_RESOURCE) */

    case u_FILE_SIZE:
      cmd = RLIMIT_FSIZE;
      goto do_ulimit;

    case u_CORE_FILE_SIZE:
      cmd = RLIMIT_CORE;
      goto do_ulimit;

    case u_DATA_SEG_SIZE:
      cmd = RLIMIT_DATA;
      goto do_ulimit;

#if !defined (USGr4)
    case u_PHYS_MEM_SIZE:
#  if defined (RLIMIT_RSS)
      cmd = RLIMIT_RSS;
#  else /* !RLIMIT_RSS */
      errno = EINVAL;
      return (-1L);
#  endif /* !RLIMIT_RSS */

      goto do_ulimit;
#endif /* USGr4 */

    case u_CPU_TIME_LIMIT:
      cmd = RLIMIT_CPU;
      goto do_ulimit;

    case u_STACK_SIZE:
      cmd = RLIMIT_STACK;

    do_ulimit:

      if (getrlimit (cmd, &limit) != 0)
	return (-1L);

      if (!setting)
	{
	  if (mode & LIMIT_SOFT)
	    return (limit.rlim_cur);
	  else
	    return (limit.rlim_max);
	}
      else
	{
	  if (mode & LIMIT_SOFT)
	    {
	      /* Non-root users are only allowed to raise a limit up to the
		 hard limit, not to infinity. */
	      if (current_user.euid != 0 && newlim == RLIM_INFINITY)
		limit.rlim_cur = limit.rlim_max;
	      else
		limit.rlim_cur = newlim;
	    }
	  if (mode & LIMIT_HARD)
	    limit.rlim_max = newlim;

	  return (setrlimit (cmd, &limit));
	}

      break;

#endif /* HAVE_RESOURCE */

      /* You can't get or set the pipe size with getrlimit, so we have to
	 cheat.  */
    case u_PIPE_SIZE:
      if (setting)
	{
	  errno = EINVAL;
	  return (-1L);
	}
      return (pipesize ());

    case u_NUM_OPEN_FILES:
      if (setting)
	{
#if defined (HAVE_RESOURCE) && defined (RLIMIT_NOFILE)
	  cmd = RLIMIT_NOFILE;
	  goto do_ulimit;
#else
#  if defined (HAVE_SETDTABLESIZE)
	  return (setdtablesize (newlim));
#  else
	  errno = EINVAL;
	  return (-1L);
#  endif /* HAVE_SETDTABLESIZE */
#endif /* !HAVE_RESOURCE || !RLIMIT_NOFILE */
	}
      else
	return (open_files (mode));

    case u_MAX_VIRTUAL_MEM:
      if (setting)
	{
	  errno = EINVAL;
	  return (-1L);
	}
      else
	{
#if defined (HAVE_RESOURCE)
	  return (getmaxvm (mode));
#else /* !HAVE_RESOURCE */
	  errno = EINVAL;
	  return (-1L);
#endif /* !HAVE_RESOURCE */
	}

    case u_MAX_USER_PROCS:
#if defined (HAVE_RESOURCE) && defined (RLIMIT_NPROC)
      cmd = RLIMIT_NPROC;
      goto do_ulimit;
#else /* !HAVE_RESOURCE || !RLIMIT_NPROC */
      errno = EINVAL;
      return (-1L);
#endif /* !HAVE_RESOURCE || !RLIMIT_NPROC */
      
    default:
      errno = EINVAL;
      return (-1L);
    }
}

#if defined (HAVE_RESOURCE)
static long
getmaxvm (mode)
     int mode;
{
  struct rlimit rl;

#if defined (RLIMIT_VMEM)
  if (getrlimit (RLIMIT_VMEM, &rl) < 0)
    return (-1L);
  else
    return (((mode & LIMIT_SOFT) ? rl.rlim_cur : rl.rlim_max) / 1024L);
#else /* !RLIMIT_VMEM */
  unsigned long maxdata, maxstack;

  if (getrlimit (RLIMIT_DATA, &rl) < 0)
    return (-1L);
  else
    maxdata = (mode & LIMIT_SOFT) ? rl.rlim_cur : rl.rlim_max;

  if (getrlimit (RLIMIT_STACK, &rl) < 0)
    return (-1L);
  else
    maxstack = (mode & LIMIT_SOFT) ? rl.rlim_cur : rl.rlim_max;

  /* Protect against overflow. */
  return ((maxdata / 1024L) + (maxstack / 1024L));
#endif /* !RLIMIT_VMEM */
}
#endif /* HAVE_RESOURCE */

static long
open_files (mode)
     int mode;
{
#if !defined (RLIMIT_NOFILE)
  return ((long)getdtablesize ());
#else
  struct rlimit rl;

  getrlimit (RLIMIT_NOFILE, &rl);
  if (mode & LIMIT_SOFT)
    return (rl.rlim_cur);
  else
    return (rl.rlim_max);
#endif
}

static long
pipesize ()
{
#if defined (PIPE_BUF)
  /* This is defined on Posix systems. */
  return ((long) PIPE_BUF);
#else
#  if defined (PIPESIZE)
  /* This is defined by running a program from the Makefile. */
  return ((long) PIPESIZE);
#  else
  errno = EINVAL;
  return (-1L);
#  endif /* PIPESIZE */
#endif /* PIPE_BUF */
}

/* ulimit(2) returns information about file size limits in terms of 512-byte
   blocks.  This is the factor by which to divide to turn it into information
   in terms of 1024-byte blocks.  Except for hpux 6.x, which returns it in
   terms of bytes. */
#if !defined (hpux) || defined (_POSIX_VERSION)
#  define ULIMIT_DIVISOR 2
#else
#  define ULIMIT_DIVISOR 1024
#endif

#if defined (HAVE_RESOURCE)

typedef struct {
  int  option_cmd;		/* The ulimit command for this limit. */
  int  parameter;		/* Parameter to pass to getrlimit (). */
  int  block_factor;		/* Blocking factor for specific limit. */
  char *description;		/* Descriptive string to output. */
} BSD_RESOURCE_LIMITS;

static BSD_RESOURCE_LIMITS limits[] = {
  { u_CORE_FILE_SIZE, RLIMIT_CORE,  1024, "core file size (blocks)" },
  { u_DATA_SEG_SIZE,  RLIMIT_DATA,  1024, "data seg size (kbytes)" },
  { u_FILE_SIZE,      RLIMIT_FSIZE, 1024, "file size (blocks)" },
#if !defined (USGr4) && defined (RLIMIT_RSS)
  { u_PHYS_MEM_SIZE,  RLIMIT_RSS,   1024, "max memory size (kbytes)" },
#endif /* USGr4 && RLIMIT_RSS */
  { u_STACK_SIZE,     RLIMIT_STACK, 1024, "stack size (kbytes)" },
  { u_CPU_TIME_LIMIT, RLIMIT_CPU,      1, "cpu time (seconds)" },
#if defined (RLIMIT_NPROC)
  { u_MAX_USER_PROCS, RLIMIT_NPROC,    1, "max user processes" },
#endif /* RLIMIT_NPROC */
  { 0, 0, 0, (char *)NULL }
};

static void
print_bsd_limit (i, mode)
     int i, mode;
{
  struct rlimit rl;
  long limit;

  getrlimit (limits[i].parameter, &rl);
  if (mode & LIMIT_HARD)
    limit = rl.rlim_max;
  else
    limit = rl.rlim_cur;
  printf ("%-25s", limits[i].description);
  if (limit == RLIM_INFINITY)
    printf ("unlimited\n");
  else
    printf ("%ld\n", limit / limits[i].block_factor);
}

static void
print_specific_bsd_limits (cmd, mode)
     int cmd, mode;
{
  register int i;

  for (i = 0; limits[i].option_cmd; i++)
    if (cmd & limits[i].option_cmd)
      print_bsd_limit (i, mode);
}
#endif /* HAVE_RESOURCE */

/* Print the limits corresponding to a specific set of resources.  This is
   called when an option string contains more than one character (e.g. -at),
   because limits may not be specified with that kind of argument. */
static void
print_specific_limits (cmd, mode)
     int cmd, mode;
{
  if (mode == 0)
    mode |= LIMIT_SOFT;

#if defined (HAVE_RESOURCE)
  print_specific_bsd_limits (cmd, mode);
#else /* !HAVE_RESOURCE */
  if (cmd & u_FILE_SIZE)
    printf ("%-25s%ld\n",
	    "file size (blocks)", ulimit (1, 0L) / ULIMIT_DIVISOR);
#endif /* !HAVE_RESOURCE */

  if (cmd & u_PIPE_SIZE)
    printf ("%-25s%ld\n", "pipe size (512 bytes)", (pipesize () / 512));

  if (cmd & u_NUM_OPEN_FILES)
    printf ("%-25s%ld\n", "open files", open_files (mode));

#if defined (HAVE_RESOURCE)
  if (cmd & u_MAX_VIRTUAL_MEM)
    printf ("%-25s%ld\n", "virtual memory (kbytes)", getmaxvm (mode));
#endif /* HAVE_RESOURCE */
}

static void
print_all_limits (mode)
     int mode;
{
  if (mode == 0)
    mode |= LIMIT_SOFT;

  print_specific_limits (u_ALL_LIMITS, mode);
}
