/* nt_vc.c Window NT/Visual C++ specific routines */


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
   Software Foundation, 675 Mass Ave, Cambridge, MA 02139, USA.
*/

#include <windows.h>
#include <io.h>
#include <sys/types.h>
#include <malloc.h>
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <share.h>
#include "bashtypes.h"
/* #include <sys/file.h> */
#include "filecntl.h"
#include "posixstat.h"
#include <signal.h>
#include <process.h>
#include <general.h>
#include "nt_types.h"
#include "config.h"

#include <assert.h>

#ifndef assert
#define assert(x) ___myassert(x, __FILE__, __LINE__);
void ___myassert(int iVal, const char *f, int l)
{
   if (0 == iVal)
   {
      fprintf(stderr, "%s:%d - ASSERTIONG FAILURE!!!\n", f, l);
   }
}
#endif

#ifndef _SH_DENYNO
#define _SH_DENYNO SH_DENYNO
#endif

#if !defined (SIGABRT)
#define SIGABRT SIGIOT
#endif

#include <sys/param.h>
#include <errno.h>

#if !defined (errno)
extern int errno;
#endif

extern int interactive;

#if defined (HAVE_STRING_H)
#  include <string.h>
#else /* !HAVE_STRING_H */
#  include <strings.h>
#endif /* !HAVE_STRING_H */

#include "shell.h"
#include "y.tab.h"
#include "flags.h"
#include "hash.h"
#include "jobs.h"
#include "execute_cmd.h"
#include "general.h"

#include "sysdefs.h"
#include "builtins/common.h"
#include "builtins/builtext.h"	/* list of builtins */

#include <glob/fnmatch.h>
#include <tilde/tilde.h>

#if defined (BUFFERED_INPUT)
#  include "input.h"
#endif

/*
  #define JDBG(a,b)           { \
            FILE *fpj = fopen("joerg.dbg", "a"); \
            fprintf(fpj, "%s:%d "a"\n", __FILE__, __LINE__, b); \
            fclose(fpj); \
          }
*/

extern int last_command_exit_value;
extern void internal_error(const char * fmt,...);
extern void unwind_protect_var (int * var, char * value, int size) ;
extern int execute_builtin (Function * builtin, WORD_LIST *words, int flags,
   int subshell) ;
extern int execute_function (SHELL_VAR * var, WORD_LIST * words, int flags,
   struct fd_bitmap * fds_to_close, int async, int subshell) ;


static void nt_exit_thread();
static void nt_close_thread_open_files();
static void nt_add_running_child(HANDLE ipHandle, const char *pcCmd);
int nt_get_process_id();
int nt_get_thread_id();

void nt_enter_critsec(const char *f, int line);
void nt_leave_critsec(const char *f, int line);

static void remove_thread_stdio_save();

char *xstrdup_j(const char *pcSource, const char *f, int l);

void printNTError(DWORD iiErr)
{
   LPVOID lpMsgBuf;

   if (!FormatMessage(FORMAT_MESSAGE_ALLOCATE_BUFFER | FORMAT_MESSAGE_FROM_SYSTEM | FORMAT_MESSAGE_IGNORE_INSERTS,
                      NULL,
                      iiErr,
                      0,
                      (LPTSTR) &lpMsgBuf,
                      0,
                      NULL))
   {
      // Handle the error.
      return;
   }

   fprintf(stderr, lpMsgBuf);
   LocalFree( lpMsgBuf );
   return;
}


/**
 * Transform the given environment into an environment
 * string like it is used by the CreateProcess() function
*/

char * make_nt_env(const char ** env)
{
   int length = 0 ;
   const char **pt = env ;
   char *ret = NULL;
   char *dest = NULL;

   if (!pt)
   {
      return(NULL);
   }

   for ( ; NULL != *pt; pt++)
   {
      length += strlen(*pt) + 1;
   }

   if (!length)
   {
      return(NULL);
   }

   dest = ret = xmalloc(length + 1);
   if (NULL == dest)
   {
      return(NULL);
   }

   for (pt = env ; *pt; pt++)
   {
      const char *p = NULL;
      for (p = *pt; *p; p++)
      {
         *dest++ = *p ;
      }
      *dest++ = '\0' ;
   }
   *dest++ = '\0';

   return ret ;
}

/** Create an environment used to spawn a child process.
 * This is simply a copy of the original environment, but with
 * a NT-style PATH variable
 */
static char **nt_make_spawn_env(char **orig_env)
{
   int i;
   int iLength = 0;
   int iCount = 0;
   char **new_env = NULL;
   char *cur_str = NULL;

   if (NULL == orig_env)
   {
      return(NULL);
   }

   iCount = 1;
   for (i=0; NULL != orig_env[i]; i++)
   {
      iLength += 1 + strlen(orig_env[i]);
      iCount ++;
   }

   iLength += sizeof(char*) * (iCount + 1);
   new_env = (char **) xmalloc(iLength);
   if (NULL == new_env)
   {
      return(NULL);
   }

   memset(new_env, '\0', iLength);
   cur_str = (char *) &new_env[iCount];

   for (i=0; NULL != orig_env[i]; i++)
   {
      new_env[i] = cur_str;
      // fprintf(stderr, "IN: %s \n", cur_str ); fflush(stderr);

      if (5 < strlen(orig_env[i]))
      {
         /* check if this is the PATH variable and
          *
          * - bind it to PATH - ignore original case
          * - replace / with \
          * - replace all colons with semicolons but don't replace colons after drive letter
          */

         char acName[6] = "";
         unsigned int iIndex = 0;

        for (iIndex = 0; iIndex < sizeof(acName) -1; iIndex ++)
        {
           acName[iIndex] = toupper(orig_env[i][iIndex]);
        }

        if (0 == strcmp(acName, "PATH="))
        {
           unsigned int iStrLen = strlen(orig_env[i]);

           strcpy(cur_str, orig_env[i]);

           for (iIndex = 6 /* strlen "PATH=" */; iIndex < iStrLen; iIndex++)
           {
              if ('/' == cur_str[iIndex])
              {
                 cur_str[iIndex] = '\\';
              }
              else if (':' == cur_str[iIndex])
              {
                 /* replace : with ; if it is not a drive letter separator */
                 if ((';' != cur_str[iIndex-2]) ||
                     (!isalpha(cur_str[iIndex-1])) ||
                     ('.' == cur_str[iIndex-1]))
                 {
                    cur_str[iIndex] = ';';
                 }
              }
           }
        }
        else
        {
           /* simple copy source to dest*/
           strcpy(cur_str, orig_env[i]);
        }
      }
      else
      {
         /* simple copy source to dest*/
         strcpy(cur_str, orig_env[i]);
      }

      // fprintf(stderr, "ENV: %s \n", cur_str ); fflush(stderr);
      cur_str += strlen(orig_env[i]);
      *cur_str = '\0';
      cur_str++;
   }

/*
   for (i=0; NULL != orig_env[i]; i++)
   {
      fprintf(stderr, "orig_env: %s\n", orig_env[i]); fflush(stderr);
   }
   for (i=0; NULL != new_env[i]; i++)
   {
      fprintf(stderr, "new_env: %s\n", new_env[i]); fflush(stderr);
   }
*/
   return(new_env);
}

/**
 * This is a workaround for several problems which occured
 * when calling some external programs too often or too fast,
 *
 * It delays the starting of each process for the no. of millisecs defined
 * in the NT_BASH_DELAY_PROGRAM_EXECUTION environment variable.
 *
 * I know this is very ugly, but it helped to fix our problems.
 * If the variable is unset, no delay is done.
 *
 * Problem description:
 *
 * If too may processes are startet at the same time (like a
 * unix style pipe would do), it may occur, that one or more
 * of this processes fail showing a dialog box which says
 * "The application XXX failed to initialize properly." and
 * the error id "0xc000142" is displayed.
 */
static long get_sleep_time_before_spawn()
{
   char *pcSleepTime = get_string_value("NT_BASH_DELAY_PROGRAM_EXECUTION");
   long iVal = 0;

   if (NULL != pcSleepTime)
   {
      sscanf(pcSleepTime, "%ld", &iVal);
      if (0 > iVal) iVal = 0;
   }
   return(iVal);
}

