#ifndef DTYPES_DOT_H
#define DTYPES_DOT_H
/*****************************************************************************
 *                                                                           *
 * From sys/types.h                                                               *
 *                                                                           *
 * Freely redistributable and modifiable.  Use at your own risk.             *
 *                                                                           *
 * Copyright 1994 The Downhill Project                                       *
 *                                                                           *
 *****************************************************************************/
/*
Modified for GNU Bash by Paul Budnik
*/


/* Good typedefs =========================================================== */
typedef long           uid_t;
typedef long           gid_t;
#ifndef __NT_EGC__
 typedef long           pid_t;
 typedef unsigned short mode_t;
#endif
typedef short          nlink_t;
typedef char*          caddr_t;

/* Bad typedefs ============================================================ */

#ifndef _GNU_H_WINDOWS32_SOCKETS
typedef unsigned char  u_char;
typedef unsigned short u_short;
typedef unsigned int   u_int;
typedef unsigned long  u_long;
#endif

typedef u_int          uint;
typedef u_short        ushort;


#endif /* #ifdef DTYPES_DOT_H */
