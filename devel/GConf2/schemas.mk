# $NetBSD: schemas.mk,v 1.1 2003/02/14 20:04:07 jmmv Exp $
#
# This Makefile fragment is intended to be included by packages that install
# GConf2 schema files.  It takes care of registering them in the GConf2
# global configuration database.
#
# The following variables are automatically defined for free use in packages:
#    GCONFTOOL2           - The gconftool-2 binary program.
#    GCONF2_CONFIG_SOURCE - URI of the global configuration database.
#    GCONF2_SCHEMAS_DIR   - Directory where .schemas files are installed.
#
# The following variables can be defined by a package to register .schemas
# files:
#    GCONF2_SCHEMAS - A list of .schemas files to register.  When using this
#                     variable, packages need to be fixed to not register
#                     them and to install those files to GCONF2_SCHEMAS_DIR.
#

.if !defined(GCONF2_SCHEMAS_MK)
GCONF2_SCHEMAS_MK=	# defined

# The gconftool-2 binary program.
GCONFTOOL2=		${BUILDLINK_PREFIX.GConf2}/bin/gconftool-2

# Default configuration source (database).
.if defined(PKG_SYSCONFDIR.GConf2)
GCONF2_CONFIG_SOURCE=	xml::${PKG_SYSCONFDIR.GConf2}/gconf/gconf.xml.defaults
.else
GCONF2_CONFIG_SOURCE=	xml::${PKG_SYSCONFBASE}/gconf/gconf.xml.defaults
.endif

# Where .schemas files go.
GCONF2_SCHEMAS_DIR=	${BUILDLINK_PREFIX.GConf2}/share/gconf/schemas

.if defined(GNU_CONFIGURE) && !empty(GNU_CONFIGURE:M[Yy][Ee][Ss])
CONFIGURE_ARGS+= 	--disable-schemas-install
CONFIGURE_ARGS+=	--with-gconf-schema-file-dir=${GCONF2_SCHEMAS_DIR}
.endif

.if !empty(GCONF2_SCHEMAS)
FILES_SUBST+=		GCONFTOOL2="${GCONFTOOL2}"
FILES_SUBST+=		GCONF2_CONFIG_SOURCE="${GCONF2_CONFIG_SOURCE}"
FILES_SUBST+=		GCONF2_SCHEMAS="${GCONF2_SCHEMAS}"
FILES_SUBST+=		GCONF2_SCHEMAS_DIR="${GCONF2_SCHEMAS_DIR}"
INSTALL_EXTRA_TMPL+=	${.CURDIR}/../../devel/GConf2/files/install.tmpl
DEINSTALL_EXTRA_TMPL+=	${.CURDIR}/../../devel/GConf2/files/deinstall.tmpl
USE_PKGINSTALL=		YES
.endif

.include "../../devel/GConf2/buildlink2.mk"

.endif	# GCONF2_SCHEMAS_MK
