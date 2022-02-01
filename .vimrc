" Helps force plug-ins to load correctly it is turned back on
filetype off

" Turn on syntax highlighting
syntax on

" For plug-ins to load correctly
filetype plugin indent on

" Speed up scrolling in Vim
set ttyfast

" Show line numbers
set number relativenumber

" Encoding
set encoding=utf-8

" Highlight matching search patterns
set hlsearch

" Use jk to quickly escape back to normal mode 
imap jk <Esc>

" Default identation
set tabstop=4
set expandtab
set shiftwidth=4
set autoindent
set smartindent
set modeline

" Map leader
let mapleader = ","

" Syntax highlighting simple
autocmd BufNewFile,BufReadPost ~/.xmobarrc setl filetype=haskell
autocmd BufNewFile,BufReadPost ~/.xinitrc setl filetype=bash
autocmd BufNewFile,BufReadPost ~/.mutt/account* setl filetype=muttrc
