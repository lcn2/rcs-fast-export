#!/usr/bin/env make
#
# rcs-fast-export - RCS fast export
#
# This code was cloned from from:
#
#     https://github.com/MichaelEischer/rcs-fast-export
#
# which in turn was cloned from:
#
#     https://github.com/Oblomov/rcs-fast-export
#
# with PR mods from:
#
#     https://github.com/Oblomov/rcs-fast-export/pull/8
#     https://github.com/Oblomov/rcs-fast-export/pull/10
#
# plus this Makefile and .gitignore from:
#
#     https://github.com/lcn2/rcs-fast-export
#
# See also the rcs2git(1) tool from:
#
#     https://github.com/lcn2/gitutil/blob/master/rcs2git

SHELL= bash
RM= rm
CP= cp
CHMOD= chmod

TOPNAME= cmd
INSTALL= install

DESTDIR= /usr/local/bin

TARGETS= rcs-fast-export

all: ${TARGETS}

rcs-fast-export: rcs-fast-export.rb
	${CP} -f rcs-fast-export.rb $@
	${CHMOD} 0555 $@

configure:

clean quick_clean quick_distclean distclean:

clobber quick_clobber: clean
	${RM} -f ${TARGETS}

install: all
	${INSTALL} -d 0655 ${DESTDIR}
	${INSTALL} -m 0555 ${TARGETS} ${DESTDIR}
