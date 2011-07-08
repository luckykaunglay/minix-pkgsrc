# $NetBSD: builtin.mk,v 1.1 2008/10/12 20:49:19 ahoka Exp $

BUILTIN_PKG:=	mpfr

PKGCONFIG_FILE.mpfr=	/usr/include/mpfr.h
PKGCONFIG_BASE.mpfr=	/usr

BUILTIN_VERSION_SCRIPT.mpfr= ${AWK} \
	'/\#define[ \t]*MPFR_VERSION_STRING[ \t]/ { \
	v = substr($$3, 2, length($$3)-2); } \
	END { print gensub("-p",".",0,v); }'

.include "../../mk/buildlink3/pkgconfig-builtin.mk"
