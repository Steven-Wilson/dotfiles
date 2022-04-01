set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

let g:doom_one_terminal_colors = v:true
set termguicolors

call plug#begin()

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

call plug#end()

source ~/.vimrc

let mapleader=" "

nnoremap <C-a> ggVG

nnoremap <Leader><space> :nohl<CR>


nnoremap <Leader>nn :ZettelNew<space>
nnoremap <Leader>ni ggVGd:ZettelGenerateLinks<CR>

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
        \ 'syntax': 'markdown',
        \ 'ext': '.md',
        \ 'auto_tags': 1,
        \ 'auto_toc': 1 },
    \ ]

let g:vimwiki_mouse = 1
let g:vimwiki_auto_chdir = 1
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let g:vimwiki_markdown_link_ext = 1
let g:taskwiki_markup_syntax = 'markdown'
let g:markdown_folding = 1

let g:ctrlp_map = '<c-p>'
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path = 0
let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll)$',
    \ }

set ff=unix
set cursorline

lua << EOF
local async = require('plenary.async')
local neogit = require('neogit')
neogit.setup()
EOF

