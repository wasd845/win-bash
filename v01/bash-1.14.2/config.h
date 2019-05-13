/* config.h -- Configuration file for bash. */

/* Copyright (C) 1987,1991 Free Software Foundation, Inc.

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

#if !defined (_CONFIG_H_)
#define _CONFIG_H_

#if !defined (BUILDING_MAKEFILE)
#include "memalloc.h"
#endif

#if defined (HAVE_UNISTD_H) && !defined (BUILDING_MAKEFILE)
#  ifdef CRAY
#    define word __word
#  endif
#include <unistd.h>
#  ifdef CRAY
#    undef word
#  endif
#endif

/* Define JOB_CONTROL if your operating system supports
   BSD-like job control. */
/* #define JOB_CONTROL */

/* Note that vanilla System V machines don't support BSD job control,
   although some do support Posix job control. */
#if defined (USG) || defined (MINIX) || defined (Minix)
#  if !defined (_POSIX_JOB_CONTROL)
#    undef JOB_CONTROL
#  endif /* !_POSIX_JOB_CONTROL */
#endif /* USG || Minix || MINIX */

/* Define ALIAS if you want the alias features. */
#define ALIAS

/* Define PUSHD_AND_POPD if you want those commands to be compiled in.
   (Also the `dirs' commands.) */
#define PUSHD_AND_POPD

/* Define BRACE_EXPANSION if you want curly brace expansion a la Csh:
   foo{a,b} -> fooa foob.  Even if this is compiled in (the default) you
   can turn it off at shell startup with `-nobraceexpansion', or during
   shell execution with `set +o braceexpand'. */
#define BRACE_EXPANSION

/* Define READLINE to get the nifty/glitzy editing features.
   This is on by default.  You can turn it off interactively
   with the -nolineediting flag. */
#define READLINE

/* Define BANG_HISTORY if you want to have Csh style "!" history expansion.
   This is unrelated to READLINE. */
#define BANG_HISTORY

/* Define HISTORY if you want to have access to previously typed commands.

   If both HISTORY and READLINE are defined, you can get at the commands
   with line editing commands, and you can directly manipulate the history
   from the command line.

   If only HISTORY is defined, the `fc' and `history' builtins are
   available. */
#define HISTORY

#if defined (BANG_HISTORY) && !defined (HISTORY)
   /* BANG_HISTORY requires HISTORY. */
#  define HISTORY
#endif /* BANG_HISTORY && !HISTORY */

#ifndef __NT_VC__
#define DEFAULT_PATH_VALUE \
  ":/usr/gnu/bin:/usr/local/bin:/usr/ucb:/bin:/usr/bin:/etc:/usr/etc"
#else
#define DEFAULT_PATH_VALUE \
  ";c:/usr/gnu/bin;c:/usr/local/bin;c:/dos;c:/winnt35/system32;c:/win32"
   /* this is for NT version 3.5 defaults */
#endif


/* The value for PATH when invoking `command -p'.  This is only used when
   the Posix.2 confstr () function, or CS_PATH define are not present. */
#define STANDARD_UTILS_PATH \
  "/bin:/usr/bin:/usr/ucb:/usr/sbin:/etc:/usr/etc"

/* Define V9_ECHO if you want to give the echo builtin backslash-escape
   interpretation using the -e option, in the style of the Bell Labs 9th
   Edition version of echo. */
#define V9_ECHO

/* Define DEFAULT_ECHO_TO_USG if you want the echo builtin to interpret
   the backslash-escape characters by default, like the System V echo.
   This requires that V9_ECHO be defined. */
/* #define DEFAULT_ECHO_TO_USG */
#if !defined (V9_ECHO)
#  undef DEFAULT_ECHO_TO_USG
#endif

/* Define CONTINUE_AFTER_KILL_ERROR if you want the kill command to
   continue processing arguments after one of them fails. */
#define CONTINUE_AFTER_KILL_ERROR

/* Define BREAK_COMPLAINS if you want the non-standard, but useful
   error messages about `break' and `continue' out of context. */
#define BREAK_COMPLAINS

/* Define GETOPTS_BUILTIN if you want the Posix.2 `getopts' shell builtin
   compiled into the shell. */
#define GETOPTS_BUILTIN

/* When ALLOW_RIGID_POSIX_COMPLIANCE is defined, you can turn on strictly
   Posix compliant behaviour by setting the environment variable
   POSIXLY_CORRECT. */
#define ALLOW_RIGID_POSIX_COMPLIANCE

/* Define RESTRICTED_SHELL if you want the generated shell to have the
   ability to be a restricted one.  The shell thus generated can become
   restricted by being run with the name "rbash", or by setting the -r
   flag. */
/* #define RESTRICTED_SHELL */

/* Define DISABLED_BUILTINS if you want "builtin foo" to always run the
   shell builtin "foo", even if it has been disabled with "enable -n foo". */
/* #define DISABLED_BUILTINS */

/* Define PROCESS_SUBSTITUTION if you want the K*rn shell-like process
   substitution features "<(file)". */
