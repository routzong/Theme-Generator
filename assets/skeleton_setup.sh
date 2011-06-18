#!/bin/bash
#            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#                    Version 2, December 2004
#
# Copyright (C) 2004 Sam Hocevar <sam@hocevar.net>
# Copyright (C) 2011 T3hh4xx0r <r2doesinc@gmail.com>
#
# Everyone is permitted to copy and distribute verbatim or modified
# copies of this license document, and changing it is allowed as long
# as the name is changed.
#
#            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
#
#  0. You just DO WHAT THE FUCK YOU WANT TO.

cp assets/AndroidManifest.xml MyTheme/AndroidManifest.xml
cp assets/strings.xml MyTheme/res/values/strings.xml
cp assets/Android.mk MyTheme/Android.mk
cp -r assets/src/ MyTheme/

clear
echo "==========================================================================="
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "==========================================================================="
echo "Enter your name."
echo "==========================================================================="
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "==========================================================================="
read NAME
sed -i "s/NAME/$NAME/g" MyTheme/res/values/strings.xml 

clear
echo "==========================================================================="
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "==========================================================================="
echo "Enter the package name, for example com.t3hh4xx0r.themes.omft"
echo "==========================================================================="
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "==========================================================================="
read PACKAGE
sed -i "s/PACKAGE/$PACKAGE/g" MyTheme/AndroidManifest.xml

clear
echo "==========================================================================="
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "==========================================================================="
echo "Enter the Theme Name. This can be anything without spaces."
echo "==========================================================================="
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "==========================================================================="
read THEMENAME
sed -i "s/THEMENAME/$THEMENAME/g" MyTheme/AndroidManifest.xml
sed -i "s/THEMENAME/$THEMENAME/g" MyTheme/res/values/strings.xml
sed -i "s/THEMENAME/$THEMENAME/g" MyTheme/Android.mk

clear
echo "==========================================================================="
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "==========================================================================="
echo "Enter the Style ID. This can be anything without spaces."
echo "==========================================================================="
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "==========================================================================="
read STYLEID
sed -i "s/STYLEID/$STYLEID/g" MyTheme/AndroidManifest.xml
sed -i "s/STYLEID/$STYLEID/g" MyTheme/res/values/strings.xml

./assets/menu.sh
