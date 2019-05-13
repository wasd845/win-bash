#ifndef DIRENT_DOT_H
#define DIRENT_DOT_H
/*****************************************************************************
 *                                                                           *
 * Was sys/dirent.h                                                              *
 *                                                                           *
 * Freely redistributable and modifiable.  Use at your own risk.             *
 *                                                                           *
 * Copyright 1994 The Downhill Project                                       *
 *                                                                           *
 *****************************************************************************/
/* 
dirent.h
Modified by Paul Budnik for GNU Bash
*/




/* Include stuff *************************************************************/
#include "dtypes.h"
#include <stdlib.h>
#include <windows.h>


/* Struct and typedef stuff **************************************************/

/* Directory entry (file) struct =========================================== */
struct dirent
{
	unsigned long   d_fileno;
	unsigned short  d_namlen;
	char            d_name[_MAX_PATH+1];
};

/* Directory info typedef ================================================== */
typedef struct __dirdesc
{
	char          dir_Name[_MAX_PATH+1];
	HANDLE        dir_Handle;
	int           dir_FileCount;
	struct dirent dir_FileUnix;
} DIR;


/* Prototype stuff **********************************************************/
DIR*           opendir(char* dir_Name);
struct dirent* readdir(DIR* dir_Info);
void           rewinddir(DIR* dir_Info);
int            closedir(DIR* dir_Info);
long           telldir(DIR* dir_Info);
void           seekdir(DIR* dir_Info,long dir_Position);


#endif /* #ifdef DIRENT_DOT_H */
