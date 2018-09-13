#!/bin/bash

sourcery () {
USERDIR=/home/mkijowski
DOTFILEREPO=https://github.com/mkijowski/dotfiles
}

sourcery
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

if [ ! -d $USERDIR/git/dotfiles ]; then
   mkdir -p $USERDIR/git/
   git clone $DOTFILEREPO
fi

mv $USERDIR/git/dotfiles/.bashrc $USERDIR/.bashrc
mv $USERDIR/git/dotfiles/.vimrc $USERDIR/.vimrc
mv $USERDIR/git/dotfiles/.ssh/* $USERDIR/.ssh

#install pre-requisites for vim and environment
sudo apt update && apt install -y vim \
    python \
    python-dev \
    python3-dev \
    build-essential \
    cmake \
    dh-autoreconf \
    build-essential \
    libarchive-dev \
    squashfs-tools


cd $USERDIR/git
git clone https://github.com/singularityware/singularity.git
cd singularity
git fetch --all
git checkout 2.6.0
./autogen.sh
./configure --prefix=/usr/local --sysconfdir=/etc
make
make install

# install plagins for vim
su mkijowski

sourcery
git config --global user.email "matthewkijowski@gmail.com"
git config --global user.name "Matthew Kijowski"
git config --global core.editor vim

git clone https://github.com/VundleVim/Vundle.vim.git $USERDIR/.vim/bundle/Vundle.vim
vim -c `PluginInstall`
python $USERDIR/.vim/bundle/YouCompleteMe/install.py --clang-completer
