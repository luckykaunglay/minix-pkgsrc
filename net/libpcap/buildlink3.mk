# $NetBSD: buildlink3.mk,v 1.11 2004/02/18 16:35:27 jlam Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
LIBPCAP_BUILDLINK3_MK:=	${LIBPCAP_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	libpcap
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nlibpcap}
BUILDLINK_PACKAGES+=	libpcap

.if !empty(LIBPCAP_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.libpcap+=	libpcap>=0.7.2
BUILDLINK_PKGSRCDIR.libpcap?=	../../net/libpcap
.endif	# LIBPCAP_BUILDLINK3_MK

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
