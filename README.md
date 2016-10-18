This repository contains my ~/.vimrc file which I will keep updated here.
Usage instructions:

Step 1: Install prerequisites:
```
sudo apt-get install vim git python-dev python3-dev build-essential cmake
```
Step 2: Clone this repo with other bundled repositories (includes vundle)
```
git clone --recursive https://github.com/mkijowski/dotfiles.git ~/
```
note: you may need to update the Vundle repo depending on how long it's been since I've updated this repo
```
git submodule update --remote
```
Step 3: Open vim, ignore errors, install plugins using :PluginInstall
```
vim -c 'PluginInstall'
```
 Step 4: upon completion, exit vim and run the following
```
python ~/.vim/bundle/YouCompleteMe/install.py --clang-completer
```
Step 5: Enjoy!