static int spawnve_console(const char * command,const char ** args,
      const char ** export_env, int *perr)
{
   char * exp_args = 0 ;
   const char ** pt ;
   int length ;

    STARTUPINFOA cstart ;
    PROCESS_INFORMATION pstart;
    int result = EXECUTION_FAILURE;
    int exec_Inherit = 0 ;
    int exec_Flags =  CREATE_NEW_CONSOLE ;
    char * nt_env = /*make_nt_env*/ nt_make_spawn_env(export_env);

    /* fprintf(stderr, "spawnve_console %s\n", command); fflush(stderr); */
    memset(&cstart,0,sizeof(STARTUPINFO));
    cstart.cb = sizeof(STARTUPINFO);

    cstart.dwFlags = 0 ;
    cstart.hStdOutput = INVALID_HANDLE_VALUE; /* use stdout */
    cstart.hStdError = INVALID_HANDLE_VALUE; /* use stderr */
    cstart.hStdInput = INVALID_HANDLE_VALUE; /* use stdin */

    exec_Inherit = FALSE;
    length = 0 ;

   for (pt = args; *pt;pt++) length+=strlen(*pt);
   if (length)
   {
      exp_args = (char *) xmalloc(length+1);
   }
   else
   {
     *perr = EXECUTION_FAILURE;
      return(EXECUTION_FAILURE);
   }

   *exp_args = '\0' ;
   for (pt = args; *pt;pt++) strcat(exp_args,*pt);


   {
      int iSleepBeforeExec = get_sleep_time_before_spawn();

      if (0 < iSleepBeforeExec)
      {
         Sleep(iSleepBeforeExec);
      }
   }

   if (!CreateProcess(command,exp_args,0,0,exec_Inherit,exec_Flags,
        nt_env,0,&cstart,&pstart))
   {
     *perr = EXECUTION_FAILURE;
      result = EXECUTION_FAILURE ;
   }
   else
   {
      CloseHandle(pstart.hProcess);
      CloseHandle(pstart.hThread);
      result = EXECUTION_SUCCESS;
      *perr = EXECUTION_SUCCESS;
   }


   if (exp_args) xfree(exp_args) ;
   if (nt_env) xfree (nt_env);

   // fprintf(stderr, "spawnve_console %s => %d\n", command, result); fflush(stderr);

   return result ;
}

char * nt_remove_cr_string(char * str)
{
   const char * pt = str ;
   char * dest = str ;
   if (pt) for(; *pt; pt++) if (*pt != '\r') *dest++ = *pt ;
   *dest = '\0' ;
   return str ;
}

void nt_remove_cr(char * string, size_t count)
{
   const char * src = string ;
   char * dest = string ;
   for (;*src;src++) if (*src != '\r') *dest++ = *src ;
   while(dest < string + count) *dest++ = '\0' ;

}

int nt_read (int fd, char *buf, size_t count)
{
   int real = 0 ;
   size_t Count = count ;
   char *pt = buf ;
   int size = 0 ;

   for (;;)
   {
      int i;

/*      if (isatty(fd))
      {
         *pt = _getche();
         size = 1;
      }
      else
*/
      {
         size = read(fd,pt,count);
      }

      if (size > 0)
      {
         for (i = 0; i < size; i++)
         {
            if (pt[i] != '\r') buf[real++] = pt[i] ;
         }
         pt = buf + real ;
      }
      else if (!real)
      {
         return size;
      }

      if ((count >= Count) || (size < 1))
      {
         return real ;
      }
      count = Count - real ;
   } /* endfor */
}

parse_and_execute_from_thread (char *string, char *from_file, int interact, int from_thread);

DWORD nt_parse_and_execute_thread(LPVOID the_param)
{
   struct nt_parse_thread * param = (struct nt_parse_thread *) the_param ;

   /* Give command substitution a place to jump back to on failure,
      so we don't go back up to main (). */
   int  result;

   // fprintf(stderr, ">> 0x%x:0x%x ParseAndExecuteThread: %s\n", nt_get_process_id(), nt_get_thread_id(), param->string); fflush(stderr);
//   fprintf(stderr, ">> 0x%x:0x%x ParseAndExecuteThread: stdin=0x%x, stdout=0x%x, stderr=0x%x\n", nt_get_process_id(), nt_get_thread_id(), fileno(stdin), fileno(stdout), fileno(stderr)); fflush(stderr);
   /* result = SETJMP(top_level); */

   int save_stdin = 0, save_stdout = 0, save_stderr = 0;

   DUP(save_stdin, 0);
   DUP(save_stdout, 1);
   DUP(save_stderr, 2);

   nt_add_thread_open_file(0, __FILE__, __LINE__);
   nt_add_thread_open_file(1, __FILE__, __LINE__);
   nt_add_thread_open_file(2, __FILE__, __LINE__);

   SETJMP(result, top_level);

   if (!result)
   {
       int exit_code = 0;

      char *pcString = NULL;
      char *pcFile = NULL;

      if (NULL != param->string)
      {
         pcString = MYSTRDUP(param->string);
      }

      if (NULL != param->from_file)
      {
         pcFile = MYSTRDUP(param->from_file);
      }

      exit_code = parse_and_execute_from_thread(pcString,
                                                pcFile,
                                                param->interact,
                                                1);

      nt_restore_exec_stdhandles(save_stdin, save_stdout, save_stderr);
      CLOSE(0);
      CLOSE(1);
      CLOSE(2);

      if (NULL != pcFile)
      {
         free(pcFile);
         pcFile = NULL;
      }

      nt_exit_thread();
      ExitThread(exit_code) ;
   }


   nt_restore_exec_stdhandles(save_stdin, save_stdout, save_stderr);
   CLOSE(0);
   CLOSE(1);
   CLOSE(2);
   nt_exit_thread();

   if (result == EXITPROG)
      ExitThread (last_command_exit_value);
   else ExitThread (EXECUTION_FAILURE);
   return 0 ;
}

/** get the length of the buffer strcpyquote() would
 * need to create a quoted version of this string
 */
int strlenquote(const char * str)
{
   const char * pt = str ;
   int len =  0;
   int bs_count = 0;

   for (;*pt;pt++,len++)
   {
      if ('\\' == *pt)
      {
         bs_count ++;
      }
      else
      {
         if ('"' == *pt)
         {
            /* need another byte for the escape char */
            len++ ;
            len += bs_count; /* need to escape backslashes */
         }
         bs_count = 0;
      }
   }

   /* always need two " around the string */
   len+=2 ;
   len += bs_count; /* need to escape backslashes */

   if (!len)
   {
      len = 1 ;
   }
   return len ;
}

/**
 * Get a quoted version of the given string.
 * Use strlenquote() to get the minimum length of the pt buffer.
 *
 * This function quotes all " with backslashes.
 * All backslashes appearing before a " have also be quoted
 * (NT leaves all other backslashes untouched but needs backslashes
 * direct before an " quoted)
 *
 * These characters are escaped with a backslash.
 *
 * All parameters are included in double quotes
 */
char * strcpyquote(char * pt,const char * str)
{
   const char * ck ;
   char use = 0 ;
   char * dest = pt ;
   char bs_count = 0;


   *dest++ = '"'; /* leading quotes */

   for (ck = str;*ck;ck++)
   {
      if ('\\' == *ck)
      {
         bs_count ++;
      }
      else
      {
         if ('"' == *ck)
         {
            /* add quotation for backslashes */
            for (;bs_count != 0; bs_count--)
            {
               *dest++ = '\\';
            }

            *dest++ = '\\' ;
         }
         bs_count = 0;
      }
      *dest++ = *ck ;
   }

   /* add quotation for backslashes */
   for (;bs_count != 0; bs_count--)
   {
      *dest++ = '\\';
   }

   *dest++ = '"'; /* trailling quotes */
   *dest = 0 ;

   return pt ;
}

/*
nt_print_wordlist(WORD_LIST *list)
{
  WORD_LIST *l;
  int i = 0;

  l = list;

  while (NULL != l->next)
  {
    i++;
    l = l->next;
    printf ("\nWORDS[0x%x, %d] => '%s'", list, i, l->word->word);
  }
  printf("\n");
}
*/

/**
 * Cons up a new array of words.  The words are taken from LIST,
 * which is a WORD_LIST *.  Absolutely everything is malloc'ed,
 * so you should free everything in this array when you are done.
 * The array is NULL terminated.
 */
