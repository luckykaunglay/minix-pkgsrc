$NetBSD$

--- usecode/compiler/ucparse.yy.orig	2011-11-25 17:48:55.000000000 +0000
+++ usecode/compiler/ucparse.yy
@@ -29,7 +29,7 @@ Foundation, Inc., 59 Temple Place - Suit
 #include <iostream>
 #include <stdio.h>
 #include <stdlib.h>
-#include <string.h>
+#include <cstring>
 #include <vector>
 
 #include "ucfun.h"
