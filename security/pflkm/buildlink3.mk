# $NetBSD$

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
PFLKM_BUILDLINK3_MK:=	${PFLKM_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	pflkm
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Npflkm}
BUILDLINK_PACKAGES+=	pflkm

.if !empty(PFLKM_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.pflkm+=	pflkm>=20041025
BUILDLINK_PKGSRCDIR.pflkm?=	../../security/pflkm
.endif	# PFLKM_BUILDLINK3_MK

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
