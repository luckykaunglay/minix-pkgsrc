# $NetBSD$

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
LIBAURA_BUILDLINK3_MK:=	${LIBAURA_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	libaura
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nlibaura}
BUILDLINK_PACKAGES+=	libaura

.if !empty(LIBAURA_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.libaura+=	libaura>=2.0
BUILDLINK_PKGSRCDIR.libaura?=	../../devel/libaura
.endif	# LIBAURA_BUILDLINK3_MK

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
