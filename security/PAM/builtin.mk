# $NetBSD$

.if !defined(IS_BUILTIN.pam)
IS_BUILTIN.pam=	no
.  if exists(/usr/include/security/pam_appl.h)
IS_BUILTIN.pam=	yes
.  endif
.endif

CHECK_BUILTIN.pam?=	no
.if !empty(CHECK_BUILTIN.pam:M[yY][eE][sS])
USE_BUILTIN.pam=	yes
.endif

USE_BUILTIN.pam?=	${IS_BUILTIN.pam}
