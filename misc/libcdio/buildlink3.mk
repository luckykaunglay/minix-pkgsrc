# $NetBSD: buildlink3.mk,v 1.2 2004/01/17 15:32:33 recht Exp $
#

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
LIBCDIO_BUILDLINK3_MK:=	${LIBCDIO_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	libcdio
.endif

.if !empty(LIBCDIO_BUILDLINK3_MK:M+)
BUILDLINK_PACKAGES+=			libcdio
BUILDLINK_DEPENDS.libcdio+=		libcdio>=0.65
BUILDLINK_PKGSRCDIR.libcdio?=		../../misc/libcdio

.endif # LIBCDIO_BUILDLINK3_MK

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
