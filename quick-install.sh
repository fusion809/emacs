#!/bin/bash
GHUBM="$HOME/GitHub/mine/editors"
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
fi

if ! [[ -d $HOME/.emacs.d/vendor/coffee-mode ]]; then
    git clone https://github.com/defunkt/coffee-mode $HOME/.emacs.d/vendor/coffee-mode
fi
