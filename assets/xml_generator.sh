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

XMLTAG="<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
RESOURCE_START="<resource-redirections>"
RESOURCE_END="</resource-redirections>"
RESOURCE_NAME="<item name=\"drawable/"
DRAWABLE_NAME="\">@drawable/"
DRAWABLE_DIR="./DRAWABLES"

THEME_REDIR_START="<theme-redirections xmlns:android=\"http://schemas.android.com/apk/res/android\" xmlns:pluto=\"http://www.w3.org/2001/pluto.html\">"
THEME_REDIR_END="</theme-redirections>"
PACKAGE_REDIR_START="<package-redirections"
PACKAGE_REDIR_END="</package-redirections>"

mkdir $DRAWABLE_DIR
pushd $DRAWABLE_DIR

if [ ! -f redirections.xml ]
then
touch redirections.xml
echo $THEME_REDIR_START >> redirections.xml
echo $THEME_REDIR_END >> redirections.xml
fi

clear
echo "==========================================================================="
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "==========================================================================="
echo "Is this an HDPI theme or an MDPI theme?"
echo "1. HDPI"
echo "2. MDPI"
echo "==========================================================================="
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "==========================================================================="
read opt
case $opt in
	1) DENSITY="drawable-hdpi";;
	2) DENSITY="drawable-mdpi";;
esac

clear
echo "==========================================================================="
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "==========================================================================="
echo "Place your images in the DRAWABLES folder, then press enter."
echo "==========================================================================="
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "==========================================================================="
read enterKey

clear
echo "==========================================================================="
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "==========================================================================="
echo 'Enter the package name, ex. com.android.inputmethod.latin or frameworks.res'
echo "==========================================================================="
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "==========================================================================="

read pname
: ${new_pname:="${pname//./_}"}

for file in *.png
do
        mv $file $new_pname"_"$file
done

if [ $new_pname == frameworks_res ]
then

touch android.xml
sed -i '/^<theme-redirections/a \$PACKAGE_REDIR_START android:name=\"android\" android:resource=\"@xml/android\" android:minSdkVersion=\"7\" />' redirections.xml 

echo $XMLTAG >> android.xml
echo $RESOURCE_START >> android.xml
for i in *.png
do
        echo $RESOURCE_NAME${i/.png}$DRAWABLE_NAME$new_pname"_"${i/.png}\</item\> >> android.xml
done

sed -i 's/.9\"/\"/g' android.xml
sed -i 's/.9</</g' android.xml

echo $RESOURCE_END >> android.xml
mv android.xml ../MyTheme/res/xml/

else

sed -i '/^<theme-redirections/a $PACKAGE_REDIR_START android:name=\"$new_pname\" android:resource=\"@xml/$new_pname\" android:minSdkVersion=\"7\" />' redirections.xml
touch $new_pname.xml
echo $XMLTAG >> $new_pname.xml
echo $RESOURCE_START >> $new_pname.xml

for i in *.png
do
        echo $RESOURCE_NAME${i/.png}$DRAWABLE_NAME$new_pname"_"${i/.png}\</item\> >> $new_pname.xml
done 

sed -i 's/.9\"/\"/g' $new_pname.xml
sed -i 's/.9</</g' $new_pname.xml

echo $RESOURCE_END >> $new_pname.xml
mv $new_pname.xml ../MyTheme/res/xml/
fi

popd
mkdir MyTheme/res/$DENSITY/
mv $DRAWABLE_DIR/redirections.xml MyTheme/res/xml/
mv $DRAWABLE_DIR/* MyTheme/res/$DENSITY/
rm -rf $DRAWABLE_DIR
./ThemeGenerator.sh
