# $NetBSD$

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
LIBVNCSERVER_BUILDLINK3_MK:=	${LIBVNCSERVER_BUILDLINK3_MK}+

.if ${BUILDLINK_DEPTH} == "+"
BUILDLINK_DEPENDS+=	libVNCServer
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:NlibVNCServer}
BUILDLINK_PACKAGES+=	libVNCServer
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}libVNCServer

.if ${LIBVNCSERVER_BUILDLINK3_MK} == "+"
BUILDLINK_API_DEPENDS.libVNCServer+=	libVNCServer>=0.8.2
BUILDLINK_PKGSRCDIR.libVNCServer?=	../../net/libvncserver
.endif	# LIBVNCSERVER_BUILDLINK3_MK

.include "../../devel/SDL/buildlink3.mk"

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH:S/+$//}
