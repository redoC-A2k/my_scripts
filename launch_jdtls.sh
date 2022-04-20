#!/usr/bin/env bash

curr_jvm=`realpath /usr/lib/jvm/default`
echo $curr_jvm

JAR="/home/afshan/eclipse-jdt/plugins/org.eclipse.equinox.launcher_*.jar"
GRADLE_HOME=/home/afshan/gradle ${curr_jvm}/bin/java \
  -Declipse.application=org.eclipse.jdt.ls.core.id1 \
  -Dosgi.bundles.defaultStartLevel=4 \
  -Declipse.product=org.eclipse.jdt.ls.core.product \
  -Dlog.protocol=true \
  -Dlog.level=ALL \
  -Xms1g \
  -Xmx2G \
  -jar $(echo "$JAR") \
  -configuration "/home/afshan/eclipse-jdt/config_linux" \
  -data "/home/afshan/eclipse-jdt/workspace" \
  --add-modules=ALL-SYSTEM \
  --add-opens java.base/java.util=ALL-UNNAMED \
  --add-opens java.base/java.lang=ALL-UNNAMED
