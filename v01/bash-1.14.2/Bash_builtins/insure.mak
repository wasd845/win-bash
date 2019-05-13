# Microsoft Visual C++ Generated NMAKE File, Format Version 2.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Static Library" 0x0104

!IF "$(CFG)" == ""
CFG=Win32 Debug
!MESSAGE No configuration specified.  Defaulting to Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "Win32 Release" && "$(CFG)" != "Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE on this makefile
!MESSAGE by defining the macro CFG on the command line.  For example:
!MESSAGE 
!MESSAGE NMAKE /f "Bash_builtins.mak" CFG="Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "Win32 Release" (based on "Win32 (x86) Static Library")
!MESSAGE "Win32 Debug" (based on "Win32 (x86) Static Library")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

BASH_SRC_MAIN_DIR=..\..

################################################################################
# Begin Project
# PROP Target_Last_Scanned "Win32 Debug"
CPP=insure.exe /Zi /Fm

!IF  "$(CFG)" == "Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "WinRel"
# PROP BASE Intermediate_Dir "WinRel"
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "WinRel"
# PROP Intermediate_Dir "WinRel"
OUTDIR=.\WinRel
INTDIR=.\WinRel

ALL : $(OUTDIR)/Bash_builtins.lib $(OUTDIR)/Bash_builtins.bsc

$(OUTDIR) : 
    if not exist $(OUTDIR)/nul mkdir $(OUTDIR)

# ADD BASE CPP /nologo /W3 /GX /YX /O2 /I "$(BASH_SRC_MAIN_DIR)\bash-1.14.2" /I "$(BASH_SRC_MAIN_DIR)\bash-1.14.2/lib" /I "$(BASH_SRC_MAIN_DIR)\dum_inc" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /FR /c
# ADD CPP /nologo /w /W0 /GX /YX /O2 /I "$(BASH_SRC_MAIN_DIR)\dum_inc" /I "$(BASH_SRC_MAIN_DIR)\bash-1.14.2" /I "$(BASH_SRC_MAIN_DIR)\bash-1.14.2/lib" /I "$(BASH_SRC_MAIN_DIR)\dum_inc" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "__NT_VC__" /FR /c
CPP_PROJ=/nologo /w /W0 /GX /YX /O2 /I $(BASH_SRC_MAIN_DIR)\dum_inc /I\
 $(BASH_SRC_MAIN_DIR)\bash-1.14.2 /I $(BASH_SRC_MAIN_DIR)\bash-1.14.2/lib /I\
 $(BASH_SRC_MAIN_DIR)\dum_inc /D NDEBUG /D WIN32 /D _WINDOWS /D __NT_VC__\
 /FR$(INTDIR)/ /Fp$(OUTDIR)/Bash_builtins.pch /Fo$(INTDIR)/ /c 
CPP_OBJS=.\WinRel/
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o$(OUTDIR)/Bash_builtins.bsc 
BSC32_SBRS= \
	$(INTDIR)/test.sbr \
	$(INTDIR)/echo.sbr \
	$(INTDIR)/cd.sbr \
	$(INTDIR)/ulimit.sbr \
	$(INTDIR)/help.sbr \
	$(INTDIR)/wait.sbr \
	$(INTDIR)/kill.sbr \
	$(INTDIR)/jobs.sbr \
	$(INTDIR)/trap.sbr \
	$(INTDIR)/enable.sbr \
	$(INTDIR)/fc.sbr \
	$(INTDIR)/fg_bg.sbr \
	$(INTDIR)/declare.sbr \
	$(INTDIR)/inlib.sbr \
	$(INTDIR)/getopts.sbr \
	$(INTDIR)/suspend.sbr \
	$(INTDIR)/read.sbr \
	$(INTDIR)/times.sbr \
	$(INTDIR)/bashgetopt.sbr \
	$(INTDIR)/bind.sbr \
	$(INTDIR)/exit.sbr \
	$(INTDIR)/break.sbr \
	$(INTDIR)/common.sbr \
	$(INTDIR)/exec.sbr \
	$(INTDIR)/shift.sbr \
	$(INTDIR)/colon.sbr \
	$(INTDIR)/set.sbr \
	$(INTDIR)/source.sbr \
	$(INTDIR)/eval.sbr \
	$(INTDIR)/hash.sbr \
	$(INTDIR)/let.sbr \
	$(INTDIR)/return.sbr \
	$(INTDIR)/umask.sbr \
	$(INTDIR)/command.sbr \
	$(INTDIR)/setattr.sbr \
	$(INTDIR)/history.sbr \
	$(INTDIR)/builtin.sbr \
	$(INTDIR)/alias.sbr \
	$(INTDIR)/type.sbr \
	$(INTDIR)/getopt.sbr \
	$(INTDIR)/builtins.sbr

