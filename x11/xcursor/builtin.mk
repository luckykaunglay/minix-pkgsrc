# $NetBSD$

_X11_XCURSOR_XCURSOR_H=	${X11BASE}/include/X11/Xcursor/Xcursor.h

.if !defined(IS_BUILTIN.xcursor)
IS_BUILTIN.xcursor=	no
.  if exists(${_X11_XCURSOR_XCURSOR_H})
IS_BUILTIN.xcursor=	yes
#
# Create an appropriate package name for the built-in Xcursor distributed
# with the system.  This package name can be used to check against
# BUILDLINK_DEPENDS.<pkg> to see if we need to install the pkgsrc version
# or if the built-in one is sufficient.
#
_XCURSOR_MAJOR!=	\
	${AWK} '/\#define[ 	]*XCURSOR_MAJOR/ { print $$3 }'		\
		${_X11_XCURSOR_XCURSOR_H}
_XCURSOR_MINOR!=	\
	${AWK} '/\#define[ 	]*XCURSOR_MINOR/ { print "."$$3 }'	\
		${_X11_XCURSOR_XCURSOR_H}
_XCURSOR_REVISION!=	\
	${AWK} '/\#define[ 	]*XCURSOR_MINOR/ { print "."$$3 }'	\
		${_X11_XCURSOR_XCURSOR_H}
_XCURSOR_VERSION=	${_XCURSOR_MAJOR}${_XCURSOR_MINOR}${_XCURSOR_REVISION}
BUILTIN_PKG.xcursor=	xcursor-${_XCURSOR_VERSION}
MAKEFLAGS+=		BUILTIN_PKG.xcursor=${BUILTIN_PKG.xcursor}
.  endif
MAKEFLAGS+=	IS_BUILTIN.xcursor=${IS_BUILTIN.xcursor}
.endif

CHECK_BUILTIN.xcursor?=	no
.if !empty(CHECK_BUILTIN.xcursor:M[yY][eE][sS])
USE_BUILTIN.xcursor=	yes
.endif

.if !defined(USE_BUILTIN.xcursor)
USE_BUILTIN.xcursor?=	${IS_BUILTIN.xcursor}

.  if defined(BUILTIN_PKG.xcursor)
USE_BUILTIN.xcursor=	yes
.    for _depend_ in ${BUILDLINK_DEPENDS.xcursor}
.      if !empty(USE_BUILTIN.xcursor:M[yY][eE][sS])
USE_BUILTIN.xcursor!=	\
	if ${PKG_ADMIN} pmatch '${_depend_}' ${BUILTIN_PKG.xcursor}; then \
		${ECHO} "yes";						\
	else								\
		${ECHO} "no";						\
	fi
.      endif
.    endfor
.  endif
.endif	# USE_BUILTIN.xcursor

.if !empty(USE_BUILTIN.xcursor:M[nN][oO])
BUILDLINK_DEPENDS.xcursor+=	xcursor>=1.1.1
BUILDLINK_DEPENDS.Xrender+=	Xrender>=0.8
.  for _mkfile_ in buildlink3.mk builtin.mk
.    if exists(../../x11/Xfixes/${_mkfile_})
.      include "../../x11/Xfixes/${_mkfile_}"
.    endif
.  endfor
.endif

.if !empty(USE_BUILTIN.xcursor:M[yY][eE][sS])
BUILDLINK_PREFIX.xcursor=	${X11BASE}
BUILDLINK_FILES.xcursor+=	lib/pkgconfig/xcursor.pc
USE_BUILTIN.Xrender=		yes
.endif
