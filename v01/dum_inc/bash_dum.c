/* dummy functions that we need to write eventually */

/* from lib/readline/complete.c */
char *filename_completion_function ()
{
	return 0 ;
}

int gethostname(char *name, int len)
{
	if (name && len) *name = 0 ;
	return -1 ;
}