$(OUTDIR)/Bash_builtins.bsc : $(OUTDIR)  $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LIB32=lib.exe
# ADD BASE LIB32 /NOLOGO
# ADD LIB32 /NOLOGO
LIB32_FLAGS=/NOLOGO /OUT:$(OUTDIR)\Bash_builtins.lib 
DEF_FLAGS=
DEF_FILE=
LIB32_OBJS= \
	$(INTDIR)/test.obj \
	$(INTDIR)/echo.obj \
	$(INTDIR)/cd.obj \
	$(INTDIR)/ulimit.obj \
	$(INTDIR)/help.obj \
	$(INTDIR)/wait.obj \
	$(INTDIR)/kill.obj \
	$(INTDIR)/jobs.obj \
	$(INTDIR)/trap.obj \
	$(INTDIR)/enable.obj \
	$(INTDIR)/fc.obj \
	$(INTDIR)/fg_bg.obj \
	$(INTDIR)/declare.obj \
	$(INTDIR)/inlib.obj \
	$(INTDIR)/getopts.obj \
	$(INTDIR)/suspend.obj \
	$(INTDIR)/read.obj \
	$(INTDIR)/times.obj \
	$(INTDIR)/bashgetopt.obj \
	$(INTDIR)/bind.obj \
	$(INTDIR)/exit.obj \
	$(INTDIR)/break.obj \
	$(INTDIR)/common.obj \
	$(INTDIR)/exec.obj \
	$(INTDIR)/shift.obj \
	$(INTDIR)/colon.obj \
	$(INTDIR)/set.obj \
	$(INTDIR)/source.obj \
	$(INTDIR)/eval.obj \
	$(INTDIR)/hash.obj \
	$(INTDIR)/let.obj \
	$(INTDIR)/return.obj \
	$(INTDIR)/umask.obj \
	$(INTDIR)/command.obj \
	$(INTDIR)/setattr.obj \
	$(INTDIR)/history.obj \
	$(INTDIR)/builtin.obj \
	$(INTDIR)/alias.obj \
	$(INTDIR)/type.obj \
	$(INTDIR)/getopt.obj \
	$(INTDIR)/builtins.obj

$(OUTDIR)/Bash_builtins.lib : $(OUTDIR)  $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "WinDebug"
# PROP BASE Intermediate_Dir "WinDebug"
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "WinDebug"
# PROP Intermediate_Dir "WinDebug"
OUTDIR=.\WinDebug
INTDIR=.\WinDebug

ALL : $(OUTDIR)/Bash_builtins.lib $(OUTDIR)/Bash_builtins.bsc

$(OUTDIR) : 
    if not exist $(OUTDIR)/nul mkdir $(OUTDIR)