static char **
nt_make_word_array (first,list)
   const char * first ;
     WORD_LIST *list;
{
  char * pt ;
  int count = first ? 3 : list_length (list) ;
  char **array = (char **)xmalloc ((1 + count) * sizeof (char *));
  count = 0 ;

  if (first)
  {
     WORD_LIST * lst = list ;
     const char * bltin = "-c" ;
     int length = 0 ;

     array[count++] = pt =  xmalloc (1 + strlen (first));
     strcpy(pt,first);

     array[count++] = pt =  xmalloc (1 + strlen (bltin));
     strcpy(pt,bltin);

      while (lst)
      {
         const char *word = lst->word->word ;
         length += 1 + strlenquote(lst->word->word);
         lst = lst->next ;
      }

      if (length > 0)
      {
         int first = 1 ;

         array[count++] =  pt = xmalloc (length);
         *pt = '\0' ;
         while (list)
         {
            if (!first)
            {
               *pt++ =  ' ';
            }
            else
            {
               first = 0 ;
            }
            pt = strcpyquote (pt,list->word->word);
            list = list->next ;
         }
      }
      array[count] = NULL;
      return array ;
  }

  for (; list; count++)
  {
     char * word = list->word->word ;
     if (!count)
     {
        array[count] = xmalloc (1 + strlen (word)) ;
        strcpy(array[count], word);
     }
     else
     {
        array[count] = xmalloc (1 + strlenquote (word)) ;
        strcpyquote(array[count], word);
     }
     list = list->next;
  }
  array[count] = (char *)NULL;
  return (array);
}

nt_free_word_array (char *array[])
{
   int i=0;

   for (i=0; NULL != array[i] ; i++)
   {
      xfree(array[i]);
      array[i] = NULL;
   }
   xfree(array);
}

/** Table of temporary files */
struct my_tempfile_table
{
      char *pcTempfileName;
      struct my_tempfile_table *pNext;
};

static struct my_tempfile_table *gpTempfileTable = NULL;

static void addTempfile(const char *ipcTempfileName)
{
   struct my_tempfile_table *pNext = (struct my_tempfile_table *) malloc(sizeof(struct my_tempfile_table));

   if (NULL == pNext)
   {
      return;
   }
   memset(pNext, '\0', sizeof(struct my_tempfile_table));

   pNext->pcTempfileName = strdup(ipcTempfileName);
   if (NULL == pNext->pcTempfileName)
   {
      return;
   }

   nt_enter_critsec(__FILE__, __LINE__);
   if (NULL == gpTempfileTable)
   {
      gpTempfileTable = pNext;
   }
   else
   {
      struct my_tempfile_table *pPrevious = gpTempfileTable;

      while (NULL != pPrevious->pNext)
      {
         pPrevious = pPrevious->pNext;
      }

      pPrevious->pNext = pNext;
   }
   nt_leave_critsec(__FILE__, __LINE__);
}

void nt_delete_file(const char *pcFile)
{
   DeleteFile(pcFile);
}

static void deleteTempfiles()
{
   struct my_tempfile_table *pPrevious = NULL, *pCurrent = NULL, *pNext = NULL;

   nt_enter_critsec(__FILE__, __LINE__);

   pCurrent = gpTempfileTable;
   while (NULL != pCurrent)
   {
      pNext = pCurrent->pNext;

      if (DeleteFile(pCurrent->pcTempfileName))
      {
         if (pPrevious)
         {
            pPrevious->pNext = pNext;
         }
         else
         {
            gpTempfileTable = pNext;
         }
         free(pCurrent->pcTempfileName);
         free(pCurrent);
      }
      else
      {
         pPrevious = pCurrent;
      }
      pCurrent = pNext;
   }
   nt_leave_critsec(__FILE__, __LINE__);
}

static const char *lastTempfileName()
{
   const char *pcResult = NULL;
   struct my_tempfile_table *pCurrent = NULL;

  nt_enter_critsec(__FILE__, __LINE__);
  pCurrent = gpTempfileTable;

  while (NULL != pCurrent)
  {
     if (NULL == pCurrent->pNext)
     {
        pcResult = pCurrent->pcTempfileName;
        break;
     }
     pCurrent = pCurrent->pNext;
  }
  nt_leave_critsec(__FILE__, __LINE__);
  return(pcResult);
}
/* ------------------------------------------------------------------------ */

// const char * nt_unlink_name = 0;
int nt_disk_pipe_in = 0 ;

void nt_set_unlink_name(const char * name)
{
   deleteTempfiles();
   if (NULL != name)
   {
      addTempfile(name);
   }
}

char * to_dos_slash(char * w)
{
   char * pt ;
   if (w) for (pt = w; *pt ; pt++) if (*pt == '/') *pt = '\\' ;
   return w ;
}

/**
 * spawnve seems to be buggy, some programs (especially tivoli progs)
 * hung after startup without any reason.
 * I got also dialog boxes saying "The application failed to initialize properly"
 * ... after using CreateProcess, those strange problems are gone ...
 * (Maybe it's no bug, but a feature - but sorry - I didn't find
 *  any documented reason for this)
 *
 * This is my own spawnve() implementation based on CreateProcess(),
 * it has the same interface like the original windows spawnve.
 */
int my_spawnve(int mode, const char *pcShortCommand, char **args, char **spawn_env, int *perr)
{
   char *pcCmdStr = NULL;
   int i = 0;
   int iCount = 0;
   int iCmdLen = 0;
   int iCreateRc = 0;
   STARTUPINFO si;
   PROCESS_INFORMATION pi;
   int pid = 0;
   char * nt_env = make_nt_env /*nt_make_spawn_env*/((const char **) spawn_env);
   DWORD result = EXECUTION_FAILURE;

   ZeroMemory(&pi, sizeof(PROCESS_INFORMATION));
   ZeroMemory(&si, sizeof(STARTUPINFO));
   si.cb=sizeof(STARTUPINFO);
   si.dwFlags =  STARTF_USESHOWWINDOW;
   si.wShowWindow = SW_SHOW;

   si.hStdOutput = INVALID_HANDLE_VALUE; /* use stdout */
   si.hStdError = INVALID_HANDLE_VALUE; /* use stderr */
   si.hStdInput = INVALID_HANDLE_VALUE; /* use stdin */

   iCount = 1;
   iCmdLen = 1 + strlen(pcShortCommand);
   for (i=1; args[i] != NULL; i++)
   {
      iCmdLen += strlen(args[i]);
      iCount++;
   }
   pcCmdStr = (char *) xmalloc(iCmdLen + iCount + 1);
   if (NULL == pcCmdStr)
   {
      pid = EXECUTION_FAILURE;
      *perr = EXECUTION_FAILURE;
      goto _quit_;
   }
   memset(pcCmdStr, '\0', iCmdLen + iCount + 1);

   strcpy(pcCmdStr, args[0]);
   for (i=1; args[i] != NULL; i++)
   {
      strcat(pcCmdStr, " ");
      strcat(pcCmdStr, args[i]);
   }

   {
      int iSleepBeforeExec = get_sleep_time_before_spawn();

      if (0 < iSleepBeforeExec)
      {
         Sleep(iSleepBeforeExec);
      }
   }

   // fprintf(stderr, "CreateProcess(%s, %s))\n", pcCmdStr, args[0]);fflush(stderr);
   iCreateRc = CreateProcess(NULL, /* application name */
                             pcCmdStr, /* command string */
                             NULL, /* sec attribs */
                             NULL, /* thread sec attribus */
                             TRUE, /* inherit handles */
                             0,
                             nt_env, /* environment */
                             NULL, /* current directory */
                             &si, /* startup info */
                             &pi); /* process info */
   // fprintf(stderr, "CreateProcess(%s) => %d\n", pcCmdStr, iCreateRc); fflush(stderr);
   if (0 == iCreateRc)
   {
      result = EXECUTION_FAILURE;
      *perr = EXECUTION_FAILURE;
      // printNTError(GetLastError());
      goto _quit_;
   }

   pid = pi.dwProcessId;

   if (_P_WAIT == mode)
   {
      /* wait for the child to terminate */
      WaitForSingleObject(pi.hProcess, INFINITE);

      GetExitCodeProcess(pi.hProcess, &result);
      CloseHandle(pi.hProcess);
      CloseHandle(pi.hThread);
      *perr = EXECUTION_SUCCESS;
   }
   else
   {
      /* add handle to "to-be-closed" list */
      nt_add_running_child(pi.hProcess, pcCmdStr);
      /* close handles no longer needed */
      CloseHandle(pi.hThread);
      result = EXECUTION_SUCCESS; /* fork succeeded */
      *perr = EXECUTION_SUCCESS;
   }

  _quit_:

   // fprintf(stderr, "my_spawnve %s => %d/%d\n", pcCmdStr, result,*perr); fflush(stderr);
   if (NULL != pcCmdStr)
   {
      xfree(pcCmdStr);
   }
   if (NULL != nt_env)
   {
      xfree(nt_env);
   }
//   if (NULL != nt_spawn_env)
//   {
//      free(nt_spawn_env);
//   }

   return(result);
}

