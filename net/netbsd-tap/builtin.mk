# $NetBSD$

.if !defined(IS_BUILTIN.netbsd-tap)
. if exists(/usr/include/net/if_tap.h)
IS_BUILTIN.netbsd-tap=		YES
. else
IS_BUILTIN.netbsd-tap=		NO
.endif # IS_BUILTIN.netbsd-tap

USE_BUILTIN.netbsd-tap?=	${IS_BUILTIN.netbsd-tap}