# ADD BASE CPP /nologo /W3 /GX /Z7 /YX /Od /I $(BASH_SRC_MAIN_DIR)\bash-1.14.2 /I "$(BASH_SRC_MAIN_DIR)\bash-1.14.2/lib" /I "$(BASH_SRC_MAIN_DIR)\dum_inc" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /FR /c
# ADD CPP /nologo /w /W0 /GX /Z7 /YX /Od /I "$(BASH_SRC_MAIN_DIR)\dum_inc" /I "$(BASH_SRC_MAIN_DIR)\bash-1.14.2" /I "$(BASH_SRC_MAIN_DIR)\bash-1.14.2/lib" /I "$(BASH_SRC_MAIN_DIR)\dum_inc" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "__NT_VC__" /FR /c
CPP_PROJ=/nologo /w /W0 /GX /Zi /YX /Od /I $(BASH_SRC_MAIN_DIR)\dum_inc /I\
 $(BASH_SRC_MAIN_DIR)\bash-1.14.2 /I $(BASH_SRC_MAIN_DIR)\bash-1.14.2/lib /I\
 $(BASH_SRC_MAIN_DIR)\dum_inc /D _DEBUG /D WIN32 /D _WINDOWS /D __NT_VC__\
 /FR$(INTDIR)/ /Fp$(OUTDIR)/Bash_builtins.pch /Fo$(INTDIR)/ /c 
CPP_OBJS=.\WinDebug/
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o$(OUTDIR)/Bash_builtins.bsc 
BSC32_SBRS= \
	$(INTDIR)/test.sbr \
	$(INTDIR)/echo.sbr \
	$(INTDIR)/cd.sbr \
	$(INTDIR)/ulimit.sbr \
	$(INTDIR)/help.sbr \
	$(INTDIR)/wait.sbr \
	$(INTDIR)/kill.sbr \
	$(INTDIR)/jobs.sbr \
	$(INTDIR)/trap.sbr \
	$(INTDIR)/enable.sbr \
	$(INTDIR)/fc.sbr \
	$(INTDIR)/fg_bg.sbr \
	$(INTDIR)/declare.sbr \
	$(INTDIR)/inlib.sbr \
	$(INTDIR)/getopts.sbr \
	$(INTDIR)/suspend.sbr \
	$(INTDIR)/read.sbr \
	$(INTDIR)/times.sbr \
	$(INTDIR)/bashgetopt.sbr \
	$(INTDIR)/bind.sbr \
	$(INTDIR)/exit.sbr \
	$(INTDIR)/break.sbr \
	$(INTDIR)/common.sbr \
	$(INTDIR)/exec.sbr \
	$(INTDIR)/shift.sbr \
	$(INTDIR)/colon.sbr \
	$(INTDIR)/set.sbr \
	$(INTDIR)/source.sbr \
	$(INTDIR)/eval.sbr \
	$(INTDIR)/hash.sbr \
	$(INTDIR)/let.sbr \
	$(INTDIR)/return.sbr \
	$(INTDIR)/umask.sbr \
	$(INTDIR)/command.sbr \
	$(INTDIR)/setattr.sbr \
	$(INTDIR)/history.sbr \
	$(INTDIR)/builtin.sbr \
	$(INTDIR)/alias.sbr \
	$(INTDIR)/type.sbr \
	$(INTDIR)/getopt.sbr \
	$(INTDIR)/builtins.sbr

