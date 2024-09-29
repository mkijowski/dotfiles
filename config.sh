#!/bin/bash

if [ ! -d /home/mkijowski ]; then
   read -p "Home directory for user mkijowski not found, enter username:" WHOAMI
else
   WHOAMI=mkijowski
fi

USERDIR=/home/$WHOAMI
DOTFILEREPO=https://github.com/mkijowski/dotfiles
PRIVATEKEY=$USERDIR/Downloads/kijowski-secret.txt

if [ ! -d $USERDIR/git/dotfiles ]; then
   echo "Cannot find dotfiles repo @ $USERDIR/git/dotfiles, exiting."
   exit 1
fi

home_config() {
  ln -sfb ~/git/dotfiles/.bashrc ~/.bashrc
  ln -sfb ~/git/dotfiles/.vimrc ~/.vimrc
  mkdir -p ~/.ssh/
  mkdir -p ~/.singularity/
  ln -sfb ~/git/dotfiles/.ssh/authorized_keys ~/.ssh/authorized_keys
  ln -sfb ~/git/dotfiles/.ssh/config ~/.ssh/config
}
export -f home_config

git_config() {
  git config --global user.email "matthewkijowski@gmail.com"
  git config --global user.name "Matthew Kijowski"
  git config --global core.editor vim
}
export -f git_config

vim_config() {
  if [ -d ~/.vim/bundle/Vundle.vim ]; then
    rm -rf ~/.vim/bundle/Vundle.vim
  fi
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  if [ -f ~/.vimrc ]; then
    vim -C PluginInstall
  fi
}
export -f vim_config

gpg_config() {
  if [ ! -f $PRIVATEKEY ]; then
    echo "Cannot find Private Key (lastpass download)"
    exit 1
  fi
  gpg --import $PRIVATEKEY
  expect -c 'spawn gpg --edit-key 7E5CF54E1BBA3984 trust quit; send "5\ry\r"; expect eof'
}
export -f gpg_config

## Configure system for mkijowski
read -p \
  "Would you like to configure this system for mkijowski? (Y/N): " mkconfirm
if [[ $mkconfirm == [yY] || $mkconfirm == [yY][eE][sS] ]]; then
  home_config $USERDIR
  git_config
  vim_config
fi

