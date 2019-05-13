/*****************************************************************************
 *                                                                           *
 * Taken from DH_GRP.C                                                                  *
 *                                                                           *
 * Freely redistributable and modifiable.  Use at your own risk.             *
 *                                                                           *
 * Copyright 1994 The Downhill Project                                       *
 *                                                                           *
 *****************************************************************************/
/* modified by Paul Budnik
for GNU Bash
*******/


/* Include stuff *************************************************************/
#include <stdlib.h>
#include <stdio.h>
#include <fcntl.h>
#include <errno.h>
#include <io.h>
#include <sys/stat.h>
#include <sys/wait.h>
#include <sys/param.h>
#include <sys/time.h>
#include <unistd.h>
#include <grp.h>
#include <pwd.h>
#include <process.h>
#include <windows.h>

#define MAXPATHLEN     _MAX_PATH

#ifdef MAXHOSTNAMELEN
#undef MAXHOSTNAMELEN
#endif
#define MAXHOSTNAMELEN 64


struct  rusage
{
    struct timeval ru_utime;
    struct timeval ru_stime;
    long           ru_maxrss;
#define ru_first       ru_ixrss
    long           ru_ixrss;
    long           ru_idrss;
    long           ru_isrss;
    long           ru_minflt;
    long           ru_majflt;
    long           ru_nswap;
    long           ru_inblock;
    long           ru_oublock;
    long           ru_ioch;
    long           ru_msgsnd;
    long           ru_msgrcv;
    long           ru_nsignals;
    long           ru_nvcsw;
    long           ru_nivcsw;
#define ru_last        ru_nivcsw
};


/*****************************************************************************
 *                                                                           *
 * sys/wait.h                                                                *
 *                                                                           *
 * Freely redistributable and modifiable.  Use at your own risk.             *
 *                                                                           *
 * Copyright 1994 The Downhill Project                                       *
 *                                                                           *
 *****************************************************************************/

#define TRUE 1
#define FALSE 0
/* Define stuff **************************************************************/
#define WIFEXITED(status)   TRUE
#define WIFSTOPPED(status)  FALSE
#define WIFSIGNALED(status) FALSE
#define WEXITSTATUS(status) (int)((signed char)((status>>8)&0xff))
#define WTERMSIG(status)    0
#define WSTOPSIG(status)    0
#define WCOREDUMP(status)   0
#define WNOHANG             1
#define WUNTRACED           0
#define _WAITMASK           (WNOHANG|WUNTRACED)


/* Prototype stuff ***********************************************************/
pid_t wait(int* process_Status);
pid_t waitpid(pid_t process_Id,int* process_Status,int wait_Flags);
pid_t wait3(int* process_Status,int wait_Flags,struct rusage* process_Usage);
pid_t wait4(pid_t process_Id,int* process_Status,int wait_Flags,
       struct rusage* process_Usage);



/* Define stuff **************************************************************/
#define GRP_NAME     "group"
#define GRP_ID       0
#define GRP_PASSWORD ""
#define SLEEP_TIME 100

/* Global stuff **************************************************************/
char* Downhill_Group_Name = GRP_NAME;
gid_t Downhill_Group_Id = GRP_ID;
gid_t Downhill_Group_Eid = GRP_ID;
char* Downhill_Group_Password = GRP_PASSWORD;


/* Define stuff **************************************************************/
#define USER_NAME     "user"
#define USER_ID       200
#define USER_PASSWORD ""
#define USER_GECOS    "User"
#define USER_DIR      "C:\\"
#define USER_SHELL    "C:\\DOS\\BASH.EXE"


/* Global stuff **************************************************************/
char* Downhill_User_Name = USER_NAME;
uid_t Downhill_User_Id = USER_ID;
uid_t Downhill_User_Eid = USER_ID;
char* Downhill_User_Password = USER_PASSWORD;
char* Downhill_User_Gecos = USER_GECOS;
char* Downhill_User_Dir = USER_DIR;
char* Downhill_User_Shell = USER_SHELL;

/* Static stuff **************************************************************/
static struct group grp_Info;
static int          grp_Position = -1;

/* Function stuff ************************************************************/