/**
 * Execute a simple command that is hopefully defined in a disk file
 * somewhere.
 *
 * Comments from orignal routine  --- with NT annotation
 *
 * 1) fork ()   ---   does not exist on NT
 * 2) connect pipes   --- first save existing pipes since we did not fork
 * 3) look up the command
 * 4) do redirections
 * 5) execve ()   --- use spawnve
 * 6) If the execve failed, see if the file has executable mode set.
 *
 * If so, and it isn't a directory, then execute its contents as
 * a shell script.
 *
 * Note that the filename hashing stuff has to take place up here,
 * in the parent.  This is probably why the Bourne style shells
 * don't handle it, since that would require them to go through
 * this gnarly hair, for no good reason.
 */
int nt_execute_disk_command (words, redirects, command, pipe_in, pipe_out,
              async, fds_to_close, nofork, shell )
     WORD_LIST *words;
     REDIRECT *redirects;
     char *command;
     int pipe_in, pipe_out, async;
     struct fd_bitmap *fds_to_close;
     int nofork;    /* Don't fork, just exec, if no pipes */
     const char * shell; /* shell name for internal command */
{
   /* as a first approximation just do the redirection of stdin, stdout
      and stderr and spawn */
   /* This leaves garbage open and signals set incorrectly -- we will
      fix this later. The complication is that we must pass the information
      to do this in come reasoable way to the spawned proces, have it clean
      things up and then exec the real target. */

   int result = EXECUTION_SUCCESS;
   int termstat = 0 ;
   char ** args ;
   int save_stdin = 0, save_stdout = 0, save_stderr = 0;
   int mode = 0;
   int err = EXECUTION_FAILURE;

   // fprintf(stderr, "nt_execute_disk_command: %s:%d - %s\n", __FILE__, __LINE__, command);
//   nt_print_wordlist(words);

   if (async || (pipe_out != NO_PIPE))
   {
      mode = /*_P_DETACH */ _P_NOWAIT ;
   }
   else
   {
      mode = _P_WAIT ;
   }

   to_dos_slash(command);

   if (words)
   {
      if (words->word) to_dos_slash(words->word->word);
   }


   fflush(stdout);
   fflush(stderr);

   DUP(save_stdin, 0);
   DUP(save_stdout, 1);
   DUP(save_stderr, 2);

   start_pipeline();

   do_piping(pipe_in,pipe_out);

   /* Execve expects the command name to be in args[0].  So we
      leave it there, in the same format that the user used to
     type it in.
   */
   args = nt_make_word_array (shell,words);

   if ((NULL == command) && ((NULL == args) || (NULL == args[0])))
   {
      /* spawn would crash */
      result = EXECUTION_FAILURE;
      goto _quit_;
   }


   /* things NOT done in child */
   /* restore_original_signals (); */
   /* if (async) setup_async_signals (); */
   /*    if (async) {
    *      old_interactive = interactive;
    *      interactive = 0;
    *    }
    *      subshell_environment = 1;
    */

   /* This functionality is now provided by close-on-exec of the
     file descriptors manipulated by redirection and piping.
     Some file descriptors still need to be closed in all children
     because of the way bash does pipes; fds_to_close is a
     bitmap of all such file descriptors. */
   /*
    *      if (fds_to_close)
    *   close_fd_bitmap (fds_to_close);
    *
    */

   if (redirects && (do_redirections2(redirects, 1, 0, 0, 1) != 0))
   {
#if defined (PROCESS_SUBSTITUTION)
      /* Try to remove named pipes that may have been created as the
         result of redirections. */
      unlink_fifo_list ();
#endif
      result = EXECUTION_FAILURE;
      goto _quit_;
   }

   /* if (async)   interactive = old_interactive; */


   /* nt_leave_critsec(__FILE__, __LINE__);*/
   {
      char *pcShortCommand = NULL;
      char *pcCmdStr = command ? command : args[0];
      char **spawn_env = NULL;

      spawn_env = nt_make_spawn_env(export_env);

      pcShortCommand = (char *) alloca(strlen(pcCmdStr) +1);

      if (NULL == pcShortCommand)
      {
         pcShortCommand = pcCmdStr;
      }
      else
      {
         if (0 >= GetShortPathName(pcCmdStr,
                                   (LPTSTR) pcShortCommand,
                                   strlen(pcCmdStr) + 1))
         {
            pcShortCommand = pcCmdStr;
         }
      }

      /** 2007-09-20 joerg
       *
       * Needed to split spawn returncode into two parts:
       *
       * - The returncode is eighter EXECUTION_SUCCESS or EXECUTION_FAILURE for async commands
       *   or the childs' exitcode for sync commands.
       *
       * - The errorcode (err) is one of EXECUTION_SUCCESS and EXECUTION_FAILURE in both cases.
       *   It signals if the process execution was successful or not.
       *
       * So we're able to find out wether process starting failed or the process
       * just returned 1.
       */
      if (!redirects && async && pipe_in == NO_PIPE && pipe_out == NO_PIPE)
      {
         result =  spawnve_console(((pcShortCommand && !shell)? pcShortCommand:args[0]),
                            (const char **) args, (const char **)spawn_env, &err);
      }
      else
      {
         char *pcArg0Sav = args[0];
         args[0] = pcShortCommand; /* batch files didn't work else */
         result =  my_spawnve(mode,((pcShortCommand && !shell)? pcShortCommand:args[0]), args, spawn_env, &err);
         args[0] = pcArg0Sav;
      }


      if (NULL != spawn_env) xfree(spawn_env);
   }

   if (EXECUTION_SUCCESS != err)
   {
      /* spawn failed */
      if (!command)
       {
         switch (errno)
         {
            case EINVAL:
               report_error("internal error in nt_execute_disk_command");
               /* fall through */
            case E2BIG:
            case ENOMEM:
               perror("Error type");
               break ;
            case ENOENT:
            case ENOEXEC:
               report_error ("%s: command not found", args[0]);
         }

         result = EXECUTION_FAILURE;
         goto _quit_; /* do not exit because we have not forked */
       }

      // fprintf(stderr, ">shell_execve_async: %s\n", command);
      result = shell_execve_async(command,args,export_env, _P_WAIT != mode);
      // fprintf(stderr, "<shell_execve_async: %s => %d\n", command, result);
      goto _quit_;
   }


/*	if (mode == _P_WAIT)
   {
      cwait(&termstat,pid,_WAIT_GRANDCHILD);
   }
*/
  _quit_:


   /* restore input and output */
   nt_restore_exec_stdhandles(save_stdin, save_stdout, save_stderr);


   if (NULL != args)
   {
      nt_free_word_array(args);
      args=NULL;
   }

   return result ;
}

/** convert backslashes to slashes */
char * to_unix_slash(char * str)
{
   char * tmp = str ;
   if (tmp) for (; *tmp; tmp++) if (*tmp == '\\') *tmp = '/' ;
   return str ;
}


