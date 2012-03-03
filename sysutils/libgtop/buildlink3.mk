# $NetBSD: buildlink3.mk,v 1.8 2012/02/06 12:41:36 wiz Exp $

BUILDLINK_TREE+=	libgtop

.if !defined(LIBGTOP_BUILDLINK3_MK)
LIBGTOP_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.libgtop+=	libgtop>=2.14.0
BUILDLINK_ABI_DEPENDS.libgtop?=	libgtop>=2.28.4nb2
BUILDLINK_PKGSRCDIR.libgtop?=	../../sysutils/libgtop

.include "../../devel/gettext-lib/buildlink3.mk"
.include "../../devel/glib2/buildlink3.mk"
.include "../../x11/libXau/buildlink3.mk"
.endif # LIBGTOP_BUILDLINK3_MK

BUILDLINK_TREE+=	-libgtop
