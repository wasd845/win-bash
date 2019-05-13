
BASH_SRC_MAIN_DIR=v01/bash-1.14.2
DUMMY_INC=v01/dum_inc

OBJ_DIR=obj
OBJ_DIR_BUILTINS=obj/builtins

CC=cmd /C gcc -Wno-error -g

CFLAGS= -I$(BASH_SRC_MAIN_DIR) \
	 -I$(BASH_SRC_MAIN_DIR)/lib \
	 -I$(BASH_SRC_MAIN_DIR)/lib/readline \
	 -I$(BASH_SRC_MAIN_DIR)/builtins \
	 -I$(DUMMY_INC) \
	 -DNDEBUG -DWIN32 -D_CONSOLE -DProgram=bash \
	 -DINITIALIZE_SIGLIST -DHAVE_VFPRINTF \
	 -DHAVE_UNISTD_H -DHAVE_STDLIB_H -DHAVE_LIMITS_H \
	 -DHAVE_RESOURCE -DHAVE_SYS_PARAM -DHAVE_DIRENT_H \
	 -DVOID_SIGHANDLER -DBROKEN_SIGSUSPEND -DHAVE_GETHOSTNAME \
	 -DMKFIFO_MISSING -DNO_DEV_TTY_JOB_CONTROL -DNO_SBRK_DECL \
	 -DPGRP_PIPE -DTERMIOS_MISSING -DHAVE_DUP2 \
	 -DHAVE_STRERROR -DHAVE_DIRENT -DHAVE_STRING_H \
	 -DHAVE_VARARGS_H -DHAVE_STRCHR -DSHELL -DHAVE_ALLOCA \
	 -DHAVE_STRCASECMP\
	 -DHAVE_ALLOCA_H -D__NT_VC__  -D__NT_EGC__\
	 -c 

BASH_OBJS=$(OBJ_DIR)/execute_cmd.obj \
	$(OBJ_DIR)/error.obj \
	$(OBJ_DIR)/siglist.obj \
	$(OBJ_DIR)/dispose_cmd.obj \
	$(OBJ_DIR)/copy_cmd.obj \
	$(OBJ_DIR)/shell.obj \
	$(OBJ_DIR)/alias.obj \
	$(OBJ_DIR)/expr.obj \
	$(OBJ_DIR)/flags.obj \
	$(OBJ_DIR)/nojobs.obj \
	$(OBJ_DIR)/general.obj \
	$(OBJ_DIR)/input.obj \
	$(OBJ_DIR)/bracecomp.obj \
	$(OBJ_DIR)/version.obj \
	$(OBJ_DIR)/bashline.obj \
	$(OBJ_DIR)/hash.obj \
	$(OBJ_DIR)/braces.obj \
	$(OBJ_DIR)/bashhist.obj \
	$(OBJ_DIR)/make_cmd.obj \
	$(OBJ_DIR)/unwind_prot.obj \
	$(OBJ_DIR)/print_cmd.obj \
	$(OBJ_DIR)/subst.obj \
	$(OBJ_DIR)/mailcheck.obj \
	$(OBJ_DIR)/variables.obj \
	$(OBJ_DIR)/getcwd.obj \
	$(OBJ_DIR)/fnmatch.obj \
	$(OBJ_DIR)/glob.obj \
	$(OBJ_DIR)/y_tab.obj \
	$(OBJ_DIR)/history.obj \
	$(OBJ_DIR)/vi_mode.obj \
	$(OBJ_DIR)/keymaps.obj \
	$(OBJ_DIR)/tilde.obj \
	$(OBJ_DIR)/isearch.obj \
	$(OBJ_DIR)/parens.obj \
	$(OBJ_DIR)/signals.obj \
	$(OBJ_DIR)/funmap.obj \
	$(OBJ_DIR)/complete.obj \
	$(OBJ_DIR)/search.obj \
	$(OBJ_DIR)/display.obj \
	$(OBJ_DIR)/readline.obj \
	$(OBJ_DIR)/test.obj \
	$(OBJ_DIR)/bind.obj \
	$(OBJ_DIR)/trap.obj \
	$(OBJ_DIR)/rltty.obj \
	$(OBJ_DIR)/dirent.obj \
	$(OBJ_DIR)/bzero.obj \
	$(OBJ_DIR)/bash_dum.obj \
	$(OBJ_DIR)/nt_vc.obj \
	$(OBJ_DIR)/bcopy.obj \
	$(OBJ_DIR)/unistd.obj \
	$(OBJ_DIR)/signal.obj

BUILTIN_OBJS= \
	$(OBJ_DIR_BUILTINS)/test.obj \
	$(OBJ_DIR_BUILTINS)/echo.obj \
	$(OBJ_DIR_BUILTINS)/cd.obj \
	$(OBJ_DIR_BUILTINS)/ulimit.obj \
	$(OBJ_DIR_BUILTINS)/help.obj \
	$(OBJ_DIR_BUILTINS)/wait.obj \
	$(OBJ_DIR_BUILTINS)/kill.obj \
	$(OBJ_DIR_BUILTINS)/jobs.obj \
	$(OBJ_DIR_BUILTINS)/trap.obj \
	$(OBJ_DIR_BUILTINS)/enable.obj \
	$(OBJ_DIR_BUILTINS)/fc.obj \
	$(OBJ_DIR_BUILTINS)/fg_bg.obj \
	$(OBJ_DIR_BUILTINS)/declare.obj \
	$(OBJ_DIR_BUILTINS)/inlib.obj \
	$(OBJ_DIR_BUILTINS)/getopts.obj \
	$(OBJ_DIR_BUILTINS)/suspend.obj \
	$(OBJ_DIR_BUILTINS)/read.obj \
	$(OBJ_DIR_BUILTINS)/times.obj \
	$(OBJ_DIR_BUILTINS)/bashgetopt.obj \
	$(OBJ_DIR_BUILTINS)/bind.obj \
	$(OBJ_DIR_BUILTINS)/exit.obj \
	$(OBJ_DIR_BUILTINS)/break.obj \
	$(OBJ_DIR_BUILTINS)/common.obj \
	$(OBJ_DIR_BUILTINS)/exec.obj \
	$(OBJ_DIR_BUILTINS)/shift.obj \
	$(OBJ_DIR_BUILTINS)/colon.obj \
	$(OBJ_DIR_BUILTINS)/set.obj \
	$(OBJ_DIR_BUILTINS)/source.obj \
	$(OBJ_DIR_BUILTINS)/eval.obj \
	$(OBJ_DIR_BUILTINS)/hash.obj \
	$(OBJ_DIR_BUILTINS)/let.obj \
	$(OBJ_DIR_BUILTINS)/return.obj \
	$(OBJ_DIR_BUILTINS)/umask.obj \
	$(OBJ_DIR_BUILTINS)/command.obj \
	$(OBJ_DIR_BUILTINS)/setattr.obj \
	$(OBJ_DIR_BUILTINS)/history.obj \
	$(OBJ_DIR_BUILTINS)/builtin.obj \
	$(OBJ_DIR_BUILTINS)/alias.obj \
	$(OBJ_DIR_BUILTINS)/type.obj \
	$(OBJ_DIR_BUILTINS)/getopt.obj \
	$(OBJ_DIR_BUILTINS)/builtins.obj

$(OBJ_DIR)/%.obj: $(BASH_SRC_MAIN_DIR)/%.c 
	$(CC) $(CFLAGS) $< -o $@

$(OBJ_DIR)/%.obj: $(BASH_SRC_MAIN_DIR)/lib/%.c  
	$(CC) $(CFLAGS) $< -o $@

$(OBJ_DIR)/%.obj: $(BASH_SRC_MAIN_DIR)/lib/glob/%.c 
	$(CC) $(CFLAGS) $< -o $@

$(OBJ_DIR)/%.obj: $(BASH_SRC_MAIN_DIR)/lib/malloc/%.c
	$(CC) $(CFLAGS) $< -o $@

$(OBJ_DIR)/%.obj: $(BASH_SRC_MAIN_DIR)/lib/malloclib/%.c
	$(CC) $(CFLAGS) $< -o $@

$(OBJ_DIR)/%.obj: $(BASH_SRC_MAIN_DIR)/lib/posixheaders/%.c
	$(CC) $(CFLAGS) $< -o $@

$(OBJ_DIR)/%.obj: $(BASH_SRC_MAIN_DIR)/lib/readline/%.c 
	$(CC) $(CFLAGS) $< -o $@

$(OBJ_DIR)/%.obj: $(BASH_SRC_MAIN_DIR)/lib/termcap/%.c  
	$(CC) $(CFLAGS) $< -o $@

$(OBJ_DIR)/%.obj: $(BASH_SRC_MAIN_DIR)/lib/tilde/%.c  
	$(CC) $(CFLAGS) $< -o $@

$(OBJ_DIR)/%.obj: $(BASH_SRC_MAIN_DIR)/builtins/%.c 
	$(CC) $(CFLAGS) $< -o $@

$(OBJ_DIR_BUILTINS)/%.obj: $(BASH_SRC_MAIN_DIR)/%.c 
	$(CC) $(CFLAGS) $< -o $@

$(OBJ_DIR_BUILTINS)/%.obj: $(BASH_SRC_MAIN_DIR)/lib/%.c 
	$(CC) $(CFLAGS) $< -o $@

$(OBJ_DIR_BUILTINS)/%.obj: $(BASH_SRC_MAIN_DIR)/lib/glob/%.c 
	$(CC) $(CFLAGS) $< -o $@

$(OBJ_DIR_BUILTINS)/%.obj: $(BASH_SRC_MAIN_DIR)/lib/malloc/%.c
	$(CC) $(CFLAGS) $< -o $@

$(OBJ_DIR_BUILTINS)/%.obj: $(BASH_SRC_MAIN_DIR)/lib/malloclib/%.c 
	$(CC) $(CFLAGS) $< -o $@

$(OBJ_DIR_BUILTINS)/%.obj: $(BASH_SRC_MAIN_DIR)/lib/posixheaders/%.c 
	$(CC) $(CFLAGS) $< -o $@

$(OBJ_DIR_BUILTINS)/%.obj: $(BASH_SRC_MAIN_DIR)/lib/readline/%.c 
	$(CC) $(CFLAGS) $< -o $@

$(OBJ_DIR_BUILTINS)/%.obj: $(BASH_SRC_MAIN_DIR)/lib/termcap/%.c 
	$(CC) $(CFLAGS) $< -o $@

$(OBJ_DIR_BUILTINS)/%.obj: $(BASH_SRC_MAIN_DIR)/lib/tilde/%.c 
	$(CC) $(CFLAGS) $< -o $@

$(OBJ_DIR_BUILTINS)/%.obj: $(BASH_SRC_MAIN_DIR)/builtins/%.c 
	$(CC) $(CFLAGS) $< -o $@

$(OBJ_DIR)/%.obj: $(DUMMY_INC)/%.c 
	$(CC) $(CFLAGS) $< -o $@

all:  $(OBJ_DIR) $(OBJ_DIR_BUILTINS) bash

$(OBJ_DIR):
	- mkdir -p $(OBJ_DIR)

$(OBJ_DIR_BUILTINS):
	- mkdir -p $(OBJ_DIR)\builtins

###########################################################
#
# DEPENDENCIES BASH
#
###########################################################

$(OBJ_DIR)/execute_cmd.obj: \
	$(BASH_SRC_MAIN_DIR)/execute_cmd.c\
	$(BASH_SRC_MAIN_DIR)/bashtypes.h\
	$(BASH_SRC_MAIN_DIR)/filecntl.h\
	$(BASH_SRC_MAIN_DIR)/posixstat.h\
	$(DUMMY_INC)/sys/param.h\
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/shell.h\
	$(BASH_SRC_MAIN_DIR)/y.tab.h\
	$(BASH_SRC_MAIN_DIR)/flags.h\
	$(BASH_SRC_MAIN_DIR)/hash.h\
	$(BASH_SRC_MAIN_DIR)/jobs.h\
	$(BASH_SRC_MAIN_DIR)/execute_cmd.h\
	$(BASH_SRC_MAIN_DIR)/sysdefs.h\
	$(BASH_SRC_MAIN_DIR)/builtins/common.h\
	$(BASH_SRC_MAIN_DIR)/builtins/builtext.h\
	$(BASH_SRC_MAIN_DIR)/lib/glob/fnmatch.h\
	$(BASH_SRC_MAIN_DIR)/lib/tilde/tilde.h\
	$(BASH_SRC_MAIN_DIR)/input.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/command.h\
	$(BASH_SRC_MAIN_DIR)/general.h\
	$(BASH_SRC_MAIN_DIR)/error.h\
	$(BASH_SRC_MAIN_DIR)/variables.h\
	$(BASH_SRC_MAIN_DIR)/quit.h\
	$(BASH_SRC_MAIN_DIR)/maxpath.h\
	$(BASH_SRC_MAIN_DIR)/unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)/dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)/make_cmd.h\
	$(BASH_SRC_MAIN_DIR)/subst.h\
	$(BASH_SRC_MAIN_DIR)/externs.h\
	$(BASH_SRC_MAIN_DIR)/stdc.h\
	$(BASH_SRC_MAIN_DIR)/siglist.h\
	$(DUMMY_INC)/sys/wait.h\
	$(DUMMY_INC)/bash_endian.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/unistd.h\
	$(DUMMY_INC)/alloca.h\
	$(DUMMY_INC)/dtypes.h

$(OBJ_DIR)/error.obj: \
	$(BASH_SRC_MAIN_DIR)/error.c \
	$(BASH_SRC_MAIN_DIR)/bashansi.h\
	$(BASH_SRC_MAIN_DIR)/flags.h\
	$(BASH_SRC_MAIN_DIR)/error.h\
	$(BASH_SRC_MAIN_DIR)/command.h\
	$(BASH_SRC_MAIN_DIR)/general.h\
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/ansi_stdlib.h\
	$(BASH_SRC_MAIN_DIR)/stdc.h