pid_t
nt_execute_builtin_command (words, redirects, command, pipe_in, pipe_out,
              async, fds_to_close, flags, shell, builtin, func )
     WORD_LIST *words;
     REDIRECT *redirects;
     char *command;
     int pipe_in, pipe_out, async;
     struct fd_bitmap *fds_to_close;
     int flags;    /* Don't fork, just exec, if no pipes */
     const char * shell; /* shell name for internal command */
    Function * builtin;
    SHELL_VAR * func ;
{
   int ret ;
   int exec_disk = 0 ;
   int disk_pipe_out = 0 ;
   int svstdin,svstdout,svstderr ;
   char * temp_name = 0; /* name of temporary file */


   // fprintf(stderr, ">nt_execute_buildin_command %s\n", command); fflush(stderr);
/*
   nt_print_wordlist(words);
*/

   if (async || pipe_in != NO_PIPE || (-1 == nt_getPipeAssoc(pipe_out))) exec_disk = 1 ;

    if (!exec_disk)
    {
       const char * prefix = "sh" ;
       const char * temp_dir = getenv("TEMP");
       char acFullPrefix[256] = "";

       nt_enter_critsec(__FILE__, __LINE__);
       sprintf(acFullPrefix, "%d.%s", GetCurrentProcessId(), prefix);

       if (temp_dir) temp_name = tempnam((char*) temp_dir, acFullPrefix);
       if (!temp_name) temp_name = tmpnam(0);

       if (temp_name)
       {
          to_unix_slash(temp_name);
          disk_pipe_out= OPEN(temp_name,O_WRONLY|O_CREAT);
          if (disk_pipe_out > 0)
          {
             nt_set_unlink_name(temp_name);
             SET_CLOSE_ON_EXEC(disk_pipe_out);
          }
          else temp_name = 0 ;
       }
       nt_leave_critsec(__FILE__, __LINE__);


       if (!temp_name)  exec_disk = 1 ;
       else
       {
          DUP(svstdout, 1);
          fflush(stderr);

          /* make stdout (fileno 1) point to pipe_out */
          if (dup2(disk_pipe_out,1) < 0) {
             internal_error ("cannot duplicate fd %d to fd 1: %s",
                             disk_pipe_out, strerror (errno));
             exec_disk = 1;
             CLOSE(svstdout);
          } else {
             CLOSE(pipe_out);
             DUP(svstdin, 0);
             DUP(svstderr, 2);
          }
       }
       CLOSE(disk_pipe_out);
    }

    if (!exec_disk)
    {
       if (builtin) ret = execute_builtin(builtin,words,flags,1);
      else ret = execute_function (func, words, flags, fds_to_close, async, 1);

       fflush(stdout);
       CLOSE(1);

       if (ret > -1)
       {
          nt_disk_pipe_in = OPEN( temp_name, O_RDONLY);
          if (nt_disk_pipe_in < 0) {
             ret = -1 ;
             perror("bash temp file");
          }

          /* make fdPipeEnd point to nt_disk_pipe_in */
          {
            int fdPipeEnd = nt_getPipeAssoc(pipe_out);

            if (0 < fdPipeEnd)
            {
               dup2(nt_disk_pipe_in, fdPipeEnd);
            }
          }
          CLOSE(nt_disk_pipe_in);

       }
       nt_restore_exec_stdhandles(svstdin, svstdout, svstderr);
   }
    else
   {
      ret = nt_execute_disk_command ( words, redirects, command, pipe_in,
                                      pipe_out, async, fds_to_close, flags, shell )  ;
   }

    nt_set_unlink_name(NULL);
    return ret ;
}
#define MAX_STRING 512
static void force_b_err(const char *nsg)
{
   fprintf(stderr,"Error in force binary: \"%s\"\n", nsg);
   exit(1);
}

static const char * force_binary(const char * mode, char * buf)
{
   int length = 0 ;
   const char * ptr = mode ;
   char * dest = buf ;
   if (!mode) force_b_err("null mode");
   for (; *ptr; ptr++) {
      if (*ptr == 'b') return mode;
      if (*ptr == 't') return mode;
      if (length++ > MAX_STRING) {
         force_b_err("mode too long");
         return mode ;
      }
      *dest++ = *ptr ;
   }
   *dest++ = 'b' ;
   *dest++ = '\0' ;
   return buf ;
}

int nt_open(const char * path, int oflag, const char *f, int l)
{
   int fd = 0;

   if (!(oflag & _O_TEXT)) oflag |= _O_BINARY ;

   fd = sopen((char *) path, oflag | _O_NOINHERIT, _SH_DENYNO ,_S_IREAD | _S_IWRITE);

   /* see comment below in nt_open3() */
   if (oflag & O_APPEND)
   {
      _lseek(fd, 0, SEEK_END);
   }

   return (fd);
}

int nt_open3(const char * path, int oflag, int pmode,const char *f, int l)
{
   int fd = 0;

   if (!(oflag & _O_TEXT)) oflag |= _O_BINARY ;
   fd = sopen((char *) path,oflag | _O_NOINHERIT,_SH_DENYNO,pmode);

   /*
    * this is very, very strange:
    *
    * it seems like the file pointer isn't correctly
    * positioned sometimes when appending to a file,
    * so we have to correct this here ..
    */
   if (oflag & O_APPEND)
   {
      _lseek(fd, 0, SEEK_END);
   }
   return (fd);
}

#ifdef __NT_EGC__
FILE * _fsopen(char *, const char *, int);
#endif

FILE * FOPEN(const char *path, char * mode)
{
   char buf[MAX_STRING+2] ;
   return _fsopen((char*) path,force_binary(mode,buf),_SH_DENYNO);
}

FILE * FDOPEN(int filedes, char * mode)
{
   char buf[MAX_STRING+2] ;
   return fdopen(filedes,force_binary(mode,buf));
}

const char ** nt_split(const char * lst)
{
   const char * pt ;
   const char * start = lst ;
   char ** ret ;
   int count = 1 ;
   for (pt = lst; *pt; pt++) if (*pt == ' ') count++ ;
   ret = (char **) xmalloc(sizeof(char *) * (count + 1)) ;
   for (count = 0, pt = lst; *pt; pt++) if (*pt == ' ' || !pt[1]) {
      int length ;
      char * r ;
      int set_exit = *pt != ' ' ;
      if (set_exit) pt++ ;
      length = pt - start ;
      if (length < 1) {
         start = pt ;
         continue ;
      }
      r = ret[count++] = (char *) xmalloc(length+1);
      strncpy(r,start,length);
      r[length] = '\0' ;
      start = pt ;
      if (set_exit) break ;
   }
   ret[count] = 0 ;
   return((const char**) ret);
}

const char ** nt_add_split(const char ** base, const char * add)
{
   const char ** spl = nt_split(add);
   int count = 0 ;
   const char ** ret;
   const char ** pt ;
   for (pt = base; *pt;pt++,count++);
   for (pt = spl; *pt;pt++,count++);
   ret = (const char **) xmalloc(sizeof(char *) * (count + 1));
   for (count=0,pt = base; *pt;pt++) ret[count++] = *pt ;
   for (pt = spl; *pt;pt++) ret[count++] = *pt ;
   ret[count] = 0;
   xfree(spl);
   return ret ;
}

/* Call repeatedly to get all names to try */
/* base = 0 on all but first call */
static const char * try_names(const char * base)
{
   static const char * base_to_try[] = {"exe","com","sh","pl","bat",0};
   static const char ** to_try = 0 ;
   static const char ** curr = 0 ;
   static const char * orig = 0 ;
#define MAX_PATH_ALLOWED (_MAX_PATH + 128)
   static char buf[MAX_PATH_ALLOWED+5] ;
   static char * dest = 0;

   if (!to_try) {
/**************
 *		const char * nt_exe_suf = getenv("NT_BASH_EXE_SUF");
 *		if (nt_exe_suf) to_try = nt_split(nt_exe_suf);
 *		else if (nt_exe_suf = getenv("NT_BASH_EXE_ADD_SUF"))
 *			to_try=nt_add_split(base_to_try, nt_exe_suf);
 *		if (!to_try) to_try = base_to_try ;
 *		curr = to_try ;
 ************/
      to_try = base_to_try ;
      curr = to_try ;
   }
   if (base) {
      int has_suffix = 0 ;
      int length = 0 ;
      const char * pt ;
      curr = to_try ;
      orig = base ;
      to_try = base_to_try ;
      for (dest = buf, pt = orig; *pt&&(length<MAX_PATH_ALLOWED);
        pt++,length++) {
         *dest++ = *pt ;
         if (*pt == '.') has_suffix = 1 ;
         else if (*pt == '/' || *pt == '\\') has_suffix = 0 ;
      }
      if (has_suffix) {
         orig = 0 ;
         curr = 0 ;
         dest = 0 ;
         return 0 ;
      }
      *dest++ = '.' ;
   }
   if (!*curr) return 0 ;
   strcpy(dest,*curr++);
   return buf ;
}

const char * find_hashed_filename_nt (const char * pathname)
{
   const char * pt = pathname ;
   const char * try = find_hashed_filename (pathname);
   const char * p = pathname ;

   if (try) return try ;
   if (!pathname) return pathname;
   while (try = try_names(p)) {
      p = 0 ;
      try = find_hashed_filename (try);
      if (try) return try ;
   }
   return 0 ;
}

int nt_file_exe_status(char ** name)
{
   char * nm = *name ;
   int orig_status = file_status(nm) ;
   const char * try ;
   int reg_exe = FS_EXISTS | FS_EXECABLE ;
   if ((orig_status & reg_exe) == reg_exe) return orig_status ;
   while (try = try_names(nm)) {
        int status = file_status(try);
        nm = 0 ;
      if ((status & reg_exe) == reg_exe) {
         char * ret = xmalloc(strlen(try)+1);
         strcpy(ret, try);
         xfree(*name);
         *name = ret ;
         return status ;
      }
    }
    return orig_status ;
}

/** get the nt thread id of the current thread */
int nt_get_thread_id()
{
   return (int) GetCurrentThreadId();
}

/** get the nt process id of the current process */
int nt_get_process_id()
{
   return((int) GetCurrentProcessId());
}

