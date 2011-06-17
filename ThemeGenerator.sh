#!/bin/bash
DATE=$(date +"%m-%d-%y")

if [ -d MyTheme ];
then
clear
echo "==========================================================================="
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "==========================================================================="
echo "Theres already a theme in the working folder."
echo "1) Continue using current theme."
echo "2) Start a new theme."
echo "==========================================================================="
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "==========================================================================="
read del
case $del in
1)echo "";;
2)mv MyTheme MyOldTheme_$DATE; mkdir MyTheme; mkdir MyTheme/res/; mkdir MyTheme/res/xml/; mkdir MyTheme/res/values/;;
esac
else
mkdir MyTheme
mkdir MyTheme/res/
mkdir MyTheme/res/xml/
mkdir MyTheme/res/values/
fi

clear
echo "==========================================================================="
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "==========================================================================="
echo "1) Generate the theme skeleton. Makefiles and Manifest, etc."
echo "2) Generate the package xmls and prepare the images."
echo "==========================================================================="
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "==========================================================================="
read opt
case $opt in
	1)./assets/skeleton_setup.sh;;
	2)./assets/xml_generator.sh;;
esac
