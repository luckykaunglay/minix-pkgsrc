# $NetBSD: buildlink3.mk,v 1.21 2012/02/06 12:41:07 wiz Exp $

BUILDLINK_TREE+=	totem

.if !defined(TOTEM_BUILDLINK3_MK)
TOTEM_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.totem+=	{totem,totem-xine}>=1.4.0
BUILDLINK_ABI_DEPENDS.totem+=	totem>=2.32.0nb7
BUILDLINK_PKGSRCDIR.totem?=	../../multimedia/totem

.include "../../textproc/libxml2/buildlink3.mk"
.include "../../x11/gtk2/buildlink3.mk"
.endif # TOTEM_BUILDLINK3_MK

BUILDLINK_TREE+=	-totem