/* Get group ID ============================================================ */
gid_t getgid(void)
{
   return Downhill_Group_Id;
}

/* Set group ID ============================================================ */
int setgid(gid_t id)
{
   if (id == Downhill_Group_Id) return 0 ;
   return -1;
}

/* Get effective group ID ================================================== */
gid_t getegid(void)
{
   return Downhill_Group_Eid;
}

/* Return a group entry ==================================================== */
struct group* downhill_Grp_GetEntry(void)
{
   /* If they've already read the "entry," error out */
   if (grp_Position != -1)
   {
      return NULL;
   }

   /* Set that we've been read */
   grp_Position++;

   /* Fill in our dummy values */
        grp_Info.gr_name = Downhill_Group_Name;
        grp_Info.gr_passwd = Downhill_Group_Password;
        grp_Info.gr_gid = Downhill_Group_Id;
        grp_Info.gr_mem[0] = Downhill_User_Name;
   grp_Info.gr_mem[1] = NULL;

   /* And return the structure */
   return &grp_Info;
}

struct group* getgrent(void)
{
   return downhill_Grp_GetEntry();
}

/* Return a group entry based on gid ======================================= */
struct group* getgrgid(gid_t group_Id)
{
   /* Check group ID */
   if (group_Id != Downhill_Group_Id)
   {
      return NULL;
   }

   /* Reset to the beginning */
   grp_Position = -1;

   /* Return an entry */
   return downhill_Grp_GetEntry();
}

/* Return a group entry based on name ====================================== */
struct group* getgrnam(char* group_Name)
{
   /* Check group name */
   if (strcmp(group_Name,Downhill_Group_Name))
   {
      return NULL;
   }

   /* Reset to the beginning */
   grp_Position = -1;

   /* Return an entry */
   return downhill_Grp_GetEntry();
}

/* Rewind the group file =================================================== */
void setgrent(void)
{
   /* Reset to the beginning */
   grp_Position = -1;

   return;
}

/* Stop using the group file =============================================== */
void endgrent(void)
{
   /* Reset to the beginning */
   grp_Position = -1;

   return;
}

/* Get the number of groups ================================================ */
int getgroups(int group_Max,gid_t group_Id[])
{
   if (group_Max < 1)
   {
      return 1;
   }

   group_Id[0] = Downhill_Group_Id;
   return 1;
}




/*****************************************************************************
 *                                                                           *
 * From DH_PROC.C                                                            *
 *                                                                           *
 * Freely redistributable and modifiable.  Use at your own risk.             *
 *                                                                           *
 * Copyright 1994 The Downhill Project                                       *
 *                                                                           *
 *****************************************************************************/



/* Define stuff **************************************************************/
#define PROCESS_MAX     1024


/* Struct stuff **************************************************************/
struct process_Struct
{
   pid_t pid[PROCESS_MAX];
   int   sigged[PROCESS_MAX];
};


/* Global stuff **************************************************************/
static struct process_Struct* process_Info = NULL;


/* Function stuff ************************************************************/

/* Init the process table ================================================== */
int downhill_Process_Init(void)
{
   int process_Index;

   /* Skip this if it's already been done */
   if (process_Info == NULL)
   {
      /* Get the memory for the process table */
      process_Info = calloc(sizeof(struct process_Struct),1);
      if (process_Info == NULL)
      {
         errno = ENOMEM;
         return FALSE;
      }

      /* And set it up */
      for (process_Index = 0;process_Index < PROCESS_MAX;
       process_Index++)
      {
         process_Info->pid[process_Index] = -1;
      }
   }

   /* Return that we're ready */
   return TRUE;
}

/* Find the index of a pid in the table ==================================== */
int downhill_Process_GetIndex(pid_t process_Id)
{
   int process_Index;

   for (process_Index = 0;process_Index < PROCESS_MAX;process_Index++)
   {
      if (process_Id == process_Info->pid[process_Index])
      {
         return process_Index;
      }
   }

   return -1;
}

/* Clear a pid entry from the table ======================================== */
void downhill_Process_ClearPid(pid_t process_Id)
{
   int process_Index = downhill_Process_GetIndex(process_Id);

   if (process_Index != -1)
   {
      process_Info->pid[process_Index] = -1;
      CloseHandle((HANDLE)process_Id);
   }
}

