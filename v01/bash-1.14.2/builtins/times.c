/* times.c, created from times.def. */
#line 23 "./times.def"

#line 30 "./times.def"

#if defined (_POSIX_VERSION) || !defined (HAVE_RESOURCE)
#  include <sys/times.h>
#else /* !_POSIX_VERSION && HAVE_RESOURCE */
#  include <sys/time.h>
#  include <sys/resource.h>
#endif /* !_POSIX_VERSION && HAVE_RESOURCE */


#include "../shell.h"
#include <sys/types.h>

#if defined (hpux) || defined (USGr4) || defined (XD88) || defined (USGr3)
#  undef HAVE_RESOURCE
#endif /* hpux || USGr4 || XD88 || USGr3 */

/* Print the totals for system and user time used.  The
   information comes from variables in jobs.c used to keep
   track of this stuff. */
times_builtin (list)
     WORD_LIST *list;
{
#if !defined (_POSIX_VERSION) && defined (HAVE_RESOURCE) && defined (RUSAGE_SELF)
  struct rusage self, kids;

  getrusage (RUSAGE_SELF, &self);
  getrusage (RUSAGE_CHILDREN, &kids);	/* terminated child processes */

  print_timeval (&self.ru_utime);
  putchar (' ');
  print_timeval (&self.ru_stime);
  putchar ('\n');
  print_timeval (&kids.ru_utime);
  putchar (' ');
  print_timeval (&kids.ru_stime);
  putchar ('\n');

#else /* _POSIX_VERSION || !HAVE_RESOURCE || !RUSAGE_SELF */
#  if !defined (BrainDeath) && !defined (__NT_VC__)
  struct tms t;

  times (&t);

  /* As of System V.3, HP-UX 6.5, and other ATT-like systems, this stuff is
     returned in terms of clock ticks (HZ from sys/param.h).  C'mon, guys.
     This kind of stupid clock-dependent stuff is exactly the reason 4.2BSD
     introduced the `timeval' struct. */

  print_time_in_hz (t.tms_utime);
  putchar (' ');
  print_time_in_hz (t.tms_stime);
  putchar ('\n');
  print_time_in_hz (t.tms_cutime);
  putchar (' ');
  print_time_in_hz (t.tms_cstime);
  putchar ('\n');
#  endif /* BrainDeath */
#endif /* _POSIX_VERSION || !HAVE_RESOURCE || !RUSAGE_SELF */

  return (EXECUTION_SUCCESS);
}
