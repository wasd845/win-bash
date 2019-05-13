/* stdc.h -- macros to make source compile on both ANSI C and K&R C
   compilers. */

/* Copyright (C) 1993 Free Software Foundation, Inc.

   This file is part of GNU Bash, the Bourne Again SHell.

   Bash is free software; you can redistribute it and/or modify it
   under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 1, or (at your option)
   any later version.

   Bash is distributed in the hope that it will be useful, but WITHOUT
   ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
   or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public
   License for more details.

   You should have received a copy of the GNU General Public License
   along with Bash; see the file COPYING.  If not, write to the Free
   Software Foundation, 675 Mass Ave, Cambridge, MA 02139, USA. */

#if !defined (__STDC_H__)
#define __STDC_H__

/* Adapted from BSD /usr/include/sys/cdefs.h. */

/* A function can be defined using prototypes and compile on both ANSI C
   and traditional C compilers with something like this:
	extern char *func __P((char *, char *, int)); */
#if defined (__STDC__)

#  if !defined (__P)
#    define __P(p) p
#  endif
#  define __STRING(x) #x

#  if !defined (__GNUC__)
#    define inline
#  endif

#else /* !__STDC__ */

#  if !defined (__P)
#    define __P(protos) ()
#  endif
#  define __STRING(x) "x"

#if !defined (const)
#  if defined (__GNUC__)		/* gcc with -traditional */
#    define const  __const
#    define inline __inline
#    define signed __signed
#    define volatile __volatile
#  else /* !__GNUC__ */
#    define const
#    define inline
#    define signed
#    define volatile
#  endif /* !__GNUC__ */
#endif /* !const */

#endif /* !__STDC__ */

#endif /* !__STDC_H__ */