/* Check if a process is signaled ========================================== */
int downhill_Process_IsSignaled(pid_t process_Id)
{
   int process_Index = downhill_Process_GetIndex(process_Id);

   if (process_Index != -1)
   {
      return process_Info->sigged[process_Index];
   }

   return FALSE;
}

/* Signal a pid entry in the table ========================================= */
void downhill_Process_Signal(pid_t process_Id)
{
   int process_Index = downhill_Process_GetIndex(process_Id);

   if (process_Index != -1)
   {
      process_Info->sigged[process_Index] = TRUE;
   }
}

/* Get the status of a process ============================================= */
pid_t downhill_Process_GetStatus(pid_t process_Id,int* process_Status)
{
   DWORD process_StatusTemp;

   /* Get the status of the process */
   if (GetExitCodeProcess((HANDLE)process_Id,&process_StatusTemp) ==
    FALSE)
   {
      errno = ECHILD;
      return -1;
   }

   /* Still living? */
   if (process_StatusTemp == STILL_ACTIVE)
   {
      return 0;
   }

   /* Return OK */
   if (process_Status != NULL)
   {
      *process_Status = (int)(((unsigned char)
       process_StatusTemp)<<8);
   }
   return process_Id;
}

/* Get the status of any process =========================================== */
pid_t downhill_Process_GetStatusAny(int* process_Status)
{
   int          loop_Index;
   static int   process_Index = 0;
   pid_t        process_Id;

   /* Make sure the info exists */
   if (downhill_Process_Init() == FALSE)
   {
      return -1;
   }

   /* Check any processes */
   for (loop_Index = 0;loop_Index < PROCESS_MAX;loop_Index++)
   {
      /* Check this process */
      if (process_Info->pid[process_Index] != -1)
      {
         process_Id = downhill_Process_GetStatus(
          process_Info->pid[process_Index],process_Status);

         /* Handle how things came out */
         if (process_Id == -1)
         {
            process_Info->pid[process_Index] = -1;
         }
         else if (process_Id > 0)
         {
            return process_Id;
         }
      }

      process_Index++;
      if (process_Index == PROCESS_MAX)
      {
         process_Index = 0;
      }
   }

   return 0;
}

/* Count the number of active children ===================================== */
int downhill_Process_CountChildren(void)
{
   int process_Index;
   int child_Count = 0;

   /* Make sure we're inited */
   if (downhill_Process_Init() == FALSE)
   {
      return 0;
   }

   /* Count the number of active children */
   for (process_Index = 0;process_Index < PROCESS_MAX;process_Index++)
   {
      if (process_Info->pid[process_Index] != -1)
      {
         child_Count++;
      }
   }

   /* And return it */
   return child_Count;
}

int downhill_Signal_IsInterrupted()
{
   return 0 ;
}

/* Wait for any process to terminate ======================================= */
pid_t wait(int* process_Status)
{
   pid_t process_Id;

   /* Run through all processes */
   for (;;)
   {
      /* Check for interrupts */
      if (downhill_Signal_IsInterrupted())
      {
         errno = EINTR;
         return -1;
      }

      /* Make sure there are children */
      if (downhill_Process_CountChildren() == 0)
      {
         return -1;
      }

      /* Get any dead processes */
      process_Id = downhill_Process_GetStatusAny(process_Status);
      if (process_Id == -1)
      {
         return -1;
      }
      else if (process_Id > 0)
      {
         downhill_Process_ClearPid(process_Id);
         return process_Id;
      }

      /* Don't busy-loop */
      Sleep(SLEEP_TIME);
   }
}

