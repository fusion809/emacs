#!/bin/bash
PRG="$HOME/Programs"
pkgver="25.1"
toolkit="gtk2"

if ! [[ -d "$PRG/emacs-$pkgver" ]]; then
  wget -cqO- ftp://ftp.gnu.org/gnu/emacs/emacs-$pkgver.tar.xz | tar xJ
fi

cd $PRG/emacs-$pkgver
./autogen.sh
unset CC
./configure --prefix=/usr --with-x-toolkit="$toolkit" CFLAGS=-no-pie
make
sudo checkinstall --pkgversion="$pkgver" --pkgname="emacs-$toolkit" --maintainer="fusion809"
cp emacs-$toolkit_$pkgver-1_amd64.deb ../Deb
