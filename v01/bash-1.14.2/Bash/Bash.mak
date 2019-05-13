# Microsoft Visual C++ Generated NMAKE File, Format Version 2.00
# ** DO NOT EDIT **


# TARGTYPE "Win32 (x86) Console Application" 0x0103

!IF "$(CFG)" == ""
CFG=Win32 Debug
!MESSAGE No configuration specified.  Defaulting to Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "Win32 Release" && "$(CFG)" != "Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE on this makefile
!MESSAGE by defining the macro CFG on the command line.  For example:
!MESSAGE 
!MESSAGE NMAKE /f "Bash.mak" CFG="Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "Win32 Debug" (based on "Win32 (x86) Console Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

BASH_SRC_MAIN_DIR=..\..

################################################################################
# Begin Project
# PROP Target_Last_Scanned "Win32 Debug"

CPP=cl.exe /Zi /Fm 
RSC=rc.exe

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

ALL : $(OUTDIR)/Bash.exe $(OUTDIR)/Bash.bsc

$(OUTDIR) : 
    if not exist $(OUTDIR)/nul mkdir $(OUTDIR)

# ADD BASE CPP /nologo /W3 /GX /YX /O2 /I "$(BASH_SRC_MAIN_DIR)\bash-1.14.2" /I "$(BASH_SRC_MAIN_DIR)\bash-1.14.2/lib" /I "$(BASH_SRC_MAIN_DIR)\dum_inc" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D Program=bash /D "INITIALIZE_SIGLIST" /D "HAVE_VFPRINTF" /D "HAVE_UNISTD_H" /D "HAVE_STDLIB_H" /D "HAVE_LIMITS_H" /D "HAVE_RESOURCE" /D "HAVE_SYS_PARAM" /D "VOID_SIGHANDLER" /D "BROKEN_SIGSUSPEND" /D "HAVE_GETHOSTNAME" /D "MKFIFO_MISSING" /D "NO_DEV_TTY_JOB_CONTROL" /D "NO_SBRK_DECL" /D "PGRP_PIPE" /D "TERMIOS_MISSING" /D "HAVE_WAIT_H" /D "HAVE_DUP2" /D "HAVE_STRERROR" /D "HAVE_DIRENT" /D "HAVE_DIRENT_H" /D "HAVE_STRING_H" /D "HAVE_VARARGS_H" /D "HAVE_STRCHR" /D "SHELL" /D "HAVE_ALLOCA" /D "HAVE_ALLOCA_H" /FR /c
# ADD CPP /nologo /w /W0 /GX /YX /O2 /I "$(BASH_SRC_MAIN_DIR)\bash-1.14.2" /I "$(BASH_SRC_MAIN_DIR)\bash-1.14.2/lib" /I "$(BASH_SRC_MAIN_DIR)\dum_inc" /D "NDEBUG" /D "WIN32" /D "_CONSOLE" /D Program=bash /D "INITIALIZE_SIGLIST" /D "HAVE_VFPRINTF" /D "HAVE_UNISTD_H" /D "HAVE_STDLIB_H" /D "HAVE_LIMITS_H" /D "HAVE_RESOURCE" /D "HAVE_SYS_PARAM" /D "HAVE_DIRENT_H" /D "VOID_SIGHANDLER" /D "BROKEN_SIGSUSPEND" /D "HAVE_GETHOSTNAME" /D "MKFIFO_MISSING" /D "NO_DEV_TTY_JOB_CONTROL" /D "NO_SBRK_DECL" /D "PGRP_PIPE" /D "TERMIOS_MISSING" /D "HAVE_DUP2" /D "HAVE_STRERROR" /D "HAVE_DIRENT" /D "HAVE_STRING_H" /D "HAVE_VARARGS_H" /D "HAVE_STRCHR" /D "SHELL" /D "HAVE_ALLOCA" /D "HAVE_ALLOCA_H" /D "__NT_VC__" /FR /c
CPP_PROJ=/nologo /w /W0 /GX /YX /O2 /I $(BASH_SRC_MAIN_DIR)\bash-1.14.2 /I\
 $(BASH_SRC_MAIN_DIR)\bash-1.14.2/lib /I $(BASH_SRC_MAIN_DIR)\dum_inc /D NDEBUG /D\
 WIN32 /D _CONSOLE /D Program=bash /D INITIALIZE_SIGLIST /D\
 HAVE_VFPRINTF /D HAVE_UNISTD_H /D HAVE_STDLIB_H /D HAVE_LIMITS_H /D\
 HAVE_RESOURCE /D HAVE_SYS_PARAM /D HAVE_DIRENT_H /D VOID_SIGHANDLER /D\
 BROKEN_SIGSUSPEND /D HAVE_GETHOSTNAME /D MKFIFO_MISSING /D\
 NO_DEV_TTY_JOB_CONTROL /D NO_SBRK_DECL /D PGRP_PIPE /D TERMIOS_MISSING\
 /D HAVE_DUP2 /D HAVE_STRERROR /D HAVE_DIRENT /D HAVE_STRING_H /D\
 HAVE_VARARGS_H /D HAVE_STRCHR /D SHELL /D HAVE_ALLOCA /D\
 HAVE_ALLOCA_H /D __NT_VC__  /FR$(INTDIR)/ /Fp$(OUTDIR)/Bash.pch\
 /Fo$(INTDIR)/ /c 
CPP_OBJS=.\WinRel/
# ADD BASE RSC /l 0x409 /i 0x409 /d NDEBUG
# ADD RSC /l 0x409 /i $(BASH_SRC_MAIN_DIR)\dum_inc /d NDEBUG
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o$(OUTDIR)/Bash.bsc 
BSC32_SBRS= \
	$(INTDIR)/execute_cmd.sbr \
	$(INTDIR)/error.sbr \
	$(INTDIR)/siglist.sbr \
	$(INTDIR)/dispose_cmd.sbr \
	$(INTDIR)/copy_cmd.sbr \
	$(INTDIR)/shell.sbr \
	$(INTDIR)/alias.sbr \
	$(INTDIR)/expr.sbr \
	$(INTDIR)/flags.sbr \
	$(INTDIR)/nojobs.sbr \
	$(INTDIR)/general.sbr \
	$(INTDIR)/input.sbr \
	$(INTDIR)/bracecomp.sbr \
	$(INTDIR)/version.sbr \
	$(INTDIR)/bashline.sbr \
	$(INTDIR)/hash.sbr \
	$(INTDIR)/braces.sbr \
	$(INTDIR)/bashhist.sbr \
	$(INTDIR)/make_cmd.sbr \
	$(INTDIR)/unwind_prot.sbr \
	$(INTDIR)/print_cmd.sbr \
	$(INTDIR)/subst.sbr \
	$(INTDIR)/mailcheck.sbr \
	$(INTDIR)/variables.sbr \
	$(INTDIR)/getcwd.sbr \
	$(INTDIR)/fnmatch.sbr \
	$(INTDIR)/glob.sbr \
	$(INTDIR)/y_tab.sbr \
	$(INTDIR)/history.sbr \
	$(INTDIR)/vi_mode.sbr \
	$(INTDIR)/keymaps.sbr \
	$(INTDIR)/tilde.sbr \
	$(INTDIR)/isearch.sbr \
	$(INTDIR)/parens.sbr \
	$(INTDIR)/signals.sbr \
	$(INTDIR)/funmap.sbr \
	$(INTDIR)/complete.sbr \
	$(INTDIR)/search.sbr \
	$(INTDIR)/display.sbr \
	$(INTDIR)/readline.sbr \
	$(INTDIR)/test.sbr \
	$(INTDIR)/bind.sbr \
	$(INTDIR)/trap.sbr \
	$(INTDIR)/rltty.sbr \
	$(INTDIR)/dirent.sbr \
	$(INTDIR)/bzero.sbr \
	$(INTDIR)/bash_dum.sbr \
	$(INTDIR)/nt_vc.sbr \
	$(INTDIR)/bcopy.sbr \
	$(INTDIR)/unistd.sbr \
	$(INTDIR)/signal.sbr

