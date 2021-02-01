call plug#begin()
Plug 'dylanaraps/wal.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sbdchd/neoformat'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'vim-vdebug/vdebug'
call plug#end()

let mapleader = ","

set nocompatible
filetype plugin indent on
syntax on
set hidden
set noswapfile
set number
set relativenumber
colorscheme wal

let $RTP=split(&runtimepath, ',')[0]
let $RC="$HOME/.config/nvim/init.vim"

set path=.,**

" Mapping to open current folder
nnoremap <leader>cf :find <C-R>=expand("%:p:h")<CR><CR>

source ~/.config/nvim/cocrc.vim
