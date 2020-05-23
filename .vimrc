set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins "call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'fugitive.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'Tagbar'
Plugin 'edkolev/tmuxline.vim'

set rtp+=~/.vim/bundle/*

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


"""""""""""" Done with plugins, move onto real stuff now """"""""""""""""""

" "Defaults" now that Vim 8.1 has different behavior

set backspace=indent,eol,start
set history=50                      " keep 50 lines of command line history
set ruler                           " show the cursor position all the time
set showcmd                         " display incomplete commands
set incsearch                       " do incremental searching

filetype on
syntax on

set noshowmode

set background=dark
set autoindent
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set nowrap
set number
set splitright
set splitbelow
set hlsearch

" Helps ctrlp search without complaining
set maxmempattern=2000

" Making my custom map leader a comma
let mapleader = ","

""""""""""""""""""""""""""""" Mappings """""""""""""""""""""""""""""""""""""

nmap <Bar> :vsp<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nmap <leader>f :lvimgrep <cword> % \| lwin<CR>
nmap <leader>F :execute 'vimgrep <cword> `find ' . g:gPath . ' -name \*.cpp -o -name \*.h` \| cwin'<CR>
