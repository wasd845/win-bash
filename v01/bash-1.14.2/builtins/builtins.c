/* builtins.c -- the built in shell commands. */

/* This file is manufactured by ./mkbuiltins, and should not be
   edited by hand.  See the source to mkbuiltins for details. */

/* Copyright (C) 1987, 1991, 1992 Free Software Foundation, Inc.

   This file is part of GNU Bash, the Bourne Again SHell.

   Bash is free software; you can redistribute it and/or modify it
   under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 1, or (at your option)
   any later version.

   Bash is distributed in the hope that it will be useful, but WITHOUT
   ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
   or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public
   License for more details.

   You should have received a copy of the GNU General Public License
   along with Bash; see the file COPYING.  If not, write to the Free
   Software Foundation, 675 Mass Ave, Cambridge, MA 02139, USA. */

/* The list of shell builtins.  Each element is name, function, enabled-p,
   long-doc, short-doc.  The long-doc field contains a pointer to an array
   of help lines.  The function takes a WORD_LIST *; the first word in the
   list is the first arg to the command.  The list has already had word
   expansion performed.

   Functions which need to look at only the simple commands (e.g.
   the enable_builtin ()), should ignore entries where
   (array[i].function == (Function *)NULL).  Such entries are for
   the list of shell reserved control structures, like `if' and `while'.
   The end of the list is denoted with a NULL name field. */

#include "../builtins.h"
#include "builtext.h"