/* Wait for a process to terminate ========================================= */
pid_t waitpid(pid_t process_Id,int* process_Status,int wait_Flags)
{
   pid_t wait_Pid;

   /* Waiting on more than one? */
   if (process_Id < 1)
   {
      /* Non-blocking */
      if (wait_Flags&WNOHANG)
      {
         if (downhill_Signal_IsInterrupted() > 0)
         {
            errno = EINTR;
            return -1;
         }
         wait_Pid = downhill_Process_GetStatusAny(
          process_Status);
         if (wait_Pid > 0)
         {
            downhill_Process_ClearPid(wait_Pid);
         }
         return wait_Pid;
      }

      /* Blocking */
      return wait(process_Status);
   }
   else
   {
      /* Non-blocking */
      if (wait_Flags&WNOHANG)
      {
         if (downhill_Signal_IsInterrupted() > 0)
         {
            errno = EINTR;
            return -1;
         }
         wait_Pid = downhill_Process_GetStatus(process_Id,
          process_Status);
         if (wait_Pid > 0)
         {
            downhill_Process_ClearPid(wait_Pid);
         }
         return wait_Pid;
      }

      /* Blocking */
      for (;;)
      {
         /* Check for interrupts */
         if (downhill_Signal_IsInterrupted() > 0)
         {
            errno = EINTR;
            return -1;
         }

         /* Should we return? */
         wait_Pid = downhill_Process_GetStatus(process_Id,
          process_Status);
         if (wait_Pid != 0)
         {
            if (wait_Pid > 0)
            {
               downhill_Process_ClearPid(wait_Pid);
            }
            return wait_Pid;
         }

         /* Don't busy-loop */
         Sleep(SLEEP_TIME);
      }
   }
}

/* Wait for a process to terminate ========================================= */
pid_t wait4(pid_t process_Id, int* process_Status,int wait_Flags,
       struct rusage* process_Usage)
{
   /* Just call waitpid() */
   process_Id = waitpid(process_Id,process_Status,wait_Flags);

   /* Dummy up the rusage entry */
   if (process_Usage != NULL)
   {
      memset(process_Usage,0,sizeof(struct rusage));
   }

   return process_Id;
}

/* Wait for any process to terminate ======================================= */
pid_t wait3(int* process_Status,int wait_Flags,struct rusage* process_Usage)
{
   /* Just call wait4() */
   return wait4(0,process_Status,wait_Flags,process_Usage);
}

/* Add a process to the list =============================================== */
pid_t Downhill_Process_Add(HANDLE process_Handle)
{
   int process_Index;

   /* Make sure the table is there */
   if (downhill_Process_Init() == FALSE)
   {
      return -1;
   }

   /* Run through each pid */
   for (process_Index = 0;process_Index < PROCESS_MAX;process_Index++)
   {
      /* If we find an empty slot (or they're re-adding the pid),
         add the info */
      if ((process_Info->pid[process_Index] == -1)
       || (process_Info->pid[process_Index] ==
       (pid_t)process_Handle))
      {
         process_Info->pid[process_Index] =
          (pid_t)process_Handle;
         process_Info->sigged[process_Index] = FALSE;

         return (pid_t)process_Handle;
      }
   }

   return 0;
}

/* Run a program in the background ========================================= */
HANDLE downhill_Process_Forkexec(char* exec_Name,char* exec_Argv[],
        HANDLE file_Handle[],DWORD exec_Flags)
{
   char                exec_Command[MAXPATHLEN+1];
   STARTUPINFO         exec_Startup;
   PROCESS_INFORMATION exec_Info;
   int                 exec_Index;
   int                 exec_Inherit = FALSE;

   /* Make sure the table is there */
   if (downhill_Process_Init() == FALSE)
   {
      return INVALID_HANDLE_VALUE;
   }

   /* Build the command */
   strcpy(exec_Command,exec_Name);
   if (exec_Argv != NULL)
   {
      for (exec_Index = 1;exec_Argv[exec_Index] != NULL;exec_Index++)
      {
         strcat(exec_Command," ");
         strcat(exec_Command,exec_Argv[exec_Index]);
      }
   }

   /* Run the command */
   memset(&exec_Startup,0,sizeof(STARTUPINFO));
   exec_Startup.cb = sizeof(STARTUPINFO);
   if (file_Handle != NULL)
   {
      if (file_Handle[0] != INVALID_HANDLE_VALUE)
      {
         exec_Startup.hStdInput = file_Handle[0];
         exec_Inherit = TRUE;
         exec_Startup.dwFlags = STARTF_USESTDHANDLES;
      }
      if (file_Handle[1] != INVALID_HANDLE_VALUE)
      {
         exec_Startup.hStdOutput = file_Handle[1];
         exec_Inherit = TRUE;
         exec_Startup.dwFlags = STARTF_USESTDHANDLES;
      }
      if (file_Handle[2] != INVALID_HANDLE_VALUE)
      {
         exec_Startup.hStdError = file_Handle[2];
         exec_Inherit = TRUE;
         exec_Startup.dwFlags = STARTF_USESTDHANDLES;
      }
   }
   if (!CreateProcess(NULL,exec_Command,NULL,NULL,exec_Inherit,exec_Flags,
    NULL,NULL,&exec_Startup,&exec_Info))
   {
      return INVALID_HANDLE_VALUE;
   }

   /* Clean up the thread */
   CloseHandle(exec_Info.hThread);

   /* Return the result */
   return exec_Info.hProcess;
}