$(OUTDIR)/Bash_builtins.bsc : $(OUTDIR)  $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LIB32=lib.exe
# ADD BASE LIB32 /NOLOGO
# ADD LIB32 /NOLOGO
LIB32_FLAGS=/NOLOGO /OUT:$(OUTDIR)\Bash_builtins.lib 
DEF_FLAGS=
DEF_FILE=
LIB32_OBJS= \
	$(INTDIR)/test.obj \
	$(INTDIR)/echo.obj \
	$(INTDIR)/cd.obj \
	$(INTDIR)/ulimit.obj \
	$(INTDIR)/help.obj \
	$(INTDIR)/wait.obj \
	$(INTDIR)/kill.obj \
	$(INTDIR)/jobs.obj \
	$(INTDIR)/trap.obj \
	$(INTDIR)/enable.obj \
	$(INTDIR)/fc.obj \
	$(INTDIR)/fg_bg.obj \
	$(INTDIR)/declare.obj \
	$(INTDIR)/inlib.obj \
	$(INTDIR)/getopts.obj \
	$(INTDIR)/suspend.obj \
	$(INTDIR)/read.obj \
	$(INTDIR)/times.obj \
	$(INTDIR)/bashgetopt.obj \
	$(INTDIR)/bind.obj \
	$(INTDIR)/exit.obj \
	$(INTDIR)/break.obj \
	$(INTDIR)/common.obj \
	$(INTDIR)/exec.obj \
	$(INTDIR)/shift.obj \
	$(INTDIR)/colon.obj \
	$(INTDIR)/set.obj \
	$(INTDIR)/source.obj \
	$(INTDIR)/eval.obj \
	$(INTDIR)/hash.obj \
	$(INTDIR)/let.obj \
	$(INTDIR)/return.obj \
	$(INTDIR)/umask.obj \
	$(INTDIR)/command.obj \
	$(INTDIR)/setattr.obj \
	$(INTDIR)/history.obj \
	$(INTDIR)/builtin.obj \
	$(INTDIR)/alias.obj \
	$(INTDIR)/type.obj \
	$(INTDIR)/getopt.obj \
	$(INTDIR)/builtins.obj

$(OUTDIR)/Bash_builtins.lib : $(OUTDIR)  $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32)  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
#
#    $(LIB32) @<<
#  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
#<<

!ENDIF 

