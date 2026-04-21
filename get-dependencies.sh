#!/bin/sh

set -eu

ARCH=$(uname -m)

echo "Installing package dependencies..."
echo "---------------------------------------------------------------"
pacman -Syu --noconfirm \
    glu \
    openal

echo "Installing debloated packages..."
echo "---------------------------------------------------------------"
get-debloated-pkgs --add-common --prefer-nano

# Comment this out if you need an AUR package
#make-aur-package PACKAGENAME

# If the application needs to be manually built that has to be done down here
echo "Getting app..."
echo "---------------------------------------------------------------"
wget "https://projectmagma.net/downloads/myth2_updates/1.8.5%20Final%20(Build%20471b)/Myth2_185_Linux.tar.gz"
tar -xvf Myth2_185_Linux.tar.gz
rm -f *.gz *.pdf *.txt Myth2_32bit .DS_Store

mkdir -p ./AppDir/bin
mv -v plugins Myth2_64bit ./AppDir/bin