/* Run a file in the background ============================================ */
pid_t Downhill_Process_Forkexec(char* exec_Name,char* exec_Argv[],
       HANDLE file_Handle[],DWORD exec_Flags)
{
   HANDLE exec_Handle = downhill_Process_Forkexec(exec_Name,exec_Argv,
                file_Handle,exec_Flags);

   if (exec_Handle == INVALID_HANDLE_VALUE)
   {
      return -1;
   }
   return Downhill_Process_Add(exec_Handle);
}

/* Run a file and return the results ======================================= */
char* Downhill_Process_System(char* exec_Name,char* exec_Argv[],
       int* exec_Return,int file_Return)
{
   HANDLE              exec_Handle;
   HANDLE              dump_Handle[3];
   static char         dump_File[MAXPATHLEN+1];
   char*               dump_Dir;
   SECURITY_ATTRIBUTES dump_Security;
   int                 result_Status;
   struct stat         result_Stat;
   char*               result_Mem;
   int                 result_Fd;

   /* Create the dump file */
   dump_Dir = getenv("TEMP");
   if (dump_Dir == NULL)
   {
      dump_Dir = getenv("TMP");
      if (dump_Dir == NULL)
      {
         dump_Dir = ".";
      }
   }
   strcpy(dump_File,dump_Dir);
   if ((dump_File[strlen(dump_File)-1] != '/') && (dump_File[strlen(
    dump_File)-1] != '\\'))
   {
      strcat(dump_File,"/");
   }
   strcat(dump_File,"DHXXXXXX");
   mktemp(dump_File);
   strcat(dump_File,".TMP");
   dump_Security.nLength = sizeof(SECURITY_ATTRIBUTES);
   dump_Security.lpSecurityDescriptor = NULL;
   dump_Security.bInheritHandle = TRUE;
   dump_Handle[0] = INVALID_HANDLE_VALUE;
   dump_Handle[1] = dump_Handle[2] = CreateFile(dump_File,
    GENERIC_READ|GENERIC_WRITE,FILE_SHARE_READ|FILE_SHARE_WRITE,
    &dump_Security,CREATE_ALWAYS,FILE_ATTRIBUTE_NORMAL,
    INVALID_HANDLE_VALUE);
   if (dump_Handle[1] == INVALID_HANDLE_VALUE)
   {
      return NULL;
   }

   /* Run the process */
   exec_Handle = downhill_Process_Forkexec(exec_Name,exec_Argv,
    dump_Handle,0);
   CloseHandle(dump_Handle[1]);
   if (exec_Handle == INVALID_HANDLE_VALUE)
   {
      errno = EINVAL;
      unlink(dump_File);
      return NULL;
   }
   for (;;)
   {
      /* Downhill_Signal_Check(); */
      if (GetExitCodeProcess(exec_Handle,&result_Status) == FALSE)
      {
         CloseHandle(exec_Handle);
         errno = EINVAL;
         unlink(dump_File);
         return NULL;
      }
      if (result_Status != STILL_ACTIVE)
      {
         CloseHandle(exec_Handle);
         break;
      }
      Sleep(SLEEP_TIME);
   }

   /* Return the name if that's what they want */
   if (file_Return != 0)
   {
      return dump_File;
   }

   /* Read the file */
   if (stat(dump_File,&result_Stat) != 0)
   {
      errno = EINVAL;
      unlink(dump_File);
      return NULL;
   }
   result_Mem = calloc(result_Stat.st_size+1,1);
   if (result_Mem == NULL)
   {
      errno = ENOMEM;
      unlink(dump_File);
      return NULL;
   }
   result_Fd = open(dump_File,O_RDONLY|O_BINARY);
   if (read(result_Fd,result_Mem,result_Stat.st_size) < 0)
   {
      close(result_Fd);
      unlink(dump_File);
      return NULL;
   }
   close(result_Fd);
   unlink(dump_File);

   /* And return */
   return result_Mem;
}

