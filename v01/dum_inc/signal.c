/*****************************************************************************
 *                                                                           *
 * From DH_SIG.C                                                                  *
 *                                                                           *
 * Freely redistributable and modifiable.  Use at your own risk.             *
 *                                                                           *
 * Copyright 1994 The Downhill Project                                       *
 *                                                                           *
 *****************************************************************************/
/*
Modified for GNU Bash by Paul Budnik
&/


/* Include stuff *************************************************************/
#include <windows.h>
#include <stdlib.h>
#include <stdio.h>

#ifndef __NT_EGC__
#include <stdarg.h>
#endif

#include <errno.h>
#include <signal.h>
#include <dtypes.h>

#ifdef __NT_EGC__
#include <process.h>
#endif

int kill(pid_t pid,int sig)
{
	if (pid == getpid()) return raise(sig);
	return -1 ;
}

int killpg(int pgrp, int sig)
{
	return -1 ;
}


