#!/bin/bash
GHUBM="$HOME/GitHub/mine"
EMD="$HOME/.emacs.d"
if ! [[ -d "$GHUBM/emacs" ]]; then
  if ! [[ -d "$GHUBM" ]]; then
    mkdir -p "$GHUBM"
  fi
  git clone https://github.com/fusion809/emacs $GHUBM/emacs
  cp $GHUBM/emacs/.emacs $HOME
  if ! [[ -d "$EMD" ]]; then
    mkdir -p "$EMD"
  fi
  cp $GHUBM/emacs/taskbar.el $EMD
fi
