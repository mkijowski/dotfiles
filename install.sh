#!/bin/bash

if [ ! -d /home/mkijowski ]; then
   read -p "Home directory for user mkijowski not found, enter username:" WHOAMI
else
   WHOAMI=mkijowski
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


#install pre-requisites for vim and environment
apt update && apt install -y \
   python \
   python-dev \
   python3-dev \
   build-essential \
   cmake \
   dh-autoreconf \
   build-essential \
   libarchive-dev \
   squashfs-tools \
   libncurses5-dev \
   libgtk2.0-dev \
   libatk1.0-dev \
   libcairo2-dev \
   libx11-dev \
   libxpm-dev \
   libxt-dev \
   ruby-dev \
   lua5.1 \
   liblua5.1-0-dev \
   libperl-dev

echo "Finished installing pre-requisites"

# install plugins for vim
# Check to make sure its me and exit if not
read -p "Configuring Git for mkijowski, are you mkijowski? (Y/N): " confirm \
   && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1


home_config() {
   ln -sfb ~/git/dotfiles/.bashrc ~/.bashrc
   ln -sfb ~/git/dotfiles/.vimrc ~/.vimrc
   mkdir -p ~/.ssh/
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
   vim -c PluginInstall
}
export -f vim_config

# vim needs to be compiled with python support for autocomplete to work
vim_from_src() {
apt remove vim vim-runtime gvim
cd ~
git clone https://github.com/vim/vim.git
cd vim

## Check Python 2 config, if you want python 3 support a lot of this needs changed...
if [ -d /usr/lib/python2.7/config-x86_64-linux-gnu ]; then
   PYCONF=/usr/lib/python2.7/config-x86_64-linux-gnu
else
   read -p "Standard python 2 config not found ( /usr/lib/python2.7/config-x86_64-linux-gnu/ )
   Please locate python 2 config and enter here: " PYCONF \
      && [ -d $PYCONF ] || (echo "$PYCONF not found, exiting." && exit 1)
fi

./configure --with-features=huge \
            --enable-multibyte \
	    --enable-rubyinterp=yes \
	    --enable-pythoninterp=yes \
	    --enable-python3interp=yes \
	    --enable-perlinterp=yes \
	    --enable-luainterp=yes \
            --enable-gui=gtk2 \
            --enable-cscope \
	    --prefix=/usr/local \
	    --with-python-config-dir=$PYCONF

make VIMRUNTIMEDIR=/usr/local/share/vim/vim81
make install
update-alternatives --install /usr/bin/editor editor /usr/local/bin/vim 1
update-alternatives --set editor /usr/local/bin/vim
update-alternatives --install /usr/bin/vi vi /usr/local/bin/vim 1
update-alternatives --set vi /usr/local/bin/vim
}


su $WHOAMI -c "bash -c home_config $USERDIR"
su $WHOAMI -c " bash -c git_config"


read -p \
   "Autocomplete (Valloric YouCompleteMe) requires vim to be compiled with
   python support.  Would you like to uninstall vim and recompile?
   (Y/N): " vimconfirm

if [[ $vimconfirm == [yY] || $vimconfirm == [yY][eE][sS] ]]; then
   vim_from_src
   su $WHOAMI -c "bash -c vim_config $USERDIR"
   python $USERDIR/.vim/bundle/YouCompleteMe/install.py --clang-completer
else
   su $WHOAMI -c "bash -c vim_config $USERDIR"
fi

