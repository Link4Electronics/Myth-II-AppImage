#!/bin/sh

set -eu

ARCH=$(uname -m)

echo "Installing package dependencies..."
echo "---------------------------------------------------------------"
pacman -Syu --noconfirm glu

echo "Installing debloated packages..."
echo "---------------------------------------------------------------"
get-debloated-pkgs --add-common --prefer-nano

# Comment this out if you need an AUR package
#make-aur-package PACKAGENAME

# If the application needs to be manually built that has to be done down here
wget https://projectmagma.net/downloads/myth2_updates/1.8.5%20Final%20(Build%20471b)/Myth2_185_Linux.tar.gz

mkdir -p ./AppDir/bin
