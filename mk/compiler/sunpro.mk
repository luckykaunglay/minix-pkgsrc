# $NetBSD: sunpro.mk,v 1.36 2006/12/15 12:46:24 martti Exp $
#
# This is the compiler definition for the SUNWspro C compiler.
#
# User-settable variables:
#
# SUNWSPROBASE
#	The base directory where the compiler is installed.
#

.if !defined(COMPILER_SUNPRO_MK)
COMPILER_SUNPRO_MK=	defined

.include "../../mk/bsd.prefs.mk"

SUNWSPROBASE?=	/opt/SUNWspro

# LANGUAGES.<compiler> is the list of supported languages by the
# compiler.
#
LANGUAGES.sunpro=	# empty

_SUNPRO_DIR=		${WRKDIR}/.sunpro
_SUNPRO_VARS=		# empty
.if exists(${SUNWSPROBASE}/bin/cc)
LANGUAGES.sunpro+=	c
_SUNPRO_VARS+=		CC
_SUNPRO_CC=		${_SUNPRO_DIR}/bin/cc
_ALIASES.CC=		cc gcc
CCPATH=			${SUNWSPROBASE}/bin/cc
PKG_CC:=		${_SUNPRO_CC}
.endif
.if exists(${SUNWSPROBASE}/bin/CC)
LANGUAGES.sunpro+=	c++
_SUNPRO_VARS+=		CXX
_SUNPRO_CXX=		${_SUNPRO_DIR}/bin/CC
_ALIASES.CXX=		CC c++ g++
CXXPATH=		${SUNWSPROBASE}/bin/CC
PKG_CXX:=		${_SUNPRO_CXX}
.endif
.if exists(${SUNWSPROBASE}/bin/f77)
LANGUAGES.sunpro+=	fortran
_SUNPRO_VARS+=		FC
_SUNPRO_FC=		${_SUNPRO_DIR}/bin/f77
_ALIASES.FC=		f77 g77
FCPATH=			${SUNWSPROBASE}/bin/f77
PKG_FC:=		${_SUNPRO_FC}
.endif
_COMPILER_STRIP_VARS+=	${_SUNPRO_VARS}

# The Solaris linker uses "-R" for rpath directives.
_LINKER_RPATH_FLAG=	-R

# SunPro passes rpath directives to the linker using "-R", however
# some packages require the "-Wl," prefix to recognize linker options.
# This is transformed by the compiler wrapper to "-R".
_COMPILER_RPATH_FLAG=	-Wl,-R

# SunPro compiler must be passed certain flags to compile/link 64-bit code.
.if ${MACHINE_ARCH} == "sparc"
_COMPILER_ABI_FLAG.64=	-xtarget=ultra -xarch=v9
.else
_COMPILER_ABI_FLAG.64= -xarch=amd64
.endif

.if exists(${CCPATH})
CC_VERSION_STRING!=	${CCPATH} -V 2>&1 || ${TRUE}
CC_VERSION!=		${CCPATH} -V 2>&1 | ${GREP} '^cc'
.else
CC_VERSION_STRING?=	${CC_VERSION}
CC_VERSION?=		cc: Sun C
.endif

# _LANGUAGES.<compiler> is ${LANGUAGES.<compiler>} restricted to the
# ones requested by the package in USE_LANGUAGES.
#
_LANGUAGES.sunpro=	# empty
.for _lang_ in ${USE_LANGUAGES}
_LANGUAGES.sunpro+=	${LANGUAGES.sunpro:M${_lang_}}
.endfor

# Prepend the path to the compiler to the PATH.
.if !empty(_LANGUAGES.sunpro)
PREPEND_PATH+=	${_SUNPRO_DIR}/bin
.endif

# Create compiler driver scripts in ${WRKDIR}.
.for _var_ in ${_SUNPRO_VARS}
.  if !target(${_SUNPRO_${_var_}})
override-tools: ${_SUNPRO_${_var_}}
${_SUNPRO_${_var_}}:
	${_PKG_SILENT}${_PKG_DEBUG}${MKDIR} ${.TARGET:H}
	${_PKG_SILENT}${_PKG_DEBUG}					\
	(${ECHO} '#!${TOOLS_SHELL}';					\
	 ${ECHO} 'exec ${SUNWSPROBASE}/bin/${.TARGET:T} "$$@"';		\
	) > ${.TARGET}
	${_PKG_SILENT}${_PKG_DEBUG}${CHMOD} +x ${.TARGET}
.    for _alias_ in ${_ALIASES.${_var_}:S/^/${.TARGET:H}\//}
	${_PKG_SILENT}${_PKG_DEBUG}					\
	if [ ! -x "${_alias_}" ]; then					\
		${LN} -f ${.TARGET} ${_alias_};				\
	fi
.    endfor
.  endif
.endfor

# Force the use of f2c-f77 for compiling Fortran.
#_SUNPRO_USE_F2C=	no
#FCPATH=			/nonexistent
#.if !exists(${FCPATH})
#_SUNPRO_USE_F2C=	yes
#.endif
#.if !empty(_SUNPRO_USE_F2C:M[yY][eE][sS])
# libtool keys off of the compiler name when configuring.  The unfortunate
# side effect is that if we let "f2c-f77" be called "f77" on solaris then
# libtool thinks we're using the Sun fortran compiler and it will add
# '-Qoption ld' to the compiler flags which get passed to the C compiler and
# those are not understood.  So make sure we call the compiler g77 instead.
#FC=	g77
#.  include "../../mk/compiler/f2c.mk"
#.endif

.endif	# COMPILER_SUNPRO_MK
