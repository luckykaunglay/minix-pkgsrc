# $NetBSD: buildlink3.mk,v 1.9 2004/02/20 23:14:14 jlam Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
EXPAT_BUILDLINK3_MK:=	${EXPAT_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	expat
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nexpat}
BUILDLINK_PACKAGES+=	expat

.if !empty(EXPAT_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.expat+=	expat>=1.95.4
BUILDLINK_PKGSRCDIR.expat?=	../../textproc/expat
.endif	# EXPAT_BUILDLINK3_MK

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