$(OBJ_DIR)/siglist.obj: \
	$(BASH_SRC_MAIN_DIR)/siglist.c \
	$(BASH_SRC_MAIN_DIR)/siglist.h\
	$(BASH_SRC_MAIN_DIR)/trap.h\
	$(BASH_SRC_MAIN_DIR)/stdc.h

$(OBJ_DIR)/dispose_cmd.obj:\
	$(BASH_SRC_MAIN_DIR)/dispose_cmd.c \
	$(BASH_SRC_MAIN_DIR)/shell.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/command.h\
	$(BASH_SRC_MAIN_DIR)/general.h\
	$(BASH_SRC_MAIN_DIR)/error.h\
	$(BASH_SRC_MAIN_DIR)/variables.h\
	$(BASH_SRC_MAIN_DIR)/quit.h\
	$(BASH_SRC_MAIN_DIR)/maxpath.h\
	$(BASH_SRC_MAIN_DIR)/unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)/dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)/make_cmd.h\
	$(BASH_SRC_MAIN_DIR)/subst.h\
	$(BASH_SRC_MAIN_DIR)/externs.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/unistd.h\
	$(BASH_SRC_MAIN_DIR)/stdc.h\
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/hash.h\
	$(DUMMY_INC)/sys/param.h\
	$(DUMMY_INC)/alloca.h\
	$(DUMMY_INC)/dtypes.h

$(OBJ_DIR)/copy_cmd.obj:\
	$(BASH_SRC_MAIN_DIR)/copy_cmd.c \
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/shell.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/command.h\
	$(BASH_SRC_MAIN_DIR)/general.h\
	$(BASH_SRC_MAIN_DIR)/error.h\
	$(BASH_SRC_MAIN_DIR)/variables.h\
	$(BASH_SRC_MAIN_DIR)/quit.h\
	$(BASH_SRC_MAIN_DIR)/maxpath.h\
	$(BASH_SRC_MAIN_DIR)/unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)/dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)/make_cmd.h\
	$(BASH_SRC_MAIN_DIR)/subst.h\
	$(BASH_SRC_MAIN_DIR)/externs.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/unistd.h\
	$(BASH_SRC_MAIN_DIR)/stdc.h\
	$(BASH_SRC_MAIN_DIR)/hash.h\
	$(DUMMY_INC)/sys/param.h\
	$(DUMMY_INC)/alloca.h\
	$(DUMMY_INC)/dtypes.h

$(OBJ_DIR)/shell.obj:\
	$(BASH_SRC_MAIN_DIR)/shell.c \
	$(BASH_SRC_MAIN_DIR)/nt_types.h\
	$(BASH_SRC_MAIN_DIR)/bashtypes.h\
	$(DUMMY_INC)/sys/file.h\
	$(BASH_SRC_MAIN_DIR)/filecntl.h\
	$(DUMMY_INC)/pwd.h\
	$(BASH_SRC_MAIN_DIR)/posixstat.h\
	$(BASH_SRC_MAIN_DIR)/bashansi.h\
	$(BASH_SRC_MAIN_DIR)/shell.h\
	$(BASH_SRC_MAIN_DIR)/flags.h\
	$(BASH_SRC_MAIN_DIR)/jobs.h\
	$(BASH_SRC_MAIN_DIR)/input.h\
	$(BASH_SRC_MAIN_DIR)/execute_cmd.h\
	$(BASH_SRC_MAIN_DIR)/bashhist.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/history.h\
	$(BASH_SRC_MAIN_DIR)/lib/tilde/tilde.h\
	$(DUMMY_INC)/sys/socket.h\
	$(DUMMY_INC)/dtypes.h\
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/ansi_stdlib.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/command.h\
	$(BASH_SRC_MAIN_DIR)/general.h\
	$(BASH_SRC_MAIN_DIR)/error.h\
	$(BASH_SRC_MAIN_DIR)/variables.h\
	$(BASH_SRC_MAIN_DIR)/quit.h\
	$(BASH_SRC_MAIN_DIR)/maxpath.h\
	$(BASH_SRC_MAIN_DIR)/unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)/dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)/make_cmd.h\
	$(BASH_SRC_MAIN_DIR)/subst.h\
	$(BASH_SRC_MAIN_DIR)/externs.h\
	$(BASH_SRC_MAIN_DIR)/stdc.h\
	$(BASH_SRC_MAIN_DIR)/siglist.h\
	$(DUMMY_INC)/sys/wait.h\
	$(DUMMY_INC)/bash_endian.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/unistd.h\
	$(BASH_SRC_MAIN_DIR)/hash.h\
	$(DUMMY_INC)/sys/param.h\
	$(DUMMY_INC)/alloca.h

$(OBJ_DIR)/alias.obj:\
	$(BASH_SRC_MAIN_DIR)/alias.c \
	$(BASH_SRC_MAIN_DIR)/bashansi.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/command.h\
	$(BASH_SRC_MAIN_DIR)/general.h\
	$(BASH_SRC_MAIN_DIR)/hash.h\
	$(BASH_SRC_MAIN_DIR)/alias.h\
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/ansi_stdlib.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/unistd.h\
	$(BASH_SRC_MAIN_DIR)/stdc.h\
	$(DUMMY_INC)/alloca.h\
	$(DUMMY_INC)/dtypes.h

$(OBJ_DIR)/expr.obj:\
	$(BASH_SRC_MAIN_DIR)/expr.c \
	$(BASH_SRC_MAIN_DIR)/bashansi.h\
	$(BASH_SRC_MAIN_DIR)/shell.h\
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/ansi_stdlib.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/command.h\
	$(BASH_SRC_MAIN_DIR)/general.h\
	$(BASH_SRC_MAIN_DIR)/error.h\
	$(BASH_SRC_MAIN_DIR)/variables.h\
	$(BASH_SRC_MAIN_DIR)/quit.h\
	$(BASH_SRC_MAIN_DIR)/maxpath.h\
	$(BASH_SRC_MAIN_DIR)/unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)/dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)/make_cmd.h\
	$(BASH_SRC_MAIN_DIR)/subst.h\
	$(BASH_SRC_MAIN_DIR)/externs.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/unistd.h\
	$(BASH_SRC_MAIN_DIR)/stdc.h\
	$(BASH_SRC_MAIN_DIR)/hash.h\
	$(DUMMY_INC)/sys/param.h\
	$(DUMMY_INC)/alloca.h\
	$(DUMMY_INC)/dtypes.h

$(OBJ_DIR)/flags.obj:\
	$(BASH_SRC_MAIN_DIR)/flags.c \
	$(BASH_SRC_MAIN_DIR)/shell.h\
	$(BASH_SRC_MAIN_DIR)/flags.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/command.h\
	$(BASH_SRC_MAIN_DIR)/general.h\
	$(BASH_SRC_MAIN_DIR)/error.h\
	$(BASH_SRC_MAIN_DIR)/variables.h\
	$(BASH_SRC_MAIN_DIR)/quit.h\
	$(BASH_SRC_MAIN_DIR)/maxpath.h\
	$(BASH_SRC_MAIN_DIR)/unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)/dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)/make_cmd.h\
	$(BASH_SRC_MAIN_DIR)/subst.h\
	$(BASH_SRC_MAIN_DIR)/externs.h\
	$(BASH_SRC_MAIN_DIR)/stdc.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/unistd.h\
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/hash.h\
	$(DUMMY_INC)/sys/param.h\
	$(DUMMY_INC)/alloca.h\
	$(DUMMY_INC)/dtypes.h

$(OBJ_DIR)/nojobs.obj:\
	$(BASH_SRC_MAIN_DIR)/nojobs.c \
	$(BASH_SRC_MAIN_DIR)/bashtypes.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/command.h\
	$(BASH_SRC_MAIN_DIR)/general.h\
	$(BASH_SRC_MAIN_DIR)/filecntl.h\
	$(BASH_SRC_MAIN_DIR)/jobs.h\
	$(BASH_SRC_MAIN_DIR)/externs.h\
	$(BASH_SRC_MAIN_DIR)/input.h\
	$(DUMMY_INC)/sgtty.h\
	$(DUMMY_INC)/termios.h\
	$(DUMMY_INC)/termio.h\
	$(DUMMY_INC)/sys/ttold.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/unistd.h\
	$(BASH_SRC_MAIN_DIR)/stdc.h\
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/quit.h\
	$(BASH_SRC_MAIN_DIR)/siglist.h\
	$(DUMMY_INC)/sys/wait.h\
	$(DUMMY_INC)/bash_endian.h\
	$(DUMMY_INC)/alloca.h\
	$(DUMMY_INC)/dtypes.h

$(OBJ_DIR)/general.obj:\
	$(BASH_SRC_MAIN_DIR)/general.c \
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/bashtypes.h\
	$(DUMMY_INC)/sys/param.h\
	$(BASH_SRC_MAIN_DIR)/filecntl.h\
	$(BASH_SRC_MAIN_DIR)/bashansi.h\
	$(BASH_SRC_MAIN_DIR)/shell.h\
	$(BASH_SRC_MAIN_DIR)/lib/tilde/tilde.h\
	$(DUMMY_INC)/sys/time.h\
	$(DUMMY_INC)/sys/times.h\
	$(BASH_SRC_MAIN_DIR)/maxpath.h\
	$(DUMMY_INC)/sys/utsname.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/unistd.h\
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/ansi_stdlib.h\
	$(BASH_SRC_MAIN_DIR)/command.h\
	$(BASH_SRC_MAIN_DIR)/general.h\
	$(BASH_SRC_MAIN_DIR)/error.h\
	$(BASH_SRC_MAIN_DIR)/variables.h\
	$(BASH_SRC_MAIN_DIR)/quit.h\
	$(BASH_SRC_MAIN_DIR)/unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)/dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)/make_cmd.h\
	$(BASH_SRC_MAIN_DIR)/subst.h\
	$(BASH_SRC_MAIN_DIR)/externs.h\
	$(DUMMY_INC)/alloca.h\
	$(DUMMY_INC)/dtypes.h\
	$(BASH_SRC_MAIN_DIR)/stdc.h\
	$(BASH_SRC_MAIN_DIR)/hash.h

$(OBJ_DIR)/input.obj:\
	$(BASH_SRC_MAIN_DIR)/input.c \
	$(BASH_SRC_MAIN_DIR)/bashtypes.h\
	$(DUMMY_INC)/sys/file.h\
	$(BASH_SRC_MAIN_DIR)/posixstat.h\
	$(BASH_SRC_MAIN_DIR)/filecntl.h\
	$(BASH_SRC_MAIN_DIR)/bashansi.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/command.h\
	$(BASH_SRC_MAIN_DIR)/general.h\
	$(BASH_SRC_MAIN_DIR)/input.h\
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/ansi_stdlib.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/unistd.h\
	$(BASH_SRC_MAIN_DIR)/stdc.h\
	$(DUMMY_INC)/alloca.h\
	$(DUMMY_INC)/dtypes.h

$(OBJ_DIR)/bracecomp.obj:\
	$(BASH_SRC_MAIN_DIR)/bracecomp.c \
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/shell.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/readline.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/command.h\
	$(BASH_SRC_MAIN_DIR)/general.h\
	$(BASH_SRC_MAIN_DIR)/error.h\
	$(BASH_SRC_MAIN_DIR)/variables.h\
	$(BASH_SRC_MAIN_DIR)/quit.h\
	$(BASH_SRC_MAIN_DIR)/maxpath.h\
	$(BASH_SRC_MAIN_DIR)/unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)/dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)/make_cmd.h\
	$(BASH_SRC_MAIN_DIR)/subst.h\
	$(BASH_SRC_MAIN_DIR)/externs.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/keymaps.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/tilde.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/unistd.h\
	$(BASH_SRC_MAIN_DIR)/stdc.h\
	$(BASH_SRC_MAIN_DIR)/hash.h\
	$(DUMMY_INC)/sys/param.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/chardefs.h\
	$(DUMMY_INC)/alloca.h\
	$(DUMMY_INC)/dtypes.h

$(OBJ_DIR)/version.obj:\
	$(BASH_SRC_MAIN_DIR)/version.c \
	$(BASH_SRC_MAIN_DIR)/version.h

$(OBJ_DIR)/bashline.obj:\
	$(BASH_SRC_MAIN_DIR)/bashline.c \
	$(BASH_SRC_MAIN_DIR)/bashtypes.h\
	$(BASH_SRC_MAIN_DIR)/posixstat.h\
	$(BASH_SRC_MAIN_DIR)/bashansi.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/readline.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/history.h\
	$(BASH_SRC_MAIN_DIR)/shell.h\
	$(BASH_SRC_MAIN_DIR)/builtins.h\
	$(BASH_SRC_MAIN_DIR)/builtins/common.h\
	$(BASH_SRC_MAIN_DIR)/bashhist.h\
	$(BASH_SRC_MAIN_DIR)/execute_cmd.h\
	$(BASH_SRC_MAIN_DIR)/alias.h\
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/ansi_stdlib.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/keymaps.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/tilde.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/command.h\
	$(BASH_SRC_MAIN_DIR)/general.h\
	$(BASH_SRC_MAIN_DIR)/error.h\
	$(BASH_SRC_MAIN_DIR)/variables.h\
	$(BASH_SRC_MAIN_DIR)/quit.h\
	$(BASH_SRC_MAIN_DIR)/maxpath.h\
	$(BASH_SRC_MAIN_DIR)/unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)/dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)/make_cmd.h\
	$(BASH_SRC_MAIN_DIR)/subst.h\
	$(BASH_SRC_MAIN_DIR)/externs.h\
	$(BASH_SRC_MAIN_DIR)/stdc.h\
	$(BASH_SRC_MAIN_DIR)/hash.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/chardefs.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/unistd.h\
	$(DUMMY_INC)/sys/param.h\
	$(DUMMY_INC)/alloca.h\
	$(DUMMY_INC)/dtypes.h

