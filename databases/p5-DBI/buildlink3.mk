# $NetBSD: buildlink3.mk,v 1.3 2004/01/05 11:05:45 jlam Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
P5_DBI_BUILDLINK3_MK:=	${P5_DBI_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	p5-DBI
.endif

.if !empty(P5_DBI_BUILDLINK3_MK:M+)
BUILDLINK_PACKAGES+=		p5-DBI
BUILDLINK_DEPENDS.p5-DBI+=	p5-DBI>=1.30
BUILDLINK_PKGSRCDIR.p5-DBI?=	../../databases/p5-DBI
BUILDLINK_INCDIRS.p5-DBI?=	${PERL5_SUB_INSTALLSITEARCH}/auto/DBI

.  include "../../lang/perl5/buildlink3.mk"
.endif	# P5_DBI_BUILDLINK3_MK

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
