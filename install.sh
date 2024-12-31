#!/bin/bash

SCRIPTDIR=$(cd $(dirname "$0"); pwd)

# Install NERDTree
git clone https://github.com/preservim/nerdtree.git ~/.vim/pack/plugins/start/nerdtree
vim -u NONE -c "helptags ~/.vim/pack/plugins/start/nerdtree/doc" -c q

# Install rust.vim
#git clone https://github.com/rust-lang/rust.vim ~/.vim/pack/plugins/start/rust.vim

# Install LSP and rust-analyzer
#rustup component add rust-analyzer
#git clone https://github.com/prabirshrestha/vim-lsp.git ~/.vim/pack/plugins/start/vim-lsp
#vihttps://github.com/dense-analysis/ale.gitm -u NONE -c "helptags ~/.vim/pack/plugins/start/vim-lsp/doc" -c q
#git clone https://github.com/prabirshrestha/asyncomplete.vim.git  ~/.vim/pack/plugins/start/asyncomplete.vim
#vim -u NONE -c "helptags ~/.vim/pack/plugins/start/asyncomplete.vim/doc" -c q
#git clone https://github.com/prabirshrestha/asyncomplete-lsp.vim.git ~/.vim/pack/plugins/start/asyncomplete-lsp.vim
#vim -u NONE -c "helptags ~/.vim/pack/plugins/start/asyncomplete-lsp.vim/doc" -c q

# Install ALE
git clone https://github.com/dense-analysis/ale.git ~/.vim/pack/plugins/start/ale
vim -u NONE -c "helptags ~/.vim/pack/plugins/start/ale/doc" -c q

# Copy files
cp "$SCRIPTDIR/.vimrc" ~
cp "$SCRIPTDIR/.bash_aliases" ~