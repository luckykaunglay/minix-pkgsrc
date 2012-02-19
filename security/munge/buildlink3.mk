# $NetBSD$

BUILDLINK_TREE+=	munge

.if !defined(MUNGE_BUILDLINK3_MK)
MUNGE_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.munge+=	munge>=0.5.10
BUILDLINK_PKGSRCDIR.munge?=	../../security/munge

.endif	# MUNGE_BUILDLINK3_MK

BUILDLINK_TREE+=	-munge
