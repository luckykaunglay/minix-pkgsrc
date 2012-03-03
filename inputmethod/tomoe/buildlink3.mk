# $NetBSD: buildlink3.mk,v 1.4 2012/02/06 12:40:45 wiz Exp $

BUILDLINK_TREE+=	tomoe

.if !defined(TOMOE_BUILDLINK3_MK)
TOMOE_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.tomoe+=	tomoe>=0.6.0
BUILDLINK_ABI_DEPENDS.tomoe?=	tomoe>=0.6.0nb4
BUILDLINK_PKGSRCDIR.tomoe?=	../../inputmethod/tomoe

.include "../../devel/glib2/buildlink3.mk"
.endif # TOMOE_BUILDLINK3_MK

BUILDLINK_TREE+=	-tomoe
