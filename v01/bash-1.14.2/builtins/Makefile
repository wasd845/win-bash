# This Makefile for building libbuiltins.a is in -*- text -*- for Emacs.
#
MKBUILTINS = mkbuiltins
RANLIB = /usr/bin/ranlib
CFLAGS = -g -I.. -I.
SHELL = /bin/sh
# CC = cc
AR = ar
RM = rm -f
CP = cp

srcdir = .
VPATH = .:$(srcdir)

.SUFFIXES:
.SUFFIXES: .def .c .o
# How to make a .o file from a .def file.
.def.o:
	$(RM) $@
	./$(MKBUILTINS) $(DIRECTDEFINE) $<
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $*.c
	$(RM) $*.c

# How to make a .c file from a .def file.
.def.c:
	$(RM) $@
	./$(MKBUILTINS) $(DIRECTDEFINE) $<

# Here is a rule for making .o files from .c files that does not
# force the type of the machine (like -M_MACHINE) into the flags.
.c.o:
	$(RM) $@
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $<

DEFS =  $(srcdir)/alias.def $(srcdir)/bind.def $(srcdir)/break.def \
	$(srcdir)/builtin.def $(srcdir)/cd.def $(srcdir)/colon.def \
	$(srcdir)/command.def $(srcdir)/declare.def $(srcdir)/echo.def \
	$(srcdir)/enable.def $(srcdir)/eval.def $(srcdir)/getopts.def \
	$(srcdir)/exec.def $(srcdir)/exit.def $(srcdir)/fc.def \
	$(srcdir)/fg_bg.def $(srcdir)/hash.def $(srcdir)/help.def \
	$(srcdir)/history.def $(srcdir)/jobs.def $(srcdir)/kill.def \
	$(srcdir)/let.def $(srcdir)/read.def $(srcdir)/return.def \
	$(srcdir)/set.def $(srcdir)/setattr.def $(srcdir)/shift.def \
	$(srcdir)/source.def $(srcdir)/suspend.def $(srcdir)/test.def \
	$(srcdir)/times.def $(srcdir)/trap.def $(srcdir)/type.def \
	$(srcdir)/ulimit.def $(srcdir)/umask.def $(srcdir)/wait.def \
	$(srcdir)/reserved.def

STATIC_SOURCE = common.c getopt.c bashgetopt.c getopt.h 

OFILES = builtins.o \
	alias.o bind.o break.o builtin.o cd.o colon.o command.o \
	common.o declare.o echo.o enable.o eval.o exec.o exit.o \
	fc.o fg_bg.o hash.o help.o history.o jobs.o kill.o \
	let.o read.o return.o set.o setattr.o shift.o source.o \
	suspend.o test.o times.o trap.o type.o ulimit.o umask.o \
	wait.o getopts.o getopt.o bashgetopt.o

THINGS_TO_TAR = $(DEFS) $(STATIC_SOURCE) Makefile ChangeLog

CREATED_FILES = builtext.h builtins.c psize.aux pipesize.h

all: $(MKBUILTINS) libbuiltins.a

libbuiltins.a: $(MKBUILTINS) $(OFILES)
	$(RM) $@
	$(AR) cq $@ $(OFILES)
	-if [ -f "$(RANLIB)" ]; then $(RANLIB) $@; fi

builtext.h builtins.c: $(MKBUILTINS) $(DEFS)
	$(RM) builtext.h builtins.c
	./$(MKBUILTINS) -externfile builtext.h -structfile builtins.c \
	-noproduction $(DIRECTDEFINE) $(DEFS)

mkbuiltins: $(srcdir)/mkbuiltins.c ../config.h
	$(CC) $(CFLAGS) -o $(MKBUILTINS) $(srcdir)/mkbuiltins.c

ulimit.o: ulimit.def pipesize.h

pipesize.h:	psize.aux
	$(SHELL) $(srcdir)/psize.sh > pipesize.h

psize.aux:	psize.c
	$(CC) $(CFLAGS) -o $@ $(srcdir)/psize.c

documentation: builtins.texi

$(OFILES):	$(MKBUILTINS) ../config.h

builtins.texi: $(MKBUILTINS)
	./$(MKBUILTINS) -documentonly $(DEFS)

