set nocompatible

if &shell =~# 'fish$'
    set shell=sh
endif

filetype plugin on
syntax on

"set term=xterm-256color
set background=dark
colorscheme termschool

set laststatus=2
set showcmd
set lazyredraw

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

set scrolloff=7
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

set splitbelow
set splitright

set wildmode=list:longest
set wildmenu
set wildignore=*.dll,*.lib,*.exe,*.obj,*.sas7*

set notimeout
set ttimeout

set ruler
set title
nnoremap <C-a> ggVG