$(OUTDIR)/Bash.bsc : $(OUTDIR)  $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe 
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /NOLOGO /SUBSYSTEM:console /MACHINE:I386
# ADD LINK32 winstrm.lib wsock32.lib $(BASH_SRC_MAIN_DIR)\bash-1.14.2\Bash_builtins\WinRel\Bash_builtins.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /NOLOGO /SUBSYSTEM:console /MACHINE:I386

#LINK32_FLAGS=winstrm.lib wsock32.lib\
# $(BASH_SRC_MAIN_DIR)\bash-1.14.2\Bash_builtins\WinRel\Bash_builtins.lib kernel32.lib\
# user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib\
# ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /NOLOGO\
# /SUBSYSTEM:console /INCREMENTAL:no /PDB:$(OUTDIR)/Bash.pdb /MACHINE:I386\
# /OUT:$(OUTDIR)/Bash.exe /DEBUG  


LINK32_FLAGS=winstrm.lib wsock32.lib\
 $(BASH_SRC_MAIN_DIR)\bash-1.14.2\Bash_builtins\WinRel\Bash_builtins.lib kernel32.lib\
 user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib\
 ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /NOLOGO\
 /SUBSYSTEM:console /INCREMENTAL:no /PDB:$(OUTDIR)/Bash.pdb /MACHINE:I386\
 /OUT:$(OUTDIR)/Bash.exe /DEBUG  /MAP

DEF_FILE=
LINK32_OBJS= \
	$(INTDIR)/execute_cmd.obj \
	$(INTDIR)/error.obj \
	$(INTDIR)/siglist.obj \
	$(INTDIR)/dispose_cmd.obj \
	$(INTDIR)/copy_cmd.obj \
	$(INTDIR)/shell.obj \
	$(INTDIR)/alias.obj \
	$(INTDIR)/expr.obj \
	$(INTDIR)/flags.obj \
	$(INTDIR)/nojobs.obj \
	$(INTDIR)/general.obj \
	$(INTDIR)/input.obj \
	$(INTDIR)/bracecomp.obj \
	$(INTDIR)/version.obj \
	$(INTDIR)/bashline.obj \
	$(INTDIR)/hash.obj \
	$(INTDIR)/braces.obj \
	$(INTDIR)/bashhist.obj \
	$(INTDIR)/make_cmd.obj \
	$(INTDIR)/unwind_prot.obj \
	$(INTDIR)/print_cmd.obj \
	$(INTDIR)/subst.obj \
	$(INTDIR)/mailcheck.obj \
	$(INTDIR)/variables.obj \
	$(INTDIR)/getcwd.obj \
	$(INTDIR)/fnmatch.obj \
	$(INTDIR)/glob.obj \
	$(INTDIR)/y_tab.obj \
	$(INTDIR)/history.obj \
	$(INTDIR)/vi_mode.obj \
	$(INTDIR)/keymaps.obj \
	$(INTDIR)/tilde.obj \
	$(INTDIR)/isearch.obj \
	$(INTDIR)/parens.obj \
	$(INTDIR)/signals.obj \
	$(INTDIR)/funmap.obj \
	$(INTDIR)/complete.obj \
	$(INTDIR)/search.obj \
	$(INTDIR)/display.obj \
	$(INTDIR)/readline.obj \
	$(INTDIR)/test.obj \
	$(INTDIR)/bind.obj \
	$(INTDIR)/trap.obj \
	$(INTDIR)/rltty.obj \
	$(INTDIR)/dirent.obj \
	$(INTDIR)/bash_dum.obj \
	$(INTDIR)/nt_vc.obj \
	$(INTDIR)/unistd.obj \
	$(INTDIR)/signal.obj \
	$(INTDIR)/bzero.obj \
	$(INTDIR)/bcopy.obj 

$(OUTDIR)/Bash.exe : $(OUTDIR)  $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
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

ALL : $(OUTDIR)/Bash.exe $(OUTDIR)/Bash.bsc

$(OUTDIR) : 
    if not exist $(OUTDIR)/nul mkdir $(OUTDIR)

# ADD BASE CPP /nologo /W3 /GX /Zi /YX /Od /I "$(BASH_SRC_MAIN_DIR)\bash-1.14.2" /I "$(BASH_SRC_MAIN_DIR)\bash-1.14.2/lib" /I "$(BASH_SRC_MAIN_DIR)\dum_inc" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D Program=bash /D "INITIALIZE_SIGLIST" /D "HAVE_VFPRINTF" /D "HAVE_UNISTD_H" /D "HAVE_STDLIB_H" /D "HAVE_LIMITS_H" /D "HAVE_RESOURCE" /D "HAVE_SYS_PARAM" /D "VOID_SIGHANDLER" /D "BROKEN_SIGSUSPEND" /D "HAVE_GETHOSTNAME" /D "MKFIFO_MISSING" /D "NO_DEV_TTY_JOB_CONTROL" /D "NO_SBRK_DECL" /D "PGRP_PIPE" /D "TERMIOS_MISSING" /D "HAVE_WAIT_H" /D "HAVE_DUP2" /D "HAVE_STRERROR" /D "HAVE_DIRENT" /D "HAVE_DIRENT_H" /D "HAVE_STRING_H" /D "HAVE_VARARGS_H" /D "HAVE_STRCHR" /D "SHELL" /D "HAVE_ALLOCA" /D "HAVE_ALLOCA_H" /FR /c
# ADD CPP /nologo /w /W0 /GX /Zi /YX /Od /I "$(BASH_SRC_MAIN_DIR)\bash-1.14.2" /I "$(BASH_SRC_MAIN_DIR)\bash-1.14.2/lib" /I "$(BASH_SRC_MAIN_DIR)\dum_inc" /D "_DEBUG" /D "WIN32" /D "_CONSOLE" /D Program=bash /D "INITIALIZE_SIGLIST" /D "HAVE_VFPRINTF" /D "HAVE_UNISTD_H" /D "HAVE_STDLIB_H" /D "HAVE_LIMITS_H" /D "HAVE_RESOURCE" /D "HAVE_SYS_PARAM" /D "HAVE_DIRENT_H" /D "VOID_SIGHANDLER" /D "BROKEN_SIGSUSPEND" /D "HAVE_GETHOSTNAME" /D "MKFIFO_MISSING" /D "NO_DEV_TTY_JOB_CONTROL" /D "NO_SBRK_DECL" /D "PGRP_PIPE" /D "TERMIOS_MISSING" /D "HAVE_DUP2" /D "HAVE_STRERROR" /D "HAVE_DIRENT" /D "HAVE_STRING_H" /D "HAVE_VARARGS_H" /D "HAVE_STRCHR" /D "SHELL" /D "HAVE_ALLOCA" /D "HAVE_ALLOCA_H" /D "__NT_VC__" /FR /c
CPP_PROJ=/nologo /w /W0 /GX /Zi /YX /Od /I $(BASH_SRC_MAIN_DIR)\bash-1.14.2 /I\
 $(BASH_SRC_MAIN_DIR)\bash-1.14.2/lib /I $(BASH_SRC_MAIN_DIR)\dum_inc /D _DEBUG /D\
 WIN32 /D _CONSOLE /D Program=bash /D INITIALIZE_SIGLIST /D\
 HAVE_VFPRINTF /D HAVE_UNISTD_H /D HAVE_STDLIB_H /D HAVE_LIMITS_H /D\
 HAVE_RESOURCE /D HAVE_SYS_PARAM /D HAVE_DIRENT_H /D VOID_SIGHANDLER /D\
 BROKEN_SIGSUSPEND /D HAVE_GETHOSTNAME /D MKFIFO_MISSING /D\
 NO_DEV_TTY_JOB_CONTROL /D NO_SBRK_DECL /D PGRP_PIPE /D TERMIOS_MISSING\
 /D HAVE_DUP2 /D HAVE_STRERROR /D HAVE_DIRENT /D HAVE_STRING_H /D\
 HAVE_VARARGS_H /D HAVE_STRCHR /D SHELL /D HAVE_ALLOCA /D\
 HAVE_ALLOCA_H /D __NT_VC__  /FR$(INTDIR)/ /Fp$(OUTDIR)/Bash.pch\
 /Fo$(INTDIR)/ /Fd$(OUTDIR)/Bash.pdb /c 
