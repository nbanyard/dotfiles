#!/bin/bash

SCRIPTDIR=$(cd $(dirname "$0"); pwd)

# Install NERDTree
git clone https://github.com/preservim/nerdtree.git ~/.vim/pack/vendor/start/nerdtree
vim -u NONE -c "helptags ~/.vim/pack/vendor/start/nerdtree/doc" -c q

# Copy files
cp "$SCRIPTDIR/.vimrc" ~