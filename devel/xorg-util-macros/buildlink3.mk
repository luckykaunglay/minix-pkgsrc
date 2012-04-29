# $NetBSD$

BUILDLINK_TREE+=	xorg-util-macros

.if !defined(XORG_UTIL_MACROS_BUILDLINK3_MK)
XORG_UTIL_MACROS_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.xorg-util-macros+=	xorg-util-macros>=1.17
BUILDLINK_ABI_DEPENDS.xorg-util-macros+=	xorg-util-macros>=1.17
BUILDLINK_PKGSRCDIR.xorg-util-macros?=	../../devel/xorg-util-macros
.endif # XORG_UTIL_MACROS_BUILDLINK3_MK

BUILDLINK_TREE+=	-xorg-util-macros