/* longjump and setjmp for multi threaded processes */

struct my_process_jump_table
{
      int pid;
      jmp_buf jmpbufs[nt_long_jmp_size];
      struct my_process_jump_table *next;
};
static void clear_current_thread_jump_space();

static struct my_process_jump_table * the_jump_table = NULL;

/** global critical section object to serialize access
 * to global variables from serveral threads
 */
static CRITICAL_SECTION CriticalSectionJumpTable;

/** enter an critical section => block until all other threads leaved the critical sections */
void nt_enter_critsec(const char *f, int line)
{
   EnterCriticalSection(&CriticalSectionJumpTable);
}


void nt_leave_critsec(const char *f, int line)
{
   LeaveCriticalSection(&CriticalSectionJumpTable);
}


/** initialize the global critical section object (to be called in the main() function)*/
void nt_init_jmp_critsec()
{
  InitializeCriticalSection(&CriticalSectionJumpTable);
}

/** cleanup the global critical section object */
void nt_cleanup_jmp_critsec()
{
  DeleteCriticalSection(&CriticalSectionJumpTable);
}

static void nt_exit_thread()
{
   int id = nt_get_thread_id();

   nt_enter_critsec(__FILE__, __LINE__);
   {

      clear_current_thread_jump_space();
      nt_close_thread_open_files();
      remove_thread_stdio_save();
   }
   nt_leave_critsec(__FILE__, __LINE__);
}

/** get the jump table for the current thread */
static struct my_process_jump_table *get_current_threads_process_jump_table(short iCreateNew)
{
   struct my_process_jump_table *this = the_jump_table; /**< entry currently working on */
   struct my_process_jump_table *avail = NULL; /**< last available (not yet used) entry */
   struct my_process_jump_table *last = NULL; /**< last entry */
   int id = nt_get_thread_id() ; /**< id of the current thread */

   /* search for an existing entry for this thread */
   for (;this; this=this->next)
   {
      if (this->pid == id)
      {
         /* that's it */
         return(this);
         break ;
      }

      if (0 == this->pid)
      {
         avail = this;
      }

      last = this;
   }

   if (0 == iCreateNew)
   {
      return(NULL);
   }

   /* is there an existing one free? */
   if (NULL != avail)
   {
      avail->pid = id;
      memset(avail->jmpbufs, '\0', sizeof(avail->jmpbufs));
      return(avail);
   }

   /* create a new one */
   this = (struct my_process_jump_table *) malloc(sizeof(struct my_process_jump_table));
   if (NULL != this)
   {
      memset(this, '\0', sizeof(struct my_process_jump_table));
      this->pid = id;

      if (last)
      {
         last->next = this ;
      }
      else
      {
         the_jump_table = this ;
      }
   }

   return(this);
}

/** get the jmp_buf for the current thread and the given index j,
 * returns NULL if no jmp_buf exists for this thread
 */
static jmp_buf*  get_long_jmp_buf(enum nt_long_jmp_enum j)
{
   struct my_process_jump_table *thread_jump_table = NULL;

   thread_jump_table = get_current_threads_process_jump_table(0);
   if (NULL != thread_jump_table)
   {
      return(&thread_jump_table->jmpbufs[j]);
   }
   return(NULL);
}

/** get the jmp_buf for the current thread and the given index j,
 * creates a new element frot his thread if needed
 */
static jmp_buf* get_jmp_space(enum nt_long_jmp_enum j)
{
   struct my_process_jump_table *thread_jump_table = NULL;

   thread_jump_table = get_current_threads_process_jump_table(1);
   if (NULL != thread_jump_table)
   {
      return(&thread_jump_table->jmpbufs[j]);
   }
   return(NULL);
}

/** remove the jump information for the current thread from the list
 */
static void clear_current_thread_jump_space()
{
   struct my_process_jump_table *thread_jump_table = NULL;

   thread_jump_table = get_current_threads_process_jump_table(0);
   if (NULL != thread_jump_table)
   {
      thread_jump_table->pid = 0;
   }
}

/** thread-safe setjmp implementation for NT */
int nt_setjmp(enum nt_long_jmp_enum j, jmp_buf a, int nt_setjmp_ret, const char *file, int line)
{
   jmp_buf *save ;

   if (nt_setjmp_ret)
   {
      return(nt_setjmp_ret);;
   }

   nt_enter_critsec(file, line);

   save = get_jmp_space(j);

   if (NULL != save)
   {
      memcpy(*save,a,sizeof(jmp_buf));
   }

   nt_leave_critsec(file, line);
   return 0 ;
}

void nt_unwind_protect_jmp_buf(enum nt_long_jmp_enum j)
{
   jmp_buf * jmp_to = NULL;

   nt_enter_critsec(__FILE__, __LINE__);
   {
      jmp_to = get_jmp_space(j);
   }
   nt_leave_critsec(__FILE__, __LINE__);

   unwind_protect_var((int *) jmp_to,(char *) jmp_to,sizeof (jmp_buf));
}

/** thread-safe longjmp implementation for NT */
void nt_longjmp(enum nt_long_jmp_enum j, int val, const char *file, int line)
{
   jmp_buf *jmp_to = NULL;

   nt_enter_critsec(file,line);
   {

      jmp_to = get_long_jmp_buf(j);
      assert(NULL != jmp_to);
   }
   nt_leave_critsec(file,line);
   longjmp(*jmp_to,val);
}

int nt_execute_shell_script(char *command, char **args, char **env, int async)
{
   char acCommandLine[1024] = "";
   const char *pcShellName = nt_get_shell_binary();

   char **ppcArgsNew = NULL;
   char *pArg = NULL;
   int iArgsCnt = 0;
   int iResult = 0;

   // fprintf(stderr, "nt_execute_shell_script '%s", command); fflush(stderr);

   if (NULL != args)
   {
      for (iArgsCnt = 0; NULL != args[iArgsCnt]; iArgsCnt++);
   }

   ppcArgsNew = (char **) malloc(sizeof(char*) * (iArgsCnt+2));
   memset(ppcArgsNew, '\0', sizeof(char*) * (iArgsCnt+2));
   ppcArgsNew[0] = pcShellName;
   for (iArgsCnt = 0; NULL != args[iArgsCnt]; iArgsCnt++)
   {
      ppcArgsNew[iArgsCnt+1] = args[iArgsCnt];
   }

   sprintf(acCommandLine, "%s \"%s\"", pcShellName, command);
   iResult =  execve_nt(acCommandLine, ppcArgsNew, env, async);
   free(ppcArgsNew);
   return(iResult);
}

const char *nt_get_shell_binary()
{
   static char acMySelf[2048] = "\0";

   if ('\0' == acMySelf[0])
   {
      GetModuleFileName(NULL, acMySelf, 2048);
   }
   return(acMySelf);
}


int execve_nt(char *command, char**args, char**env, int asynchronous)
{
   int iRc = 0;

   int i=0;

   const char *pcShortCommand = NULL;
   const char *pcCmdStr = command ? command : args[0];
   char **spawn_env = NULL;
   int err = 0;

   // fprintf(stderr, ">>>>>>>>>>>>>>>>> execve_nt: %s\n", command);
   if ((NULL == command) && ((NULL == args) || (NULL == args[0])))
   {
      /* spawn would crash */
      // fprintf(stderr, "execve_nt: %s = -1\n", command);
      return(-1);
   }

   pcShortCommand = (char *) alloca(strlen(pcCmdStr) +1);
   if (NULL == pcShortCommand)
   {
      pcShortCommand = pcCmdStr;
   }
   else
   {
      if (0 >= GetShortPathName(pcCmdStr,
                                (LPTSTR) pcShortCommand,
                                strlen(pcCmdStr) + 1))
      {
         pcShortCommand = pcCmdStr;
      }
   }

   spawn_env = nt_make_spawn_env(env);

   iRc = my_spawnve( asynchronous ? /* _P_DETACH */ _P_NOWAIT : _P_WAIT,
           pcShortCommand,
           args, spawn_env, &err);

   // fprintf(stderr, "execve_nt: %s - %s => %d <<<<<<<<<<<<<<<<\n", command, pcShortCommand, iRc);
   if (NULL != spawn_env) xfree(spawn_env);

   if (EXECUTION_SUCCESS != err)
   {
      return -1;
   }
   return(iRc);
}


struct my_running_childs_table
{
      HANDLE hProcess; /* process id of child */
      char *pcCmd;
      struct my_running_childs_table *next;
};

static struct my_running_childs_table *the_childs_table = NULL; /**< global childs table */

