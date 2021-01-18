call plug#begin()
Plug 'tpope/vim-sensible'
" Using plug
Plug 'dylanaraps/wal.vim'
call plug#end()

filetype plugin indent on
syntax on
set hidden
set noswapfile
set relativenumber
set cursorline
colorscheme wal

let $RTP=split(&runtimepath, ',')[0]
let $RC="$HOME/.config/nvim/init.vim"

set path=.,**
