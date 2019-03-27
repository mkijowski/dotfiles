#!/bin/bash

if [ ! -d /home/mkijowski ]; then
   read -p "Home directory for user mkijowski not found, enter username:" WHOAMI
else
   WHOAMI = mkijowski
fi

USERDIR=/home/$WHOAMI
DOTFILEREPO=https://github.com/mkijowski/dotfiles

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root, exiting." 
   exit 1
fi

if [ ! -d $USERDIR/git/dotfiles ]; then
   echo "Cannot find dotfiles repo @ $USERDIR/git/dotfiles, exiting."
   exit 1
fi

su $WHOAMI -c ln -s $USERDIR/git/dotfiles/.bashrc $USERDIR/.bashrc
su $WHOAMI -c ln -s $USERDIR/git/dotfiles/.vimrc $USERDIR/.vimrc
su $WHOAMI -c cp -R $USERDIR/git/dotfiles/.ssh/* $USERDIR/.ssh

#install pre-requisites for vim and environment
apt update && apt install -y vim \
    python \
    python-dev \
    python3-dev \
    build-essential \
    cmake \
    dh-autoreconf \
    build-essential \
    libarchive-dev \
    squashfs-tools

echo "Finished installing pre-requisites"

install-singularity2-6 () {
cd $USERDIR/git
git clone https://github.com/mkijowski/container-education.git
git clone https://github.com/singularityware/singularity.git
cd singularity
git fetch --all
git checkout 2.6.0
./autogen.sh
./configure --prefix=/usr/local --sysconfdir=/etc
make
make install
}

# install plugins for vim
# Check to make sure its me and exit if not
read -p "Configuring Git for mkijowski, are you mkijowski? (Y/N): " confirm \
   && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1

su mkijowski -c git config --global user.email "matthewkijowski@gmail.com"
su mkijowski -c git config --global user.name "Matthew Kijowski"
su mkijowski -c git config --global core.editor vim

git clone https://github.com/VundleVim/Vundle.vim.git $USERDIR/.vim/bundle/Vundle.vim
vim -c `PluginInstall`
python $USERDIR/.vim/bundle/YouCompleteMe/install.py --clang-completer

