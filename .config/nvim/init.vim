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

nnoremap <Leader><space> :nohl<CR>

nnoremap <Leader>g :Neogit<CR>

nnoremap <Leader>nn :ZettelNew<space>

nmap <silent> <A-h> :wincmd h<CR>
nmap <silent> <A-j> :wincmd j<CR>
nmap <silent> <A-k> :wincmd k<CR>
nmap <silent> <A-l> :wincmd l<CR>

imap <silent> <A-h> <ESC>:wincmd h<CR>
imap <silent> <A-j> <ESC>:wincmd j<CR>
imap <silent> <A-k> <ESC>:wincmd k<CR>
imap <silent> <A-l> <ESC>:wincmd l<CR>

vmap <silent> <A-h> <ESC>:wincmd h<CR>
vmap <silent> <A-j> <ESC>:wincmd j<CR>
vmap <silent> <A-k> <ESC>:wincmd k<CR>
vmap <silent> <A-l> <ESC>:wincmd l<CR>

" Resize
nmap <silent> <A-H> 3<C-W><
nmap <silent> <A-J> 3<C-W>+
nmap <silent> <A-K> 3<C-W>-
nmap <silent> <A-L> 3<C-W>>

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

let g:vimwiki_list = [
    \ {
        \ 'path': '~/notes/todo',
        \ 'syntax': 'markdown',
        \ 'ext': '.md',
        \ 'auto_tags': 1,
        \ 'auto_toc': 1 },
    \ {
        \ 'path': '~/notes/fleeting',
        \ 'syntax': 'markdown',
        \ 'ext': '.md',
        \ 'auto_tags': 1,
        \ 'auto_toc': 1 },
    \ {
        \ 'path': '~/notes/zettel',
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

lua << EOF
local neogit = require('neogit')
neogit.setup()
EOF