/* Right now, you cannot do this on machines without fully operational
   FIFO support.  This currently include NeXT and Alliant. */
#if !defined (MKFIFO_MISSING) || defined (HAVE_DEV_FD)
#  define PROCESS_SUBSTITUTION
#endif /* !MKFIFO_MISSING */

/* Define PROMPT_STRING_DECODE if you want the backslash-escaped special
   characters in PS1 and PS2 expanded.  Variable expansion will still be
   performed. */
#define PROMPT_STRING_DECODE

/* Define BUFFERED_INPUT if you want the shell to do its own input
   buffering. */
#define BUFFERED_INPUT

/* Define INTERACTIVE_COMMENTS if you want # comments to work by default
   when the shell is interactive, as Posix.2a specifies. */
#define INTERACTIVE_COMMENTS

/* Define ONESHOT if you want sh -c 'command' to avoid forking to execute
   `command' whenever possible. */
#define ONESHOT

/* Default primary and secondary prompt strings. */
#define PPROMPT "bash\\$ "
#define SPROMPT "> "

/* Define SELECT_COMMAND if you want the Korn-shell style `select' command:
   select word in word_list; do command_list; done */
#define SELECT_COMMAND

#ifdef __NT_VC__
#include <stdio.h>
#include <setjmp.h>
#include "dtypes.h"
#include "command.h"
#define getenv(a) xgetenv(a)

char *xgetenv (const char *name);

enum nt_long_jmp_enum {
    nt_long_jmp_top_level=0,
    nt_long_jmp_return_catch=1,
    nt_long_jmp_readline_top_level=2,
    nt_long_jmp_test_exit_buf=3,
    nt_long_jmp_evalbuf=4,
    nt_long_jmp_subshell_top_level=5,

    /* used to size arrays */
    nt_long_jmp_size = 6};

extern void nt_longjmp(enum nt_long_jmp_enum j,int val, const char *file, int line);
extern int nt_setjmp(enum nt_long_jmp_enum j,jmp_buf a, int v, const char *file, int line);
extern int nt_setjmp_ret;
void nt_unwind_protect_jmp_buf(enum nt_long_jmp_enum j);

void nt_add_thread_open_file(int fd, const char *file, const int line);
void nt_remove_thread_open_file(int fd, const char *file, const int line);
void nt_init_jmp_critsec();
void nt_cleanup_jmp_critsec();
void nt_cleanup_childs_table();
void nt_restore_exec_stdhandles(int fd_stdin, int fd_stdout, int fd_stderr);
void nt_cleanup_exec_stdhandles();

/* added __FILE__ and __LINE__ for debugging purposes */
#define LONGJMP(a,b)  nt_longjmp(nt_long_jmp_##a,b, __FILE__, __LINE__)
#define SETJMP(v,a) v = setjmp(a); nt_setjmp(nt_long_jmp_##a,a, v, __FILE__, __LINE__);

/* add target descriptor to "to-be-closed-on-exit" list */
#define DUP(target,source) target=dup(source); nt_add_thread_open_file(target, __FILE__, __LINE__)
#define CLOSE(target) nt_remove_thread_open_file(target, __FILE__, __LINE__); close(target)

#define READ nt_read
extern int nt_open(const char * path, int oflag, const char *f, int l);
extern int nt_open3(const char * path, int oflag, int pmode, const char*f, int l);
extern FILE *FOPEN(const char *path, char *mode);
extern FILE *FDOPEN( int fildes, char *mode);

extern void nt_close_current_fds();
extern void nt_clean_current_fds();

struct fd_bitmap {
  long size;
  char *bitmap;
};

extern void nt_set_current_fds(struct fd_bitmap *bitmap);

int nt_get_thread_id();
int nt_get_process_id();
void nt_enter_critsec(const char *f, int line);
void nt_leave_critsec(const char *f, int line);
void nt_export_functions(const char *ipcFilename, const char *ipcFuncName);
void nt_delete_file(const char *pcFile);
int nt_file_exe_status(char ** name);
const char *nt_get_shell_binary();

int nt_execute_disk_command (WORD_LIST *words, REDIRECT *redirects,char *command, int pipe_in, int pipe_out, int async, struct fd_bitmap *fds_to_close, int nofork, const char * shell);
int execve_nt(char *command, char**args, char**env, int asynchronous);
int nt_read (int fd, char *buf, size_t count);
void nt_remove_cr(char * string, size_t count);
char * nt_remove_cr_string(char * str);
void nt_set_unlink_name(const char * name);
char * to_dos_slash(char * w);

#define OPEN(a,b) nt_open(a,b,__FILE__,__LINE__)
#define OPEN3(a,b,c) nt_open3(a,b,c,__FILE__,__LINE__)
#else
#define LONGJMP longjmp
#define SETJMP setjmp
#define READ read
#define OPEN open
#define FOPEN fopen
#define FDOPEN fdopen
#endif

#endif	/* !_CONFIG_H_ */