$(OBJ_DIR)/hash.obj:\
	$(BASH_SRC_MAIN_DIR)/hash.c \
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/ansi_stdlib.h\
	$(BASH_SRC_MAIN_DIR)/shell.h\
	$(BASH_SRC_MAIN_DIR)/hash.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/command.h\
	$(BASH_SRC_MAIN_DIR)/general.h\
	$(BASH_SRC_MAIN_DIR)/error.h\
	$(BASH_SRC_MAIN_DIR)/variables.h\
	$(BASH_SRC_MAIN_DIR)/quit.h\
	$(BASH_SRC_MAIN_DIR)/maxpath.h\
	$(BASH_SRC_MAIN_DIR)/unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)/dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)/make_cmd.h\
	$(BASH_SRC_MAIN_DIR)/subst.h\
	$(BASH_SRC_MAIN_DIR)/externs.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/unistd.h\
	$(BASH_SRC_MAIN_DIR)/stdc.h\
	$(DUMMY_INC)/sys/param.h\
	$(DUMMY_INC)/alloca.h\
	$(DUMMY_INC)/dtypes.h

$(OBJ_DIR)/braces.obj:\
	$(BASH_SRC_MAIN_DIR)/braces.c \
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/shell.h\
	$(BASH_SRC_MAIN_DIR)/general.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/command.h\
	$(BASH_SRC_MAIN_DIR)/error.h\
	$(BASH_SRC_MAIN_DIR)/variables.h\
	$(BASH_SRC_MAIN_DIR)/quit.h\
	$(BASH_SRC_MAIN_DIR)/maxpath.h\
	$(BASH_SRC_MAIN_DIR)/unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)/dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)/make_cmd.h\
	$(BASH_SRC_MAIN_DIR)/subst.h\
	$(BASH_SRC_MAIN_DIR)/externs.h\
	$(BASH_SRC_MAIN_DIR)/stdc.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/unistd.h\
	$(BASH_SRC_MAIN_DIR)/hash.h\
	$(DUMMY_INC)/sys/param.h\
	$(DUMMY_INC)/alloca.h\
	$(DUMMY_INC)/dtypes.h

$(OBJ_DIR)/bashhist.obj:\
	$(BASH_SRC_MAIN_DIR)/bashhist.c \
	$(BASH_SRC_MAIN_DIR)/bashansi.h\
	$(BASH_SRC_MAIN_DIR)/posixstat.h\
	$(BASH_SRC_MAIN_DIR)/filecntl.h\
	$(BASH_SRC_MAIN_DIR)/shell.h\
	$(BASH_SRC_MAIN_DIR)/flags.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/history.h\
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/ansi_stdlib.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/command.h\
	$(BASH_SRC_MAIN_DIR)/general.h\
	$(BASH_SRC_MAIN_DIR)/error.h\
	$(BASH_SRC_MAIN_DIR)/variables.h\
	$(BASH_SRC_MAIN_DIR)/quit.h\
	$(BASH_SRC_MAIN_DIR)/maxpath.h\
	$(BASH_SRC_MAIN_DIR)/unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)/dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)/make_cmd.h\
	$(BASH_SRC_MAIN_DIR)/subst.h\
	$(BASH_SRC_MAIN_DIR)/externs.h\
	$(BASH_SRC_MAIN_DIR)/stdc.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/unistd.h\
	$(BASH_SRC_MAIN_DIR)/hash.h\
	$(DUMMY_INC)/sys/param.h\
	$(DUMMY_INC)/alloca.h\
	$(DUMMY_INC)/dtypes.h

$(OBJ_DIR)/make_cmd.obj:\
	$(BASH_SRC_MAIN_DIR)/make_cmd.c \
	$(BASH_SRC_MAIN_DIR)/bashtypes.h\
	$(DUMMY_INC)/sys/file.h\
	$(BASH_SRC_MAIN_DIR)/filecntl.h\
	$(BASH_SRC_MAIN_DIR)/bashansi.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/command.h\
	$(BASH_SRC_MAIN_DIR)/general.h\
	$(BASH_SRC_MAIN_DIR)/error.h\
	$(BASH_SRC_MAIN_DIR)/flags.h\
	$(BASH_SRC_MAIN_DIR)/make_cmd.h\
	$(BASH_SRC_MAIN_DIR)/subst.h\
	$(BASH_SRC_MAIN_DIR)/input.h\
	$(BASH_SRC_MAIN_DIR)/externs.h\
	$(BASH_SRC_MAIN_DIR)/jobs.h\
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/ansi_stdlib.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/unistd.h\
	$(BASH_SRC_MAIN_DIR)/stdc.h\
	$(BASH_SRC_MAIN_DIR)/quit.h\
	$(BASH_SRC_MAIN_DIR)/siglist.h\
	$(DUMMY_INC)/sys/wait.h\
	$(DUMMY_INC)/bash_endian.h\
	$(DUMMY_INC)/alloca.h\
	$(DUMMY_INC)/dtypes.h

$(OBJ_DIR)/unwind_prot.obj:\
	$(BASH_SRC_MAIN_DIR)/unwind_prot.c \
	$(BASH_SRC_MAIN_DIR)/bashtypes.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/command.h\
	$(BASH_SRC_MAIN_DIR)/general.h\
	$(BASH_SRC_MAIN_DIR)/unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)/quit.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/unistd.h\
	$(BASH_SRC_MAIN_DIR)/stdc.h\
	$(DUMMY_INC)/strings.h\
	$(DUMMY_INC)/alloca.h\
	$(DUMMY_INC)/dtypes.h

$(OBJ_DIR)/print_cmd.obj:\
	$(BASH_SRC_MAIN_DIR)/print_cmd.c \
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/shell.h\
	$(BASH_SRC_MAIN_DIR)/y.tab.h\
	$(BASH_SRC_MAIN_DIR)/stdc.h\
	$(BASH_SRC_MAIN_DIR)/builtins/common.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/command.h\
	$(BASH_SRC_MAIN_DIR)/general.h\
	$(BASH_SRC_MAIN_DIR)/error.h\
	$(BASH_SRC_MAIN_DIR)/variables.h\
	$(BASH_SRC_MAIN_DIR)/quit.h\
	$(BASH_SRC_MAIN_DIR)/maxpath.h\
	$(BASH_SRC_MAIN_DIR)/unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)/dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)/make_cmd.h\
	$(BASH_SRC_MAIN_DIR)/subst.h\
	$(BASH_SRC_MAIN_DIR)/externs.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/unistd.h\
	$(BASH_SRC_MAIN_DIR)/hash.h\
	$(DUMMY_INC)/sys/param.h\
	$(DUMMY_INC)/alloca.h\
	$(DUMMY_INC)/dtypes.h

$(OBJ_DIR)/subst.obj:\
	$(BASH_SRC_MAIN_DIR)/subst.c \
	$(BASH_SRC_MAIN_DIR)/bashtypes.h\
	$(DUMMY_INC)/pwd.h\
	$(BASH_SRC_MAIN_DIR)/nt_types.h\
	$(BASH_SRC_MAIN_DIR)/bashansi.h\
	$(BASH_SRC_MAIN_DIR)/posixstat.h\
	$(BASH_SRC_MAIN_DIR)/shell.h\
	$(BASH_SRC_MAIN_DIR)/flags.h\
	$(BASH_SRC_MAIN_DIR)/jobs.h\
	$(BASH_SRC_MAIN_DIR)/execute_cmd.h\
	$(BASH_SRC_MAIN_DIR)/filecntl.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/readline.h\
	$(BASH_SRC_MAIN_DIR)/lib/tilde/tilde.h\
	$(BASH_SRC_MAIN_DIR)/bashhist.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/history.h\
	$(BASH_SRC_MAIN_DIR)/lib/glob/fnmatch.h\
	$(DUMMY_INC)/dtypes.h\
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/ansi_stdlib.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/command.h\
	$(BASH_SRC_MAIN_DIR)/general.h\
	$(BASH_SRC_MAIN_DIR)/error.h\
	$(BASH_SRC_MAIN_DIR)/variables.h\
	$(BASH_SRC_MAIN_DIR)/quit.h\
	$(BASH_SRC_MAIN_DIR)/maxpath.h\
	$(BASH_SRC_MAIN_DIR)/unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)/dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)/make_cmd.h\
	$(BASH_SRC_MAIN_DIR)/subst.h\
	$(BASH_SRC_MAIN_DIR)/externs.h\
	$(BASH_SRC_MAIN_DIR)/stdc.h\
	$(BASH_SRC_MAIN_DIR)/siglist.h\
	$(DUMMY_INC)/sys/wait.h\
	$(DUMMY_INC)/bash_endian.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/keymaps.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/tilde.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/unistd.h\
	$(BASH_SRC_MAIN_DIR)/hash.h\
	$(DUMMY_INC)/sys/param.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/chardefs.h\
	$(DUMMY_INC)/alloca.h

$(OBJ_DIR)/mailcheck.obj:\
	$(BASH_SRC_MAIN_DIR)/mailcheck.c \
	$(BASH_SRC_MAIN_DIR)/bashtypes.h\
	$(BASH_SRC_MAIN_DIR)/posixstat.h\
	$(DUMMY_INC)/sys/param.h\
	$(BASH_SRC_MAIN_DIR)/bashansi.h\
	$(BASH_SRC_MAIN_DIR)/shell.h\
	$(BASH_SRC_MAIN_DIR)/maxpath.h\
	$(BASH_SRC_MAIN_DIR)/execute_cmd.h\
	$(BASH_SRC_MAIN_DIR)/lib/tilde/tilde.h\
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/ansi_stdlib.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/command.h\
	$(BASH_SRC_MAIN_DIR)/general.h\
	$(BASH_SRC_MAIN_DIR)/error.h\
	$(BASH_SRC_MAIN_DIR)/variables.h\
	$(BASH_SRC_MAIN_DIR)/quit.h\
	$(BASH_SRC_MAIN_DIR)/unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)/dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)/make_cmd.h\
	$(BASH_SRC_MAIN_DIR)/subst.h\
	$(BASH_SRC_MAIN_DIR)/externs.h\
	$(BASH_SRC_MAIN_DIR)/stdc.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/unistd.h\
	$(BASH_SRC_MAIN_DIR)/hash.h\
	$(DUMMY_INC)/alloca.h\
	$(DUMMY_INC)/dtypes.h

$(OBJ_DIR)/variables.obj:\
	$(BASH_SRC_MAIN_DIR)/variables.c \
	$(BASH_SRC_MAIN_DIR)/bashtypes.h\
	$(BASH_SRC_MAIN_DIR)/posixstat.h\
	$(DUMMY_INC)/pwd.h\
	$(BASH_SRC_MAIN_DIR)/bashansi.h\
	$(BASH_SRC_MAIN_DIR)/shell.h\
	$(BASH_SRC_MAIN_DIR)/hash.h\
	$(BASH_SRC_MAIN_DIR)/flags.h\
	$(BASH_SRC_MAIN_DIR)/execute_cmd.h\
	$(BASH_SRC_MAIN_DIR)/builtins/common.h\
	$(BASH_SRC_MAIN_DIR)/lib/tilde/tilde.h\
	$(BASH_SRC_MAIN_DIR)/bashhist.h\
	$(DUMMY_INC)/dtypes.h\
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/ansi_stdlib.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/command.h\
	$(BASH_SRC_MAIN_DIR)/general.h\
	$(BASH_SRC_MAIN_DIR)/error.h\
	$(BASH_SRC_MAIN_DIR)/variables.h\
	$(BASH_SRC_MAIN_DIR)/quit.h\
	$(BASH_SRC_MAIN_DIR)/maxpath.h\
	$(BASH_SRC_MAIN_DIR)/unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)/dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)/make_cmd.h\
	$(BASH_SRC_MAIN_DIR)/subst.h\
	$(BASH_SRC_MAIN_DIR)/externs.h\
	$(BASH_SRC_MAIN_DIR)/stdc.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/unistd.h\
	$(DUMMY_INC)/sys/param.h\
	$(DUMMY_INC)/alloca.h

$(OBJ_DIR)/getcwd.obj:\
	$(BASH_SRC_MAIN_DIR)/getcwd.c \
	$(BASH_SRC_MAIN_DIR)/bashtypes.h\
	$(DUMMY_INC)/dirent.h\
	$(DUMMY_INC)/sys/dir.h\
	$(DUMMY_INC)/unistd.h\
	$(BASH_SRC_MAIN_DIR)/posixstat.h\
	$(BASH_SRC_MAIN_DIR)/maxpath.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/ansi_stdlib.h\
	$(DUMMY_INC)/strings.h\
	$(DUMMY_INC)/dtypes.h\
	$(DUMMY_INC)/sys/param.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/alloca.h

$(OBJ_DIR)/lib/glob/fnmatch.obj:\
	$(BASH_SRC_MAIN_DIR)/lib/glob/fnmatch.c \
	$(BASH_SRC_MAIN_DIR)/lib/glob/fnmatch.h

