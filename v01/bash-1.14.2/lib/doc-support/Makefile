GETOPT = ${topdir}/builtins/getopt.o
OBJECTS = texindex.o $(GETOPT)
SOURCES = texindex.c

LDFLAGS = -g

srcdir = .
VPATH = .:$(srcdir)

.c.o:
	rm -f $@
	$(CC) $(CFLAGS) -c $<

all: texindex

texindex: texindex.o
	$(CC) $(LDFLAGS) -o $@ $(OBJECTS) $(LIBS)
