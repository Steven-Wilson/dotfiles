set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

let g:doom_one_terminal_colors = v:true
set termguicolors

call plug#begin()

"Plug 'dylanaraps/wal.vim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-orgmode/orgmode'
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
Plug 'michal-h21/vim-zettel'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'TimUntersberger/neogit'
Plug 'andreadev-it/timetrap.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'editorconfig/editorconfig-vim'

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
nnoremap <Leader>a ggVG
nnoremap <Leader>d :bdelete<CR>
nnoremap <Leader>g :Neogit<CR>

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

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

let g:vimwiki_list = [
    \ {
        \ 'path': '~/notes',
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

lua << EOF
local async = require('plenary.async')
local neogit = require('neogit')
local timetrap = require('timetrap_nvim')
neogit.setup()
timetrap.setup({
    display= {
        win_type = "float",
        border = "rounded",
    },
    prompts = "float"
})
EOF

" init.vim
lua << EOF

-- Load custom tree-sitter grammar for org filetype
require('orgmode').setup_ts_grammar()

-- Tree-sitter configuration
require'nvim-treesitter.configs'.setup {
  -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = {'org'}, -- Required for spellcheck, some LaTex highlights and code block highlights that do not have ts grammar
  },
  ensure_installed = {'org'}, -- Or run :TSUpdate org
}

require('orgmode').setup({
  org_agenda_files = {'~/Dropbox/org/*', '~/my-orgs/**/*'},
  org_default_notes_file = '~/Dropbox/org/refile.org',
})
EOF

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()OF
