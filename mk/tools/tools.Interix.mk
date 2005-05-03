# $NetBSD: tools.Interix.mk,v 1.5 2005/05/03 16:30:34 jlam Exp $
#
# System-supplied tools for the Interix operating system.

TOOLS_PLATFORM.[?=		/bin/[
TOOLS_PLATFORM.awk?=		/usr/contrib/bin/awk
TOOLS_PLATFORM.basename?=	/bin/basename
TOOLS_PLATFORM.cat?=		/bin/cat
TOOLS_PLATFORM.chgrp?=		/bin/chgrp
TOOLS_PLATFORM.chmod?=		/bin/chmod
TOOLS_PLATFORM.chown?=		/bin/chown
TOOLS_PLATFORM.cmp?=		/bin/cmp
TOOLS_PLATFORM.cp?=		/bin/cp
TOOLS_PLATFORM.cut?=		/bin/cut
TOOLS_PLATFORM.date?=		/bin/date
TOOLS_PLATFORM.dirname?=	/bin/dirname
TOOLS_PLATFORM.echo?=		echo			# shell builtin
TOOLS_PLATFORM.egrep?=		/bin/egrep
TOOLS_PLATFORM.env?=		/bin/env
TOOLS_PLATFORM.expr?=		/bin/expr
TOOLS_PLATFORM.false?=		false			# shell builtin
TOOLS_PLATFORM.fgrep?=		/bin/fgrep
TOOLS_PLATFORM.file?=		/bin/file
TOOLS_PLATFORM.find?=		/bin/find
TOOLS_PLATFORM.grep?=		/bin/grep
TOOLS_PLATFORM.gunzip?=		/usr/contrib/bin/gunzip -f
TOOLS_PLATFORM.gzcat?=		/usr/contrib/bin/gunzip -c
TOOLS_PLATFORM.gzip?=		/usr/contrib/bin/gzip -nf ${GZIP}
TOOLS_PLATFORM.head?=		/bin/head
TOOLS_PLATFORM.hostname?=	/bin/hostname
TOOLS_PLATFORM.id?=		/bin/id
TOOLS_PLATFORM.install?=	/bin/install
TOOLS_PLATFORM.ldconfig?=	/bin/true
TOOLS_PLATFORM.ln?=		/bin/ln
TOOLS_PLATFORM.ls?=		/bin/ls
TOOLS_PLATFORM.m4?=		/bin/m4
TOOLS_PLATFORM.mail?=		/bin/mail
TOOLS_PLATFORM.mkdir?=		/bin/mkdir -p
TOOLS_PLATFORM.mv?=		/bin/mv
TOOLS_PLATFORM.nice?=		/bin/nice
TOOLS_PLATFORM.pwd?=		/bin/pwd
TOOLS_PLATFORM.rm?=		/bin/rm
TOOLS_PLATFORM.rmdir?=		/bin/rmdir
TOOLS_PLATFORM.sh?=		/bin/sh
TOOLS_PLATFORM.sort?=		/bin/sort
TOOLS_PLATFORM.tail?=		/bin/tail
TOOLS_PLATFORM.tee?=		/bin/tee
TOOLS_PLATFORM.test?=		/bin/test
TOOLS_PLATFORM.touch?=		/bin/touch
TOOLS_PLATFORM.tr?=		/bin/tr
TOOLS_PLATFORM.true?=		true			# shell builtin
TOOLS_PLATFORM.tsort?=		/bin/tsort
TOOLS_PLATFORM.wc?=		/bin/wc
TOOLS_PLATFORM.xargs?=		/bin/xargs