$(OBJ_DIR)/lib/glob/glob.obj:\
	$(BASH_SRC_MAIN_DIR)/lib/glob/glob.c \
	$(BASH_SRC_MAIN_DIR)/ansi_stdlib.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(DUMMY_INC)/dirent.h\
	$(DUMMY_INC)/sys/ndir.h\
	$(BASH_SRC_MAIN_DIR)/lib/glob/ndir.h\
	$(DUMMY_INC)/sys/dir.h\
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/lib/glob/fnmatch.h\
	$(BASH_SRC_MAIN_DIR)/posixstat.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/unistd.h\
	$(DUMMY_INC)/dtypes.h\
	$(DUMMY_INC)/fab.h\
	$(DUMMY_INC)/nam.h\
	$(DUMMY_INC)/rmsdef.h\
	$(DUMMY_INC)/dir.h\
	$(DUMMY_INC)/alloca.h

$(OBJ_DIR)/y_tab.obj:\
	$(BASH_SRC_MAIN_DIR)/y_tab.c \
	$(BASH_SRC_MAIN_DIR)/bashtypes.h\
	$(BASH_SRC_MAIN_DIR)/bashansi.h\
	$(BASH_SRC_MAIN_DIR)/shell.h\
	$(BASH_SRC_MAIN_DIR)/flags.h\
	$(BASH_SRC_MAIN_DIR)/input.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/readline.h\
	$(BASH_SRC_MAIN_DIR)/bashhist.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/history.h\
	$(BASH_SRC_MAIN_DIR)/jobs.h\
	$(BASH_SRC_MAIN_DIR)/alias.h\
	$(DUMMY_INC)/sys/param.h\
	$(BASH_SRC_MAIN_DIR)/maxpath.h\
	$(DUMMY_INC)/alloca.h\
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/ansi_stdlib.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/command.h\
	$(BASH_SRC_MAIN_DIR)/general.h\
	$(BASH_SRC_MAIN_DIR)/error.h\
	$(BASH_SRC_MAIN_DIR)/variables.h\
	$(BASH_SRC_MAIN_DIR)/quit.h\
	$(BASH_SRC_MAIN_DIR)/unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)/dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)/make_cmd.h\
	$(BASH_SRC_MAIN_DIR)/subst.h\
	$(BASH_SRC_MAIN_DIR)/externs.h\
	$(BASH_SRC_MAIN_DIR)/stdc.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/keymaps.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/tilde.h\
	$(BASH_SRC_MAIN_DIR)/siglist.h\
	$(DUMMY_INC)/sys/wait.h\
	$(DUMMY_INC)/bash_endian.h\
	$(BASH_SRC_MAIN_DIR)/hash.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/unistd.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/chardefs.h\
	$(DUMMY_INC)/dtypes.h

$(OBJ_DIR)/lib/readline/history.obj:\
	$(BASH_SRC_MAIN_DIR)/lib/readline/history.c \
	$(DUMMY_INC)/sys/file.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/ansi_stdlib.h\
	$(DUMMY_INC)/unistd.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/memalloc.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/history.h\
	$(DUMMY_INC)/dtypes.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/alloca.h

$(OBJ_DIR)/lib/readline/vi_mode.obj:\
	$(BASH_SRC_MAIN_DIR)/lib/readline/vi_mode.c \
	$(BASH_SRC_MAIN_DIR)/lib/readline/rlconf.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/ansi_stdlib.h\
	$(DUMMY_INC)/unistd.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/rldefs.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/readline.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/history.h\
	$(DUMMY_INC)/dtypes.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/memalloc.h\
	$(DUMMY_INC)/termcap.h\
	$(DUMMY_INC)/termio.h\
	$(DUMMY_INC)/termios.h\
	$(DUMMY_INC)/sgtty.h\
	$(DUMMY_INC)/dirent.h\
	$(DUMMY_INC)/sys/ndir.h\
	$(DUMMY_INC)/ndir.h\
	$(DUMMY_INC)/sys/dir.h\
	$(DUMMY_INC)/sys/stream.h\
	$(DUMMY_INC)/sys/ptem.h\
	$(DUMMY_INC)/sys/pte.h\
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/keymaps.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/tilde.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/alloca.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/chardefs.h

$(OBJ_DIR)/lib/readline/keymaps.obj:\
	$(BASH_SRC_MAIN_DIR)/lib/readline/keymaps.c \
	$(BASH_SRC_MAIN_DIR)/lib/readline/ansi_stdlib.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/rlconf.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/keymaps.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/emacs_keymap.c\
	$(BASH_SRC_MAIN_DIR)/lib/readline/vi_keymap.c\
	$(BASH_SRC_MAIN_DIR)/lib/readline/chardefs.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/readline.h\
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/tilde.h

$(OBJ_DIR)/lib/readline/tilde.obj:\
	$(BASH_SRC_MAIN_DIR)/lib/readline/tilde.c \
	$(BASH_SRC_MAIN_DIR)/lib/readline/memalloc.h\
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/ansi_stdlib.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/tilde.h\
	$(DUMMY_INC)/pwd.h\
	$(DUMMY_INC)/alloca.h\
	$(DUMMY_INC)/dtypes.h

$(OBJ_DIR)/lib/readline/isearch.obj:\
	$(BASH_SRC_MAIN_DIR)/lib/readline/isearch.c \
	$(DUMMY_INC)/unistd.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/memalloc.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/readline.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/history.h\
	$(DUMMY_INC)/dtypes.h\
	$(DUMMY_INC)/alloca.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/keymaps.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/tilde.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/chardefs.h\
	$(DUMMY_INC)/strings.h

$(OBJ_DIR)/lib/readline/parens.obj:\
	$(BASH_SRC_MAIN_DIR)/lib/readline/parens.c \
	$(BASH_SRC_MAIN_DIR)/lib/readline/rlconf.h\
	$(DUMMY_INC)/sys/time.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/readline.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/keymaps.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/tilde.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/chardefs.h\
	$(DUMMY_INC)/strings.h

$(OBJ_DIR)/lib/readline/signals.obj:\
	$(BASH_SRC_MAIN_DIR)/lib/readline/signals.c \
	$(DUMMY_INC)/sys/file.h\
	$(DUMMY_INC)/unistd.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/ansi_stdlib.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/posixstat.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/rldefs.h\
	$(DUMMY_INC)/sys/ioctl.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/readline.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/history.h\
	$(DUMMY_INC)/dtypes.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/memalloc.h\
	$(DUMMY_INC)/termcap.h\
	$(DUMMY_INC)/termio.h\
	$(DUMMY_INC)/termios.h\
	$(DUMMY_INC)/sgtty.h\
	$(DUMMY_INC)/dirent.h\
	$(DUMMY_INC)/sys/ndir.h\
	$(DUMMY_INC)/ndir.h\
	$(DUMMY_INC)/sys/dir.h\
	$(DUMMY_INC)/sys/stream.h\
	$(DUMMY_INC)/sys/ptem.h\
	$(DUMMY_INC)/sys/pte.h\
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/rlconf.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/keymaps.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/tilde.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/alloca.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/chardefs.h

$(OBJ_DIR)/lib/readline/funmap.obj:\
	$(BASH_SRC_MAIN_DIR)/lib/readline/funmap.c \
	$(BASH_SRC_MAIN_DIR)/lib/readline/ansi_stdlib.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/rlconf.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/readline.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/keymaps.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/tilde.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/chardefs.h\
	$(DUMMY_INC)/strings.h

$(OBJ_DIR)/lib/readline/complete.obj:\
	$(BASH_SRC_MAIN_DIR)/lib/readline/complete.c \
	$(DUMMY_INC)/sys/file.h\
	$(DUMMY_INC)/unistd.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/ansi_stdlib.h\
	$(DUMMY_INC)/pwd.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/posixstat.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/rldefs.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/readline.h\
	$(DUMMY_INC)/dtypes.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/memalloc.h\
	$(DUMMY_INC)/termcap.h\
	$(DUMMY_INC)/termio.h\
	$(DUMMY_INC)/termios.h\
	$(DUMMY_INC)/sgtty.h\
	$(DUMMY_INC)/dirent.h\
	$(DUMMY_INC)/sys/ndir.h\
	$(DUMMY_INC)/ndir.h\
	$(DUMMY_INC)/sys/dir.h\
	$(DUMMY_INC)/sys/stream.h\
	$(DUMMY_INC)/sys/ptem.h\
	$(DUMMY_INC)/sys/pte.h\
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/rlconf.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/keymaps.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/tilde.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/alloca.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/chardefs.h

$(OBJ_DIR)/lib/readline/search.obj:\
	$(BASH_SRC_MAIN_DIR)/lib/readline/search.c \
	$(DUMMY_INC)/unistd.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/memalloc.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/rldefs.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/readline.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/history.h\
	$(DUMMY_INC)/dtypes.h\
	$(DUMMY_INC)/alloca.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(DUMMY_INC)/termcap.h\
	$(DUMMY_INC)/termio.h\
	$(DUMMY_INC)/termios.h\
	$(DUMMY_INC)/sgtty.h\
	$(DUMMY_INC)/dirent.h\
	$(DUMMY_INC)/sys/ndir.h\
	$(DUMMY_INC)/ndir.h\
	$(DUMMY_INC)/sys/dir.h\
	$(DUMMY_INC)/sys/stream.h\
	$(DUMMY_INC)/sys/ptem.h\
	$(DUMMY_INC)/sys/pte.h\
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/rlconf.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/keymaps.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/tilde.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/chardefs.h

$(OBJ_DIR)/lib/readline/display.obj:\
	$(BASH_SRC_MAIN_DIR)/lib/readline/display.c \
	$(DUMMY_INC)/unistd.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/ansi_stdlib.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/posixstat.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/rldefs.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/readline.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/history.h\
	$(DUMMY_INC)/dtypes.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/memalloc.h\
	$(DUMMY_INC)/termcap.h\
	$(DUMMY_INC)/termio.h\
	$(DUMMY_INC)/termios.h\
	$(DUMMY_INC)/sgtty.h\
	$(DUMMY_INC)/dirent.h\
	$(DUMMY_INC)/sys/ndir.h\
	$(DUMMY_INC)/ndir.h\
	$(DUMMY_INC)/sys/dir.h\
	$(DUMMY_INC)/sys/stream.h\
	$(DUMMY_INC)/sys/ptem.h\
	$(DUMMY_INC)/sys/pte.h\
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/rlconf.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/keymaps.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/tilde.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/alloca.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/chardefs.h

$(OBJ_DIR)/lib/readline/readline.obj:\
	$(BASH_SRC_MAIN_DIR)/lib/readline/readline.c \
	$(DUMMY_INC)/sys/file.h\
	$(DUMMY_INC)/unistd.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/ansi_stdlib.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/posixstat.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/rldefs.h\
	$(DUMMY_INC)/sys/ioctl.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/readline.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/history.h\
	$(DUMMY_INC)/sys/pc.h\
	$(DUMMY_INC)/dtypes.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/memalloc.h\
	$(DUMMY_INC)/termcap.h\
	$(DUMMY_INC)/termio.h\
	$(DUMMY_INC)/termios.h\
	$(DUMMY_INC)/sgtty.h\
	$(DUMMY_INC)/dirent.h\
	$(DUMMY_INC)/sys/ndir.h\
	$(DUMMY_INC)/ndir.h\
	$(DUMMY_INC)/sys/dir.h\
	$(DUMMY_INC)/sys/stream.h\
	$(DUMMY_INC)/sys/ptem.h\
	$(DUMMY_INC)/sys/pte.h\
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/rlconf.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/keymaps.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/tilde.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/alloca.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/chardefs.h

$(OBJ_DIR)/test.obj:\
	$(BASH_SRC_MAIN_DIR)/test.c \
	$(BASH_SRC_MAIN_DIR)/bashtypes.h\
	$(DUMMY_INC)/sys/file.h\
	$(BASH_SRC_MAIN_DIR)/posixstat.h\
	$(BASH_SRC_MAIN_DIR)/filecntl.h\
	$(BASH_SRC_MAIN_DIR)/shell.h\
	$(DUMMY_INC)/system.h\
	$(DUMMY_INC)/unistd.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/command.h\
	$(BASH_SRC_MAIN_DIR)/general.h\
	$(BASH_SRC_MAIN_DIR)/error.h\
	$(BASH_SRC_MAIN_DIR)/variables.h\
	$(BASH_SRC_MAIN_DIR)/quit.h\
	$(BASH_SRC_MAIN_DIR)/maxpath.h\
	$(BASH_SRC_MAIN_DIR)/unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)/dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)/make_cmd.h\
	$(BASH_SRC_MAIN_DIR)/subst.h\
	$(BASH_SRC_MAIN_DIR)/externs.h\
	$(DUMMY_INC)/dtypes.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(BASH_SRC_MAIN_DIR)/stdc.h\
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/hash.h\
	$(DUMMY_INC)/sys/param.h\
	$(DUMMY_INC)/alloca.h

$(OBJ_DIR)/lib/readline/bind.obj:\
	$(BASH_SRC_MAIN_DIR)/lib/readline/bind.c \
	$(DUMMY_INC)/sys/file.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(DUMMY_INC)/unistd.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/ansi_stdlib.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/posixstat.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/rldefs.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/readline.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/history.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/dtypes.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/memalloc.h\
	$(DUMMY_INC)/termcap.h\
	$(DUMMY_INC)/termio.h\
	$(DUMMY_INC)/termios.h\
	$(DUMMY_INC)/sgtty.h\
	$(DUMMY_INC)/dirent.h\
	$(DUMMY_INC)/sys/ndir.h\
	$(DUMMY_INC)/ndir.h\
	$(DUMMY_INC)/sys/dir.h\
	$(DUMMY_INC)/sys/stream.h\
	$(DUMMY_INC)/sys/ptem.h\
	$(DUMMY_INC)/sys/pte.h\
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/rlconf.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/keymaps.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/tilde.h\
	$(DUMMY_INC)/alloca.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/chardefs.h

