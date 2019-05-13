#ifndef GRP_DOT_H
#define GRP_DOT_H
/*****************************************************************************
 *                                                                           *
 * grp.h                                                                     *
 *                                                                           *
 * Freely redistributable and modifiable.  Use at your own risk.             *
 *                                                                           *
 * Copyright 1994 The Downhill Project                                       *
 *                                                                           *
 *****************************************************************************/
/* modified by Paul Budnik for GNU Bash
*/

#include "dtypes.h"



/* Include stuff *************************************************************/
#include <sys/types.h>


/* Struct stuff **************************************************************/
struct group
{
	char* gr_name;
	char* gr_passwd;
	gid_t gr_gid;
	char* gr_mem[2];
};


/* Prototype stuff ***********************************************************/
struct group* getgrent(void);
void          setgrent(void);
void          endgrent(void);
struct group* getgrgid(gid_t group_Id);
struct group* getgrnam(char* group_Name);


#endif /* #ifdef GRP_DOT_H */
