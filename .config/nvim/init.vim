set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

let g:doom_one_terminal_colors = v:true
set termguicolors

call plug#begin()

Plug 'psf/black', { 'branch': 'stable' }
Plug 'dense-analysis/ale'
Plug 'scrooloose/syntastic'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dag/vim-fish'
Plug 'vimwiki/vimwiki'
Plug 'romgrk/doom-one.vim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'TimUntersberger/neogit'
Plug 'Pocco81/auto-save.nvim'

call plug#end()

set nocompatible

set shell=sh

filetype plugin on
syntax on

let mapleader=" "

set background=dark
colorscheme doom-one

set ignorecase
set hlsearch
set incsearch
set smartcase

set noerrorbells
set novisualbell
set t_vb=

set clipboard=unnamedplus
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
set relativenumber
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


nnoremap <Leader><space> :nohl<CR>


nnoremap <Leader>nn :ZettelNew<space>
nnoremap <Leader>nf :ZettelOpen<CR>
nnoremap <Leader>np :ZettelInsertNote<CR>
nnoremap <Leader>ni ggVGd:ZettelInbox<CR>

nnoremap <Leader>- :sp<CR>
nnoremap <Leader>\| :vs<CR>
nnoremap <Leader>o :on<CR>
nnoremap <Leader>q ZZ<CR>

nnoremap <Leader>r :source ~/.config/nvim/init.vim<CR>
nnoremap <Leader>s :w<CR>
onoremap <Leader>a ggVG
nnoremap <Leader>d :bd<CR>
nnoremap <Leader>g :Neogit<CR>
nnoremap <C-K> :m -2<CR>
nnoremap <C-J> :m +1<CR>

" Navigate Through buffers
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <Leader>[ :bprevious<CR>
nnoremap <Leader>] :bnext<CR>
nnoremap <Leader>t :enew<CR>

" Navigate through splits
nnoremap <Leader>h :wincmd h<CR>
nnoremap <Leader>j :wincmd j<CR>
nnoremap <Leader>k :wincmd k<CR>
nnoremap <Leader>l :wincmd l<CR>

nnoremap <leader>b :ALEFix<CR>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

tnoremap <Leader>[ <C-\><C-n>:bprevious<CR>
tnoremap <Leader>] <C-\><C-n>:bnext<CR>
tnoremap <Leader>h <C-\><C-n>:wincmd h<CR>
tnoremap <Leader>j <C-\><C-n>:wincmd j<CR>
tnoremap <Leader>k <C-\><C-n>:wincmd k<CR>
tnoremap <Leader>l <C-\><C-n>:wincmd l<CR>


let g:ale_fixers = ['black']
let g:vimwiki_list = [
    \ {
        \ 'path': '~/notes',
        \ 'syntax': 'markdown',
        \ 'ext': '.md',
        \ 'auto_tags': 1,
        \ 'auto_toc': 1 },
    \ ]

let g:vimwiki_mouse = 1
let g:vimwiki_auto_chdir = 1

let g:ctrlp_map = '<c-p>'
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path = 0
let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll)$',
    \ }

let g:airline_theme='onedark'

set ff=unix
set cursorline

autocmd TermOpen,BufWinEnter,WinEnter term://* startinsert


lua << EOF
local async = require('plenary.async')
local neogit = require('neogit')
require('telescope').setup{ defaults = { file_ignore_patterns = { "__pycache__" } } }
EOF