struct builtin shell_builtins[] = {
#if defined (ALIAS)
  { "alias", alias_builtin, BUILTIN_ENABLED | STATIC_BUILTIN, alias_doc,
     "alias [ name[=value] ... ]" },
#endif /* ALIAS */
#if defined (ALIAS)
  { "unalias", unalias_builtin, BUILTIN_ENABLED | STATIC_BUILTIN, unalias_doc,
     "unalias [-a] [name ...]" },
#endif /* ALIAS */
#if defined (READLINE)
  { "bind", bind_builtin, BUILTIN_ENABLED | STATIC_BUILTIN, bind_doc,
     "bind [-lvd] [-m keymap] [-f filename] [-q name] [keyseq:readline-function]" },
#endif /* READLINE */
  { "break", break_builtin, BUILTIN_ENABLED | STATIC_BUILTIN | SPECIAL_BUILTIN, break_doc,
     "break [n]" },
  { "continue", continue_builtin, BUILTIN_ENABLED | STATIC_BUILTIN | SPECIAL_BUILTIN, continue_doc,
     "continue [n]" },
  { "builtin", builtin_builtin, BUILTIN_ENABLED | STATIC_BUILTIN, builtin_doc,
     "builtin [shell-builtin [arg ...]]" },
  { "cd", cd_builtin, BUILTIN_ENABLED | STATIC_BUILTIN, cd_doc,
     "cd [dir]" },
  { "pwd", pwd_builtin, BUILTIN_ENABLED | STATIC_BUILTIN, pwd_doc,
     "pwd" },
#if defined (PUSHD_AND_POPD)
  { "pushd", pushd_builtin, BUILTIN_ENABLED | STATIC_BUILTIN, pushd_doc,
     "pushd [dir | +n | -n]" },
#endif /* PUSHD_AND_POPD */
#if defined (PUSHD_AND_POPD)
  { "dirs", dirs_builtin, BUILTIN_ENABLED | STATIC_BUILTIN, dirs_doc,
     "dirs [-l]" },
#endif /* PUSHD_AND_POPD */
#if defined (PUSHD_AND_POPD)
  { "popd", popd_builtin, BUILTIN_ENABLED | STATIC_BUILTIN, popd_doc,
     "popd [+n | -n]" },
#endif /* PUSHD_AND_POPD */
  { ":", colon_builtin, BUILTIN_ENABLED | STATIC_BUILTIN | SPECIAL_BUILTIN, colon_builtin_doc,
     ":" },
  { "command", command_builtin, BUILTIN_ENABLED | STATIC_BUILTIN, command_doc,
     "command [-pVv] [command [arg ...]]" },
  { "declare", declare_builtin, BUILTIN_ENABLED | STATIC_BUILTIN, declare_doc,
     "declare [-[frxi]] name[=value] ..." },
  { "typeset", declare_builtin, BUILTIN_ENABLED | STATIC_BUILTIN, typeset_doc,
     "typeset [-[frxi]] name[=value] ..." },
  { "local", local_builtin, BUILTIN_ENABLED | STATIC_BUILTIN, local_doc,
     "local name[=value] ..." },
#if defined (V9_ECHO)
  { "echo", echo_builtin, BUILTIN_ENABLED | STATIC_BUILTIN, echo_doc,
     "echo [-neE] [arg ...]" },
#endif /* V9_ECHO */
#if !defined (V9_ECHO)
  { "echo", echo_builtin, BUILTIN_ENABLED | STATIC_BUILTIN, echo_doc,
     "echo [-n] [arg ...]" },
#endif /* !V9_ECHO */
  { "enable", enable_builtin, BUILTIN_ENABLED | STATIC_BUILTIN, enable_doc,
     "enable [-n] [name ...]" },
  { "eval", eval_builtin, BUILTIN_ENABLED | STATIC_BUILTIN | SPECIAL_BUILTIN, eval_doc,
     "eval [arg ...]" },
#if defined (GETOPTS_BUILTIN)
  { "getopts", getopts_builtin, BUILTIN_ENABLED | STATIC_BUILTIN, getopts_doc,
     "getopts optstring name [arg]" },
#endif /* GETOPTS_BUILTIN */
  { "exec", exec_builtin, BUILTIN_ENABLED | STATIC_BUILTIN | SPECIAL_BUILTIN, exec_doc,
     "exec [ [-] file [redirection ...]]" },
  { "exit", exit_builtin, BUILTIN_ENABLED | STATIC_BUILTIN | SPECIAL_BUILTIN, exit_doc,
     "exit [n]" },
  { "logout", logout_builtin, BUILTIN_ENABLED | STATIC_BUILTIN, logout_doc,
     "logout" },
#if defined (HISTORY)
  { "fc", fc_builtin, BUILTIN_ENABLED | STATIC_BUILTIN, fc_doc,
     "fc [-e ename] [-nlr] [first] [last] or fc -s [pat=rep] [cmd]" },
#endif /* HISTORY */
#if defined (JOB_CONTROL)
  { "fg", fg_builtin, BUILTIN_ENABLED | STATIC_BUILTIN, fg_doc,
     "fg [job_spec]" },
#endif /* JOB_CONTROL */
#if defined (JOB_CONTROL)
  { "bg", bg_builtin, BUILTIN_ENABLED | STATIC_BUILTIN, bg_doc,
     "bg [job_spec]" },
#endif /* JOB_CONTROL */
  { "hash", hash_builtin, BUILTIN_ENABLED | STATIC_BUILTIN, hash_doc,
     "hash [-r] [name ...]" },
  { "help", help_builtin, BUILTIN_ENABLED | STATIC_BUILTIN, help_doc,
     "help [pattern ...]" },
#if defined (HISTORY)
  { "history", history_builtin, BUILTIN_ENABLED | STATIC_BUILTIN, history_doc,
     "history [n] [ [-awrn] [filename]]" },
#endif /* HISTORY */
#if defined (JOB_CONTROL)
  { "jobs", jobs_builtin, BUILTIN_ENABLED | STATIC_BUILTIN, jobs_doc,
     "jobs [-lnp] [jobspec ...] | jobs -x command [args]" },
#endif /* JOB_CONTROL */
#if defined (JOB_CONTROL)
  { "kill", kill_builtin, BUILTIN_ENABLED | STATIC_BUILTIN, kill_doc,
     "kill [-s sigspec | -sigspec] [pid | job]... | -l [signum]" },
#endif /* JOB_CONTROL */
  { "let", let_builtin, BUILTIN_ENABLED | STATIC_BUILTIN, let_doc,
     "let arg [arg ...]" },
  { "read", read_builtin, BUILTIN_ENABLED | STATIC_BUILTIN, read_doc,
     "read [-r] [name ...]" },
  { "return", return_builtin, BUILTIN_ENABLED | STATIC_BUILTIN | SPECIAL_BUILTIN, return_doc,
     "return [n]" },
  { "set", set_builtin, BUILTIN_ENABLED | STATIC_BUILTIN | SPECIAL_BUILTIN, set_doc,
     "set [--abefhknotuvxldHCP] [-o option] [arg ...]" },
  { "unset", unset_builtin, BUILTIN_ENABLED | STATIC_BUILTIN | SPECIAL_BUILTIN, unset_doc,
     "unset [-f] [-v] [name ...]" },
  { "export", export_builtin, BUILTIN_ENABLED | STATIC_BUILTIN | SPECIAL_BUILTIN, export_doc,
     "export [-n] [-f] [name ...] or export -p" },
  { "readonly", readonly_builtin, BUILTIN_ENABLED | STATIC_BUILTIN | SPECIAL_BUILTIN, readonly_doc,
     "readonly [-n] [-f] [name ...] or readonly -p" },
  { "shift", shift_builtin, BUILTIN_ENABLED | STATIC_BUILTIN | SPECIAL_BUILTIN, shift_doc,
     "shift [n]" },
  { "source", source_builtin, BUILTIN_ENABLED | STATIC_BUILTIN | SPECIAL_BUILTIN, source_doc,
     "source filename" },
  { ".", source_builtin, BUILTIN_ENABLED | STATIC_BUILTIN | SPECIAL_BUILTIN, dot_doc,
     ". [filename]" },
#if defined (JOB_CONTROL)
  { "suspend", suspend_builtin, BUILTIN_ENABLED | STATIC_BUILTIN, suspend_doc,
     "suspend [-f]" },
#endif /* JOB_CONTROL */
  { "test", test_builtin, BUILTIN_ENABLED | STATIC_BUILTIN, test_doc,
     "test [expr]" },
  { "[", test_builtin, BUILTIN_ENABLED | STATIC_BUILTIN, test_bracket_doc,
     "[ arg... ]" },
  { "times", times_builtin, BUILTIN_ENABLED | STATIC_BUILTIN, times_doc,
     "times" },
  { "trap", trap_builtin, BUILTIN_ENABLED | STATIC_BUILTIN | SPECIAL_BUILTIN, trap_doc,
     "trap [arg] [signal_spec]" },
  { "type", type_builtin, BUILTIN_ENABLED | STATIC_BUILTIN, type_doc,
     "type [-all] [-type | -path] [name ...]" },
#if !defined (MINIX)
  { "ulimit", ulimit_builtin, BUILTIN_ENABLED | STATIC_BUILTIN, ulimit_doc,
     "ulimit [-SHacdmstfpnuv [limit]]" },
#endif /* !MINIX */
  { "umask", umask_builtin, BUILTIN_ENABLED | STATIC_BUILTIN, umask_doc,
     "umask [-S] [mode]" },
#if defined (JOB_CONTROL)
  { "wait", wait_builtin, BUILTIN_ENABLED | STATIC_BUILTIN, wait_doc,
     "wait [n]" },
#endif /* JOB_CONTROL */
#if !defined (JOB_CONTROL)
  { "wait", wait_builtin, BUILTIN_ENABLED | STATIC_BUILTIN, wait_doc,
     "wait [n]" },
#endif /* !JOB_CONTROL */
  { "for", (Function *)0x0, BUILTIN_ENABLED | STATIC_BUILTIN, for_doc,
     "for NAME [in WORDS ... ;] do COMMANDS; done" },
  { "case", (Function *)0x0, BUILTIN_ENABLED | STATIC_BUILTIN, case_doc,
     "case WORD in [PATTERN [| PATTERN]...) COMMANDS ;;]... esac" },
  { "if", (Function *)0x0, BUILTIN_ENABLED | STATIC_BUILTIN, if_doc,
     "if COMMANDS; then COMMANDS; [ elif COMMANDS; then COMMANDS; ]... [ else COMMANDS; ] fi" },
  { "while", (Function *)0x0, BUILTIN_ENABLED | STATIC_BUILTIN, while_doc,
     "while COMMANDS; do COMMANDS; done" },
  { "until", (Function *)0x0, BUILTIN_ENABLED | STATIC_BUILTIN, until_doc,
     "until COMMANDS; do COMMANDS; done" },
  { "function", (Function *)0x0, BUILTIN_ENABLED | STATIC_BUILTIN, function_doc,
     "function NAME { COMMANDS ; } or NAME () { COMMANDS ; }" },
  { "{ ... }", (Function *)0x0, BUILTIN_ENABLED | STATIC_BUILTIN, grouping_braces_doc,
     "{ COMMANDS }" },
  { "%", (Function *)0x0, BUILTIN_ENABLED | STATIC_BUILTIN, fg_percent_doc,
     "%[DIGITS | WORD] [&]" },
  { "Variables", (Function *)0x0, BUILTIN_ENABLED | STATIC_BUILTIN, variable_help_doc,
     "Some variable names and meanings" },
  { (char *)0x0, (Function *)0x0, 0, (char **)0x0, (char *)0x0 }
};

