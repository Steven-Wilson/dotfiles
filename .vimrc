set nocompatible

set shell=sh

filetype plugin on
syntax on

set background=dark
colorscheme doom-one

set ignorecase
set hlsearch
set incsearch
set smartcase

set noerrorbells
set novisualbell
set t_vb=

set clipboard=unnamed
map <silent> <C-N> :let @/=<CR>

set history=1000

set shortmess+=filmnroOtT
set autowrite

set scrolloff=10
set sidescrolloff=10
set sidescroll=1

set formatoptions=l
set lbr
set showbreak=\|

set list listchars=tab:\ \ ,trail:~
set nf=octal,hex,alpha

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

set smarttab
set smartindent
set autoindent

set textwidth=0
set wrapmargin=0

set noswapfile
set nobackup
set nowb
set autoread

set hidden
set number
set backspace=indent,eol,start
set showcmd
set showmode
set laststatus=2
set lazyredraw

set splitbelow
set splitright

set wildmode=list:longest
set wildmenu
set wildignore=*.so,*.app,*.exe,*.lib,*.dll

set notimeout
set ttimeout

set ruler
set title

nnoremap <C-a> ggVG


