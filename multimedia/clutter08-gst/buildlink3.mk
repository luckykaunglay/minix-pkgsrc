# $NetBSD: buildlink3.mk,v 1.8 2012/02/06 12:41:01 wiz Exp $
#

BUILDLINK_TREE+=	clutter08-gst

.if !defined(CLUTTER08_GST_BUILDLINK3_MK)
CLUTTER08_GST_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.clutter08-gst+=	clutter08-gst>=0.8.0
BUILDLINK_ABI_DEPENDS.clutter08-gst?=	clutter08-gst>=0.8.0nb8
BUILDLINK_PKGSRCDIR.clutter08-gst?=	../../multimedia/clutter08-gst

.include "../../graphics/clutter08/buildlink3.mk"
.include "../../multimedia/gstreamer0.10/buildlink3.mk"
.include "../../multimedia/gst-plugins0.10-base/buildlink3.mk"
.endif # CLUTTER08_GST_BUILDLINK3_MK

BUILDLINK_TREE+=	-clutter08-gst
