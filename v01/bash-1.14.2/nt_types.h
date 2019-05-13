/* nt_types.h -- interface to Windows NT specific code in nt_vc.c */

/* Copyright (C) 1994 Free Software Foundation, Inc.

   This file is part of GNU Bash, the Bourne Again SHell.

   Bash is free software; you can redistribute it and/or modify it under
   the terms of the GNU General Public License as published by the Free
   Software Foundation; either version 2, or (at your option) any later
   version.

   Bash is distributed in the hope that it will be useful, but WITHOUT ANY
   WARRANTY; without even the implied warranty of MERCHANTABILITY or
   FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
   for more details.

   You should have received a copy of the GNU General Public License along
   with Bash; see the file COPYING.  If not, write to the Free Software
   Foundation, 675 Mass Ave, Cambridge, MA 02139, USA. */

/* Created by Mountain Math Software  (support@mtnmath.com) for a
   Windows NT version of Bash. */

#ifndef NT_TYPES_DOT_H
#define NT_TYPES_DOT_H


/* define it here because the windows include files bring in too much garbage */
/* #include <windef.h> */

#ifdef __NT_EGC__
#include <windef.h>
#else
typedef long DWORD ;
#endif


#include "command.h"

struct nt_parse_thread {
	const char * string;
	const char * from_file  ;
	int interact ;
};


extern struct nt_parse_thread parse_thread_param ;
extern DWORD nt_parse_and_execute_thread(void * param);
void do_piping (int pipe_in, int pipe_out) ;
int do_redirections2(REDIRECT * list, int for_real, int internal, int set_clexec, int bypass_buf_dup);

#endif /* #ifdef NT_TYPES_DOT_H */
