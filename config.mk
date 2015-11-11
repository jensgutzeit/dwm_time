# dwm_time version
VERSION = 0.1

# Customize below to fit your system

# paths
PREFIX = /usr/local
MANPREFIX = ${PREFIX}/share/man

X11INC = /usr/X11R6/include
X11LIB = /usr/X11R6/lib

# includes and libs
INCS = -I. -I/usr/include -I${X11INC}
LIBS = -L/usr/lib -lc -L${X11LIB} -lX11

# flags
CPPFLAGS = -DVERSION=\"${VERSION}\" -D_XOPEN_SOURCE=600
CFLAGS += -std=c11 -pedantic -Wall -Wextra -Wvariadic-macros -Os ${INCS} ${CPPFLAGS} \
			 -D_DEFAULT_SOURCE
LDFLAGS += ${LIBS}

# compiler and linker
# CC = cc

