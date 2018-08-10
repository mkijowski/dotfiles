#!/bin/bash

apt-get install -y vim \
    git \
    python-dev \
    python3-dev \
    build-essential \
    cmake

mkdir ~/git
cd git
git clone https://github.com/mkijowski/dotfiles.git
mv ~/git/dotfiles/.bashrc ~/.bashrc
mv ~/git/dotfiles/.vimrc ~/.vimrc
mv ~/git/.ssh/* ~/.ssh

# install plagins for vim
#git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
#vim -c `PluginInstall`
#python ~/.vim/bundle/YouCompleteMe/install.py --clang-completer
