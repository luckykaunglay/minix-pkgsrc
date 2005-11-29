# $NetBSD$

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
TRE_BUILDLINK3_MK:=	${TRE_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	tre
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Ntre}
BUILDLINK_PACKAGES+=	tre

.if !empty(TRE_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.tre+=		tre>=0.7.2
BUILDLINK_PKGSRCDIR.tre?=	../../devel/tre
BUILDLINK_DEPMETHOD.tre?=	build
.endif	# TRE_BUILDLINK3_MK

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
