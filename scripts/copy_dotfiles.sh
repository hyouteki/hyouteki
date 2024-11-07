#!/bin/bash

# I know I can use GNU stow but fuck it we ball
# TODO: replace duplicating files with symlinks

if [ -z "${ROOT}" ]; then
    ROOT="."
    echo "ROOT not set, defaulting to: ${ROOT}"
fi

cp ~/.config/i3/config ${ROOT}/i3/config
cp ~/.config/i3status/config ${ROOT}/i3status/config
cp ~/.config/libinput-gestures.conf ${ROOT}/gestures/libinput-gestures.conf
cp ~/.tmux.conf ${ROOT}/
cp ~/.emacs ${ROOT}/
cp ~/.emacs.custom.el ${ROOT}/
