# $NetBSD: options.mk,v 1.13 2007/05/26 11:50:12 xtraeme Exp $
#

PKG_OPTIONS_VAR=		PKG_OPTIONS.jabberd2
PKG_OPTIONS_REQUIRED_GROUPS=	auth storage sasl
# Authentication backend
PKG_OPTIONS_GROUP.auth=		auth-mysql auth-pgsql auth-sqlite
PKG_OPTIONS_GROUP.auth+=	auth-db auth-ldap auth-pam
# Storage backend
PKG_OPTIONS_GROUP.storage=	storage-mysql storage-pgsql
PKG_OPTIONS_GROUP.storage+=	storage-sqlite storage-db
# SASL implementation
PKG_OPTIONS_GROUP.sasl=		cyrus-sasl gnusasl
PKG_SUGGESTED_OPTIONS=		auth-sqlite storage-sqlite gnusasl

.include "../../mk/bsd.options.mk"

.if !empty(PKG_OPTIONS:Mauth-db) || !empty(PKG_OPTIONS:Mstorage-db)
PLIST_SUBST+=		DB_OPT=
CONFIGURE_ARGS+=	--enable-db
.  include "../../databases/db4/buildlink3.mk"
.else
PLIST_SUBST+=		DB_OPT='@comment '
CONFIGURE_ARGS+=	--disable-db
.endif

.if !empty(PKG_OPTIONS:Mauth-mysql) || !empty(PKG_OPTIONS:Mstorage-mysql)
PLIST_SUBST+=		MYSQL_OPT=
CONFIGURE_ARGS+=	--enable-mysql
CPPFLAGS+=		-I${BUILDLINK_PREFIX.mysql-client}/include/mysql
.  include "../../mk/mysql.buildlink3.mk"
.else
PLIST_SUBST+=		MYSQL_OPT='@comment '
CONFIGURE_ARGS+=	--disable-mysql
.endif

.if !empty(PKG_OPTIONS:Mauth-pgsql) || !empty(PKG_OPTIONS:Mstorage-pgsql)
PLIST_SUBST+=		PGSQL_OPT=
CONFIGURE_ARGS+=	--enable-pgsql
.  include "../../mk/pgsql.buildlink3.mk"
.else
PLIST_SUBST+=		PGSQL_OPT='@comment '
CONFIGURE_ARGS+=	--disable-pgsql
.endif

.if !empty(PKG_OPTIONS:Mauth-sqlite) || !empty(PKG_OPTIONS:Mstorage-sqlite)
PLIST_SUBST+=		SQLITE_OPT=
CONFIGURE_ARGS+=	--enable-sqlite
.  include "../../databases/sqlite3/buildlink3.mk"
.else
PLIST_SUBST+=		SQLITE_OPT='@comment '
CONFIGURE_ARGS+=	--disable-sqlite
.endif

.if !empty(PKG_OPTIONS:Mauth-ldap)
PLIST_SUBST+=		LDAP_OPT=
CONFIGURE_ARGS+=	--enable-ldap
.  include "../../databases/openldap-client/buildlink3.mk"
.else
PLIST_SUBST+=		LDAP_OPT='@comment '
CONFIGURE_ARGS+=	--disable-ldap
.endif

.if !empty(PKG_OPTIONS:Mcyrus-sasl)
CONFIGURE_ARGS+=	--enable-cyrus
.  include "../../security/cyrus-sasl/buildlink3.mk"
.else
CONFIGURE_ARGS+=	--disable-cyrus
.endif

.if !empty(PKG_OPTIONS:Mgnusasl)
CONFIGURE_ARGS+=	--enable-gsasl
.  include "../../security/gsasl/buildlink3.mk"
.else
CONFIGURE_ARGS+=	--disable-gsasl
.endif

.if !empty(PKG_OPTIONS:Mauth-pam)
PLIST_SUBST+=		PAM_OPT=
CONFIGURE_ARGS+=	--enable-pam
.  include "../../mk/pam.buildlink3.mk"
.else
PLIST_SUBST+=		PAM_OPT='@comment '
CONFIGURE_ARGS+=	--disable-pam
.endif
