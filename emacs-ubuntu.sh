#!/bin/bash
PRG="$HOME/Programs"
pkgver="25.1"

if ! [[ -d "$PRG/emacs-$pkgver" ]]; then
  wget -cqO- ftp://ftp.gnu.org/gnu/emacs/emacs-$pkgver.tar.xz | tar xJ
fi

cd $PRG/emacs-$pkgver
./autogen.sh
unset CC
./configure --prefix=/usr --with-x-toolkit=gtk2 CFLAGS=-no-pie
make
sudo checkinstall --pkgversion="$pkgver" --pkgname="emacs-gtk2" --maintainer="Brenton Horne <brentonhorne77@gmail.com>"
cp emacs-gtk2_$pkgver-1_amd64.deb ../Deb
