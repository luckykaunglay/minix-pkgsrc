# $NetBSD: buildlink3.mk,v 1.6 2004/03/26 02:27:49 wiz Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
PY_ORBIT_BUILDLINK3_MK:=	${PY_ORBIT_BUILDLINK3_MK}+

.include "../../lang/python/pyversion.mk"

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	pyorbit
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Npyorbit}
BUILDLINK_PACKAGES+=	pyorbit

.if !empty(PY_ORBIT_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.pyorbit+=	${PYPKGPREFIX}-ORBit>=2.0.0nb1
BUILDLINK_RECOMMENDED.pyorbit?=	${PYPKGPREFIX}-ORBit>=2.0.0nb2
BUILDLINK_PKGSRCDIR.pyorbit?=	../../net/py-ORBit
.endif	# PY_ORBIT_BUILDLINK3_MK

.include "../../net/ORBit2/buildlink3.mk"

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