clean:
	$(RM) $(OFILES) $(CREATED_FILES) $(MKBUILTINS) libbuiltins.a

alias.o: alias.def
bind.o: bind.def
break.o: break.def
builtin.o: builtin.def
cd.o: cd.def
colon.o: colon.def
command.o: command.def
declare.o: declare.def
echo.o: echo.def
enable.o: enable.def
eval.o: eval.def
exec.o: exec.def
exit.o: exit.def
fc.o: fc.def
fg_bg.o: fg_bg.def
hash.o: hash.def
help.o: help.def
history.o: history.def
jobs.o: jobs.def
kill.o: kill.def
let.o: let.def
read.o: read.def
return.o: return.def
set.o: set.def
setattr.o: setattr.def
shift.o: shift.def
source.o: source.def
suspend.o: suspend.def
test.o: test.def
times.o: times.def
trap.o: trap.def
type.o: type.def
umask.o: umask.def
wait.o: wait.def
getopts.o: getopts.def
reserved.o: reserved.def

common.o: ../shell.h ../command.h ../config.h ../memalloc.h ../general.h
common.o: ../variables.h ../input.h hashcom.h ../bashhist.h
common.o: ../quit.h  ../unwind_prot.h ../maxpath.h ../jobs.h ../builtins.h
common.o: ../dispose_cmd.h ../make_cmd.h ../subst.h ../externs.h
common.o: ../execute_cmd.h ../error.h
alias.o: ../command.h ../config.h ../memalloc.h ../error.h ../general.h
alias.o: ../quit.h ../dispose_cmd.h ../make_cmd.h ../subst.h ../externs.h
alias.o: ../shell.h ../unwind_prot.h ../variables.h common.h ../maxpath.h
bind.o: ../command.h ../config.h ../memalloc.h ../error.h ../general.h
bind.o: ../quit.h ../dispose_cmd.h ../make_cmd.h ../subst.h ../externs.h
bind.o: ../maxpath.h
bind.o: ../shell.h ../unwind_prot.h ../variables.h bashgetopt.h
break.o: ../command.h ../config.h ../memalloc.h ../error.h ../general.h
break.o: ../quit.h ../dispose_cmd.h ../make_cmd.h ../subst.h ../externs.h
break.o: ../shell.h ../unwind_prot.h ../variables.h ../maxpath.h
builtin.o: ../command.h ../config.h ../memalloc.h ../error.h ../general.h
builtin.o: ../quit.h common.h ../maxpath.h
builtin.o: ../dispose_cmd.h ../make_cmd.h ../subst.h ../externs.h
builtin.o: ../shell.h ../unwind_prot.h ../variables.h 
cd.o: ../command.h ../config.h ../memalloc.h ../error.h ../general.h
cd.o: ../quit.h ../dispose_cmd.h ../make_cmd.h ../subst.h ../externs.h
cd.o: ../shell.h ../unwind_prot.h ../variables.h common.h ../maxpath.h
command.o: ../command.h ../config.h ../memalloc.h ../error.h ../general.h
command.o: ../quit.h bashgetopt.h ../maxpath.h
command.o: ../dispose_cmd.h ../make_cmd.h ../subst.h ../externs.h
command.o: ../shell.h ../unwind_prot.h ../variables.h 
declare.o: ../command.h ../config.h ../memalloc.h ../error.h ../general.h
declare.o: ../quit.h ../dispose_cmd.h ../make_cmd.h ../subst.h ../externs.h
declare.o: ../shell.h ../unwind_prot.h ../variables.h ../maxpath.h
echo.o: ../command.h ../config.h ../memalloc.h ../error.h ../general.h
echo.o: ../quit.h ../dispose_cmd.h ../make_cmd.h ../subst.h ../externs.h
echo.o: ../shell.h ../unwind_prot.h ../variables.h ../maxpath.h
enable.o: ../command.h ../config.h ../memalloc.h ../error.h ../general.h
enable.o: ../quit.h ../dispose_cmd.h ../make_cmd.h ../subst.h ../externs.h
enable.o: ../shell.h ../unwind_prot.h ../variables.h ../maxpath.h
eval.o: ../command.h ../config.h ../memalloc.h ../error.h ../general.h
eval.o: ../quit.h ../dispose_cmd.h ../make_cmd.h ../subst.h ../externs.h
eval.o: ../shell.h ../unwind_prot.h ../variables.h ../maxpath.h
exec.o: ../command.h ../config.h ../memalloc.h ../error.h ../general.h
exec.o: ../quit.h ../dispose_cmd.h ../make_cmd.h ../subst.h ../externs.h
exec.o: ../shell.h ../unwind_prot.h ../variables.h common.h ../execute_cmd.h
exec.o: ../maxpath.h ../flags.h
exit.o: ../command.h ../config.h ../memalloc.h ../error.h ../general.h
exit.o: ../quit.h ../dispose_cmd.h ../make_cmd.h ../subst.h ../externs.h
exit.o: ../shell.h ../unwind_prot.h ../variables.h ../maxpath.h
fc.o: ../builtins.h ../command.h bashgetopt.h ../bashhist.h
fc.o: ../command.h ../config.h ../memalloc.h ../error.h ../general.h
fc.o: ../quit.h ../dispose_cmd.h ../make_cmd.h ../subst.h ../externs.h
fc.o: ../flags.h ../unwind_prot.h ../variables.h ../shell.h ../maxpath.h
fg_bg.o: ../command.h ../config.h ../memalloc.h ../error.h ../general.h
fg_bg.o: ../quit.h ../dispose_cmd.h ../make_cmd.h ../subst.h ../externs.h
fg_bg.o: ../shell.h ../unwind_prot.h ../variables.h ../maxpath.h
getopts.o: ../command.h ../config.h ../memalloc.h ../error.h ../general.h
getopts.o: ../quit.h ../dispose_cmd.h ../make_cmd.h ../subst.h ../externs.h
getopts.o: ../shell.h ../unwind_prot.h ../variables.h ../maxpath.h
hash.o: ../builtins.h ../command.h ../quit.h ../execute_cmd.h
hash.o: ../command.h ../config.h ../memalloc.h ../error.h ../general.h
hash.o: ../shell.h ../unwind_prot.h ../variables.h common.h ../maxpath.h
help.o: ../command.h ../config.h ../memalloc.h ../error.h ../general.h
help.o: ../quit.h ../dispose_cmd.h ../make_cmd.h ../subst.h ../externs.h
help.o: ../shell.h ../unwind_prot.h ../variables.h ../maxpath.h
history.o: ../command.h ../config.h ../memalloc.h ../error.h ../general.h
history.o: ../quit.h ../dispose_cmd.h ../make_cmd.h ../subst.h ../externs.h
history.o: ../filecntl.h ../shell.h ../unwind_prot.h ../variables.h
history.o: ../bashhist.h ../maxpath.h
inlib.o: ../command.h ../config.h ../memalloc.h ../error.h ../general.h
inlib.o: ../shell.h ../unwind_prot.h ../variables.h ../maxpath.h
inlib.o: ../quit.h ../dispose_cmd.h ../make_cmd.h ../subst.h ../externs.h
jobs.o: ../command.h ../config.h ../memalloc.h ../error.h ../general.h
jobs.o: ../quit.h bashgetopt.h ../maxpath.h
jobs.o: ../dispose_cmd.h ../make_cmd.h ../subst.h ../externs.h
jobs.o: ../shell.h ../unwind_prot.h ../variables.h 
kill.o: ../command.h ../config.h ../memalloc.h ../error.h ../general.h
kill.o: ../quit.h ../dispose_cmd.h ../make_cmd.h ../subst.h ../externs.h
kill.o: ../shell.h ../trap.h ../unwind_prot.h ../variables.h ../maxpath.h
let.o: ../command.h ../config.h ../memalloc.h ../error.h ../general.h
let.o: ../quit.h ../dispose_cmd.h ../make_cmd.h ../subst.h ../externs.h
let.o: ../shell.h ../unwind_prot.h ../variables.h ../maxpath.h
read.o: ../command.h ../config.h ../memalloc.h ../error.h ../general.h
read.o: ../quit.h ../dispose_cmd.h ../make_cmd.h ../subst.h ../externs.h
read.o: ../shell.h ../unwind_prot.h ../variables.h ../maxpath.h
return.o: ../command.h ../config.h ../memalloc.h ../error.h ../general.h
return.o: ../quit.h ../dispose_cmd.h ../make_cmd.h ../subst.h ../externs.h
return.o: ../shell.h ../unwind_prot.h ../variables.h ../maxpath.h
set.o: ../command.h ../config.h ../memalloc.h ../error.h ../general.h
set.o: ../quit.h ../dispose_cmd.h ../make_cmd.h ../subst.h ../externs.h
set.o: ../shell.h ../unwind_prot.h ../variables.h ../maxpath.h
setattr.o: ../command.h ../config.h ../memalloc.h ../error.h ../general.h
setattr.o: ../quit.h common.h bashgetopt.h ../maxpath.h
setattr.o: ../dispose_cmd.h ../make_cmd.h ../subst.h ../externs.h
setattr.o: ../shell.h ../unwind_prot.h ../variables.h 
shift.o: ../command.h ../config.h ../memalloc.h ../error.h ../general.h
shift.o: ../quit.h ../dispose_cmd.h ../make_cmd.h ../subst.h ../externs.h
shift.o: ../shell.h ../unwind_prot.h ../variables.h ../maxpath.h
source.o: ../command.h ../config.h ../memalloc.h ../error.h ../general.h
source.o: ../quit.h ../dispose_cmd.h ../make_cmd.h ../subst.h ../externs.h
source.o: ../shell.h ../unwind_prot.h ../variables.h ../maxpath.h
suspend.o: ../command.h ../config.h ../memalloc.h ../error.h ../general.h
suspend.o: ../quit.h ../dispose_cmd.h ../make_cmd.h ../subst.h ../externs.h
suspend.o: ../shell.h ../unwind_prot.h ../variables.h ../maxpath.h
test.o: ../command.h ../config.h ../memalloc.h ../error.h ../general.h
test.o: ../quit.h ../dispose_cmd.h ../make_cmd.h ../subst.h ../externs.h
test.o: ../shell.h ../unwind_prot.h ../variables.h ../maxpath.h
times.o: ../command.h ../config.h ../memalloc.h ../error.h ../general.h
times.o: ../quit.h ../dispose_cmd.h ../make_cmd.h ../subst.h ../externs.h
times.o: ../shell.h ../unwind_prot.h ../variables.h ../maxpath.h
trap.o: ../command.h ../config.h ../memalloc.h ../error.h ../general.h
trap.o: ../quit.h common.h ../maxpath.h
trap.o: ../dispose_cmd.h ../make_cmd.h ../subst.h ../externs.h
trap.o: ../shell.h ../unwind_prot.h ../variables.h ../execute_cmd.h
type.o: ../command.h ../config.h ../memalloc.h ../error.h ../general.h
type.o: ../quit.h common.h ../maxpath.h
type.o: ../dispose_cmd.h ../make_cmd.h ../subst.h ../externs.h
type.o: ../shell.h ../unwind_prot.h ../variables.h 
ulimit.o: ../command.h ../config.h ../memalloc.h ../error.h ../general.h
ulimit.o: ../quit.h ../dispose_cmd.h ../make_cmd.h ../subst.h ../externs.h
ulimit.o: ../shell.h ../unwind_prot.h ../variables.h ../maxpath.h
umask.o: ../command.h ../config.h ../memalloc.h ../error.h ../general.h
umask.o: ../quit.h ../dispose_cmd.h ../make_cmd.h ../subst.h ../externs.h
umask.o: ../shell.h ../unwind_prot.h ../variables.h ../maxpath.h
wait.o: ../command.h ../config.h ../memalloc.h ../error.h ../general.h
wait.o: ../quit.h ../dispose_cmd.h ../make_cmd.h ../subst.h ../externs.h
wait.o: ../shell.h ../unwind_prot.h ../variables.h ../maxpath.h

bashgetopt.o: ../bashansi.h ../ansi_stdlib.h
mkbuiltins.o: ../bashansi.h ../ansi_stdlib.h
fc.o: ../bashansi.h ../ansi_stdlib.h

#bind.o: $(RL_LIBSRC)chardefs.h $(RL_LIBSRC)readline.h $(RL_LIBSRC)keymaps.h
