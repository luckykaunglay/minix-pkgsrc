$NetBSD$

--- src/FbTk/StringUtil.cc.orig	2011-11-25 17:41:16.000000000 +0000
+++ src/FbTk/StringUtil.cc
@@ -23,7 +23,7 @@
 
 #include "StringUtil.hh"
 
-
+#include <cstring>
 #ifdef HAVE_CSTDIO
   #include <cstdio>
 #else
