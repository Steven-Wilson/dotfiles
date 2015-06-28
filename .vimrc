set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tomasr/molokai'
Plugin 'fatih/vim-go'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'

call vundle#end()
filetype plugin indent on

syntax on

set term=xterm-256color
set background=dark
colorscheme molokai

set laststatus=2
set showcmd
set lazyredraw

set ignorecase
set hlsearch
set incsearch
set smartcase

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
set showbreak=~~~~~~~~~~~>

set list listchars=tab:\ \ ,trail:~

set nf=octal,hex,alpha

set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
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

let mapleader=","
nnoremap <Leader><space> :nohl<CR>
inoremap jk <esc>

set ruler
set title

nno <C-Tab> :bn<CR>
nnoremap <C-a> ggVG

let g:ctrlp_map = '<c-p>'
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path = 0
"
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

"let g:neocomplete#enable_at_startup = 1
"let g:neocomplete#enable_camel_case = 1
"let g:neocomplete#enable_smart_case = 1
"let g:neocomplete#enable_fuzzy_completion = 1
"inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

"let g:gundo_right = 1
"let g:gundo_preview_height = 15
"let g:gundo_help = 0
"nnoremap <F5> :GundoToggle<CR>

let g:airline#extensions#tabline#enabled=1

let g:go_fmt_command = "goimports"
set ff=unix
