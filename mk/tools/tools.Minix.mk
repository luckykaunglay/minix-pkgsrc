# $NetBSD: tools.Linux.mk,v 1.47 2010/02/13 08:30:59 obache Exp $
#
# System-supplied tools for the Minix operating system.

#TODO: Cover these in .if exists(checks)
TOOLS_PLATFORM.[?=		/bin/[
TOOLS_PLATFORM.awk?=		/usr/bin/awk
TOOLS_PLATFORM.basename?=	/usr/bin/basename
TOOLS_PLATFORM.bzcat?=		/usr/bin/bzcat
TOOLS_PLATFORM.cat?=		/bin/cat
TOOLS_PLATFORM.bzip2?=		/usr/bin/bzip2
TOOLS_PLATFORM.chgrp?=		/usr/bin/chgrp
TOOLS_PLATFORM.chmod?=		/usr/bin/chmod
TOOLS_PLATFORM.chown?=		/usr/sbin/chown
TOOLS_PLATFORM.cmp?=		/usr/bin/cmp
TOOLS_PLATFORM.cp?=		/bin/cp
TOOLS_PLATFORM.cut?=		/usr/bin/cut
TOOLS_PLATFORM.date?=		/bin/date
TOOLS_PLATFORM.diff?=		/usr/bin/diff
TOOLS_PLATFORM.dirname?=	/usr/bin/dirname
TOOLS_PLATFORM.echo?=		/bin/echo
TOOLS_PLATFORM.env?=		/usr/bin/env
TOOLS_PLATFORM.expr?=		/bin/expr
TOOLS_PLATFORM.false?=		/bin/false
TOOLS_PLATFORM.file?=		/usr/bin/file
TOOLS_PLATFORM.find?=		/usr/bin/find
TOOLS_PLATFORM.head?=		/usr/bin/head
TOOLS_PLATFORM.id?=		/usr/bin/id
TOOLS_PLATFORM.install?=	/bin/install
TOOLS_PLATFORM.ln?=		/bin/ln
TOOLS_PLATFORM.ls?=		/bin/ls
TOOLS_PLATFORM.m4?=		/usr/bin/m4
TOOLS_PLATFORM.mail?=		/usr/bin/mail
TOOLS_PLATFORM.mkdir?=		/usr/bin/mkdir -p
TOOLS_PLATFORM.mv?=		/bin/mv
TOOLS_PLATFORM.nice?=		/usr/bin/nice
TOOLS_PLATFORM.nroff?=		/usr/bin/nroff
TOOLS_PLATFORM.pwd?=		/bin/pwd
TOOLS_PLATFORM.rm?=		/bin/rm
TOOLS_PLATFORM.rmdir?=		/bin/rmdir
TOOLS_PLATFORM.sed?=	/usr/bin/sed
TOOLS_PLATFORM.sh?=		/bin/sh
TOOLS_PLATFORM.sleep?=		/usr/bin/sleep
TOOLS_PLATFORM.sort?=		/usr/bsd/bin/sort
TOOLS_PLATFORM.strip?=		/usr/bin/strip
TOOLS_PLATFORM.tail?=		/usr/bin/tail
TOOLS_PLATFORM.tar?=		/usr/bin/tar
TOOLS_PLATFORM.tee?=		/usr/bin/tee
TOOLS_PLATFORM.test?=		/bin/test
TOOLS_PLATFORM.tr?=		/usr/bin/tr
TOOLS_PLATFORM.true?=		/bin/true
TOOLS_PLATFORM.tsort?=		/usr/bin/tsort
TOOLS_PLATFORM.wc?=		/usr/bin/wc
TOOLS_PLATFORM.xargs?=		/usr/bin/xargs
TOOLS_PLATFORM.yacc?=		/usr/bin/yacc

TOOLS_PLATFORM.printf?=		/usr/bsd/bin/printf
TOOLS_PLATFORM.touch?=		/usr/bsd/bin/touch #XXX Use Minix touch 
TOOLS_PLATFORM.hostname?= /usr/bsd/bin/hostname

#TOOLS_PLATFORM.patch?=		/usr/gnu/bin/patch
TOOLS_PLATFORM.gzcat?=		/usr/local/bin/zcat
TOOLS_PLATFORM.grep?=		/usr/local/bin/grep
TOOLS_PLATFORM.egrep?=		/usr/local/bin/egrep
TOOLS_PLATFORM.fgrep?=		/usr/local/bin/fgrep

TOOLS_PLATFORM.ar?=	/usr/gnu/bin/gar
TOOLS_PLATFORM.bash?=		/usr/local/bin/bash
TOOLS_PLATFORM.bison?=		/usr/local/bin/bison
TOOLS_PLATFORM.bison-yacc?=	/usr/local/bin/bison -y
TOOLS_PLATFORM.gawk?=		/usr/local/bin/awk
TOOLS_PLATFORM.gm4?=		/usr/gnu/bin/m4
TOOLS_PLATFORM.gmake?=		/usr/local/bin/gmake
TOOLS_PLATFORM.groff?=		/usr/local/bin/groff
TOOLS_PLATFORM.gsed?=		/usr/local/bin/sed
TOOLS_PLATFORM.gtar?=		/usr/gnu/bin/tar
TOOLS_PLATFORM.gunzip?=		/usr/local/bin/gunzip -f
TOOLS_PLATFORM.gzip?=		/usr/local/bin/gzip -nf ${GZIP}


# TOOLS_PLATFORM.ident?=
# TOOLS_PLATFORM.install-info?=
# TOOLS_PLATFORM.ldconfig?=
# TOOLS_PLATFORM.makeinfo?=
# TOOLS_PLATFORM.mktemp?=
# TOOLS_PLATFORM.openssl?=
# TOOLS_PLATFORM.sdiff?=
# TOOLS_PLATFORM.soelim?=
# TOOLS_PLATFORM.tbl?=
# TOOLS_PLATFORM.xgettext?=
# TOOLS_PLATFORM.csh?=
# TOOLS_PLATFORM.diff3?=
# TOOLS_PLATFORM.msgfmt?=
# TOOLS_PLATFORM.gsoelim?=
