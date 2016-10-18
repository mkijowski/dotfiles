# vimrc
# This repository contains my ~/.vimrc file which I will keep updated here.
# Usage instructions:
# 
# Step 1: Install prerequisites: git, python-dev, python3-dev, build-essentials, cmake
```
sudo apt-get install git python-dev python3-dev build-essential cmake
```
# Step 2: Clone this repo with other bundled repositories (includes vundle)
```
git clone https://github.com/mkijowski/dotfiles.git ~/
```
# Step 3: Open vim, ignore errors, install plugins using :PluginInstall
```
vim -c 'PluginInstall'
```
# Step 4: upon completion, exit vim and run the following
```
python ~/.vim/bundle/YouCompleteMe/install.py --clang-completer
```
# Step 5: Enjoy!