CPP_OBJS=.\WinDebug/
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /i "$(BASH_SRC_MAIN_DIR)\dum_inc" /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nolog
BSC32_FLAGS=/o$(OUTDIR)/Bash.bsc /nolog 
BSC32_SBRS= \
	$(INTDIR)/execute_cmd.sbr \
	$(INTDIR)/error.sbr \
	$(INTDIR)/siglist.sbr \
	$(INTDIR)/dispose_cmd.sbr \
	$(INTDIR)/copy_cmd.sbr \
	$(INTDIR)/shell.sbr \
	$(INTDIR)/alias.sbr \
	$(INTDIR)/expr.sbr \
	$(INTDIR)/flags.sbr \
	$(INTDIR)/nojobs.sbr \
	$(INTDIR)/general.sbr \
	$(INTDIR)/input.sbr \
	$(INTDIR)/bracecomp.sbr \
	$(INTDIR)/version.sbr \
	$(INTDIR)/bashline.sbr \
	$(INTDIR)/hash.sbr \
	$(INTDIR)/braces.sbr \
	$(INTDIR)/bashhist.sbr \
	$(INTDIR)/make_cmd.sbr \
	$(INTDIR)/unwind_prot.sbr \
	$(INTDIR)/print_cmd.sbr \
	$(INTDIR)/subst.sbr \
	$(INTDIR)/mailcheck.sbr \
	$(INTDIR)/variables.sbr \
	$(INTDIR)/getcwd.sbr \
	$(INTDIR)/fnmatch.sbr \
	$(INTDIR)/glob.sbr \
	$(INTDIR)/y_tab.sbr \
	$(INTDIR)/history.sbr \
	$(INTDIR)/vi_mode.sbr \
	$(INTDIR)/keymaps.sbr \
	$(INTDIR)/tilde.sbr \
	$(INTDIR)/isearch.sbr \
	$(INTDIR)/parens.sbr \
	$(INTDIR)/signals.sbr \
	$(INTDIR)/funmap.sbr \
	$(INTDIR)/complete.sbr \
	$(INTDIR)/search.sbr \
	$(INTDIR)/display.sbr \
	$(INTDIR)/readline.sbr \
	$(INTDIR)/test.sbr \
	$(INTDIR)/bind.sbr \
	$(INTDIR)/trap.sbr \
	$(INTDIR)/rltty.sbr \
	$(INTDIR)/dirent.sbr \
	$(INTDIR)/bash_dum.sbr \
	$(INTDIR)/nt_vc.sbr \
	$(INTDIR)/unistd.sbr \
	$(INTDIR)/signal.sbr \
	$(INTDIR)/bzero.sbr \
	$(INTDIR)/bcopy.sbr 

$(OUTDIR)/Bash.bsc : $(OUTDIR)  $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /NOLOGO /SUBSYSTEM:console /DEBUG /MACHINE:I386
# ADD LINK32 winstrm.lib wsock32.lib $(BASH_SRC_MAIN_DIR)\bash-1.14.2\Bash_builtins\WinDebug\Bash_builtins.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /NOLOGO /SUBSYSTEM:console /DEBUG /MACHINE:I386
#LINK32_FLAGS=winstrm.lib wsock32.lib\
# $(BASH_SRC_MAIN_DIR)\bash-1.14.2\Bash_builtins\WinDebug\Bash_builtins.lib\
# kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib\
# shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /NOLOGO\
# /SUBSYSTEM:console /INCREMENTAL:yes /PDB:$(OUTDIR)/Bash.pdb /DEBUG\
# /MACHINE:I386 /OUT:$(OUTDIR)/Bash.exe  /DEBUG

LINK32_FLAGS=winstrm.lib wsock32.lib\
 $(BASH_SRC_MAIN_DIR)\bash-1.14.2\Bash_builtins\WinDebug\Bash_builtins.lib\
 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib\
 shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib  /NOLOGO\
 /SUBSYSTEM:console /INCREMENTAL:yes /PDB:$(OUTDIR)/Bash.pdb /DEBUG\
 /MACHINE:I386 /OUT:$(OUTDIR)/Bash.exe  /DEBUG /MAP /PROFILE

DEF_FILE=
LINK32_OBJS= \
	$(INTDIR)/execute_cmd.obj \
	$(INTDIR)/error.obj \
	$(INTDIR)/siglist.obj \
	$(INTDIR)/dispose_cmd.obj \
	$(INTDIR)/copy_cmd.obj \
	$(INTDIR)/shell.obj \
	$(INTDIR)/alias.obj \
	$(INTDIR)/expr.obj \
	$(INTDIR)/flags.obj \
	$(INTDIR)/nojobs.obj \
	$(INTDIR)/general.obj \
	$(INTDIR)/input.obj \
	$(INTDIR)/bracecomp.obj \
	$(INTDIR)/version.obj \
	$(INTDIR)/bashline.obj \
	$(INTDIR)/hash.obj \
	$(INTDIR)/braces.obj \
	$(INTDIR)/bashhist.obj \
	$(INTDIR)/make_cmd.obj \
	$(INTDIR)/unwind_prot.obj \
	$(INTDIR)/print_cmd.obj \
	$(INTDIR)/subst.obj \
	$(INTDIR)/mailcheck.obj \
	$(INTDIR)/variables.obj \
	$(INTDIR)/getcwd.obj \
	$(INTDIR)/fnmatch.obj \
	$(INTDIR)/glob.obj \
	$(INTDIR)/y_tab.obj \
	$(INTDIR)/history.obj \
	$(INTDIR)/vi_mode.obj \
	$(INTDIR)/keymaps.obj \
	$(INTDIR)/tilde.obj \
	$(INTDIR)/isearch.obj \
	$(INTDIR)/parens.obj \
	$(INTDIR)/signals.obj \
	$(INTDIR)/funmap.obj \
	$(INTDIR)/complete.obj \
	$(INTDIR)/search.obj \
	$(INTDIR)/display.obj \
	$(INTDIR)/readline.obj \
	$(INTDIR)/test.obj \
	$(INTDIR)/bind.obj \
	$(INTDIR)/trap.obj \
	$(INTDIR)/rltty.obj \
	$(INTDIR)/dirent.obj \
	$(INTDIR)/bash_dum.obj \
	$(INTDIR)/nt_vc.obj \
	$(INTDIR)/unistd.obj \
	$(INTDIR)/signal.obj \
	$(INTDIR)/bzero.obj \
	$(INTDIR)/bcopy.obj 


