set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

call plug#begin()

Plug 'vimwiki/vimwiki'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'michal-h21/vim-zettel'
Plug 'blankname/vim-fish'
Plug 'ctrlpvim/ctrlp.vim'

call plug#end()


let mapleader=" "

nnoremap <Leader><space> :nohl<CR>

" Create a new empty note with a title
nnoremap <Leader>nn :ZettelNew<space>

" Link to existing note
nnoremap <Leader>nl :ZettelSearch<CR>

" Open an existing note
nnoremap <Leader>no :ZettelOpen<CR>

" Insert a backlinks section
nnoremap <Leader>nb :ZettelBackLinks<CR>

" Insert an inbox section
nnoremap <Leader>nm :ZettelInbox<CR>

" Inset a tags section with all of the tags
nnoremap <Leader>nt :ZettelGenerateTags<CR>


" Window Motions in Normal Mode
nmap <silent> <A-h> :wincmd h<CR>
nmap <silent> <A-j> :wincmd j<CR>
nmap <silent> <A-k> :wincmd k<CR>
nmap <silent> <A-l> :wincmd l<CR>

" Window Motions in Insert mode
imap <silent> <A-h> <ESC>:wincmd h<CR>
imap <silent> <A-j> <ESC>:wincmd j<CR>
imap <silent> <A-k> <ESC>:wincmd k<CR>
imap <silent> <A-l> <ESC>:wincmd l<CR>

" Window Motions in Visual mode
vmap <silent> <A-h> <ESC>:wincmd h<CR>
vmap <silent> <A-j> <ESC>:wincmd j<CR>
vmap <silent> <A-k> <ESC>:wincmd k<CR>
vmap <silent> <A-l> <ESC>:wincmd l<CR>

" Open Splits
nmap <silent> <A-Right> :vs<CR>
imap <silent> <A-Right> <ESC>:vs<CR>
vmap <silent> <A-Right> <ESC>:vs<CR>
nmap <silent> <A-Down> :sp<CR>
imap <silent> <A-Down> <ESC>:sp<CR>
vmap <silent> <A-Down> <ESC>:sp<CR>

" Resize Splits
nmap <silent> <A-H> 3<C-W><
nmap <silent> <A-J> 3<C-W>+
nmap <silent> <A-K> 3<C-W>-
nmap <silent> <A-L> 3<C-W>>


let g:vimwiki_list = [ { 'path': '~/notes/', 'syntax': 'markdown', 'ext': '.md', 'auto_tags': 1, 'auto_toc': 1} ]
let g:vimwiki_mouse = 1
"let g:vimwiki_folding = 'expr'
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
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

set ff=unix

