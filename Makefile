# dwm_time - display current time is dwm's status area 
# See LICENSE file for copyright and license details.

include config.mk

SRC = dwm_time.c
OBJ = ${SRC:.c=.o}

all: options dwm_time

options:
	@echo dwm_time build options:
	@echo "CFLAGS   = ${CFLAGS}"
	@echo "LDFLAGS  = ${LDFLAGS}"
	@echo "CC       = ${CC}"
	@echo

config.h:
	cp config.def.h config.h

.c.o:
	@echo CC $<
	@${CC} -c ${CFLAGS} $<

${OBJ}: config.h config.mk

dwm_time: ${OBJ}
	@echo CC -o $@
	@${CC} -o $@ ${OBJ} ${LDFLAGS}

clean:
	@echo Cleaning
	@rm -f dwm_time ${OBJ}

install: all
	@echo Installing executable file to ${DESTDIR}${PREFIX}/bin
	@mkdir -p ${DESTDIR}${PREFIX}/bin
	@cp -f dwm_time ${DESTDIR}${PREFIX}/bin
	@chmod 755 ${DESTDIR}${PREFIX}/bin/dwm_time
	@echo Installing manual page to ${DESTDIR}${MANPREFIX}/man1
	@mkdir -p ${DESTDIR}${MANPREFIX}/man1
	@sed "s/VERSION/${VERSION}/g" < dwm_time.1 > ${DESTDIR}${MANPREFIX}/man1/dwm_time.1
	@chmod 644 ${DESTDIR}${MANPREFIX}/man1/dwm_time.1

uninstall:
	@echo Removing executable file from ${DESTDIR}${PREFIX}/bin
	@rm -f ${DESTDIR}${PREFIX}/bin/dwm_time
	@echo Removing manual page from ${DESTDIR}${MANPREFIX}/man1
	@rm -f ${DESTDIR}${MANPREFIX}/man1/dwm_time.1

.PHONY: all options clean install uninstall
