
if !has("compatible")
    "Vundle Setting  
    set nocompatible              " be iMproved, required
    filetype off                  " required
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'fatih/vim-go'
    call vundle#end()            " required
endif

syntax on
filetype plugin indent on
set enc=utf8
set fileencodings=utf8,big5,euc-jp,gbk,euc-kr,utf-bom,iso8859-1
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set cindent
set autoindent
set bg=dark
set t_Co=256
set autochdir

map <C-n> :tabnext<CR>
map <C-p> :tabprev<CR>
map <f9> :Tlist<CR>
