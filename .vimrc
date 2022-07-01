" Starting vim-plug
call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

Plug 'LnL7/vim-nix'

" Initialize plugin system
call plug#end()

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
