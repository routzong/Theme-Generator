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

clear
echo "==========================================================================="
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "==========================================================================="
echo "1) Generate the theme skeleton. Makefile, Manifest, java files, etc."
echo "2) Generate the themed app xmls and prepare the images."
echo "==========================================================================="
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "==========================================================================="
read opt
case $opt in
        1)./assets/skeleton_setup.sh;;
        2)./assets/xml_generator.sh;;
esac

