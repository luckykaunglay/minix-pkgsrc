# $NetBSD: buildlink3.mk,v 1.5 2005/01/17 12:56:14 martti Exp $

BUILDLINK_DEPTH:=			${BUILDLINK_DEPTH}+
XFCE4_TRIGGER_LAUNCHER_BUILDLINK3_MK:=	${XFCE4_TRIGGER_LAUNCHER_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	xfce4-trigger-launcher
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nxfce4-trigger-launcher}
BUILDLINK_PACKAGES+=	xfce4-trigger-launcher

.if !empty(XFCE4_TRIGGER_LAUNCHER_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.xfce4-trigger-launcher+=	xfce4-trigger-launcher>=4.2.1
BUILDLINK_PKGSRCDIR.xfce4-trigger-launcher?=	../../x11/xfce4-trigger-launcher
.endif	# XFCE4_TRIGGER_LAUNCHER_BUILDLINK3_MK

.include "../../textproc/libxml2/buildlink3.mk"
.include "../../x11/xfce4-panel/buildlink3.mk"
.include "../../devel/glib2/buildlink3.mk"

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