$(OBJ_DIR)/trap.obj:\
	$(BASH_SRC_MAIN_DIR)/trap.c \
	$(BASH_SRC_MAIN_DIR)/bashtypes.h\
	$(BASH_SRC_MAIN_DIR)/trap.h\
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/shell.h\
	$(BASH_SRC_MAIN_DIR)/signames.h\
	$(BASH_SRC_MAIN_DIR)/stdc.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/command.h\
	$(BASH_SRC_MAIN_DIR)/general.h\
	$(BASH_SRC_MAIN_DIR)/error.h\
	$(BASH_SRC_MAIN_DIR)/variables.h\
	$(BASH_SRC_MAIN_DIR)/quit.h\
	$(BASH_SRC_MAIN_DIR)/maxpath.h\
	$(BASH_SRC_MAIN_DIR)/unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)/dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)/make_cmd.h\
	$(BASH_SRC_MAIN_DIR)/subst.h\
	$(BASH_SRC_MAIN_DIR)/externs.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/unistd.h\
	$(BASH_SRC_MAIN_DIR)/hash.h\
	$(DUMMY_INC)/sys/param.h\
	$(DUMMY_INC)/alloca.h\
	$(DUMMY_INC)/dtypes.h

$(OBJ_DIR)/lib/readline/rltty.obj:\
	$(BASH_SRC_MAIN_DIR)/lib/readline/rltty.c \
	$(DUMMY_INC)/unistd.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/rldefs.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/readline.h\
	$(DUMMY_INC)/sys/pc.h\
	$(DUMMY_INC)/dtypes.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/memalloc.h\
	$(DUMMY_INC)/termcap.h\
	$(DUMMY_INC)/termio.h\
	$(DUMMY_INC)/termios.h\
	$(DUMMY_INC)/sgtty.h\
	$(DUMMY_INC)/dirent.h\
	$(DUMMY_INC)/sys/ndir.h\
	$(DUMMY_INC)/ndir.h\
	$(DUMMY_INC)/sys/dir.h\
	$(DUMMY_INC)/sys/stream.h\
	$(DUMMY_INC)/sys/ptem.h\
	$(DUMMY_INC)/sys/pte.h\
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/rlconf.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/keymaps.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/tilde.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/alloca.h\
	$(BASH_SRC_MAIN_DIR)/lib/readline/chardefs.h


$(DUMMY_INC)/dirent.c:

$(DUMMY_INC)/bzero.c:


$(DUMMY_INC)/bash_dum.c:

$(OBJ_DIR)/nt_vc.obj:\
	$(BASH_SRC_MAIN_DIR)/nt_vc.c \
	$(BASH_SRC_MAIN_DIR)/bashtypes.h\
	$(BASH_SRC_MAIN_DIR)/filecntl.h\
	$(BASH_SRC_MAIN_DIR)/posixstat.h\
	$(BASH_SRC_MAIN_DIR)/general.h\
	$(BASH_SRC_MAIN_DIR)/nt_types.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(DUMMY_INC)/sys/param.h\
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/shell.h\
	$(BASH_SRC_MAIN_DIR)/y.tab.h\
	$(BASH_SRC_MAIN_DIR)/flags.h\
	$(BASH_SRC_MAIN_DIR)/hash.h\
	$(BASH_SRC_MAIN_DIR)/jobs.h\
	$(BASH_SRC_MAIN_DIR)/execute_cmd.h\
	$(BASH_SRC_MAIN_DIR)/sysdefs.h\
	$(BASH_SRC_MAIN_DIR)/builtins/common.h\
	$(BASH_SRC_MAIN_DIR)/builtins/builtext.h\
	$(BASH_SRC_MAIN_DIR)/lib/glob/fnmatch.h\
	$(BASH_SRC_MAIN_DIR)/lib/tilde/tilde.h\
	$(BASH_SRC_MAIN_DIR)/input.h\
	$(BASH_SRC_MAIN_DIR)/stdc.h\
	$(BASH_SRC_MAIN_DIR)/command.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/unistd.h\
	$(BASH_SRC_MAIN_DIR)/error.h\
	$(BASH_SRC_MAIN_DIR)/variables.h\
	$(BASH_SRC_MAIN_DIR)/quit.h\
	$(BASH_SRC_MAIN_DIR)/maxpath.h\
	$(BASH_SRC_MAIN_DIR)/unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)/dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)/make_cmd.h\
	$(BASH_SRC_MAIN_DIR)/subst.h\
	$(BASH_SRC_MAIN_DIR)/externs.h\
	$(BASH_SRC_MAIN_DIR)/siglist.h\
	$(DUMMY_INC)/sys/wait.h\
	$(DUMMY_INC)/bash_endian.h\
	$(DUMMY_INC)/alloca.h\
	$(DUMMY_INC)/dtypes.h

$(OBJ_DIR)/unistd.obj:\
	$(DUMMY_INC)/unistd.c\
	$(DUMMY_INC)/sys/wait.h\
	$(DUMMY_INC)/sys/param.h\
	$(DUMMY_INC)/sys/time.h\
	$(DUMMY_INC)/unistd.h\
	$(DUMMY_INC)/grp.h\
	$(DUMMY_INC)/pwd.h\
	$(DUMMY_INC)/dtypes.h


(OBJ_DIR)/signal.obj:\\
	$(DUMMY_INC)/signal.c\
	$(DUMMY_INC)/dtypes.h

###########################################################
#
# DEPENDENCIES BUILTINS
#
###########################################################

$(OBJ_DIR)/builtins/test.obj:\
	$(BASH_SRC_MAIN_DIR)/builtins/test.c \
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/command.h\
	$(BASH_SRC_MAIN_DIR)/general.h\
	$(BASH_SRC_MAIN_DIR)/error.h\
	$(BASH_SRC_MAIN_DIR)/variables.h\
	$(BASH_SRC_MAIN_DIR)/quit.h\
	$(BASH_SRC_MAIN_DIR)/maxpath.h\
	$(BASH_SRC_MAIN_DIR)/unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)/dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)/make_cmd.h\
	$(BASH_SRC_MAIN_DIR)/subst.h\
	$(BASH_SRC_MAIN_DIR)/externs.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/unistd.h\
	$(BASH_SRC_MAIN_DIR)/stdc.h\
	$(BASH_SRC_MAIN_DIR)/hash.h\
	$(DUMMY_INC)/sys\param.h\
	$(DUMMY_INC)/alloca.h\
	$(DUMMY_INC)/dtypes.h

$(OBJ_DIR)/builtins/echo.obj:\
	$(BASH_SRC_MAIN_DIR)/builtins/echo.c \
	$(BASH_SRC_MAIN_DIR)/shell.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/command.h\
	$(BASH_SRC_MAIN_DIR)/general.h\
	$(BASH_SRC_MAIN_DIR)/error.h\
	$(BASH_SRC_MAIN_DIR)/variables.h\
	$(BASH_SRC_MAIN_DIR)/quit.h\
	$(BASH_SRC_MAIN_DIR)/maxpath.h\
	$(BASH_SRC_MAIN_DIR)/unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)/dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)/make_cmd.h\
	$(BASH_SRC_MAIN_DIR)/subst.h\
	$(BASH_SRC_MAIN_DIR)/externs.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/unistd.h\
	$(BASH_SRC_MAIN_DIR)/stdc.h\
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/hash.h\
	$(DUMMY_INC)/sys\param.h\
	$(DUMMY_INC)/alloca.h\
	$(DUMMY_INC)/dtypes.h

$(OBJ_DIR)/builtins/cd.obj:\
	$(BASH_SRC_MAIN_DIR)/builtins/cd.c \
	$(DUMMY_INC)/sys\param.h\
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/lib\tilde\tilde.h\
	$(BASH_SRC_MAIN_DIR)/shell.h\
	$(BASH_SRC_MAIN_DIR)/flags.h\
	$(BASH_SRC_MAIN_DIR)/maxpath.h\
	$(BASH_SRC_MAIN_DIR)/builtins/common.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/command.h\
	$(BASH_SRC_MAIN_DIR)/general.h\
	$(BASH_SRC_MAIN_DIR)/error.h\
	$(BASH_SRC_MAIN_DIR)/variables.h\
	$(BASH_SRC_MAIN_DIR)/quit.h\
	$(BASH_SRC_MAIN_DIR)/unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)/dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)/make_cmd.h\
	$(BASH_SRC_MAIN_DIR)/subst.h\
	$(BASH_SRC_MAIN_DIR)/externs.h\
	$(BASH_SRC_MAIN_DIR)/stdc.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/unistd.h\
	$(BASH_SRC_MAIN_DIR)/hash.h\
	$(DUMMY_INC)/alloca.h\
	$(DUMMY_INC)/dtypes.h

$(OBJ_DIR)/builtins/ulimit.obj:\
	$(BASH_SRC_MAIN_DIR)/builtins/ulimit.c \
	$(DUMMY_INC)/sys\param.h\
	$(BASH_SRC_MAIN_DIR)/shell.h\
	$(BASH_SRC_MAIN_DIR)/builtins/pipesize.h\
	$(DUMMY_INC)/sys\time.h\
	$(DUMMY_INC)/sys\resource.h\
	$(DUMMY_INC)/sys\times.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/command.h\
	$(BASH_SRC_MAIN_DIR)/general.h\
	$(BASH_SRC_MAIN_DIR)/error.h\
	$(BASH_SRC_MAIN_DIR)/variables.h\
	$(BASH_SRC_MAIN_DIR)/quit.h\
	$(BASH_SRC_MAIN_DIR)/maxpath.h\
	$(BASH_SRC_MAIN_DIR)/unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)/dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)/make_cmd.h\
	$(BASH_SRC_MAIN_DIR)/subst.h\
	$(BASH_SRC_MAIN_DIR)/externs.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/unistd.h\
	$(BASH_SRC_MAIN_DIR)/stdc.h\
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/hash.h\
	$(DUMMY_INC)/alloca.h\
	$(DUMMY_INC)/dtypes.h

$(OBJ_DIR)/builtins/help.obj:\
	$(BASH_SRC_MAIN_DIR)/builtins/help.c \
	$(BASH_SRC_MAIN_DIR)/shell.h\
	$(BASH_SRC_MAIN_DIR)/builtins.h\
	$(DUMMY_INC)/glob/glob.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/command.h\
	$(BASH_SRC_MAIN_DIR)/general.h\
	$(BASH_SRC_MAIN_DIR)/error.h\
	$(BASH_SRC_MAIN_DIR)/variables.h\
	$(BASH_SRC_MAIN_DIR)/quit.h\
	$(BASH_SRC_MAIN_DIR)/maxpath.h\
	$(BASH_SRC_MAIN_DIR)/unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)/dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)/make_cmd.h\
	$(BASH_SRC_MAIN_DIR)/subst.h\
	$(BASH_SRC_MAIN_DIR)/externs.h\
	$(BASH_SRC_MAIN_DIR)/alias.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/unistd.h\
	$(BASH_SRC_MAIN_DIR)/stdc.h\
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/hash.h\
	$(DUMMY_INC)/sys\param.h\
	$(DUMMY_INC)/alloca.h\
	$(DUMMY_INC)/dtypes.h

$(OBJ_DIR)/builtins/wait.obj:\
	$(BASH_SRC_MAIN_DIR)/builtins/wait.c \
	$(BASH_SRC_MAIN_DIR)/shell.h\
	$(BASH_SRC_MAIN_DIR)/jobs.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/command.h\
	$(BASH_SRC_MAIN_DIR)/general.h\
	$(BASH_SRC_MAIN_DIR)/error.h\
	$(BASH_SRC_MAIN_DIR)/variables.h\
	$(BASH_SRC_MAIN_DIR)/quit.h\
	$(BASH_SRC_MAIN_DIR)/maxpath.h\
	$(BASH_SRC_MAIN_DIR)/unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)/dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)/make_cmd.h\
	$(BASH_SRC_MAIN_DIR)/subst.h\
	$(BASH_SRC_MAIN_DIR)/externs.h\
	$(BASH_SRC_MAIN_DIR)/siglist.h\
	$(BASH_SRC_MAIN_DIR)/stdc.h\
	$(DUMMY_INC)/sys\wait.h\
	$(DUMMY_INC)/bash_endian.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/unistd.h\
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/hash.h\
	$(DUMMY_INC)/sys\param.h\
	$(DUMMY_INC)/alloca.h\
	$(DUMMY_INC)/dtypes.h

$(OBJ_DIR)/builtins/kill.obj:\
	$(BASH_SRC_MAIN_DIR)/builtins/kill.c \
	$(BASH_SRC_MAIN_DIR)/shell.h\
	$(BASH_SRC_MAIN_DIR)/trap.h\
	$(BASH_SRC_MAIN_DIR)/jobs.h\
	$(BASH_SRC_MAIN_DIR)/builtins/common.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/command.h\
	$(BASH_SRC_MAIN_DIR)/general.h\
	$(BASH_SRC_MAIN_DIR)/error.h\
	$(BASH_SRC_MAIN_DIR)/variables.h\
	$(BASH_SRC_MAIN_DIR)/quit.h\
	$(BASH_SRC_MAIN_DIR)/maxpath.h\
	$(BASH_SRC_MAIN_DIR)/unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)/dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)/make_cmd.h\
	$(BASH_SRC_MAIN_DIR)/subst.h\
	$(BASH_SRC_MAIN_DIR)/externs.h\
	$(BASH_SRC_MAIN_DIR)/stdc.h\
	$(BASH_SRC_MAIN_DIR)/siglist.h\
	$(DUMMY_INC)/sys\wait.h\
	$(DUMMY_INC)/bash_endian.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/unistd.h\
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/hash.h\
	$(DUMMY_INC)/sys\param.h\
	$(DUMMY_INC)/alloca.h\
	$(DUMMY_INC)/dtypes.h


