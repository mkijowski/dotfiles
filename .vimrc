set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()
 " alternatively, pass a path where Vundle should install plugins
 "call vundle#begin('~/some/path/here')

Plugin 'VundleVim/Vundle.vim'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sensible'
Bundle 'https://github.com/m-kat/aws-vim'
Plugin 'scrooloose/nerdtree',{'on':'NERDTreeToggle'}
Plugin 'jistr/vim-nerdtree-tabs'

" Color Schemes
Plugin 'flazz/vim-colorschemes'
Plugin 'roosta/vim-srcery'
Plugin 'notpratheek/vim-luna'
Plugin 'lifepillar/vim-solarized8'

" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'

" " Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'

" " git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'

" " The sparkup vim script is in a subdirectory of this repo called vim.
" " Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" " Install L9 and avoid a Naming conflict if you've already installed a
" " different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
"
" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" " To ignore plugin indent changes, instead use:
" "filetype plugin on
" "
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line

colorscheme molokai 

let python_highlight_all=1
syntax on
set nu
set hidden               " Use hidden buffers
set ignorecase           " Ignore case when searching...
set smartcase " ...unless the search is mixed case
set nostartofline " Don't move to the beginning of a line when jumping
set shiftwidth=4         " Indent in 4-character wide chunks
set showcmd " Show commands in the cmd area
set shortmess=a
set cmdheight=2 " Keep vim from saying 'Press Enter to continue'

" Ignore binary files in the standard vim file finder
set wildignore+=*.pyc,*.obj,*.bin,a.out
"
" " <Leader>w to write
map <silent> <Leader>w :w<CR>
map <silent> <Leader>W :w!<CR>
"
" " <Leader>q to quit
map <silent> <Leader>q :qall<CR>
map <silent> <Leader>Q :qall!<CR>
"
" " <Leader>c to close a window
map <silent> <Leader>c :close<CR>
