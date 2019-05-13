#ifndef PWD_DOT_H
#define PWD_DOT_H
/*****************************************************************************
 *                                                                           *
 * pwd.h                                                                     *
 *                                                                           *
 * Freely redistributable and modifiable.  Use at your own risk.             *
 *                                                                           *
 * Copyright 1994 The Downhill Project                                       *
 *                                                                           *
 *****************************************************************************/
/*
Modified by Paul Budnik for GNU BASH
*/




/* Include stuff *************************************************************/
#include "dtypes.h"
#include <sys/types.h>


/* Struct stuff **************************************************************/
struct passwd
{
	char* pw_name;
	char* pw_passwd;
	uid_t pw_uid;
	gid_t pw_gid;
	char* pw_gecos;
	char* pw_dir;
	char* pw_shell;
};


/* Prototype stuff ***********************************************************/
struct passwd* getpwent(void);
void           setpwent(void);
void           endpwent(void);
struct passwd* getpwuid(uid_t user_Id);
struct passwd* getpwnam(char* user_Name);


#endif /* #ifdef PWD_DOT_H */