$(OBJ_DIR)/builtins/jobs.obj:\
	$(BASH_SRC_MAIN_DIR)/builtins/jobs.c \
	$(BASH_SRC_MAIN_DIR)/shell.h\
	$(BASH_SRC_MAIN_DIR)/jobs.h\
	$(BASH_SRC_MAIN_DIR)/builtins/bashgetopt.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/command.h\
	$(BASH_SRC_MAIN_DIR)/general.h\
	$(BASH_SRC_MAIN_DIR)/error.h\
	$(BASH_SRC_MAIN_DIR)/variables.h\
	$(BASH_SRC_MAIN_DIR)/quit.h\
	$(BASH_SRC_MAIN_DIR)/maxpath.h\
	$(BASH_SRC_MAIN_DIR)/unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)/dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)/make_cmd.h\
	$(BASH_SRC_MAIN_DIR)/subst.h\
	$(BASH_SRC_MAIN_DIR)/externs.h\
	$(BASH_SRC_MAIN_DIR)/siglist.h\
	$(BASH_SRC_MAIN_DIR)/stdc.h\
	$(DUMMY_INC)/sys\wait.h\
	$(DUMMY_INC)/bash_endian.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/unistd.h\
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/hash.h\
	$(DUMMY_INC)/sys\param.h\
	$(DUMMY_INC)/alloca.h\
	$(DUMMY_INC)/dtypes.h

$(OBJ_DIR)/builtins/trap.obj:\
	$(BASH_SRC_MAIN_DIR)/builtins/trap.c \
	$(BASH_SRC_MAIN_DIR)/shell.h\
	$(BASH_SRC_MAIN_DIR)/trap.h\
	$(BASH_SRC_MAIN_DIR)/builtins/common.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/command.h\
	$(BASH_SRC_MAIN_DIR)/general.h\
	$(BASH_SRC_MAIN_DIR)/error.h\
	$(BASH_SRC_MAIN_DIR)/variables.h\
	$(BASH_SRC_MAIN_DIR)/quit.h\
	$(BASH_SRC_MAIN_DIR)/maxpath.h\
	$(BASH_SRC_MAIN_DIR)/unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)/dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)/make_cmd.h\
	$(BASH_SRC_MAIN_DIR)/subst.h\
	$(BASH_SRC_MAIN_DIR)/externs.h\
	$(BASH_SRC_MAIN_DIR)/stdc.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/unistd.h\
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/hash.h\
	$(DUMMY_INC)/sys\param.h\
	$(DUMMY_INC)/alloca.h\
	$(DUMMY_INC)/dtypes.h

$(OBJ_DIR)/builtins/enable.obj:\
	$(BASH_SRC_MAIN_DIR)/builtins/enable.c \
	$(BASH_SRC_MAIN_DIR)/shell.h\
	$(BASH_SRC_MAIN_DIR)/builtins.h\
	$(BASH_SRC_MAIN_DIR)/builtins/common.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/command.h\
	$(BASH_SRC_MAIN_DIR)/general.h\
	$(BASH_SRC_MAIN_DIR)/error.h\
	$(BASH_SRC_MAIN_DIR)/variables.h\
	$(BASH_SRC_MAIN_DIR)/quit.h\
	$(BASH_SRC_MAIN_DIR)/maxpath.h\
	$(BASH_SRC_MAIN_DIR)/unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)/dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)/make_cmd.h\
	$(BASH_SRC_MAIN_DIR)/subst.h\
	$(BASH_SRC_MAIN_DIR)/externs.h\
	$(BASH_SRC_MAIN_DIR)/alias.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/unistd.h\
	$(BASH_SRC_MAIN_DIR)/stdc.h\
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/hash.h\
	$(DUMMY_INC)/sys\param.h\
	$(DUMMY_INC)/alloca.h\
	$(DUMMY_INC)/dtypes.h

$(OBJ_DIR)/builtins/fc.obj:\
	$(BASH_SRC_MAIN_DIR)/builtins/fc.c \
	$(BASH_SRC_MAIN_DIR)/bashansi.h\
	$(BASH_SRC_MAIN_DIR)/shell.h\
	$(DUMMY_INC)/sys\param.h\
	$(DUMMY_INC)/sys\file.h\
	$(BASH_SRC_MAIN_DIR)/builtins.h\
	$(BASH_SRC_MAIN_DIR)/flags.h\
	$(BASH_SRC_MAIN_DIR)/maxpath.h\
	$(BASH_SRC_MAIN_DIR)/bashhist.h\
	$(BASH_SRC_MAIN_DIR)/lib\readline\history.h\
	$(BASH_SRC_MAIN_DIR)/builtins/bashgetopt.h\
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/ansi_stdlib.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/command.h\
	$(BASH_SRC_MAIN_DIR)/general.h\
	$(BASH_SRC_MAIN_DIR)/error.h\
	$(BASH_SRC_MAIN_DIR)/variables.h\
	$(BASH_SRC_MAIN_DIR)/quit.h\
	$(BASH_SRC_MAIN_DIR)/unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)/dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)/make_cmd.h\
	$(BASH_SRC_MAIN_DIR)/subst.h\
	$(BASH_SRC_MAIN_DIR)/externs.h\
	$(BASH_SRC_MAIN_DIR)/alias.h\
	$(BASH_SRC_MAIN_DIR)/stdc.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/unistd.h\
	$(BASH_SRC_MAIN_DIR)/hash.h\
	$(DUMMY_INC)/alloca.h\
	$(DUMMY_INC)/dtypes.h

$(OBJ_DIR)/builtins/fg_bg.obj:\
	$(BASH_SRC_MAIN_DIR)/builtins/fg_bg.c \
	$(BASH_SRC_MAIN_DIR)/shell.h\
	$(BASH_SRC_MAIN_DIR)/jobs.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/command.h\
	$(BASH_SRC_MAIN_DIR)/general.h\
	$(BASH_SRC_MAIN_DIR)/error.h\
	$(BASH_SRC_MAIN_DIR)/variables.h\
	$(BASH_SRC_MAIN_DIR)/quit.h\
	$(BASH_SRC_MAIN_DIR)/maxpath.h\
	$(BASH_SRC_MAIN_DIR)/unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)/dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)/make_cmd.h\
	$(BASH_SRC_MAIN_DIR)/subst.h\
	$(BASH_SRC_MAIN_DIR)/externs.h\
	$(BASH_SRC_MAIN_DIR)/siglist.h\
	$(BASH_SRC_MAIN_DIR)/stdc.h\
	$(DUMMY_INC)/sys\wait.h\
	$(DUMMY_INC)/bash_endian.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/unistd.h\
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/hash.h\
	$(DUMMY_INC)/sys\param.h\
	$(DUMMY_INC)/alloca.h\
	$(DUMMY_INC)/dtypes.h

$(OBJ_DIR)/builtins/declare.obj:\
	$(BASH_SRC_MAIN_DIR)/builtins/declare.c \
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/shell.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/command.h\
	$(BASH_SRC_MAIN_DIR)/general.h\
	$(BASH_SRC_MAIN_DIR)/error.h\
	$(BASH_SRC_MAIN_DIR)/variables.h\
	$(BASH_SRC_MAIN_DIR)/quit.h\
	$(BASH_SRC_MAIN_DIR)/maxpath.h\
	$(BASH_SRC_MAIN_DIR)/unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)/dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)/make_cmd.h\
	$(BASH_SRC_MAIN_DIR)/subst.h\
	$(BASH_SRC_MAIN_DIR)/externs.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/unistd.h\
	$(BASH_SRC_MAIN_DIR)/stdc.h\
	$(BASH_SRC_MAIN_DIR)/hash.h\
	$(DUMMY_INC)/sys\param.h\
	$(DUMMY_INC)/alloca.h\
	$(DUMMY_INC)/dtypes.h

$(OBJ_DIR)/builtins/inlib.obj:\
	$(BASH_SRC_MAIN_DIR)/builtins/inlib.c \
	$(BASH_SRC_MAIN_DIR)/shell.h\
	$(DUMMY_INC)/apollo\base.h\
	$(DUMMY_INC)/apollo\loader.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/command.h\
	$(BASH_SRC_MAIN_DIR)/general.h\
	$(BASH_SRC_MAIN_DIR)/error.h\
	$(BASH_SRC_MAIN_DIR)/variables.h\
	$(BASH_SRC_MAIN_DIR)/quit.h\
	$(BASH_SRC_MAIN_DIR)/maxpath.h\
	$(BASH_SRC_MAIN_DIR)/unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)/dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)/make_cmd.h\
	$(BASH_SRC_MAIN_DIR)/subst.h\
	$(BASH_SRC_MAIN_DIR)/externs.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/unistd.h\
	$(BASH_SRC_MAIN_DIR)/stdc.h\
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/hash.h\
	$(DUMMY_INC)/sys\param.h\
	$(DUMMY_INC)/alloca.h\
	$(DUMMY_INC)/dtypes.h

$(OBJ_DIR)/builtins/getopts.obj:\
	$(BASH_SRC_MAIN_DIR)/builtins/getopts.c \
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/shell.h\
	$(BASH_SRC_MAIN_DIR)/builtins/getopt.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/command.h\
	$(BASH_SRC_MAIN_DIR)/general.h\
	$(BASH_SRC_MAIN_DIR)/error.h\
	$(BASH_SRC_MAIN_DIR)/variables.h\
	$(BASH_SRC_MAIN_DIR)/quit.h\
	$(BASH_SRC_MAIN_DIR)/maxpath.h\
	$(BASH_SRC_MAIN_DIR)/unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)/dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)/make_cmd.h\
	$(BASH_SRC_MAIN_DIR)/subst.h\
	$(BASH_SRC_MAIN_DIR)/externs.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/unistd.h\
	$(BASH_SRC_MAIN_DIR)/stdc.h\
	$(BASH_SRC_MAIN_DIR)/hash.h\
	$(DUMMY_INC)/sys\param.h\
	$(DUMMY_INC)/alloca.h\
	$(DUMMY_INC)/dtypes.h

$(OBJ_DIR)/builtins/suspend.obj:\
	$(BASH_SRC_MAIN_DIR)/builtins/suspend.c \
	$(BASH_SRC_MAIN_DIR)/shell.h\
	$(BASH_SRC_MAIN_DIR)/jobs.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/command.h\
	$(BASH_SRC_MAIN_DIR)/general.h\
	$(BASH_SRC_MAIN_DIR)/error.h\
	$(BASH_SRC_MAIN_DIR)/variables.h\
	$(BASH_SRC_MAIN_DIR)/quit.h\
	$(BASH_SRC_MAIN_DIR)/maxpath.h\
	$(BASH_SRC_MAIN_DIR)/unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)/dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)/make_cmd.h\
	$(BASH_SRC_MAIN_DIR)/subst.h\
	$(BASH_SRC_MAIN_DIR)/externs.h\
	$(BASH_SRC_MAIN_DIR)/siglist.h\
	$(BASH_SRC_MAIN_DIR)/stdc.h\
	$(DUMMY_INC)/sys\wait.h\
	$(DUMMY_INC)/bash_endian.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/unistd.h\
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/hash.h\
	$(DUMMY_INC)/sys\param.h\
	$(DUMMY_INC)/alloca.h\
	$(DUMMY_INC)/dtypes.h

$(OBJ_DIR)/builtins/read.obj:\
	$(BASH_SRC_MAIN_DIR)/builtins/read.c \
	$(BASH_SRC_MAIN_DIR)/shell.h\
	$(BASH_SRC_MAIN_DIR)/builtins/common.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/command.h\
	$(BASH_SRC_MAIN_DIR)/general.h\
	$(BASH_SRC_MAIN_DIR)/error.h\
	$(BASH_SRC_MAIN_DIR)/variables.h\
	$(BASH_SRC_MAIN_DIR)/quit.h\
	$(BASH_SRC_MAIN_DIR)/maxpath.h\
	$(BASH_SRC_MAIN_DIR)/unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)/dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)/make_cmd.h\
	$(BASH_SRC_MAIN_DIR)/subst.h\
	$(BASH_SRC_MAIN_DIR)/externs.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/unistd.h\
	$(BASH_SRC_MAIN_DIR)/stdc.h\
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/hash.h\
	$(DUMMY_INC)/sys\param.h\
	$(DUMMY_INC)/alloca.h\
	$(DUMMY_INC)/dtypes.h

$(OBJ_DIR)/builtins/times.obj:\
	$(BASH_SRC_MAIN_DIR)/builtins/times.c \
	$(BASH_SRC_MAIN_DIR)/shell.h\
	$(DUMMY_INC)/sys\times.h\
	$(DUMMY_INC)/sys\time.h\
	$(DUMMY_INC)/sys\resource.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/command.h\
	$(BASH_SRC_MAIN_DIR)/general.h\
	$(BASH_SRC_MAIN_DIR)/error.h\
	$(BASH_SRC_MAIN_DIR)/variables.h\
	$(BASH_SRC_MAIN_DIR)/quit.h\
	$(BASH_SRC_MAIN_DIR)/maxpath.h\
	$(BASH_SRC_MAIN_DIR)/unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)/dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)/make_cmd.h\
	$(BASH_SRC_MAIN_DIR)/subst.h\
	$(BASH_SRC_MAIN_DIR)/externs.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/unistd.h\
	$(BASH_SRC_MAIN_DIR)/stdc.h\
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/hash.h\
	$(DUMMY_INC)/sys\param.h\
	$(DUMMY_INC)/alloca.h\
	$(DUMMY_INC)/dtypes.h

