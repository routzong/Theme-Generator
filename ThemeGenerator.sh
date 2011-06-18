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

./assets/menu.sh