int num_shell_builtins =
	sizeof (shell_builtins) / sizeof (struct builtin) - 1;
#if defined (ALIAS)
char *alias_doc[] = {
  "`alias' with no arguments prints the list of aliases in the form",
  "NAME=VALUE on standard output.  An alias is defined for each NAME",
  "whose VALUE is given.  A trailing space in VALUE causes the next",
  "word to be checked for alias substitution.  Alias returns true",
  "unless a NAME is given for which no alias has been defined.",
  (char *)NULL
};
#endif /* ALIAS */
#if defined (ALIAS)
char *unalias_doc[] = {
  "Remove NAMEs from the list of defined aliases.  If the -a option is given,",
  "then remove all alias definitions.",
  (char *)NULL
};
#endif /* ALIAS */
#if defined (READLINE)
char *bind_doc[] = {
  "Bind a key sequence to a Readline function, or to a macro.  The",
  "syntax is equivalent to that found in ~/.inputrc, but must be",
  "passed as a single argument: bind '\"\\C-x\\C-r\": re-read-init-file'.",
  "Arguments we accept:",
  "  -m  keymap         Use `keymap' as the keymap for the duration of this",
  "                     command.  Acceptable keymap names are emacs,",
  "                     emacs-standard, emacs-meta, emacs-ctlx, vi, vi-move,",
  "                     vi-command, and vi-insert.",
  "  -l                 List names of functions.",
  "  -v                 List function names and bindings.",
  "  -d                 Dump functions and bindings such that they",
  "                     can be read back in.",
  "  -f  filename       Read key bindings from FILENAME.",
  "  -q  function-name  Query about which keys invoke the named function.",
  (char *)NULL
};
#endif /* READLINE */
char *break_doc[] = {
  "Exit from within a FOR, WHILE or UNTIL loop.  If N is specified,",
  "break N levels.",
  (char *)NULL
};
char *continue_doc[] = {
  "Resume the next iteration of the enclosing FOR, WHILE or UNTIL loop.",
  "If N is specified, resume at the N-th enclosing loop.",
  (char *)NULL
};
char *builtin_doc[] = {
  "Run a shell builtin.  This is useful when you wish to rename a",
  "shell builtin to be a function, but need the functionality of the",
  "builtin within the function itself.",
  (char *)NULL
};
char *cd_doc[] = {
  "Change the current directory to DIR.  The variable $HOME is the",
  "default DIR.  The variable $CDPATH defines the search path for",
  "the directory containing DIR.  Alternative directory names are",
  "separated by a colon (:).  A null directory name is the same as",
  "the current directory, i.e. `.'.  If DIR begins with a slash (/),",
  "then $CDPATH is not used.  If the directory is not found, and the",
  "shell variable `cdable_vars' exists, then try the word as a variable",
  "name.  If that variable has a value, then cd to the value of that",
  "variable.",
  (char *)NULL
};
char *pwd_doc[] = {
  "Print the current working directory.",
  (char *)NULL
};
#if defined (PUSHD_AND_POPD)
char *pushd_doc[] = {
  "Adds a directory to the top of the directory stack, or rotates",
  "the stack, making the new top of the stack the current working",
  "directory.  With no arguments, exchanges the top two directories.",
  "",
  "+n	Rotates the stack so that the Nth directory (counting",
  "	from the left of the list shown by `dirs') is at the top.",
  "",
  "-n	Rotates the stack so that the Nth directory (counting",
  "	from the right) is at the top.",
  "",
  "dir	adds DIR to the directory stack at the top, making it the",
  "	new current working directory.",
  "",
  "You can see the directory stack with the `dirs' command.",
  (char *)NULL
};
#endif /* PUSHD_AND_POPD */
#if defined (PUSHD_AND_POPD)
char *dirs_doc[] = {
  "Display the list of currently remembered directories.  Directories",
  "find their way onto the list with the `pushd' command; you can get",
  "back up through the list with the `popd' command.",
  "",
  "The -l flag specifies that `dirs' should not print shorthand versions",
  "of directories which are relative to your home directory.  This means",
  "that `~/bin' might be displayed as `/homes/bfox/bin'.",
  (char *)NULL
};
#endif /* PUSHD_AND_POPD */
#if defined (PUSHD_AND_POPD)
char *popd_doc[] = {
  "Removes entries from the directory stack.  With no arguments,",
  "removes the top directory from the stack, and cd's to the new",
  "top directory.",
  "",
  "+n	removes the Nth entry counting from the left of the list",
  "	shown by `dirs', starting with zero.  For example: `popd +0'",
  "	removes the first directory, `popd +1' the second.",
  "",
  "-n	removes the Nth entry counting from the right of the list",
  "	shown by `dirs', starting with zero.  For example: `popd -0'",
  "	removes the last directory, `popd -1' the next to last.",
  "",
  "You can see the directory stack with the `dirs' command.",
  (char *)NULL
};
#endif /* PUSHD_AND_POPD */
char *colon_builtin_doc[] = {
  "No effect; the command does nothing.  A zero exit code is returned.",
  (char *)NULL
};
char *command_doc[] = {
  "Runs COMMAND with ARGS ignoring shell functions.  If you have a shell",
  "function called `ls', and you wish to call the command `ls', you can",
  "say \"command ls\".  If the -p option is given, a default value is used",
  "for PATH that is guaranteed to find all of the standard utilities.  If",
  "the -V or -v option is given, a string is printed describing COMMAND.",
  "The -V option produces a more verbose description.",
  (char *)NULL
};
char *declare_doc[] = {
  "Declare variables and/or give them attributes.  If no NAMEs are",
  "given, then display the values of variables instead.",
  "",
  "The flags are:",
  "",
  "  -f	to select from among function names only,",
  "  -r	to make NAMEs readonly,",
  "  -x	to make NAMEs export,",
  "  -i	to make NAMEs have the `integer' attribute set.",
  "",
  "Variables with the integer attribute have arithmetic evaluation (see",
  "`let') done when the variable is assigned to.",
  "",
  "Using `+' instead of `-' turns off the given attribute instead.  When",
  "used in a function, makes NAMEs local, as with the `local' command.",
  (char *)NULL
};
char *typeset_doc[] = {
  "Obsolete.  See `declare'.",
  (char *)NULL
};
char *local_doc[] = {
  "Create a local variable called NAME, and give it VALUE.  LOCAL",
  "can only be used within a function; it makes the variable NAME",
  "have a visible scope restricted to that function and its children.",
  (char *)NULL
};
#if defined (V9_ECHO)
char *echo_doc[] = {
  "Output the ARGs.  If -n is specified, the trailing newline is",
  "suppressed.  If the -e option is given, interpretation of the",
  "following backslash-escaped characters is turned on:",
  "	\\a	alert (bell)",
  "	\\b	backspace",
  "	\\c	suppress trailing newline",
  "	\\f	form feed",
  "	\\n	new line",
  "	\\r	carriage return",
  "	\\t	horizontal tab",
  "	\\v	vertical tab",
  "	\\\\	backslash",
  "	\\num	the character whose ASCII code is NUM (octal).",
  "",
  "You can explicitly turn off the interpretation of the above characters",
  "with the -E option.",
  (char *)NULL
};
#endif /* V9_ECHO */
#if !defined (V9_ECHO)
char *echo_doc[] = {
  "Output the ARGs.  If -n is specified, the trailing newline is suppressed.",
  (char *)NULL
};
#endif /* !V9_ECHO */
char *enable_doc[] = {
  "Enable and disable builtin shell commands.  This allows",
  "you to use a disk command which has the same name as a shell",
  "builtin.  If -n is used, the NAMEs become disabled.  Otherwise",
  "NAMEs are enabled.  For example, to use the `test' found on your",
  "path instead of the shell builtin version, you type `enable -n test'.",
  (char *)NULL
};
char *eval_doc[] = {
  "Read ARGs as input to the shell and execute the resulting command(s).",
  (char *)NULL
};
#if defined (GETOPTS_BUILTIN)
char *getopts_doc[] = {
  "Getopts is used by shell procedures to parse positional parameters.",
  "",
  "OPTSTRING contains the option letters to be recognized; if a letter",
  "is followed by a colon, the option is expected to have an argument,",
  "which should be separated from it by white space.",
  "",
  "Each time it is invoked, getopts will place the next option in the",
  "shell variable $name, initializing name if it does not exist, and",
  "the index of the next argument to be processed into the shell",
  "variable OPTIND.  OPTIND is initialized to 1 each time the shell or",
  "a shell script is invoked.  When an option requires an argument,",
  "getopts places that argument into the shell variable OPTARG.",
  "",
  "getopts reports errors in one of two ways.  If the first character",
  "of OPTSTRING is a colon, getopts uses silent error reporting.  In",
  "this mode, no error messages are printed.  If an illegal option is",
  "seen, getopts places the option character found into OPTARG.  If a",
  "required argument is not found, getopts places a ':' into NAME and",
  "sets OPTARG to the option character found.  If getopts is not in",
  "silent mode, and an illegal option is seen, getopts places '?' into",
  "NAME and unsets OPTARG.  If a required option is not found, a '?'",
  "is placed in NAME, OPTARG is unset, and a diagnostic message is",
  "printed.",
  "",
  "If the shell variable OPTERR has the value 0, getopts disables the",
  "printing of error messages, even if the first character of",
  "OPTSTRING is not a colon.  OPTERR has the value 1 by default.",
  "",
  "Getopts normally parses the positional parameters ($0 - $9), but if",
  "more arguments are given, they are parsed instead.",
  (char *)NULL
};
#endif /* GETOPTS_BUILTIN */
char *exec_doc[] = {
  "Exec FILE, replacing this shell with the specified program.",
  "If FILE is not specified, the redirections take effect in this",
  "shell.  If the first argument is `-', then place a dash in the",
  "zeroth arg passed to FILE.  If the file cannot be exec'ed and",
  "the shell is not interactive, then the shell exits, unless the",
  "shell variable \"no_exit_on_failed_exec\" exists.",
  (char *)NULL
};
char *exit_doc[] = {
  "Exit the shell with a status of N.  If N is omitted, the exit status",
  "is that of the last command executed.",
  (char *)NULL
};
char *logout_doc[] = {
  "Logout of a login shell.",
  (char *)NULL
};
#if defined (HISTORY)
char *fc_doc[] = {
  "FIRST and LAST can be numbers specifying the range, or FIRST can be a",
  "string, which means the most recent command beginning with that",
  "string.",
  "",
  "   -e ENAME selects which editor to use.  Default is FCEDIT, then EDITOR,",
  "      then the editor which corresponds to the current readline editing",
  "      mode, then vi.",
  "",
  "   -l means list lines instead of editing.",
  "   -n means no line numbers listed.",
  "   -r means reverse the order of the lines (making it newest listed first).",
  "",
  "With the `fc -s [pat=rep ...] [command]' format, the command is",
  "re-executed after the substitution OLD=NEW is performed.",
  "",
  "A useful alias to use with this is r='fc -s', so that typing `r cc'",
  "runs the last command beginning with `cc' and typing `r' re-executes",
  "the last command.",
  (char *)NULL
};
#endif /* HISTORY */
#if defined (JOB_CONTROL)
char *fg_doc[] = {
  "Place JOB_SPEC in the foreground, and make it the current job.  If",
  "JOB_SPEC is not present, the shell's notion of the current job is",
  "used.",
  (char *)NULL
};
#endif /* JOB_CONTROL */
#if defined (JOB_CONTROL)
char *bg_doc[] = {
  "Place JOB_SPEC in the background, as if it had been started with",
  "`&'.  If JOB_SPEC is not present, the shell's notion of the current",
  "job is used.",
  (char *)NULL
};
#endif /* JOB_CONTROL */
char *hash_doc[] = {
  "For each NAME, the full pathname of the command is determined and",
  "remembered.  The -r option causes the shell to forget all remembered",
  "locations.  If no arguments are given, information about remembered",
  "commands is presented.",
  (char *)NULL
};
char *help_doc[] = {
  "Display helpful information about builtin commands.  If PATTERN is",
  "specified, gives detailed help on all commands matching PATTERN,",
  "otherwise a list of the builtins is printed.",
  (char *)NULL
};
#if defined (HISTORY)
char *history_doc[] = {
  "Display the history list with line numbers.  Lines listed with",
  "with a `*' have been modified.  Argument of N says to list only",
  "the last N lines.  Argument `-w' means to write out the current",
  "history file;  `-r' means to read it instead.  Argument `-a' means",
  "to append history lines from this session to the history file.",
  "Argument `-n' means to read all history lines not already read",
  "from the history file.  If FILENAME is given, then use that file,",
  "else if $HISTFILE has a value, use that, else use ~/.bash_history.",
  (char *)NULL
};
#endif /* HISTORY */
#if defined (JOB_CONTROL)
char *jobs_doc[] = {
  "Lists the active jobs.  The -l option lists process id's in addition",
  "to the normal information; the -p option lists process id's only.",
  "If -n is given, only processes that have changed status since the last",
  "notification are printed.  JOBSPEC restricts output to that job.",
  "If -x is given, COMMAND is run after all job specifications that appear",
  "in ARGS have been replaced with the process ID of that job's process group",
  "leader.",
  (char *)NULL
};
#endif /* JOB_CONTROL */
#if defined (JOB_CONTROL)
char *kill_doc[] = {
  "Send the processes named by PID (or JOB) the signal SIGSPEC.  If",
  "SIGSPEC is not present, then SIGTERM is assumed.  An argument of `-l'",
  "lists the signal names; if arguments follow `-l' they are assumed to",
  "be signal numbers for which names should be listed.  Kill is a shell",
  "builtin for two reasons: it allows job IDs to be used instead of",
  "process IDs, and, if you have reached the limit on processes that",
  "you can create, you don't have to start a process to kill another one.",
  (char *)NULL
};
#endif /* JOB_CONTROL */
char *let_doc[] = {
  "Each ARG is an arithmetic expression to be evaluated.  Evaluation",
  "is done in long integers with no check for overflow, though division",
  "by 0 is trapped and flagged as an error.  The following list of",
  "operators is grouped into levels of equal-precedence operators.",
  "The levels are listed in order of decreasing precedence.",
  "",
  "	-		unary minus",
  "	!		logical NOT",
  "	* / %		multiplication, division, remainder",
  "	+ -		addition, subtraction",
  "	<= >= < >	comparison",
  "	== !=		equality inequality",
  "	=		assignment",
  "",
  "Shell variables are allowed as operands.  The name of the variable",
  "is replaced by its value (coerced to a long integer) within",
  "an expression.  The variable need not have its integer attribute",
  "turned on to be used in an expression.",
  "",
  "Operators are evaluated in order of precedence.  Sub-expressions in",
  "parentheses are evaluated first and may override the precedence",
  "rules above.",
  "",
  "If the last ARG evaluates to 0, let returns 1; 0 is returned",
  "otherwise.",
  (char *)NULL
};
char *read_doc[] = {
  "One line is read from the standard input, and the first word is",
  "assigned to the first NAME, the second word to the second NAME, etc.",
  "with leftover words assigned to the last NAME.  Only the characters",
  "found in $IFS are recognized as word delimiters.  The return code is",
  "zero, unless end-of-file is encountered.  If the -r option is given,",
  "this signifies `raw' input, and backslash processing is disabled.",
  (char *)NULL
};
char *return_doc[] = {
  "Causes a function to exit with the return value specified by N.  If N",
  "is omitted, the return status is that of the last command.",
  (char *)NULL
};
char *set_doc[] = {
  "    -a  Mark variables which are modified or created for export.",
  "    -b  Notify of job termination immediately.",
  "    -e  Exit immediately if a command exits with a non-zero status.",
  "    -f  Disable file name generation (globbing).",
  "    -h  Locate and remember function commands as functions are",
  "        defined.  Function commands are normally looked up when",
  "        the function is executed.",
  "    -i  Force the shell to be an \"interactive\" one.  Interactive shells",
  "        always read `~/.bashrc' on startup.",
  "    -k  All keyword arguments are placed in the environment for a",
  "        command, not just those that precede the command name.",
  "    -m  Job control is enabled.",
  "    -n  Read commands but do not execute them.",
  "    -o option-name",
  "        Set the variable corresponding to option-name:",
  "            allexport    same as -a",
  "            braceexpand  the shell will perform brace expansion",
#if defined (READLINE)
  "            emacs        use an emacs-style line editing interface",
#endif /* READLINE */
  "            errexit      same as -e",
  "            histexpand   same as -H",
  "            ignoreeof    the shell will not exit upon reading EOF",
  "            interactive-comments",
  "                         allow comments to appear in interactive commands",
  "            monitor      same as -m",
  "            noclobber    disallow redirection to existing files",
  "            noexec       same as -n",
  "            noglob       same as -f",
  "            nohash       same as -d",
  "            notify       save as -b",
  "            nounset      same as -u",
  "	    physical     same as -P",
  "	    posix        change the behavior of bash where the default",
  "			 operation differs from the 1003.2 standard to",
  "			 match the standard",
  "	    privileged   same as -p",
  "            verbose      same as -v",
#if defined (READLINE)
  "            vi           use a vi-style line editing interface",
#endif /* READLINE */
  "            xtrace       same as -x",
  "    -p  Turned on whenever the real and effective user ids do not match.",
  "        Disables processing of the $ENV file and importing of shell",
  "        functions.  Turning this option off causes the effective uid and",
  "	gid to be set to the real uid and gid.",
  "    -t  Exit after reading and executing one command.",
  "    -u  Treat unset variables as an error when substituting.",
  "    -v  Print shell input lines as they are read.",
  "    -x  Print commands and their arguments as they are executed.",
  "    -l  Save and restore the binding of the NAME in a FOR command.",
  "    -d  Disable the hashing of commands that are looked up for execution.",
  "        Normally, commands are remembered in a hash table, and once",
  "        found, do not have to be looked up again.",
#if defined (BANG_HISTORY)
  "    -H  Enable ! style history substitution.  This flag is on",
  "        by default.",
#endif /* BANG_HISTORY */
  "    -C  If set, disallow existing regular files to be overwritten",
  "        by redirection of output.",
  "    -P  If set, do not follow symbolic links when executing commands",
  "        such as cd which change the current directory.",
  "",
  "Using + rather than - causes these flags to be turned off.  The",
  "flags can also be used upon invocation of the shell.  The current",
  "set of flags may be found in $-.  The remaining n ARGs are positional",
  "parameters and are assigned, in order, to $1, $2, .. $n.  If no",
  "ARGs are given, all shell variables are printed.",
  (char *)NULL
};
char *unset_doc[] = {
  "For each NAME, remove the corresponding variable or function.  Given",
  "the `-v', unset will only act on variables.  Given the `-f' flag,",
  "unset will only act on functions.  With neither flag, unset first",
  "tries to unset a variable, and if that fails, then tries to unset a",
  "function.  Some variables (such as PATH and IFS) cannot be unset; also",
  "see readonly.",
  (char *)NULL
};
char *export_doc[] = {
  "NAMEs are marked for automatic export to the environment of",
  "subsequently executed commands.  If the -f option is given,",
  "the NAMEs refer to functions.  If no NAMEs are given, or if `-p'",
  "is given, a list of all names that are exported in this shell is",
  "printed.  An argument of `-n' says to remove the export property",
  "from subsequent NAMEs.  An argument of `--' disables further option",
  "processing.",
  (char *)NULL
};
char *readonly_doc[] = {
  "The given NAMEs are marked readonly and the values of these NAMEs may",
  "not be changed by subsequent assignment.  If the -f option is given,",
  "then functions corresponding to the NAMEs are so marked.  If no",
  "arguments are given, or if `-p' is given, a list of all readonly names",
  "is printed.  An argument of `-n' says to remove the readonly property",
  "from subsequent NAMEs.  An argument of `--' disables further option",
  "processing.",
  (char *)NULL
};
char *shift_doc[] = {
  "The positional parameters from $N+1 ... are renamed to $1 ...  If N is",
  "not given, it is assumed to be 1.",
  (char *)NULL
};
char *source_doc[] = {
  "Read and execute commands from FILENAME and return.  The pathnames",
  "in $PATH are used to find the directory containing FILENAME.",
  (char *)NULL
};
char *dot_doc[] = {
  "Read and execute commands from FILENAME and return.  The pathnames",
  "in $PATH are used to find the directory containing FILENAME.",
  (char *)NULL
};
#if defined (JOB_CONTROL)
char *suspend_doc[] = {
  "Suspend the execution of this shell until it receives a SIGCONT",
  "signal.  The `-f' if specified says not to complain about this",
  "being a login shell if it is; just suspend anyway.",
  (char *)NULL
};
#endif /* JOB_CONTROL */
char *test_doc[] = {
  "Exits with a status of 0 (trueness) or 1 (falseness) depending on",
  "the evaluation of EXPR.  Expressions may be unary or binary.  Unary",
  "expressions are often used to examine the status of a file.  There",
  "are string operators as well, and numeric comparison operators.",
  "",
  "File operators:",
  "",
  "    -b FILE        True if file is block special.",
  "    -c FILE        True if file is character special.",
  "    -d FILE        True if file is a directory.",
  "    -e FILE        True if file exists.",
  "    -f FILE        True if file exists and is a regular file.",
  "    -g FILE        True if file is set-group-id.",
  "    -h FILE        True if file is a symbolic link.  Use \"-L\".",
  "    -L FILE        True if file is a symbolic link.",
  "    -k FILE        True if file has its \"sticky\" bit set.",
  "    -p FILE        True if file is a named pipe.",
  "    -r FILE        True if file is readable by you.",
  "    -s FILE        True if file is not empty.",
  "    -S FILE        True if file is a socket.",
  "    -t FD          True if FD is opened on a terminal.",
  "    -u FILE        True if the file is set-user-id.",
  "    -w FILE        True if the file is writable by you.",
  "    -x FILE        True if the file is executable by you.",
  "    -O FILE        True if the file is effectively owned by you.",
  "    -G FILE        True if the file is effectively owned by your group.",
  "",
  "  FILE1 -nt FILE2  True if file1 is newer than (according to",
  "                   modification date) file2.",
  "",
  "  FILE1 -ot FILE2  True if file1 is older than file2.",
  "",
  "  FILE1 -ef FILE2  True if file1 is a hard link to file2.",
  "",
  "String operators:",
  "",
  "    -z STRING      True if string is empty.",
  "",
  "    -n STRING",
  " or STRING         True if string is not empty.",
  "",
  "    STRING1 = STRING2",
  "                   True if the strings are equal.",
  "    STRING1 != STRING2",
  "                   True if the strings are not equal.",
  "",
  "Other operators:",
  "",
  "    ! EXPR         True if expr is false.",
  "    EXPR1 -a EXPR2 True if both expr1 AND expr2 are true.",
  "    EXPR1 -o EXPR2 True if either expr1 OR expr2 is true.",
  "",
  "    arg1 OP arg2   Arithmetic tests.  OP is one of -eq, -ne,",
  "                   -lt, -le, -gt, or -ge.",
  "",
  "Arithmetic binary operators return true if ARG1 is equal, not-equal,",
  "less-than, less-than-or-equal, greater-than, or greater-than-or-equal",
  "than ARG2.",
  (char *)NULL
};
char *test_bracket_doc[] = {
  "This is a synonym for the \"test\" shell builtin, excepting that the",
  "last argument must be literally `]', to match the `[' which invoked",
  "the test.",
  (char *)NULL
};
char *times_doc[] = {
  "Print the accumulated user and system times for processes run from",
  "the shell.",
  (char *)NULL
};
char *trap_doc[] = {
  "The command ARG is to be read and executed when the shell receives",
  "signal(s) SIGNAL_SPEC.  If ARG is absent all specified signals are",
  "reset to their original values.  If ARG is the null string this",
  "signal is ignored by the shell and by the commands it invokes.  If",
  "SIGNAL_SPEC is EXIT (0) the command ARG is executed on exit from",
  "the shell.  The trap command with no arguments prints the list of",
  "commands associated with each signal number.  SIGNAL_SPEC is either",
  "a signal name in <signal.h>, or a signal number.  The syntax `trap -l'",
  "prints a list of signal names and their corresponding numbers.",
  "Note that a signal can be sent to the shell with \"kill -signal $$\".",
  (char *)NULL
};
char *type_doc[] = {
  "For each NAME, indicate how it would be interpreted if used as a",
  "command name.",
  "",
  "If the -type flag is used, returns a single word which is one of",
  "`alias', `keyword', `function', `builtin', `file' or `', if NAME is an",
  "alias, shell reserved word, shell function, shell builtin, disk file,",
  "or unfound, respectively.",
  "",
  "If the -path flag is used, either returns the name of the disk file",
  "that would be exec'ed, or nothing if -type wouldn't return `file'.",
  "",
  "If the -all flag is used, displays all of the places that contain an",
  "executable named `file'.  This includes aliases and functions, if and",
  "only if the -path flag is not also used.",
  (char *)NULL
};
#if !defined (MINIX)
char *ulimit_doc[] = {
  "Ulimit provides control over the resources available to processes",
  "started by the shell, on systems that allow such control.  If an",
  "option is given, it is interpreted as follows:",
  "",
  "    -S	use the `soft' resource limit",
  "    -H	use the `hard' resource limit",
  "    -a	all current limits are reported",
  "    -c	the maximum size of core files created",
  "    -d	the maximum size of a process's data segment",
  "    -m	the maximum resident set size",
  "    -s	the maximum stack size",
  "    -t	the maximum amount of cpu time in seconds",
  "    -f	the maximum size of files created by the shell",
  "    -p	the pipe buffer size",
  "    -n	the maximum number of open file descriptors",
  "    -u	the maximum number of user processes",
  "    -v	the size of virtual memory",
  "",
  "If LIMIT is given, it is the new value of the specified resource.",
  "Otherwise, the current value of the specified resource is printed.",
  "If no option is given, then -f is assumed.  Values are in 1k",
  "increments, except for -t, which is in seconds, -p, which is in",
  "increments of 512 bytes, and -u, which is an unscaled number of",
  "processes.",
  (char *)NULL
};
#endif /* !MINIX */
char *umask_doc[] = {
  "The user file-creation mask is set to MODE.  If MODE is omitted, or if",
  "`-S' is supplied, the current value of the mask is printed.  The `-S'",
  "option makes the output symbolic; otherwise an octal number is output.",
  "If MODE begins with a digit, it is interpreted as an octal number,",
  "otherwise it is a symbolic mode string like that accepted by chmod(1).",
  (char *)NULL
};
#if defined (JOB_CONTROL)
char *wait_doc[] = {
  "Wait for the specified process and report its termination status.  If",
  "N is not given, all currently active child processes are waited for,",
  "and the return code is zero.  N may be a process ID or a job",
  "specification; if a job spec is given, all processes in the job's",
  "pipeline are waited for.",
  (char *)NULL
};
#endif /* JOB_CONTROL */
#if !defined (JOB_CONTROL)
char *wait_doc[] = {
  "Wait for the specified process and report its termination status.  If",
  "N is not given, all currently active child processes are waited for,",
  "and the return code is zero.  N is a process ID; if it is not given,",
  "all child processes of the shell are waited for.",
  (char *)NULL
};
#endif /* !JOB_CONTROL */
char *for_doc[] = {
  "The `for' loop executes a sequence of commands for each member in a",
  "list of items.  If `in WORDS ...;' is not present, then `in \"$@\"' is",
  "assumed.  For each element in WORDS, NAME is set to that element, and",
  "the COMMANDS are executed.",
  (char *)NULL
};
char *case_doc[] = {
  "Selectively execute COMMANDS based upon WORD matching PATTERN.  The",
  "`|' is used to separate multiple patterns.",
  (char *)NULL
};
char *if_doc[] = {
  "The if COMMANDS are executed.  If the exit status is zero, then the then",
  "COMMANDS are executed.  Otherwise, each of the elif COMMANDS are executed",
  "in turn, and if the exit status is zero, the corresponding then COMMANDS",
  "are executed and the if command completes.  Otherwise, the else COMMANDS",
  "are executed, if present.  The exit status is the exit status of the last",
  "command executed, or zero if no condition tested true.",
  (char *)NULL
};
char *while_doc[] = {
  "Expand and execute COMMANDS as long as the final command in the",
  "`while' COMMANDS has an exit status of zero.",
  (char *)NULL
};
char *until_doc[] = {
  "Expand and execute COMMANDS as long as the final command in the",
  "`until' COMMANDS has an exit status which is not zero.",
  (char *)NULL
};
char *function_doc[] = {
  "Create a simple command invoked by NAME which runs COMMANDS.",
  "Arguments on the command line along with NAME are passed to the",
  "function as $0 .. $n.",
  (char *)NULL
};
char *grouping_braces_doc[] = {
  "Run a set of commands in a group.  This is one way to redirect an",
  "entire set of commands.",
  (char *)NULL
};
char *fg_percent_doc[] = {
  "This is similar to the `fg' command.  Resume a stopped or background",
  "job.  If you specifiy DIGITS, then that job is used.  If you specify",
  "WORD, then the job whose name begins with WORD is used.  Following the",
  "job specification with a `&' places the job in the background.",
  (char *)NULL
};
char *variable_help_doc[] = {
  "BASH_VERSION    The version numbers of this Bash.",
  "CDPATH          A colon separated list of directories to search",
  "		when the argument to `cd' is not found in the current",
  "		directory.",
#if defined (HISTORY)
  "HISTFILE        The name of the file where your command history is stored.",
  "HISTFILESIZE    The maximum number of lines this file can contain.",
  "HISTSIZE        The maximum number of history lines that a running",
  "		shell can access.",
#endif /* HISTORY */
  "HOME            The complete pathname to your login directory.",
  "HOSTTYPE        The type of CPU this version of Bash is running under.",
  "IGNOREEOF       Controls the action of the shell on receipt of an EOF",
  "		character as the sole input.  If set, then the value",
  "		of it is the number of EOF characters that can be seen",
  "		in a row on an empty line before the shell will exit",
  "		(default 10).  When unset, EOF signifies the end of input.",
  "MAILCHECK	How often, in seconds, Bash checks for new mail.",
  "MAILPATH	A colon-separated list of filenames which Bash checks",
  "		for new mail.",
  "PATH            A colon-separated list of directories to search when",
  "		looking for commands.",
  "PROMPT_COMMAND  A command to be executed before the printing of each",
  "		primary prompt.",
  "PS1             The primary prompt string.",
  "PS2             The secondary prompt string.",
  "TERM            The name of the current terminal type.",
  "auto_resume     Non-null means a command word appearing on a line by",
  "		itself is first looked for in the list of currently",
  "		stopped jobs.  If found there, that job is foregrounded.",
  "		A value of `exact' means that the command word must",
  "		exactly match a command in the list of stopped jobs.  A",
  "		value of `substring' means that the command word must",
  "		match a substring of the job.  Any other value means that",
  "		the command must be a prefix of a stopped job.",
#if defined (HISTORY)
  "command_oriented_history",
  "                Non-null means to save multiple-line commands together on",
  "                a single history line.",
#  if defined (BANG_HISTORY)
  "histchars       Characters controlling history expansion and quick",
  "		substitution.  The first character is the history",
  "		substitution character, usually `!'.  The second is",
  "		the `quick substitution' character, usually `^'.  The",
  "		third is the `history comment' character, usually `#'.",
#  endif /* BANG_HISTORY */
  "HISTCONTROL	Set to a value of `ignorespace', it means don't enter",
  "		lines which begin with a space or tab on the history",
  "		list.  Set to a value of `ignoredups', it means don't",
  "		enter lines which match the last entered line.  Set to",
  "		`ignoreboth' means to combine the two options.  Unset,",
  "		or set to any other value than those above means to save",
  "		all lines on the history list.",
#endif /* HISTORY */
#if defined (JOB_CONTROL)
  "notify          Notify of job termination immediately.",
#endif
  (char *)NULL
};
