# $NetBSD: builtin.mk,v 1.1 2008/10/12 20:49:19 ahoka Exp $

BUILTIN_PKG:=	gmp

PKGCONFIG_FILE.gmp=	/usr/include/gmp.h
PKGCONFIG_BASE.gmp=	/usr

BUILTIN_VERSION_SCRIPT.gmp= ${AWK} \
	'/\#define[ \t]*__GNU_MP_VERSION[ \t]/ { major = $$3; } \
	/\#define[ \t]*__GNU_MP_VERSION_MINOR[ \t]/ { minor = $$3; } \
	/\#define[ \t]*__GNU_MP_VERSION_PATCHLEVEL[ \t]/ { patch = $$3; } \
	END { if (major!="" && minor!="" && patch!="") \
	print major "." minor "." patch; else print ""; }'

.include "../../mk/buildlink3/pkgconfig-builtin.mk"