/** add a child to the running childs list */
static void nt_add_running_child(HANDLE ihProcess, const char *ipcCmd)
{
   struct my_running_childs_table *newchild = NULL;
   struct my_running_childs_table *prev = NULL;

   newchild = (void *) malloc(sizeof(struct my_running_childs_table));
   if (NULL == newchild)
   {
      return;
   }
   memset(newchild, '\0', sizeof(struct my_running_childs_table));
   newchild->hProcess = ihProcess;
   newchild->pcCmd = strdup(ipcCmd);

   nt_enter_critsec(__FILE__, __LINE__);
   prev = the_childs_table;
   if (NULL != prev)
   {
      while (NULL != prev->next)
      {
         prev = prev->next;
      }
      prev->next = newchild;
   }
   else
   {
      the_childs_table = newchild;
   }

   nt_leave_critsec(__FILE__, __LINE__);

   nt_cleanup_childs_table(); // remove zombie childs
   return;
}

/** wait for all remaining childs an clean up the childs table (and the systems process table) */
void nt_cleanup_childs_table()
{
   struct my_running_childs_table *child = NULL;
   struct my_running_childs_table *prev = NULL;
   struct my_running_childs_table *next = NULL;

   nt_enter_critsec(__FILE__, __LINE__);

   child = the_childs_table;

   while (NULL != child)
   {
      DWORD termstat ;

      next = child->next;

      if (WAIT_OBJECT_0 == WaitForSingleObject(child->hProcess, 0))
      {
         GetExitCodeProcess(child->hProcess, &termstat);
         CloseHandle(child->hProcess);

         if(prev)
         {
            prev->next = next;
         }
         else
         {
            the_childs_table = next;
         }

         if (NULL != child->pcCmd)
         {
            free(child->pcCmd);
         }

         free(child);
      }
      else
      {
         prev = child;
      }
      child = next;
   }
   nt_leave_critsec(__FILE__, __LINE__);
}


#define MY_OPEN_FILES_MAX 255 /**< max. open files per thread */

/** struct to manage open files for a thread */
struct my_open_files_table
{
      int pid; /** thread id */
      int fd[MY_OPEN_FILES_MAX]; /** file handles */
      struct my_open_files_table *next; /** next entry */
};

static struct my_open_files_table *the_file_table = NULL; /**< global file table */

/** return the file table for the current thread */
static struct my_open_files_table* get_current_threads_file_table(int iCreateNew)
{
   struct my_open_files_table *this = the_file_table; /**< entry currently working on */
   struct my_open_files_table *avail = NULL; /**< last available (not yet used) entry */
   struct my_open_files_table *last = NULL; /*<* last entry */
   int id = nt_get_thread_id() ; /**< id of the current thread */

   /* search for an existing entry for this thread */
   for (;this; this=this->next)
   {
      if (this->pid == id)
      {
         return(this);
         break ;
      }

      if (0 == this->pid)
      {
         avail = this;
      }

      last = this;
   }

   if (!iCreateNew)
   {
      return(NULL);
   }

   /* is there an existing one free? */
   if (NULL != avail)
   {
      int i=0;
      avail->pid = id;

      for (i=0; i < MY_OPEN_FILES_MAX; i++) avail->fd[i] = -1;
      return(avail);
   }

   /* create a new one */
   this = (struct my_open_files_table *) xmalloc(sizeof(struct my_open_files_table));
   if (NULL != this)
   {
      int i=0;

      memset(this, '\0', sizeof(struct my_open_files_table));

      for (i=0; i < MY_OPEN_FILES_MAX; i++) this->fd[i] = -1;
      this->pid = id;
      this->next = NULL;

      if (last)
      {
         last->next = this ;
      }
      else
      {
         the_file_table = this ;
      }
   }

   return(this);
}

/** add a new filedescriptor to the threads entry */
void nt_add_thread_open_file(int fd, const char *file, const int line)
{
   struct my_open_files_table *table = NULL;

   if ((0 <= fd) && (2 >= fd))
   {
      return;
   }

   nt_enter_critsec(__FILE__, __LINE__);
   table = get_current_threads_file_table(1);

   if (NULL != table)
   {
      int i=0;
      int j=-1;

      for (i=0; i < MY_OPEN_FILES_MAX; i++)
      {
         if (fd == table->fd[i])
         {
            j = -1;
            break; /* already in list */
         }

         if (-1 == table->fd[i])
         {
            j = i;
         }
      }
      if (-1 != j)
      {
         table->fd[j] = fd;
      }
   }
   nt_leave_critsec(__FILE__,__LINE__);
}

void nt_remove_thread_open_file(int fd, const char *file, const int line)
{
   struct my_open_files_table *table = NULL;

   nt_enter_critsec(__FILE__, __LINE__);
   table = get_current_threads_file_table(1);

   if (NULL != table)
   {
      int i=0;

      for (i=0; i < MY_OPEN_FILES_MAX; i++)
      {
         if (fd == table->fd[i])
         {
            table->fd[i] = -1;
            break;
         }

      }
   }
   nt_leave_critsec(__FILE__,__LINE__);
}

/** close all file which were opened by this thread
 *
 * This is called by nt_exit_thread() which already
 * entered the critical section, so this function doesn't.
 */
static void nt_close_thread_open_files()
{
   struct my_open_files_table *table = NULL;

   table = get_current_threads_file_table(0);

   if (NULL != table)
   {
      int i=0;
      for (i=0; i < MY_OPEN_FILES_MAX; i++)
      {
         if (-1 != table->fd[i])
         {
            close(table->fd[i]);
            table->fd[i] = -1;
         }
      }
      table->pid = 0;
   }
}

/** struct to manage open files for a thread */
struct my_stdio_save
{
      int pid; /** thread id */
      int fd_stdin_new;
      int fd_stdout_new;
      int fd_stderr_new;
      struct my_stdio_save *next; /** next entry */
};

static struct my_stdio_save *the_stdio_table = NULL; /**< global file table */


static void add_thread_stdio_save()
{
   int pid = nt_get_thread_id();
   struct my_stdio_save *stdio_save = (void *) malloc(sizeof(struct my_stdio_save));

   stdio_save->pid = pid;
   stdio_save->fd_stdin_new = -1;
   stdio_save->fd_stdout_new = -1;
   stdio_save->fd_stderr_new = -1;

   nt_enter_critsec(__FILE__, __LINE__);
   stdio_save->next = the_stdio_table;
   the_stdio_table = stdio_save;
   nt_leave_critsec(__FILE__, __LINE__);
}

static void remove_thread_stdio_save()
{
   int pid = nt_get_thread_id();

   struct my_stdio_save *stdio_save = NULL;
   struct my_stdio_save *prev=NULL;

   for(stdio_save = the_stdio_table; NULL != stdio_save; prev=stdio_save, stdio_save = stdio_save->next)
   {
      if (pid == stdio_save->pid)
      {
         if (NULL != prev)
         {
            prev->next = stdio_save->next;
         }
         else
         {
            the_stdio_table = stdio_save->next;
         }
         free(stdio_save);
         break;
      }
   }
}

static struct my_stdio_save* get_thread_stdio_save()
{
   int pid = nt_get_thread_id();
   struct my_stdio_save *stdio_save=NULL;
   struct my_stdio_save *stdio_result = NULL;

   nt_enter_critsec(__FILE__, __LINE__);

   for(stdio_save = the_stdio_table; NULL != stdio_save; stdio_save = stdio_save->next)
   {
      if (pid == stdio_save->pid)
      {
         stdio_result = stdio_save;
         break;
      }
   }

   nt_leave_critsec(__FILE__, __LINE__);

   return(stdio_result);
}

/** save the stdio handles set by exec */
void nt_save_exec_stdhandles(int fd_stdin, int fd_stdout, int fd_stderr)
{
   struct my_stdio_save* stdio_save = get_thread_stdio_save();

   if (NULL == stdio_save)
   {
      add_thread_stdio_save();
      stdio_save = get_thread_stdio_save();
      if (NULL == stdio_save)
      {
         return;
      }
   }

   if (-1 != fd_stdin)
   {
      stdio_save->fd_stdin_new = dup(fd_stdin);
      SET_CLOSE_ON_EXEC(stdio_save->fd_stdin_new);
   }
   else
   {
      stdio_save->fd_stdin_new = -1;
   }

   if (-1 != fd_stdout)
   {
      stdio_save->fd_stdout_new = dup(fd_stdout);
      SET_CLOSE_ON_EXEC(stdio_save->fd_stdout_new);
   }
   else
   {
      stdio_save->fd_stdout_new = -1;
   }

   if (-1 != fd_stderr)
   {
      stdio_save->fd_stderr_new = dup(fd_stderr);
      SET_CLOSE_ON_EXEC(stdio_save->fd_stderr_new);
   }
   else
   {
      stdio_save->fd_stderr_new = -1;
   }
}

