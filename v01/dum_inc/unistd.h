#ifndef UNISTD_DOT_H
#define UNISTD_DOT_H
/*****************************************************************************
 *                                                                           *
 * sys/unistd.h                                                              *
 *                                                                           *
 * Freely redistributable and modifiable.  Use at your own risk.             *
 *                                                                           *
 * Copyright 1994 The Downhill Project                                       *
 *                                                                           *
 *****************************************************************************/
/*
Modified by Paul Budnik for GNU BASH 
*/


#include "dtypes.h"
#include <stdio.h>
#include <sys/types.h>




/* Prototype stuff ***********************************************************/
#ifndef __NT_EGC__
 uid_t        getuid(void);
 uid_t        geteuid(void);
 gid_t        getgid(void);
 gid_t        getegid(void);
 unsigned int sleep(unsigned int sleep_Duration);
#endif

int          getgroups(int group_Max,gid_t group_Id[]);

int          pause(void);
int          chown(char* file_Name,uid_t file_User,gid_t file_Group);
int          fchown(int file_Fd,uid_t file_User,gid_t file_Group);
int          getopt(int arg_Count,char* arg_Value[],char flag_List[]);
int          readlink(char* file_Name,char* buf_Mem,int buf_Size);

int          pipe(int filedes[2]);
int          getppid(void);
int          getdtablesize();
int          setuid(uid_t id);
int          setgid(gid_t gid);
long         ulimit(int a, long b);

#endif /* #ifdef UNISTD_DOT_H */