.c{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.cpp{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.cxx{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

################################################################################
# Begin Group Source Files

################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\test.c
DEP_TEST_=\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\shell.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\config.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\command.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\general.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\error.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\variables.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\quit.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\maxpath.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\make_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\subst.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\externs.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\unistd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\stdc.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\hash.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\param.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h

$(INTDIR)/test.obj :  $(SOURCE)  $(DEP_TEST_) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\echo.c
DEP_ECHO_=\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\shell.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\config.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\command.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\general.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\error.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\variables.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\quit.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\maxpath.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\make_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\subst.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\externs.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\unistd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\stdc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\hash.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\param.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h

$(INTDIR)/echo.obj :  $(SOURCE)  $(DEP_ECHO_) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\cd.c
DEP_CD_C4=\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\param.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\tilde\tilde.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\shell.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\flags.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\maxpath.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\common.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\config.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\command.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\general.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\error.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\variables.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\quit.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\make_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\subst.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\externs.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\stdc.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\unistd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\hash.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h

$(INTDIR)/cd.obj :  $(SOURCE)  $(DEP_CD_C4) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\ulimit.c
DEP_ULIMI=\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\param.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\shell.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\pipesize.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\time.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\resource.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\times.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\config.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\command.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\general.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\error.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\variables.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\quit.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\maxpath.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\make_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\subst.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\externs.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\unistd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\stdc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\hash.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h

$(INTDIR)/ulimit.obj :  $(SOURCE)  $(DEP_ULIMI) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\help.c
DEP_HELP_=\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\shell.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\glob\glob.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\config.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\command.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\general.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\error.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\variables.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\quit.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\maxpath.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\make_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\subst.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\externs.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\alias.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\unistd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\stdc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\hash.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\param.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h

$(INTDIR)/help.obj :  $(SOURCE)  $(DEP_HELP_) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\wait.c
DEP_WAIT_=\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\shell.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\jobs.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\config.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\command.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\general.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\error.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\variables.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\quit.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\maxpath.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\make_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\subst.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\externs.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\siglist.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\stdc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\wait.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\bash_endian.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\unistd.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\hash.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\param.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h

$(INTDIR)/wait.obj :  $(SOURCE)  $(DEP_WAIT_) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\kill.c
DEP_KILL_=\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\shell.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\trap.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\jobs.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\common.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\config.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\command.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\general.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\error.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\variables.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\quit.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\maxpath.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\make_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\subst.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\externs.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\stdc.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\siglist.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\wait.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\bash_endian.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\unistd.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\hash.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\param.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h

$(INTDIR)/kill.obj :  $(SOURCE)  $(DEP_KILL_) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\jobs.c
DEP_JOBS_=\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\shell.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\jobs.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\bashgetopt.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\config.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\command.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\general.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\error.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\variables.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\quit.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\maxpath.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\make_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\subst.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\externs.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\siglist.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\stdc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\wait.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\bash_endian.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\unistd.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\hash.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\param.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h

$(INTDIR)/jobs.obj :  $(SOURCE)  $(DEP_JOBS_) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\trap.c
DEP_TRAP_=\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\shell.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\trap.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\common.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\config.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\command.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\general.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\error.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\variables.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\quit.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\maxpath.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\make_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\subst.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\externs.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\stdc.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\unistd.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\hash.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\param.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h

$(INTDIR)/trap.obj :  $(SOURCE)  $(DEP_TRAP_) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\enable.c
DEP_ENABL=\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\shell.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\common.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\config.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\command.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\general.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\error.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\variables.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\quit.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\maxpath.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\make_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\subst.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\externs.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\alias.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\unistd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\stdc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\hash.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\param.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h

$(INTDIR)/enable.obj :  $(SOURCE)  $(DEP_ENABL) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\fc.c
DEP_FC_C14=\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\bashansi.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\shell.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\param.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\file.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\flags.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\maxpath.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\bashhist.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\history.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\bashgetopt.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\ansi_stdlib.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\config.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\command.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\general.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\error.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\variables.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\quit.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\make_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\subst.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\externs.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\alias.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\stdc.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\unistd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\hash.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h

$(INTDIR)/fc.obj :  $(SOURCE)  $(DEP_FC_C14) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\fg_bg.c
DEP_FG_BG=\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\shell.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\jobs.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\config.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\command.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\general.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\error.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\variables.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\quit.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\maxpath.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\make_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\subst.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\externs.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\siglist.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\stdc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\wait.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\bash_endian.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\unistd.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\hash.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\param.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h

$(INTDIR)/fg_bg.obj :  $(SOURCE)  $(DEP_FG_BG) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\declare.c
DEP_DECLA=\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\shell.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\config.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\command.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\general.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\error.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\variables.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\quit.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\maxpath.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\make_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\subst.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\externs.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\unistd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\stdc.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\hash.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\param.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h

$(INTDIR)/declare.obj :  $(SOURCE)  $(DEP_DECLA) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\inlib.c
DEP_INLIB=\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\shell.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\apollo\base.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\apollo\loader.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\config.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\command.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\general.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\error.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\variables.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\quit.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\maxpath.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\make_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\subst.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\externs.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\unistd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\stdc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\hash.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\param.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h

$(INTDIR)/inlib.obj :  $(SOURCE)  $(DEP_INLIB) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\getopts.c
DEP_GETOP=\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\shell.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\getopt.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\config.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\command.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\general.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\error.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\variables.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\quit.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\maxpath.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\make_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\subst.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\externs.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\unistd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\stdc.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\hash.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\param.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h

$(INTDIR)/getopts.obj :  $(SOURCE)  $(DEP_GETOP) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\suspend.c
DEP_SUSPE=\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\shell.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\jobs.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\config.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\command.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\general.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\error.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\variables.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\quit.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\maxpath.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\make_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\subst.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\externs.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\siglist.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\stdc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\wait.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\bash_endian.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\unistd.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\hash.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\param.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h

$(INTDIR)/suspend.obj :  $(SOURCE)  $(DEP_SUSPE) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\read.c
DEP_READ_=\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\shell.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\common.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\config.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\command.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\general.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\error.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\variables.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\quit.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\maxpath.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\make_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\subst.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\externs.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\unistd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\stdc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\hash.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\param.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h

$(INTDIR)/read.obj :  $(SOURCE)  $(DEP_READ_) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\times.c
DEP_TIMES=\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\shell.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\times.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\time.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\resource.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\config.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\command.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\general.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\error.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\variables.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\quit.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\maxpath.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\make_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\subst.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\externs.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\unistd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\stdc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\hash.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\param.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h

$(INTDIR)/times.obj :  $(SOURCE)  $(DEP_TIMES) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\bashgetopt.c
DEP_BASHG=\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\shell.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\bashansi.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\config.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\command.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\general.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\error.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\variables.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\quit.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\maxpath.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\make_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\subst.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\externs.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\ansi_stdlib.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\unistd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\stdc.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\hash.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\param.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h

$(INTDIR)/bashgetopt.obj :  $(SOURCE)  $(DEP_BASHG) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\bind.c
DEP_BIND_=\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\shell.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\readline.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\history.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\bashgetopt.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\config.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\command.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\general.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\error.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\variables.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\quit.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\maxpath.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\make_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\subst.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\externs.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\keymaps.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\tilde.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\unistd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\stdc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\hash.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\param.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\chardefs.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h

$(INTDIR)/bind.obj :  $(SOURCE)  $(DEP_BIND_) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\exit.c
DEP_EXIT_=\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\shell.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\jobs.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\builtext.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\config.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\command.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\general.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\error.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\variables.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\quit.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\maxpath.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\make_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\subst.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\externs.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\siglist.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\stdc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\wait.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\bash_endian.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\unistd.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\hash.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\param.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h

$(INTDIR)/exit.obj :  $(SOURCE)  $(DEP_EXIT_) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\break.c
DEP_BREAK=\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\shell.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\config.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\command.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\general.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\error.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\variables.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\quit.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\maxpath.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\make_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\subst.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\externs.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\unistd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\stdc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\hash.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\param.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h

$(INTDIR)/break.obj :  $(SOURCE)  $(DEP_BREAK) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\common.c
DEP_COMMO=\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\posixstat.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\shell.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\maxpath.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\jobs.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\input.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\execute_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\hashcom.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\common.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\tilde\tilde.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\bashhist.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\config.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\command.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\general.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\error.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\variables.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\quit.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\make_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\subst.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\externs.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\param.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\siglist.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\stdc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\wait.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\bash_endian.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\alias.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\hash.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\unistd.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h

$(INTDIR)/common.obj :  $(SOURCE)  $(DEP_COMMO) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\exec.c
DEP_EXEC_=\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\shell.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\posixstat.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\execute_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\common.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\flags.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\config.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\command.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\general.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\error.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\variables.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\quit.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\maxpath.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\make_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\subst.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\externs.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\stdc.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\unistd.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\hash.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\param.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h

$(INTDIR)/exec.obj :  $(SOURCE)  $(DEP_EXEC_) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\shift.c
DEP_SHIFT=\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\shell.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\config.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\command.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\general.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\error.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\variables.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\quit.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\maxpath.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\make_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\subst.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\externs.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\unistd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\stdc.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\hash.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\param.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h

$(INTDIR)/shift.obj :  $(SOURCE)  $(DEP_SHIFT) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\colon.c

$(INTDIR)/colon.obj :  $(SOURCE)  $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\set.c
DEP_SET_C=\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\shell.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\flags.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\bashgetopt.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\config.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\command.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\general.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\error.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\variables.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\quit.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\maxpath.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\make_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\subst.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\externs.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\stdc.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\unistd.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\hash.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\param.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h

$(INTDIR)/set.obj :  $(SOURCE)  $(DEP_SET_C) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\source.c
DEP_SOURC=\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\file.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\shell.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\posixstat.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\filecntl.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\execute_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\config.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\command.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\general.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\error.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\variables.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\quit.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\maxpath.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\make_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\subst.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\externs.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\stdc.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\unistd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\hash.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\param.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h

$(INTDIR)/source.obj :  $(SOURCE)  $(DEP_SOURC) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\eval.c
DEP_EVAL_=\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\shell.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\config.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\command.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\general.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\error.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\variables.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\quit.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\maxpath.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\make_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\subst.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\externs.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\unistd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\stdc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\hash.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\param.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h

$(INTDIR)/eval.obj :  $(SOURCE)  $(DEP_EVAL_) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\hash.c
DEP_HASH_=\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\posixstat.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\shell.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\flags.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\hashcom.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\common.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\execute_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\config.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\command.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\general.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\error.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\variables.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\quit.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\maxpath.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\make_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\subst.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\externs.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\alias.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\stdc.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\hash.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\unistd.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\param.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h

$(INTDIR)/hash.obj :  $(SOURCE)  $(DEP_HASH_) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\let.c
DEP_LET_C=\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\shell.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\config.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\command.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\general.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\error.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\variables.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\quit.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\maxpath.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\make_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\subst.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\externs.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\unistd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\stdc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\hash.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\param.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h

$(INTDIR)/let.obj :  $(SOURCE)  $(DEP_LET_C) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\return.c
DEP_RETUR=\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\shell.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\config.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\command.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\general.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\error.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\variables.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\quit.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\maxpath.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\make_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\subst.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\externs.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\unistd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\stdc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\hash.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\param.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h

$(INTDIR)/return.obj :  $(SOURCE)  $(DEP_RETUR) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\umask.c
DEP_UMASK=\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\file.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\shell.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\posixstat.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\common.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\config.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\command.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\general.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\error.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\variables.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\quit.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\maxpath.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\make_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\subst.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\externs.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\unistd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\stdc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\hash.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\param.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h

$(INTDIR)/umask.obj :  $(SOURCE)  $(DEP_UMASK) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\command.c
DEP_COMMA=\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\shell.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\bashgetopt.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\config.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\command.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\general.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\error.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\variables.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\quit.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\maxpath.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\make_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\subst.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\externs.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\unistd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\stdc.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\hash.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\param.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h

$(INTDIR)/command.obj :  $(SOURCE)  $(DEP_COMMA) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\setattr.c
DEP_SETAT=\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\shell.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\common.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\bashgetopt.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\config.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\command.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\general.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\error.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\variables.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\quit.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\maxpath.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\make_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\subst.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\externs.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\unistd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\stdc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\hash.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\param.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h

$(INTDIR)/setattr.obj :  $(SOURCE)  $(DEP_SETAT) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\history.c
DEP_HISTO=\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\shell.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\file.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\filecntl.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\posixstat.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\bashhist.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\history.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\config.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\command.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\general.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\error.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\variables.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\quit.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\maxpath.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\make_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\subst.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\externs.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\unistd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\stdc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\hash.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\param.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h

$(INTDIR)/history.obj :  $(SOURCE)  $(DEP_HISTO) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\builtin.c
DEP_BUILT=\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\shell.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\common.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\config.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\command.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\general.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\error.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\variables.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\quit.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\maxpath.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\make_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\subst.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\externs.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\unistd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\stdc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\hash.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\param.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h

$(INTDIR)/builtin.obj :  $(SOURCE)  $(DEP_BUILT) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\alias.c
DEP_ALIAS=\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\config.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\shell.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\alias.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\common.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\unistd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\command.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\general.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\error.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\variables.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\quit.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\maxpath.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\make_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\subst.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\externs.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\hash.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\stdc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\param.h

$(INTDIR)/alias.obj :  $(SOURCE)  $(DEP_ALIAS) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\type.c
DEP_TYPE_=\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\posixstat.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\shell.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\execute_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\alias.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\common.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\config.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\command.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\general.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\error.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\variables.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\quit.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\maxpath.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\make_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\subst.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\externs.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\stdc.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\hash.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\unistd.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\param.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h

$(INTDIR)/type.obj :  $(SOURCE)  $(DEP_TYPE_) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\getopt.c
DEP_GETOPT=\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\config.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\getopt.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\unistd.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h

$(INTDIR)/getopt.obj :  $(SOURCE)  $(DEP_GETOPT) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\builtins.c
DEP_BUILTI=\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\builtext.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\config.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\command.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\general.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\alias.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\unistd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\stdc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\hash.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h

$(INTDIR)/builtins.obj :  $(SOURCE)  $(DEP_BUILTI) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
# End Group
# End Project
################################################################################
