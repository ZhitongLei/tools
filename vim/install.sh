#!/bin/bash

# File Name: install.sh
# Author: lei
# Created Time: 2016-07-13 14:34:42

WORKPLACE="$HOME/.vim_runtime"

PATHOGEN_URL="https://github.com/tpope/vim-pathogen.git"
NERDTREE_URL="https://github.com/scrooloose/nerdtree.git"
POWERLINE_URL="https://github.com/Lokaltog/vim-powerline.git"
CTRLP_URL="https://github.com/kien/ctrlp.vim.git"
CPP_HIGHLIGHT="https://github.com/octol/vim-cpp-enhanced-highlight.git"

mkdir $WORKPLACE
cp ./vimrc $WORKPLACE
cd $WORKPLACE

mkdir "autoload" "bundle"
cd $WORKPLACE/bundle

#curl -LSso $WORKPLACE/autoload/pathogen.vim https://tpo.pe/pathogen.vim
echo "installing pathogen..."
git clone "$PATHOGEN_URL" 
cp vim-pathogen/"autoload"/pathogen.vim $WORKPLACE/"autoload"

echo "installing NERDTree..."
git clone "$NERDTREE_URL" 

echo "installing powerline..."
git clone "$POWERLINE_URL"

echo "installing ctrlp.vim..."
git clone "$CTRLP_URL"

echo "installing cpp-highlight..."
git clone "$CPP_HIGHLIGHT"

# backup
if [ -e ~/.vimrc ]; then
    mv ~/.vimrc ~/.vimrc_old
fi

echo 'set runtimepath+=~/.vim_runtime
source ~/.vim_runtime/vimrc' > ~/.vimrc

echo "Installed the Vim configuration successfully! Enjoy :-)"