$(OBJ_DIR)/builtins/bashgetopt.obj:\
	$(BASH_SRC_MAIN_DIR)/builtins/bashgetopt.c \
	$(BASH_SRC_MAIN_DIR)/shell.h\
	$(BASH_SRC_MAIN_DIR)/bashansi.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/command.h\
	$(BASH_SRC_MAIN_DIR)/general.h\
	$(BASH_SRC_MAIN_DIR)/error.h\
	$(BASH_SRC_MAIN_DIR)/variables.h\
	$(BASH_SRC_MAIN_DIR)/quit.h\
	$(BASH_SRC_MAIN_DIR)/maxpath.h\
	$(BASH_SRC_MAIN_DIR)/unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)/dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)/make_cmd.h\
	$(BASH_SRC_MAIN_DIR)/subst.h\
	$(BASH_SRC_MAIN_DIR)/externs.h\
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/ansi_stdlib.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/unistd.h\
	$(BASH_SRC_MAIN_DIR)/stdc.h\
	$(BASH_SRC_MAIN_DIR)/hash.h\
	$(DUMMY_INC)/sys\param.h\
	$(DUMMY_INC)/alloca.h\
	$(DUMMY_INC)/dtypes.h

$(OBJ_DIR)/builtins/bind.obj:\
	$(BASH_SRC_MAIN_DIR)/builtins/bind.c\
	$(BASH_SRC_MAIN_DIR)/shell.h\
	$(BASH_SRC_MAIN_DIR)/lib\readline\readline.h\
	$(BASH_SRC_MAIN_DIR)/lib\readline\history.h\
	$(BASH_SRC_MAIN_DIR)/builtins/bashgetopt.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/command.h\
	$(BASH_SRC_MAIN_DIR)/general.h\
	$(BASH_SRC_MAIN_DIR)/error.h\
	$(BASH_SRC_MAIN_DIR)/variables.h\
	$(BASH_SRC_MAIN_DIR)/quit.h\
	$(BASH_SRC_MAIN_DIR)/maxpath.h\
	$(BASH_SRC_MAIN_DIR)/unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)/dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)/make_cmd.h\
	$(BASH_SRC_MAIN_DIR)/subst.h\
	$(BASH_SRC_MAIN_DIR)/externs.h\
	$(BASH_SRC_MAIN_DIR)/lib\readline\keymaps.h\
	$(BASH_SRC_MAIN_DIR)/lib\readline\tilde.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/unistd.h\
	$(BASH_SRC_MAIN_DIR)/stdc.h\
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/hash.h\
	$(DUMMY_INC)/sys\param.h\
	$(BASH_SRC_MAIN_DIR)/lib\readline\chardefs.h\
	$(DUMMY_INC)/alloca.h\
	$(DUMMY_INC)/dtypes.h

$(OBJ_DIR)/builtins/exit.obj:\
	$(BASH_SRC_MAIN_DIR)/builtins/exit.c \
	$(BASH_SRC_MAIN_DIR)/shell.h\
	$(BASH_SRC_MAIN_DIR)/jobs.h\
	$(BASH_SRC_MAIN_DIR)/builtins/builtext.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/command.h\
	$(BASH_SRC_MAIN_DIR)/general.h\
	$(BASH_SRC_MAIN_DIR)/error.h\
	$(BASH_SRC_MAIN_DIR)/variables.h\
	$(BASH_SRC_MAIN_DIR)/quit.h\
	$(BASH_SRC_MAIN_DIR)/maxpath.h\
	$(BASH_SRC_MAIN_DIR)/unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)/dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)/make_cmd.h\
	$(BASH_SRC_MAIN_DIR)/subst.h\
	$(BASH_SRC_MAIN_DIR)/externs.h\
	$(BASH_SRC_MAIN_DIR)/siglist.h\
	$(BASH_SRC_MAIN_DIR)/stdc.h\
	$(DUMMY_INC)/sys\wait.h\
	$(DUMMY_INC)/bash_endian.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/unistd.h\
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/hash.h\
	$(DUMMY_INC)/sys\param.h\
	$(DUMMY_INC)/alloca.h\
	$(DUMMY_INC)/dtypes.h

$(OBJ_DIR)/builtins/break.obj:\
	$(BASH_SRC_MAIN_DIR)/builtins/break.c \
	$(BASH_SRC_MAIN_DIR)/shell.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/command.h\
	$(BASH_SRC_MAIN_DIR)/general.h\
	$(BASH_SRC_MAIN_DIR)/error.h\
	$(BASH_SRC_MAIN_DIR)/variables.h\
	$(BASH_SRC_MAIN_DIR)/quit.h\
	$(BASH_SRC_MAIN_DIR)/maxpath.h\
	$(BASH_SRC_MAIN_DIR)/unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)/dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)/make_cmd.h\
	$(BASH_SRC_MAIN_DIR)/subst.h\
	$(BASH_SRC_MAIN_DIR)/externs.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/unistd.h\
	$(BASH_SRC_MAIN_DIR)/stdc.h\
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/hash.h\
	$(DUMMY_INC)/sys\param.h\
	$(DUMMY_INC)/alloca.h\
	$(DUMMY_INC)/dtypes.h

$(OBJ_DIR)/builtins/common.obj:\
	$(BASH_SRC_MAIN_DIR)/builtins/common.c \
	$(BASH_SRC_MAIN_DIR)/posixstat.h\
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/shell.h\
	$(BASH_SRC_MAIN_DIR)/unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)/maxpath.h\
	$(BASH_SRC_MAIN_DIR)/jobs.h\
	$(BASH_SRC_MAIN_DIR)/builtins.h\
	$(BASH_SRC_MAIN_DIR)/input.h\
	$(BASH_SRC_MAIN_DIR)/execute_cmd.h\
	$(BASH_SRC_MAIN_DIR)/builtins/hashcom.h\
	$(BASH_SRC_MAIN_DIR)/builtins/common.h\
	$(BASH_SRC_MAIN_DIR)/lib\tilde\tilde.h\
	$(BASH_SRC_MAIN_DIR)/bashhist.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/command.h\
	$(BASH_SRC_MAIN_DIR)/general.h\
	$(BASH_SRC_MAIN_DIR)/error.h\
	$(BASH_SRC_MAIN_DIR)/variables.h\
	$(BASH_SRC_MAIN_DIR)/quit.h\
	$(BASH_SRC_MAIN_DIR)/dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)/make_cmd.h\
	$(BASH_SRC_MAIN_DIR)/subst.h\
	$(BASH_SRC_MAIN_DIR)/externs.h\
	$(DUMMY_INC)/sys\param.h\
	$(BASH_SRC_MAIN_DIR)/siglist.h\
	$(BASH_SRC_MAIN_DIR)/stdc.h\
	$(DUMMY_INC)/sys\wait.h\
	$(DUMMY_INC)/bash_endian.h\
	$(BASH_SRC_MAIN_DIR)/alias.h\
	$(BASH_SRC_MAIN_DIR)/hash.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/unistd.h\
	$(DUMMY_INC)/alloca.h\
	$(DUMMY_INC)/dtypes.h

$(OBJ_DIR)/builtins/exec.obj:\
	$(BASH_SRC_MAIN_DIR)/builtins/exec.c \
	$(BASH_SRC_MAIN_DIR)/shell.h\
	$(BASH_SRC_MAIN_DIR)/posixstat.h\
	$(BASH_SRC_MAIN_DIR)/execute_cmd.h\
	$(BASH_SRC_MAIN_DIR)/builtins/common.h\
	$(BASH_SRC_MAIN_DIR)/flags.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/command.h\
	$(BASH_SRC_MAIN_DIR)/general.h\
	$(BASH_SRC_MAIN_DIR)/error.h\
	$(BASH_SRC_MAIN_DIR)/variables.h\
	$(BASH_SRC_MAIN_DIR)/quit.h\
	$(BASH_SRC_MAIN_DIR)/maxpath.h\
	$(BASH_SRC_MAIN_DIR)/unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)/dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)/make_cmd.h\
	$(BASH_SRC_MAIN_DIR)/subst.h\
	$(BASH_SRC_MAIN_DIR)/externs.h\
	$(BASH_SRC_MAIN_DIR)/stdc.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/unistd.h\
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/hash.h\
	$(DUMMY_INC)/sys\param.h\
	$(DUMMY_INC)/alloca.h\
	$(DUMMY_INC)/dtypes.h

$(OBJ_DIR)/builtins/shift.obj:\
	$(BASH_SRC_MAIN_DIR)/builtins/shift.c \
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/shell.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/command.h\
	$(BASH_SRC_MAIN_DIR)/general.h\
	$(BASH_SRC_MAIN_DIR)/error.h\
	$(BASH_SRC_MAIN_DIR)/variables.h\
	$(BASH_SRC_MAIN_DIR)/quit.h\
	$(BASH_SRC_MAIN_DIR)/maxpath.h\
	$(BASH_SRC_MAIN_DIR)/unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)/dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)/make_cmd.h\
	$(BASH_SRC_MAIN_DIR)/subst.h\
	$(BASH_SRC_MAIN_DIR)/externs.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/unistd.h\
	$(BASH_SRC_MAIN_DIR)/stdc.h\
	$(BASH_SRC_MAIN_DIR)/hash.h\
	$(DUMMY_INC)/sys\param.h\
	$(DUMMY_INC)/alloca.h\
	$(DUMMY_INC)/dtypes.h

$(OBJ_DIR)/builtins/colon.obj:\
	$(BASH_SRC_MAIN_DIR)/builtins/colon.c 

$(OBJ_DIR)/builtins/set.obj:\
	$(BASH_SRC_MAIN_DIR)/builtins/set.c\
	$(BASH_SRC_MAIN_DIR)/shell.h\
	$(BASH_SRC_MAIN_DIR)/flags.h\
	$(BASH_SRC_MAIN_DIR)/builtins/bashgetopt.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/command.h\
	$(BASH_SRC_MAIN_DIR)/general.h\
	$(BASH_SRC_MAIN_DIR)/error.h\
	$(BASH_SRC_MAIN_DIR)/variables.h\
	$(BASH_SRC_MAIN_DIR)/quit.h\
	$(BASH_SRC_MAIN_DIR)/maxpath.h\
	$(BASH_SRC_MAIN_DIR)/unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)/dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)/make_cmd.h\
	$(BASH_SRC_MAIN_DIR)/subst.h\
	$(BASH_SRC_MAIN_DIR)/externs.h\
	$(BASH_SRC_MAIN_DIR)/stdc.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/unistd.h\
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/hash.h\
	$(DUMMY_INC)/sys\param.h\
	$(DUMMY_INC)/alloca.h\
	$(DUMMY_INC)/dtypes.h

$(OBJ_DIR)/builtins/source.obj:\
	$(BASH_SRC_MAIN_DIR)/builtins/source.c \
	$(DUMMY_INC)/sys\file.h\
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/shell.h\
	$(BASH_SRC_MAIN_DIR)/posixstat.h\
	$(BASH_SRC_MAIN_DIR)/filecntl.h\
	$(BASH_SRC_MAIN_DIR)/execute_cmd.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/command.h\
	$(BASH_SRC_MAIN_DIR)/general.h\
	$(BASH_SRC_MAIN_DIR)/error.h\
	$(BASH_SRC_MAIN_DIR)/variables.h\
	$(BASH_SRC_MAIN_DIR)/quit.h\
	$(BASH_SRC_MAIN_DIR)/maxpath.h\
	$(BASH_SRC_MAIN_DIR)/unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)/dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)/make_cmd.h\
	$(BASH_SRC_MAIN_DIR)/subst.h\
	$(BASH_SRC_MAIN_DIR)/externs.h\
	$(BASH_SRC_MAIN_DIR)/stdc.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/unistd.h\
	$(BASH_SRC_MAIN_DIR)/hash.h\
	$(DUMMY_INC)/sys\param.h\
	$(DUMMY_INC)/alloca.h\
	$(DUMMY_INC)/dtypes.h

$(OBJ_DIR)/builtins/eval.obj:\
	$(BASH_SRC_MAIN_DIR)/builtins/eval.c \
	$(BASH_SRC_MAIN_DIR)/shell.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/command.h\
	$(BASH_SRC_MAIN_DIR)/general.h\
	$(BASH_SRC_MAIN_DIR)/error.h\
	$(BASH_SRC_MAIN_DIR)/variables.h\
	$(BASH_SRC_MAIN_DIR)/quit.h\
	$(BASH_SRC_MAIN_DIR)/maxpath.h\
	$(BASH_SRC_MAIN_DIR)/unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)/dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)/make_cmd.h\
	$(BASH_SRC_MAIN_DIR)/subst.h\
	$(BASH_SRC_MAIN_DIR)/externs.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/unistd.h\
	$(BASH_SRC_MAIN_DIR)/stdc.h\
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/hash.h\
	$(DUMMY_INC)/sys\param.h\
	$(DUMMY_INC)/alloca.h\
	$(DUMMY_INC)/dtypes.h

$(OBJ_DIR)/builtins/hash.obj:\
	$(BASH_SRC_MAIN_DIR)/builtins/hash.c \
	$(BASH_SRC_MAIN_DIR)/posixstat.h\
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/shell.h\
	$(BASH_SRC_MAIN_DIR)/builtins.h\
	$(BASH_SRC_MAIN_DIR)/flags.h\
	$(BASH_SRC_MAIN_DIR)/builtins/hashcom.h\
	$(BASH_SRC_MAIN_DIR)/builtins/common.h\
	$(BASH_SRC_MAIN_DIR)/execute_cmd.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/command.h\
	$(BASH_SRC_MAIN_DIR)/general.h\
	$(BASH_SRC_MAIN_DIR)/error.h\
	$(BASH_SRC_MAIN_DIR)/variables.h\
	$(BASH_SRC_MAIN_DIR)/quit.h\
	$(BASH_SRC_MAIN_DIR)/maxpath.h\
	$(BASH_SRC_MAIN_DIR)/unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)/dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)/make_cmd.h\
	$(BASH_SRC_MAIN_DIR)/subst.h\
	$(BASH_SRC_MAIN_DIR)/externs.h\
	$(BASH_SRC_MAIN_DIR)/alias.h\
	$(BASH_SRC_MAIN_DIR)/stdc.h\
	$(BASH_SRC_MAIN_DIR)/hash.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/unistd.h\
	$(DUMMY_INC)/sys\param.h\
	$(DUMMY_INC)/alloca.h\
	$(DUMMY_INC)/dtypes.h