int nt_pipe_filedes[2] ;
/* allows converting a pipe to a disk file for internal commands */


int nt_pipe(int filedes[2], const char *f, int l)
{
   int ret = _pipe(filedes,256,_O_BINARY);

   nt_addPipeAssoc(filedes[0], filedes[1]);

   return ret ;
}

int downhill_parent = -1 ;

int getppid(void)
{
   if (downhill_parent > 0) return downhill_parent ;
   return getpid() ;
}

int getdtablesize()
{
   return 50 ;
}


int fork(void)
{
   report_error("option not availible on this NT BASH release");
   return -1 ;
}

int lstat(const char *file_name, struct stat *buf)
{
   return stat(file_name,buf);
}

/*****************************************************************************
 *                                                                           *
 * From DH_USR.C                                                                  *
 *                                                                           *
 * Freely redistributable and modifiable.  Use at your own risk.             *
 *                                                                           *
 * Copyright 1994 The Downhill Project                                       *
 *                                                                           *
 *****************************************************************************/
/* modified by Paul Budnik
for GNU Bash
*******/





/* Static stuff **************************************************************/
static struct passwd pwd_Info;
static int           pwd_Position = -1;


/* Function stuff ************************************************************/

/* Get user ID ============================================================= */
uid_t getuid(void)
{
   return Downhill_User_Id;
}

/* Set user ID ============================================================= */
int setuid(uid_t id)
{
   if (id == Downhill_User_Id) return 0 ;
   return -1 ;
}


/* Get effective user ID =================================================== */
uid_t geteuid(void)
{
   return Downhill_User_Eid;
}

/* Return a password entry ================================================= */
struct passwd* downhill_Pwd_GetEntry(void)
{
   /* If they've already read the "entry," error out */
   if (pwd_Position != -1)
   {
      return NULL;
   }

   /* Set that we've been read */
   pwd_Position++;

   /* Fill in our dummy values */
   pwd_Info.pw_name = Downhill_User_Name;
   pwd_Info.pw_passwd = Downhill_User_Password;
   pwd_Info.pw_uid = Downhill_User_Id;
   pwd_Info.pw_gid = Downhill_Group_Id;
   pwd_Info.pw_gecos = Downhill_User_Gecos;
   pwd_Info.pw_dir = Downhill_User_Dir;
   pwd_Info.pw_shell = Downhill_User_Shell;

   /* And return the structure */
   return &pwd_Info;
}

struct passwd* getpwent(void)
{
   return downhill_Pwd_GetEntry();
}

/* Return a password entry based on uid ==================================== */
struct passwd* getpwuid(uid_t user_Id)
{
   /* Check user ID */
   if (user_Id != Downhill_User_Id)
   {
      return NULL;
   }

   /* Reset to the beginning */
   pwd_Position = -1;

   /* Return an entry */
   return downhill_Pwd_GetEntry();
}

/* Return a password entry based on name =================================== */
struct passwd* getpwnam(char* user_Name)
{
   /* Check user name */
   if (strcmp(user_Name,Downhill_User_Name))
   {
      return NULL;
   }

   /* Reset to the beginning */
   pwd_Position = -1;

   /* Return an entry */
   return downhill_Pwd_GetEntry();
}

/* Rewind the password file ================================================ */
void setpwent(void)
{
   /* Reset to the beginning */
   pwd_Position = -1;

   return;
}

/* Stop using the password file ============================================ */
void endpwent(void)
{
   /* Reset to the beginning */
   pwd_Position = -1;

   return;
}

long ulimit(int a, long b)
{
   return 1000000 ;
}