$(OUTDIR)/Bash.exe : $(OUTDIR)  $(DEF_FILE) $(LINK32_OBJS)
	$(LINK32)  $(LINK32_FLAGS) $(LINK32_OBJS) 
#    $(LINK32) @<<
#  $(LINK32_FLAGS) $(LINK32_OBJS) .\WinDebug\Bash_builtins.lib
#<<

!ENDIF 

.c{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.cpp{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.cxx{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

################################################################################
# Begin Group "Source Files"

################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\execute_cmd.c
DEP_EXECU=\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\bashtypes.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\filecntl.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\posixstat.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\param.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\shell.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\y.tab.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\flags.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\hash.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\jobs.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\execute_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\sysdefs.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\common.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\builtext.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\glob\fnmatch.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\tilde\tilde.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\input.h\
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
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h

$(INTDIR)/execute_cmd.obj :  $(SOURCE)  $(DEP_EXECU) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\error.c
DEP_ERROR=\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\bashansi.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\flags.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\error.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\command.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\general.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\ansi_stdlib.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\stdc.h

$(INTDIR)/error.obj :  $(SOURCE)  $(DEP_ERROR) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\siglist.c
DEP_SIGLI=\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\siglist.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\trap.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\stdc.h

$(INTDIR)/siglist.obj :  $(SOURCE)  $(DEP_SIGLI) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\dispose_cmd.c
DEP_DISPO=\
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

$(INTDIR)/dispose_cmd.obj :  $(SOURCE)  $(DEP_DISPO) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\copy_cmd.c
DEP_COPY_=\
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

$(INTDIR)/copy_cmd.obj :  $(SOURCE)  $(DEP_COPY_) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\shell.c
DEP_SHELL=\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\nt_types.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\bashtypes.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\file.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\filecntl.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\pwd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\posixstat.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\bashansi.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\shell.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\flags.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\jobs.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\input.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\execute_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\bashhist.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\history.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\tilde\tilde.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\socket.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\ansi_stdlib.h\
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
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\hash.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\param.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h

$(INTDIR)/shell.obj :  $(SOURCE)  $(DEP_SHELL) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\alias.c
DEP_ALIAS=\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\bashansi.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\config.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\command.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\general.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\hash.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\alias.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\ansi_stdlib.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\unistd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\stdc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h

$(INTDIR)/alias.obj :  $(SOURCE)  $(DEP_ALIAS) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\expr.c
DEP_EXPR_=\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\bashansi.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\shell.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\ansi_stdlib.h\
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

$(INTDIR)/expr.obj :  $(SOURCE)  $(DEP_EXPR_) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\flags.c
DEP_FLAGS=\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\shell.h\
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

$(INTDIR)/flags.obj :  $(SOURCE)  $(DEP_FLAGS) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\nojobs.c
DEP_NOJOB=\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\bashtypes.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\config.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\command.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\general.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\filecntl.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\jobs.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\externs.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\input.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sgtty.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\termios.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\termio.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\ttold.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\unistd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\stdc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\quit.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\siglist.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\wait.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\bash_endian.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h

$(INTDIR)/nojobs.obj :  $(SOURCE)  $(DEP_NOJOB) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\general.c
DEP_GENER=\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\config.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\bashtypes.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\param.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\filecntl.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\bashansi.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\shell.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\tilde\tilde.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\time.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\times.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\maxpath.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\utsname.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\unistd.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\ansi_stdlib.h\
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
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\stdc.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\hash.h

$(INTDIR)/general.obj :  $(SOURCE)  $(DEP_GENER) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\input.c
DEP_INPUT=\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\bashtypes.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\file.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\posixstat.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\filecntl.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\bashansi.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\config.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\command.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\general.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\input.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\ansi_stdlib.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\unistd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\stdc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h

$(INTDIR)/input.obj :  $(SOURCE)  $(DEP_INPUT) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\bracecomp.c
DEP_BRACE=\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\shell.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\readline.h\
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
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\hash.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\param.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\chardefs.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h

$(INTDIR)/bracecomp.obj :  $(SOURCE)  $(DEP_BRACE) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\version.c
DEP_VERSI=\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\version.h

$(INTDIR)/version.obj :  $(SOURCE)  $(DEP_VERSI) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\bashline.c
DEP_BASHL=\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\bashtypes.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\posixstat.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\bashansi.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\readline.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\history.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\shell.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\common.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\bashhist.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\execute_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\alias.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\ansi_stdlib.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\keymaps.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\tilde.h\
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
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\chardefs.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\unistd.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\param.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h

$(INTDIR)/bashline.obj :  $(SOURCE)  $(DEP_BASHL) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\hash.c
DEP_HASH_=\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\ansi_stdlib.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\shell.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\hash.h\
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
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\param.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h

$(INTDIR)/hash.obj :  $(SOURCE)  $(DEP_HASH_) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\braces.c
DEP_BRACES=\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\shell.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\general.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\config.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\command.h\
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

$(INTDIR)/braces.obj :  $(SOURCE)  $(DEP_BRACES) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\bashhist.c
DEP_BASHH=\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\bashansi.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\posixstat.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\filecntl.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\shell.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\flags.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\history.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\ansi_stdlib.h\
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

$(INTDIR)/bashhist.obj :  $(SOURCE)  $(DEP_BASHH) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\make_cmd.c
DEP_MAKE_=\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\bashtypes.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\file.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\filecntl.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\bashansi.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\config.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\command.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\general.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\error.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\flags.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\make_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\subst.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\input.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\externs.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\jobs.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\ansi_stdlib.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\unistd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\stdc.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\quit.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\siglist.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\wait.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\bash_endian.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h

$(INTDIR)/make_cmd.obj :  $(SOURCE)  $(DEP_MAKE_) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\unwind_prot.c
DEP_UNWIN=\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\bashtypes.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\config.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\command.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\general.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\quit.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\unistd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\stdc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h

$(INTDIR)/unwind_prot.obj :  $(SOURCE)  $(DEP_UNWIN) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\print_cmd.c
DEP_PRINT=\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\shell.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\y.tab.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\stdc.h\
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
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\hash.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\param.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h

$(INTDIR)/print_cmd.obj :  $(SOURCE)  $(DEP_PRINT) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\subst.c
DEP_SUBST=\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\bashtypes.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\pwd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\nt_types.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\bashansi.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\posixstat.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\shell.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\flags.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\jobs.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\execute_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\filecntl.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\readline.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\tilde\tilde.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\bashhist.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\history.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\glob\fnmatch.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\ansi_stdlib.h\
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
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\keymaps.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\tilde.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\unistd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\hash.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\param.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\chardefs.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h

$(INTDIR)/subst.obj :  $(SOURCE)  $(DEP_SUBST) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\mailcheck.c
DEP_MAILC=\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\bashtypes.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\posixstat.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\param.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\bashansi.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\shell.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\maxpath.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\execute_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\tilde\tilde.h\
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
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\stdc.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\unistd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\hash.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h

$(INTDIR)/mailcheck.obj :  $(SOURCE)  $(DEP_MAILC) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\variables.c
DEP_VARIA=\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\bashtypes.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\posixstat.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\pwd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\bashansi.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\shell.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\hash.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\flags.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\execute_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\common.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\tilde\tilde.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\bashhist.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\ansi_stdlib.h\
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
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\param.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h

$(INTDIR)/variables.obj :  $(SOURCE)  $(DEP_VARIA) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\getcwd.c
DEP_GETCW=\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\bashtypes.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dirent.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\dir.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\unistd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\posixstat.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\maxpath.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\config.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\ansi_stdlib.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\param.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h

$(INTDIR)/getcwd.obj :  $(SOURCE)  $(DEP_GETCW) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\glob\fnmatch.c
DEP_FNMAT=\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\glob\fnmatch.h

$(INTDIR)/fnmatch.obj :  $(SOURCE)  $(DEP_FNMAT) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\glob\glob.c
DEP_GLOB_=\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\ansi_stdlib.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\config.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dirent.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\ndir.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\glob\ndir.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\dir.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\glob\fnmatch.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\posixstat.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\unistd.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\fab.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\nam.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\rmsdef.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dir.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h

$(INTDIR)/glob.obj :  $(SOURCE)  $(DEP_GLOB_) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\y_tab.c
DEP_Y_TAB=\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\bashtypes.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\bashansi.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\shell.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\flags.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\input.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\readline.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\bashhist.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\history.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\jobs.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\alias.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\param.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\maxpath.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h\
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
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\stdc.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\keymaps.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\tilde.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\siglist.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\wait.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\bash_endian.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\hash.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\unistd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\chardefs.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h

$(INTDIR)/y_tab.obj :  $(SOURCE)  $(DEP_Y_TAB) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\history.c
DEP_HISTO=\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\file.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\ansi_stdlib.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\unistd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\config.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\history.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h

$(INTDIR)/history.obj :  $(SOURCE)  $(DEP_HISTO) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\vi_mode.c
DEP_VI_MO=\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\rlconf.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\ansi_stdlib.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\unistd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\rldefs.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\readline.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\history.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\config.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\termcap.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\termio.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\termios.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sgtty.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dirent.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\ndir.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\ndir.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\dir.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\stream.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\ptem.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\pte.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\keymaps.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\tilde.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\chardefs.h

$(INTDIR)/vi_mode.obj :  $(SOURCE)  $(DEP_VI_MO) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\keymaps.c
DEP_KEYMA=\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\ansi_stdlib.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\rlconf.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\keymaps.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\emacs_keymap.c\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\vi_keymap.c\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\chardefs.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\readline.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\tilde.h

$(INTDIR)/keymaps.obj :  $(SOURCE)  $(DEP_KEYMA) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\tilde.c
DEP_TILDE=\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\ansi_stdlib.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\tilde.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\pwd.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h

$(INTDIR)/tilde.obj :  $(SOURCE)  $(DEP_TILDE) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\isearch.c
DEP_ISEAR=\
	$(BASH_SRC_MAIN_DIR)\dum_inc\unistd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\readline.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\history.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\keymaps.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\tilde.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\chardefs.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h

$(INTDIR)/isearch.obj :  $(SOURCE)  $(DEP_ISEAR) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\parens.c
DEP_PAREN=\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\rlconf.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\time.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\readline.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\keymaps.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\tilde.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\chardefs.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h

$(INTDIR)/parens.obj :  $(SOURCE)  $(DEP_PAREN) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\signals.c
DEP_SIGNA=\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\file.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\unistd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\ansi_stdlib.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\posixstat.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\rldefs.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\ioctl.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\readline.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\history.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\config.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\termcap.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\termio.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\termios.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sgtty.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dirent.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\ndir.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\ndir.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\dir.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\stream.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\ptem.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\pte.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\rlconf.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\keymaps.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\tilde.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\chardefs.h

$(INTDIR)/signals.obj :  $(SOURCE)  $(DEP_SIGNA) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\funmap.c
DEP_FUNMA=\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\ansi_stdlib.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\rlconf.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\readline.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\keymaps.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\tilde.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\chardefs.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h

$(INTDIR)/funmap.obj :  $(SOURCE)  $(DEP_FUNMA) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\complete.c
DEP_COMPL=\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\file.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\unistd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\ansi_stdlib.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\pwd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\posixstat.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\rldefs.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\readline.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\config.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\termcap.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\termio.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\termios.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sgtty.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dirent.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\ndir.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\ndir.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\dir.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\stream.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\ptem.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\pte.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\rlconf.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\keymaps.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\tilde.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\chardefs.h

$(INTDIR)/complete.obj :  $(SOURCE)  $(DEP_COMPL) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\search.c
DEP_SEARC=\
	$(BASH_SRC_MAIN_DIR)\dum_inc\unistd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\rldefs.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\readline.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\history.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\config.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\termcap.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\termio.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\termios.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sgtty.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dirent.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\ndir.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\ndir.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\dir.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\stream.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\ptem.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\pte.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\rlconf.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\keymaps.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\tilde.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\chardefs.h

$(INTDIR)/search.obj :  $(SOURCE)  $(DEP_SEARC) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\display.c
DEP_DISPL=\
	$(BASH_SRC_MAIN_DIR)\dum_inc\unistd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\ansi_stdlib.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\posixstat.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\rldefs.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\readline.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\history.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\config.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\termcap.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\termio.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\termios.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sgtty.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dirent.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\ndir.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\ndir.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\dir.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\stream.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\ptem.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\pte.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\rlconf.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\keymaps.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\tilde.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\chardefs.h

$(INTDIR)/display.obj :  $(SOURCE)  $(DEP_DISPL) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\readline.c
DEP_READL=\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\file.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\unistd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\ansi_stdlib.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\posixstat.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\rldefs.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\ioctl.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\readline.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\history.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\pc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\config.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\termcap.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\termio.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\termios.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sgtty.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dirent.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\ndir.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\ndir.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\dir.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\stream.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\ptem.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\pte.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\rlconf.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\keymaps.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\tilde.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\chardefs.h

$(INTDIR)/readline.obj :  $(SOURCE)  $(DEP_READL) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\test.c
DEP_TEST_=\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\bashtypes.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\file.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\posixstat.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\filecntl.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\shell.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\system.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\unistd.h\
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
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\stdc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\hash.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\param.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h

$(INTDIR)/test.obj :  $(SOURCE)  $(DEP_TEST_) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\bind.c
DEP_BIND_=\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\file.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\config.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\unistd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\ansi_stdlib.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\posixstat.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\rldefs.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\readline.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\history.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\termcap.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\termio.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\termios.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sgtty.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dirent.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\ndir.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\ndir.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\dir.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\stream.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\ptem.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\pte.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\rlconf.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\keymaps.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\tilde.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\chardefs.h

$(INTDIR)/bind.obj :  $(SOURCE)  $(DEP_BIND_) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\trap.c
DEP_TRAP_=\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\bashtypes.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\trap.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\shell.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\signames.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\stdc.h\
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
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\hash.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\param.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h

$(INTDIR)/trap.obj :  $(SOURCE)  $(DEP_TRAP_) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\rltty.c
DEP_RLTTY=\
	$(BASH_SRC_MAIN_DIR)\dum_inc\unistd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\rldefs.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\readline.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\pc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\config.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\termcap.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\termio.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\termios.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sgtty.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dirent.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\ndir.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\ndir.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\dir.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\stream.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\ptem.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\pte.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\rlconf.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\keymaps.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\tilde.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\readline\chardefs.h

$(INTDIR)/rltty.obj :  $(SOURCE)  $(DEP_RLTTY) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
# End Group
################################################################################
# Begin Group nt_specific

################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\dum_inc\dirent.c

!IF  "$(CFG)" == "Win32 Release"

# ADD CPP /W3

$(INTDIR)/dirent.obj :  $(SOURCE)  $(INTDIR)
   $(CPP) /nologo /W3 /GX /YX /O2 /I $(BASH_SRC_MAIN_DIR)\bash-1.14.2 /I\
 $(BASH_SRC_MAIN_DIR)\bash-1.14.2/lib /I $(BASH_SRC_MAIN_DIR)\dum_inc /D NDEBUG /D\
 WIN32 /D _CONSOLE /D Program=bash /D INITIALIZE_SIGLIST /D\
 HAVE_VFPRINTF /D HAVE_UNISTD_H /D HAVE_STDLIB_H /D HAVE_LIMITS_H /D\
 HAVE_RESOURCE /D HAVE_SYS_PARAM /D HAVE_DIRENT_H /D VOID_SIGHANDLER /D\
 BROKEN_SIGSUSPEND /D HAVE_GETHOSTNAME /D MKFIFO_MISSING /D\
 NO_DEV_TTY_JOB_CONTROL /D NO_SBRK_DECL /D PGRP_PIPE /D TERMIOS_MISSING\
 /D HAVE_DUP2 /D HAVE_STRERROR /D HAVE_DIRENT /D HAVE_STRING_H /D\
 HAVE_VARARGS_H /D HAVE_STRCHR /D SHELL /D HAVE_ALLOCA /D\
 HAVE_ALLOCA_H /D __NT_VC__ /FR$(INTDIR)/ /Fp$(OUTDIR)/Bash.pch\
 /Fo$(INTDIR)/ /c  $(SOURCE) 

!ELSEIF  "$(CFG)" == "Win32 Debug"

# ADD CPP /W3

$(INTDIR)/dirent.obj :  $(SOURCE)  $(INTDIR)
   $(CPP) /nologo /W3 /GX /Zi /YX /Od /I $(BASH_SRC_MAIN_DIR)\bash-1.14.2 /I\
 $(BASH_SRC_MAIN_DIR)\bash-1.14.2/lib /I $(BASH_SRC_MAIN_DIR)\dum_inc /D _DEBUG /D\
 WIN32 /D _CONSOLE /D Program=bash /D INITIALIZE_SIGLIST /D\
 HAVE_VFPRINTF /D HAVE_UNISTD_H /D HAVE_STDLIB_H /D HAVE_LIMITS_H /D\
 HAVE_RESOURCE /D HAVE_SYS_PARAM /D HAVE_DIRENT_H /D VOID_SIGHANDLER /D\
 BROKEN_SIGSUSPEND /D HAVE_GETHOSTNAME /D MKFIFO_MISSING /D\
 NO_DEV_TTY_JOB_CONTROL /D NO_SBRK_DECL /D PGRP_PIPE /D TERMIOS_MISSING\
 /D HAVE_DUP2 /D HAVE_STRERROR /D HAVE_DIRENT /D HAVE_STRING_H /D\
 HAVE_VARARGS_H /D HAVE_STRCHR /D SHELL /D HAVE_ALLOCA /D\
 HAVE_ALLOCA_H /D __NT_VC__ /FR$(INTDIR)/ /Fp$(OUTDIR)/Bash.pch\
 /Fo$(INTDIR)/ /Fd$(OUTDIR)/Bash.pdb /c  $(SOURCE) 

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\dum_inc\bzero.c

!IF  "$(CFG)" == "Win32 Release"

# ADD CPP /W3

$(INTDIR)/bzero.obj :  $(SOURCE)  $(INTDIR)
   $(CPP) /nologo /W3 /GX /YX /O2 /I $(BASH_SRC_MAIN_DIR)\bash-1.14.2 /I\
 $(BASH_SRC_MAIN_DIR)\bash-1.14.2/lib /I $(BASH_SRC_MAIN_DIR)\dum_inc /D NDEBUG /D\
 WIN32 /D _CONSOLE /D Program=bash /D INITIALIZE_SIGLIST /D\
 HAVE_VFPRINTF /D HAVE_UNISTD_H /D HAVE_STDLIB_H /D HAVE_LIMITS_H /D\
 HAVE_RESOURCE /D HAVE_SYS_PARAM /D HAVE_DIRENT_H /D VOID_SIGHANDLER /D\
 BROKEN_SIGSUSPEND /D HAVE_GETHOSTNAME /D MKFIFO_MISSING /D\
 NO_DEV_TTY_JOB_CONTROL /D NO_SBRK_DECL /D PGRP_PIPE /D TERMIOS_MISSING\
 /D HAVE_DUP2 /D HAVE_STRERROR /D HAVE_DIRENT /D HAVE_STRING_H /D\
 HAVE_VARARGS_H /D HAVE_STRCHR /D SHELL /D HAVE_ALLOCA /D\
 HAVE_ALLOCA_H /D __NT_VC__ /FR$(INTDIR)/ /Fp$(OUTDIR)/Bash.pch\
 /Fo$(INTDIR)/ /c  $(SOURCE) 

!ELSEIF  "$(CFG)" == "Win32 Debug"

# ADD CPP /W3

$(INTDIR)/bzero.obj :  $(SOURCE)  $(INTDIR)
   $(CPP) /nologo /W3 /GX /Zi /YX /Od /I $(BASH_SRC_MAIN_DIR)\bash-1.14.2 /I\
 $(BASH_SRC_MAIN_DIR)\bash-1.14.2/lib /I $(BASH_SRC_MAIN_DIR)\dum_inc /D _DEBUG /D\
 WIN32 /D _CONSOLE /D Program=bash /D INITIALIZE_SIGLIST /D\
 HAVE_VFPRINTF /D HAVE_UNISTD_H /D HAVE_STDLIB_H /D HAVE_LIMITS_H /D\
 HAVE_RESOURCE /D HAVE_SYS_PARAM /D HAVE_DIRENT_H /D VOID_SIGHANDLER /D\
 BROKEN_SIGSUSPEND /D HAVE_GETHOSTNAME /D MKFIFO_MISSING /D\
 NO_DEV_TTY_JOB_CONTROL /D NO_SBRK_DECL /D PGRP_PIPE /D TERMIOS_MISSING\
 /D HAVE_DUP2 /D HAVE_STRERROR /D HAVE_DIRENT /D HAVE_STRING_H /D\
 HAVE_VARARGS_H /D HAVE_STRCHR /D SHELL /D HAVE_ALLOCA /D\
 HAVE_ALLOCA_H /D __NT_VC__ /FR$(INTDIR)/ /Fp$(OUTDIR)/Bash.pch\
 /Fo$(INTDIR)/ /Fd$(OUTDIR)/Bash.pdb /c  $(SOURCE) 

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\dum_inc\bash_dum.c

!IF  "$(CFG)" == "Win32 Release"

# ADD CPP /W3

$(INTDIR)/bash_dum.obj :  $(SOURCE)  $(INTDIR)
   $(CPP) /nologo /W3 /GX /YX /O2 /I $(BASH_SRC_MAIN_DIR)\bash-1.14.2 /I\
 $(BASH_SRC_MAIN_DIR)\bash-1.14.2/lib /I $(BASH_SRC_MAIN_DIR)\dum_inc /D NDEBUG /D\
 WIN32 /D _CONSOLE /D Program=bash /D INITIALIZE_SIGLIST /D\
 HAVE_VFPRINTF /D HAVE_UNISTD_H /D HAVE_STDLIB_H /D HAVE_LIMITS_H /D\
 HAVE_RESOURCE /D HAVE_SYS_PARAM /D HAVE_DIRENT_H /D VOID_SIGHANDLER /D\
 BROKEN_SIGSUSPEND /D HAVE_GETHOSTNAME /D MKFIFO_MISSING /D\
 NO_DEV_TTY_JOB_CONTROL /D NO_SBRK_DECL /D PGRP_PIPE /D TERMIOS_MISSING\
 /D HAVE_DUP2 /D HAVE_STRERROR /D HAVE_DIRENT /D HAVE_STRING_H /D\
 HAVE_VARARGS_H /D HAVE_STRCHR /D SHELL /D HAVE_ALLOCA /D\
 HAVE_ALLOCA_H /D __NT_VC__ /FR$(INTDIR)/ /Fp$(OUTDIR)/Bash.pch\
 /Fo$(INTDIR)/ /c  $(SOURCE) 

!ELSEIF  "$(CFG)" == "Win32 Debug"

# ADD CPP /W3

$(INTDIR)/bash_dum.obj :  $(SOURCE)  $(INTDIR)
   $(CPP) /nologo /W3 /GX /Zi /YX /Od /I $(BASH_SRC_MAIN_DIR)\bash-1.14.2 /I\
 $(BASH_SRC_MAIN_DIR)\bash-1.14.2/lib /I $(BASH_SRC_MAIN_DIR)\dum_inc /D _DEBUG /D\
 WIN32 /D _CONSOLE /D Program=bash /D INITIALIZE_SIGLIST /D\
 HAVE_VFPRINTF /D HAVE_UNISTD_H /D HAVE_STDLIB_H /D HAVE_LIMITS_H /D\
 HAVE_RESOURCE /D HAVE_SYS_PARAM /D HAVE_DIRENT_H /D VOID_SIGHANDLER /D\
 BROKEN_SIGSUSPEND /D HAVE_GETHOSTNAME /D MKFIFO_MISSING /D\
 NO_DEV_TTY_JOB_CONTROL /D NO_SBRK_DECL /D PGRP_PIPE /D TERMIOS_MISSING\
 /D HAVE_DUP2 /D HAVE_STRERROR /D HAVE_DIRENT /D HAVE_STRING_H /D\
 HAVE_VARARGS_H /D HAVE_STRCHR /D SHELL /D HAVE_ALLOCA /D\
 HAVE_ALLOCA_H /D __NT_VC__ /FR$(INTDIR)/ /Fp$(OUTDIR)/Bash.pch\
 /Fo$(INTDIR)/ /Fd$(OUTDIR)/Bash.pdb /c  $(SOURCE) 

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\bash-1.14.2\nt_vc.c
DEP_NT_VC=\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\bashtypes.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\filecntl.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\posixstat.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\general.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\nt_types.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\config.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\param.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\strings.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\shell.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\y.tab.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\flags.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\hash.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\jobs.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\execute_cmd.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\sysdefs.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\common.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\builtins\builtext.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\glob\fnmatch.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\lib\tilde\tilde.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\input.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\stdc.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\command.h\
	$(BASH_SRC_MAIN_DIR)\bash-1.14.2\memalloc.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\unistd.h\
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
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\wait.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\bash_endian.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\alloca.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h

!IF  "$(CFG)" == "Win32 Release"

# ADD CPP /W3

$(INTDIR)/nt_vc.obj :  $(SOURCE)  $(DEP_NT_VC) $(INTDIR)
   $(CPP) /nologo /W3 /GX /YX /O2 /I $(BASH_SRC_MAIN_DIR)\bash-1.14.2 /I\
 $(BASH_SRC_MAIN_DIR)\bash-1.14.2/lib /I $(BASH_SRC_MAIN_DIR)\dum_inc /D NDEBUG /D\
 WIN32 /D _CONSOLE /D Program=bash /D INITIALIZE_SIGLIST /D\
 HAVE_VFPRINTF /D HAVE_UNISTD_H /D HAVE_STDLIB_H /D HAVE_LIMITS_H /D\
 HAVE_RESOURCE /D HAVE_SYS_PARAM /D HAVE_DIRENT_H /D VOID_SIGHANDLER /D\
 BROKEN_SIGSUSPEND /D HAVE_GETHOSTNAME /D MKFIFO_MISSING /D\
 NO_DEV_TTY_JOB_CONTROL /D NO_SBRK_DECL /D PGRP_PIPE /D TERMIOS_MISSING\
 /D HAVE_DUP2 /D HAVE_STRERROR /D HAVE_DIRENT /D HAVE_STRING_H /D\
 HAVE_VARARGS_H /D HAVE_STRCHR /D SHELL /D HAVE_ALLOCA /D\
 HAVE_ALLOCA_H /D __NT_VC__ /FR$(INTDIR)/ /Fp$(OUTDIR)/Bash.pch\
 /Fo$(INTDIR)/ /c  $(SOURCE) 

!ELSEIF  "$(CFG)" == "Win32 Debug"

# ADD CPP /W3

$(INTDIR)/nt_vc.obj :  $(SOURCE)  $(DEP_NT_VC) $(INTDIR)
   $(CPP) /nologo /W3 /GX /Zi /YX /Od /I $(BASH_SRC_MAIN_DIR)\bash-1.14.2 /I\
 $(BASH_SRC_MAIN_DIR)\bash-1.14.2/lib /I $(BASH_SRC_MAIN_DIR)\dum_inc /D _DEBUG /D\
 WIN32 /D _CONSOLE /D Program=bash /D INITIALIZE_SIGLIST /D\
 HAVE_VFPRINTF /D HAVE_UNISTD_H /D HAVE_STDLIB_H /D HAVE_LIMITS_H /D\
 HAVE_RESOURCE /D HAVE_SYS_PARAM /D HAVE_DIRENT_H /D VOID_SIGHANDLER /D\
 BROKEN_SIGSUSPEND /D HAVE_GETHOSTNAME /D MKFIFO_MISSING /D\
 NO_DEV_TTY_JOB_CONTROL /D NO_SBRK_DECL /D PGRP_PIPE /D TERMIOS_MISSING\
 /D HAVE_DUP2 /D HAVE_STRERROR /D HAVE_DIRENT /D HAVE_STRING_H /D\
 HAVE_VARARGS_H /D HAVE_STRCHR /D SHELL /D HAVE_ALLOCA /D\
 HAVE_ALLOCA_H /D __NT_VC__ /FR$(INTDIR)/ /Fp$(OUTDIR)/Bash.pch\
 /Fo$(INTDIR)/ /Fd$(OUTDIR)/Bash.pdb /c  $(SOURCE) 

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\dum_inc\bcopy.c

!IF  "$(CFG)" == "Win32 Release"

# ADD CPP /W3

$(INTDIR)/bcopy.obj :  $(SOURCE)  $(INTDIR)
   $(CPP) /nologo /W3 /GX /YX /O2 /I $(BASH_SRC_MAIN_DIR)\bash-1.14.2 /I\
 $(BASH_SRC_MAIN_DIR)\bash-1.14.2/lib /I $(BASH_SRC_MAIN_DIR)\dum_inc /D NDEBUG /D\
 WIN32 /D _CONSOLE /D Program=bash /D INITIALIZE_SIGLIST /D\
 HAVE_VFPRINTF /D HAVE_UNISTD_H /D HAVE_STDLIB_H /D HAVE_LIMITS_H /D\
 HAVE_RESOURCE /D HAVE_SYS_PARAM /D HAVE_DIRENT_H /D VOID_SIGHANDLER /D\
 BROKEN_SIGSUSPEND /D HAVE_GETHOSTNAME /D MKFIFO_MISSING /D\
 NO_DEV_TTY_JOB_CONTROL /D NO_SBRK_DECL /D PGRP_PIPE /D TERMIOS_MISSING\
 /D HAVE_DUP2 /D HAVE_STRERROR /D HAVE_DIRENT /D HAVE_STRING_H /D\
 HAVE_VARARGS_H /D HAVE_STRCHR /D SHELL /D HAVE_ALLOCA /D\
 HAVE_ALLOCA_H /D __NT_VC__ /FR$(INTDIR)/ /Fp$(OUTDIR)/Bash.pch\
 /Fo$(INTDIR)/ /c  $(SOURCE) 

!ELSEIF  "$(CFG)" == "Win32 Debug"

# ADD CPP /W3

$(INTDIR)/bcopy.obj :  $(SOURCE)  $(INTDIR)
   $(CPP) /nologo /W3 /GX /Zi /YX /Od /I $(BASH_SRC_MAIN_DIR)\bash-1.14.2 /I\
 $(BASH_SRC_MAIN_DIR)\bash-1.14.2/lib /I $(BASH_SRC_MAIN_DIR)\dum_inc /D _DEBUG /D\
 WIN32 /D _CONSOLE /D Program=bash /D INITIALIZE_SIGLIST /D\
 HAVE_VFPRINTF /D HAVE_UNISTD_H /D HAVE_STDLIB_H /D HAVE_LIMITS_H /D\
 HAVE_RESOURCE /D HAVE_SYS_PARAM /D HAVE_DIRENT_H /D VOID_SIGHANDLER /D\
 BROKEN_SIGSUSPEND /D HAVE_GETHOSTNAME /D MKFIFO_MISSING /D\
 NO_DEV_TTY_JOB_CONTROL /D NO_SBRK_DECL /D PGRP_PIPE /D TERMIOS_MISSING\
 /D HAVE_DUP2 /D HAVE_STRERROR /D HAVE_DIRENT /D HAVE_STRING_H /D\
 HAVE_VARARGS_H /D HAVE_STRCHR /D SHELL /D HAVE_ALLOCA /D\
 HAVE_ALLOCA_H /D __NT_VC__ /FR$(INTDIR)/ /Fp$(OUTDIR)/Bash.pch\
 /Fo$(INTDIR)/ /Fd$(OUTDIR)/Bash.pdb /c  $(SOURCE) 

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\dum_inc\unistd.c
DEP_UNIST=\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\wait.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\param.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\sys\time.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\unistd.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\grp.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\pwd.h\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h

!IF  "$(CFG)" == "Win32 Release"

# ADD CPP /W3

$(INTDIR)/unistd.obj :  $(SOURCE)  $(DEP_UNIST) $(INTDIR)
   $(CPP) /nologo /W3 /GX /YX /O2 /I $(BASH_SRC_MAIN_DIR)\bash-1.14.2 /I\
 $(BASH_SRC_MAIN_DIR)\bash-1.14.2/lib /I $(BASH_SRC_MAIN_DIR)\dum_inc /D NDEBUG /D\
 WIN32 /D _CONSOLE /D Program=bash /D INITIALIZE_SIGLIST /D\
 HAVE_VFPRINTF /D HAVE_UNISTD_H /D HAVE_STDLIB_H /D HAVE_LIMITS_H /D\
 HAVE_RESOURCE /D HAVE_SYS_PARAM /D HAVE_DIRENT_H /D VOID_SIGHANDLER /D\
 BROKEN_SIGSUSPEND /D HAVE_GETHOSTNAME /D MKFIFO_MISSING /D\
 NO_DEV_TTY_JOB_CONTROL /D NO_SBRK_DECL /D PGRP_PIPE /D TERMIOS_MISSING\
 /D HAVE_DUP2 /D HAVE_STRERROR /D HAVE_DIRENT /D HAVE_STRING_H /D\
 HAVE_VARARGS_H /D HAVE_STRCHR /D SHELL /D HAVE_ALLOCA /D\
 HAVE_ALLOCA_H /D __NT_VC__ /FR$(INTDIR)/ /Fp$(OUTDIR)/Bash.pch\
 /Fo$(INTDIR)/ /c  $(SOURCE) 

!ELSEIF  "$(CFG)" == "Win32 Debug"

# ADD CPP /W3

$(INTDIR)/unistd.obj :  $(SOURCE)  $(DEP_UNIST) $(INTDIR)
   $(CPP) /nologo /W3 /GX /Zi /YX /Od /I $(BASH_SRC_MAIN_DIR)\bash-1.14.2 /I\
 $(BASH_SRC_MAIN_DIR)\bash-1.14.2/lib /I $(BASH_SRC_MAIN_DIR)\dum_inc /D _DEBUG /D\
 WIN32 /D _CONSOLE /D Program=bash /D INITIALIZE_SIGLIST /D\
 HAVE_VFPRINTF /D HAVE_UNISTD_H /D HAVE_STDLIB_H /D HAVE_LIMITS_H /D\
 HAVE_RESOURCE /D HAVE_SYS_PARAM /D HAVE_DIRENT_H /D VOID_SIGHANDLER /D\
 BROKEN_SIGSUSPEND /D HAVE_GETHOSTNAME /D MKFIFO_MISSING /D\
 NO_DEV_TTY_JOB_CONTROL /D NO_SBRK_DECL /D PGRP_PIPE /D TERMIOS_MISSING\
 /D HAVE_DUP2 /D HAVE_STRERROR /D HAVE_DIRENT /D HAVE_STRING_H /D\
 HAVE_VARARGS_H /D HAVE_STRCHR /D SHELL /D HAVE_ALLOCA /D\
 HAVE_ALLOCA_H /D __NT_VC__ /FR$(INTDIR)/ /Fp$(OUTDIR)/Bash.pch\
 /Fo$(INTDIR)/ /Fd$(OUTDIR)/Bash.pdb /c  $(SOURCE) 

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=$(BASH_SRC_MAIN_DIR)\dum_inc\signal.c
DEP_SIGNAL=\
	$(BASH_SRC_MAIN_DIR)\dum_inc\dtypes.h

$(INTDIR)/signal.obj :  $(SOURCE)  $(DEP_SIGNAL) $(INTDIR)
   $(CPP) $(CPP_PROJ)  $(SOURCE) 

# End Source File
# End Group
# End Project
################################################################################
