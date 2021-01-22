call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'sbdchd/neoformat'
Plug 'vim-vdebug/vdebug'
Plug 'dylanaraps/wal.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

source ~/.config/nvim/cocrc.vim

filetype plugin indent on
syntax on
set hidden
set noswapfile
set relativenumber
colorscheme wal

let $RTP=split(&runtimepath, ',')[0]
let $RC="$HOME/.config/nvim/init.vim"

set path=.,**