/** restore the stdin/stout/stderr duplicating either
 * the given handles (if exec hasn't been call) or duplicating
 * the files set by exec
 */
void nt_restore_exec_stdhandles(int fd_stdin, int fd_stdout, int fd_stderr)
{

   struct my_stdio_save* stdio_save = NULL; // get_thread_stdio_save();

   fflush(stdout);
   fflush(stderr);

   if ((NULL != stdio_save) && (-1 != stdio_save->fd_stdin_new))
   {
      nt_remove_thread_open_file(stdio_save->fd_stdin_new, __FILE__, __LINE__);
      dup2(stdio_save->fd_stdin_new,0);
   }
   else
   {
      dup2(fd_stdin, 0);
   }
   CLOSE(fd_stdin);


   if ((NULL != stdio_save) && (-1 != stdio_save->fd_stdout_new))
   {
      nt_remove_thread_open_file(stdio_save->fd_stdout_new, __FILE__, __LINE__);
      dup2(stdio_save->fd_stdout_new,1);
   }
   else
   {
      dup2(fd_stdout, 1);
   }
   CLOSE(fd_stdout);

   if ((NULL != stdio_save) && (-1 != stdio_save->fd_stderr_new))
   {
      nt_remove_thread_open_file(stdio_save->fd_stderr_new, __FILE__, __LINE__);
      dup2(stdio_save->fd_stderr_new,2);
   }
   else
   {
      dup2(fd_stderr, 2);
   }
   CLOSE(fd_stderr);

   SET_CLOSE_ON_EXEC(0);
   SET_CLOSE_ON_EXEC(1);
   SET_CLOSE_ON_EXEC(2);
}

/** clean up the standard handles set by exec */
void nt_cleanup_exec_stdhandles()
{
   struct my_stdio_save *stdio_save = NULL;

   nt_enter_critsec(__FILE__, __LINE__);

   for(stdio_save = the_stdio_table; NULL != stdio_save; stdio_save = stdio_save->next)
   {
      if (-1 != stdio_save->fd_stdin_new)
      {
         close(stdio_save->fd_stdin_new);
         stdio_save->fd_stdin_new = -1;
      }
      if (-1 != stdio_save->fd_stdout_new)
      {
         close(stdio_save->fd_stdout_new);
         stdio_save->fd_stdout_new = -1;
      }
      if (-1 != stdio_save->fd_stderr_new)
      {
         close(stdio_save->fd_stderr_new);
         stdio_save->fd_stderr_new = -1;
      }
   }

   nt_leave_critsec(__FILE__, __LINE__);
}

int nt_getc(FILE *iFile)
{
   int cRet = EOF;

   if (feof(iFile))
   {
      return(EOF);
   }

   cRet = fgetc(iFile);

   return(cRet);
}

struct my_fd_bitmap_el
{
      struct fd_bitmap *bitmap;
      int tid;
      struct my_fd_bitmap_el *next;
};

struct my_fd_bitmap_el *my_fd_bitmap_list = NULL;

static struct my_fd_bitmap_el* get_fds(int iCreateNew)
{
   int pid = nt_get_thread_id();

   struct my_fd_bitmap_el *thisone = NULL;
   struct my_fd_bitmap_el *prev=NULL;

   for(thisone = my_fd_bitmap_list; NULL != thisone; prev=thisone, thisone = thisone->next)
   {
      if (pid == thisone->tid)
      {
         return(thisone);
      }
   }

   if (!iCreateNew)
   {
      return(NULL);
   }
   thisone = malloc (sizeof(struct my_fd_bitmap_el));
   if (NULL != thisone)
   {
      thisone->tid = pid;
      thisone->bitmap = NULL;
      thisone->next = my_fd_bitmap_list;
      my_fd_bitmap_list = thisone;
   }
   return(thisone);
}

void nt_close_current_fds()
{
   struct my_fd_bitmap_el *thisone = NULL;

   nt_enter_critsec(__FILE__, __LINE__);

   thisone = get_fds(0);
   if (NULL != thisone)
   {
      struct my_fd_bitmap_el *next = thisone->next;

      if (my_fd_bitmap_list == thisone)
      {
         my_fd_bitmap_list = next;
      }
      else
      {
         struct my_fd_bitmap_el *prev = NULL;
         for(prev = my_fd_bitmap_list; NULL != prev; prev=prev->next)
         {
            if (prev->next == thisone)
            {
               prev->next = next;
               break;
            }
         }
      }
      if (NULL != thisone->bitmap)
      {
         close_fd_bitmap(thisone->bitmap);
      }
      free(thisone);
   }
   nt_leave_critsec(__FILE__, __LINE__);
}

void nt_clean_current_fds()
{
   nt_set_current_fds(NULL);
}

void nt_set_current_fds(struct fd_bitmap *bitmap)
{
   struct my_fd_bitmap_el *thisone = NULL;

   nt_enter_critsec(__FILE__, __LINE__);

   thisone = get_fds(1);
   if (NULL != thisone)
   {
      thisone->bitmap = bitmap;
   }
   nt_leave_critsec(__FILE__, __LINE__);
}

void nt_print_var_list(FILE *fp, SHELL_VAR **list);
void nt_print_func_list(FILE *fp, SHELL_VAR **list);

void nt_export_functions(const char *ipcFilename, const char *ipcFuncName)
{
   SHELL_VAR **vars = NULL;

   FILE *fp = fopen(ipcFilename, "w");

   vars = all_shell_variables ();
   if (vars)
   {
      nt_print_var_list(fp, vars);
   }
   free (vars); vars = NULL;

   vars = all_shell_functions ();
   if (vars)
   {
      nt_print_func_list(fp, vars);
   }
   free (vars); vars = NULL;

   fprintf(fp, "\n\n%s \"$@\"\n", ipcFuncName);
   fclose(fp);

}

/** Table of temporary files */
struct my_filedes_table
{
      int filedes[2];
      struct my_filedes_table *pNext;
};

static struct my_filedes_table *gpFileDesTable = NULL;

void nt_addPipeAssoc(int iFDRead, int iFDWrite)
{
   struct my_filedes_table *pNext = (struct my_filedes_table *) malloc(sizeof(struct my_filedes_table));

   if (NULL == pNext)
   {
      return;
   }
   memset(pNext, '\0', sizeof(struct my_filedes_table));

   pNext->filedes[0] = iFDRead;
   pNext->filedes[1] = iFDWrite;

   nt_enter_critsec(__FILE__, __LINE__);
   if (NULL == gpFileDesTable)
   {
      gpFileDesTable = pNext;
   }
   else
   {
      struct my_filedes_table *pPrevious = gpFileDesTable;

      while (NULL != pPrevious->pNext)
      {
         pPrevious = pPrevious->pNext;
      }

      pPrevious->pNext = pNext;
   }
   nt_leave_critsec(__FILE__, __LINE__);
}

void nt_deletePipeAssoc(int fd)
{
   struct my_filedes_table *pPrevious = NULL, *pCurrent = NULL, *pNext = NULL;

   nt_enter_critsec(__FILE__, __LINE__);

   pCurrent = gpFileDesTable;
   while (NULL != pCurrent)
   {
      pNext = pCurrent->pNext;

      if ((fd == pCurrent->filedes[0]) || (fd == pCurrent->filedes[1]))
      {
         if (pPrevious)
         {
            pPrevious->pNext = pNext;
         }
         else
         {
            gpFileDesTable = pNext;
         }
         free(pCurrent);
         break;
      }

      pPrevious = pCurrent;
      pCurrent = pNext;
   }
   nt_leave_critsec(__FILE__, __LINE__);
}

int nt_getPipeAssoc(int fd)
{
   struct my_filedes_table *pCurrent = NULL, *pNext = NULL;
   int iReturn = -1;

   nt_enter_critsec(__FILE__, __LINE__);

   pCurrent = gpFileDesTable;
   while (NULL != pCurrent)
   {
      pNext = pCurrent->pNext;

      if (fd == pCurrent->filedes[0])
      {
         iReturn = pCurrent->filedes[1];
         break;
      }
      if (fd == pCurrent->filedes[1])
      {
         iReturn = pCurrent->filedes[0];
         break;
      }

      pCurrent = pNext;
   }
   nt_leave_critsec(__FILE__, __LINE__);

   return iReturn;
}