$(OBJ_DIR)/builtins/let.obj:\
	$(BASH_SRC_MAIN_DIR)/builtins/let.c \
	$(BASH_SRC_MAIN_DIR)/shell.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/command.h\
	$(BASH_SRC_MAIN_DIR)/general.h\
	$(BASH_SRC_MAIN_DIR)/error.h\
	$(BASH_SRC_MAIN_DIR)/variables.h\
	$(BASH_SRC_MAIN_DIR)/quit.h\
	$(BASH_SRC_MAIN_DIR)/maxpath.h\
	$(BASH_SRC_MAIN_DIR)/unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)/dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)/make_cmd.h\
	$(BASH_SRC_MAIN_DIR)/subst.h\
	$(BASH_SRC_MAIN_DIR)/externs.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/unistd.h\
	$(BASH_SRC_MAIN_DIR)/stdc.h\
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/hash.h\
	$(DUMMY_INC)/sys\param.h\
	$(DUMMY_INC)/alloca.h\
	$(DUMMY_INC)/dtypes.h

$(OBJ_DIR)/builtins/return.obj:\
	$(BASH_SRC_MAIN_DIR)/builtins/return.c \
	$(BASH_SRC_MAIN_DIR)/shell.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/command.h\
	$(BASH_SRC_MAIN_DIR)/general.h\
	$(BASH_SRC_MAIN_DIR)/error.h\
	$(BASH_SRC_MAIN_DIR)/variables.h\
	$(BASH_SRC_MAIN_DIR)/quit.h\
	$(BASH_SRC_MAIN_DIR)/maxpath.h\
	$(BASH_SRC_MAIN_DIR)/unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)/dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)/make_cmd.h\
	$(BASH_SRC_MAIN_DIR)/subst.h\
	$(BASH_SRC_MAIN_DIR)/externs.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/unistd.h\
	$(BASH_SRC_MAIN_DIR)/stdc.h\
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/hash.h\
	$(DUMMY_INC)/sys\param.h\
	$(DUMMY_INC)/alloca.h\
	$(DUMMY_INC)/dtypes.h

$(OBJ_DIR)/builtins/umask.obj:\
	$(BASH_SRC_MAIN_DIR)/builtins/umask.c \
	$(DUMMY_INC)/sys\file.h\
	$(BASH_SRC_MAIN_DIR)/shell.h\
	$(BASH_SRC_MAIN_DIR)/posixstat.h\
	$(BASH_SRC_MAIN_DIR)/builtins/common.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/command.h\
	$(BASH_SRC_MAIN_DIR)/general.h\
	$(BASH_SRC_MAIN_DIR)/error.h\
	$(BASH_SRC_MAIN_DIR)/variables.h\
	$(BASH_SRC_MAIN_DIR)/quit.h\
	$(BASH_SRC_MAIN_DIR)/maxpath.h\
	$(BASH_SRC_MAIN_DIR)/unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)/dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)/make_cmd.h\
	$(BASH_SRC_MAIN_DIR)/subst.h\
	$(BASH_SRC_MAIN_DIR)/externs.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/unistd.h\
	$(BASH_SRC_MAIN_DIR)/stdc.h\
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/hash.h\
	$(DUMMY_INC)/sys\param.h\
	$(DUMMY_INC)/alloca.h\
	$(DUMMY_INC)/dtypes.h

$(OBJ_DIR)/builtins/command.obj:\
	$(BASH_SRC_MAIN_DIR)/builtins/command.c \
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/shell.h\
	$(BASH_SRC_MAIN_DIR)/builtins/bashgetopt.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/command.h\
	$(BASH_SRC_MAIN_DIR)/general.h\
	$(BASH_SRC_MAIN_DIR)/error.h\
	$(BASH_SRC_MAIN_DIR)/variables.h\
	$(BASH_SRC_MAIN_DIR)/quit.h\
	$(BASH_SRC_MAIN_DIR)/maxpath.h\
	$(BASH_SRC_MAIN_DIR)/unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)/dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)/make_cmd.h\
	$(BASH_SRC_MAIN_DIR)/subst.h\
	$(BASH_SRC_MAIN_DIR)/externs.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/unistd.h\
	$(BASH_SRC_MAIN_DIR)/stdc.h\
	$(BASH_SRC_MAIN_DIR)/hash.h\
	$(DUMMY_INC)/sys\param.h\
	$(DUMMY_INC)/alloca.h\
	$(DUMMY_INC)/dtypes.h

$(OBJ_DIR)/builtins/setattr.obj:\
	$(BASH_SRC_MAIN_DIR)/builtins/setattr.c \
	$(BASH_SRC_MAIN_DIR)/shell.h\
	$(BASH_SRC_MAIN_DIR)/builtins/common.h\
	$(BASH_SRC_MAIN_DIR)/builtins/bashgetopt.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/command.h\
	$(BASH_SRC_MAIN_DIR)/general.h\
	$(BASH_SRC_MAIN_DIR)/error.h\
	$(BASH_SRC_MAIN_DIR)/variables.h\
	$(BASH_SRC_MAIN_DIR)/quit.h\
	$(BASH_SRC_MAIN_DIR)/maxpath.h\
	$(BASH_SRC_MAIN_DIR)/unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)/dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)/make_cmd.h\
	$(BASH_SRC_MAIN_DIR)/subst.h\
	$(BASH_SRC_MAIN_DIR)/externs.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/unistd.h\
	$(BASH_SRC_MAIN_DIR)/stdc.h\
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/hash.h\
	$(DUMMY_INC)/sys\param.h\
	$(DUMMY_INC)/alloca.h\
	$(DUMMY_INC)/dtypes.h

$(OBJ_DIR)/builtins/history.obj:\
	$(BASH_SRC_MAIN_DIR)/builtins/history.c \
	$(BASH_SRC_MAIN_DIR)/shell.h\
	$(DUMMY_INC)/sys\file.h\
	$(BASH_SRC_MAIN_DIR)/filecntl.h\
	$(BASH_SRC_MAIN_DIR)/posixstat.h\
	$(BASH_SRC_MAIN_DIR)/bashhist.h\
	$(BASH_SRC_MAIN_DIR)/lib\readline\history.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/command.h\
	$(BASH_SRC_MAIN_DIR)/general.h\
	$(BASH_SRC_MAIN_DIR)/error.h\
	$(BASH_SRC_MAIN_DIR)/variables.h\
	$(BASH_SRC_MAIN_DIR)/quit.h\
	$(BASH_SRC_MAIN_DIR)/maxpath.h\
	$(BASH_SRC_MAIN_DIR)/unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)/dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)/make_cmd.h\
	$(BASH_SRC_MAIN_DIR)/subst.h\
	$(BASH_SRC_MAIN_DIR)/externs.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/unistd.h\
	$(BASH_SRC_MAIN_DIR)/stdc.h\
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/hash.h\
	$(DUMMY_INC)/sys\param.h\
	$(DUMMY_INC)/alloca.h\
	$(DUMMY_INC)/dtypes.h

$(OBJ_DIR)/builtins/builtin.obj:\
	$(BASH_SRC_MAIN_DIR)/builtins/builtin.c \
	$(BASH_SRC_MAIN_DIR)/shell.h\
	$(BASH_SRC_MAIN_DIR)/builtins/common.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/command.h\
	$(BASH_SRC_MAIN_DIR)/general.h\
	$(BASH_SRC_MAIN_DIR)/error.h\
	$(BASH_SRC_MAIN_DIR)/variables.h\
	$(BASH_SRC_MAIN_DIR)/quit.h\
	$(BASH_SRC_MAIN_DIR)/maxpath.h\
	$(BASH_SRC_MAIN_DIR)/unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)/dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)/make_cmd.h\
	$(BASH_SRC_MAIN_DIR)/subst.h\
	$(BASH_SRC_MAIN_DIR)/externs.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/unistd.h\
	$(BASH_SRC_MAIN_DIR)/stdc.h\
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/hash.h\
	$(DUMMY_INC)/sys\param.h\
	$(DUMMY_INC)/alloca.h\
	$(DUMMY_INC)/dtypes.h

$(OBJ_DIR)/builtins/alias.obj:\
	$(BASH_SRC_MAIN_DIR)/builtins/alias.c \
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/shell.h\
	$(BASH_SRC_MAIN_DIR)/alias.h\
	$(BASH_SRC_MAIN_DIR)/builtins/common.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/unistd.h\
	$(BASH_SRC_MAIN_DIR)/command.h\
	$(BASH_SRC_MAIN_DIR)/general.h\
	$(BASH_SRC_MAIN_DIR)/error.h\
	$(BASH_SRC_MAIN_DIR)/variables.h\
	$(BASH_SRC_MAIN_DIR)/quit.h\
	$(BASH_SRC_MAIN_DIR)/maxpath.h\
	$(BASH_SRC_MAIN_DIR)/unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)/dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)/make_cmd.h\
	$(BASH_SRC_MAIN_DIR)/subst.h\
	$(BASH_SRC_MAIN_DIR)/externs.h\
	$(BASH_SRC_MAIN_DIR)/hash.h\
	$(DUMMY_INC)/alloca.h\
	$(DUMMY_INC)/dtypes.h\
	$(BASH_SRC_MAIN_DIR)/stdc.h\
	$(DUMMY_INC)/strings.h\
	$(DUMMY_INC)/sys\param.h

$(OBJ_DIR)/builtins/type.obj:\
	$(BASH_SRC_MAIN_DIR)/builtins/type.c \
	$(BASH_SRC_MAIN_DIR)/posixstat.h\
	$(BASH_SRC_MAIN_DIR)/shell.h\
	$(BASH_SRC_MAIN_DIR)/execute_cmd.h\
	$(BASH_SRC_MAIN_DIR)/alias.h\
	$(BASH_SRC_MAIN_DIR)/builtins/common.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/command.h\
	$(BASH_SRC_MAIN_DIR)/general.h\
	$(BASH_SRC_MAIN_DIR)/error.h\
	$(BASH_SRC_MAIN_DIR)/variables.h\
	$(BASH_SRC_MAIN_DIR)/quit.h\
	$(BASH_SRC_MAIN_DIR)/maxpath.h\
	$(BASH_SRC_MAIN_DIR)/unwind_prot.h\
	$(BASH_SRC_MAIN_DIR)/dispose_cmd.h\
	$(BASH_SRC_MAIN_DIR)/make_cmd.h\
	$(BASH_SRC_MAIN_DIR)/subst.h\
	$(BASH_SRC_MAIN_DIR)/externs.h\
	$(BASH_SRC_MAIN_DIR)/stdc.h\
	$(BASH_SRC_MAIN_DIR)/hash.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/unistd.h\
	$(DUMMY_INC)/strings.h\
	$(DUMMY_INC)/sys\param.h\
	$(DUMMY_INC)/alloca.h\
	$(DUMMY_INC)/dtypes.h

$(OBJ_DIR)/builtins/getopt.obj:\
	$(BASH_SRC_MAIN_DIR)/builtins/getopt.c \
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(DUMMY_INC)/alloca.h\
	$(BASH_SRC_MAIN_DIR)/builtins/getopt.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/unistd.h\
	$(DUMMY_INC)/dtypes.h

$(OBJ_DIR)/builtins/builtins.obj:\
	$(BASH_SRC_MAIN_DIR)/builtins/builtins.c \
	$(BASH_SRC_MAIN_DIR)/builtins.h\
	$(BASH_SRC_MAIN_DIR)/builtins/builtext.h\
	$(BASH_SRC_MAIN_DIR)/config.h\
	$(BASH_SRC_MAIN_DIR)/command.h\
	$(BASH_SRC_MAIN_DIR)/general.h\
	$(BASH_SRC_MAIN_DIR)/alias.h\
	$(BASH_SRC_MAIN_DIR)/memalloc.h\
	$(DUMMY_INC)/unistd.h\
	$(BASH_SRC_MAIN_DIR)/stdc.h\
	$(DUMMY_INC)/strings.h\
	$(BASH_SRC_MAIN_DIR)/hash.h\
	$(DUMMY_INC)/alloca.h\
	$(DUMMY_INC)/dtypes.h


###########################################################
###########################################################



all: bash test

bash: $(BASH_OBJS) $(BUILTIN_OBJS)
	$(CC) $(BUILTIN_OBJS) $(BASH_OBJS)  -o bash.exe

clean:
	- cmd /C del /F $(subst /,\, $(BASH_OBJS))\*
	- cmd /C del /F $(subst /,\, $(BUILTIN_OBJS))\*

test: bash
	- cmd /C del shelltools\sh.exe shelltools\bash.exe
	cmd /C copy bash.exe shelltools
	cmd /C move shelltools\bash.exe shelltools\sh.exe
	cmd /C copy bash.exe shelltools
	cd shelltools && cmd /C start_bash.bat "cd ../testcases; . ./runtests.sh" && cd ..	
#	cd shelltools && cmd /C "start /WAIT cmd /c start_bash.cmd -c cd ../testcases; sh ./runtests.sh"
	