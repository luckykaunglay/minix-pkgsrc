$NetBSD$

--- e2fsprogs-1.41.9/ext2fs/icount.c.orig	2012-12-20 13:30:46.000000000 +0000
+++ e2fsprogs-1.41.9/ext2fs/icount.c
@@ -8,6 +8,7 @@
  * License.
  * %End-Header%
  */
+#include "config.h"
 
 #if HAVE_UNISTD_H
 #include <unistd.h>
