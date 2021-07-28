set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

call plug#begin()

Plug 'vimwiki/vimwiki'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'michal-h21/vim-zettel'
Plug 'blankname/vim-fish'
Plug 'ctrlpvim/ctrlp.vim'

call plug#end()

let mapleader=","
nnoremap <Leader><space> :nohl<CR>
nnoremap <Leader>zo :ZettelOpen<CR>
nnoremap <Leader>zi :ZettelInsertNote<CR>
nnoremap <Leader>zc :ZettelCapture<CR>
nnoremap <Leader>zb :ZettelBackLinks<CR>
nnoremap <Leader>zm :ZettelInbox<CR>
nnoremap <Leader>zn :ZettelNew<space>
nnoremap <Leader>zt :ZettelGenerateTags<CR>
nnoremap <Leader>zs :ZettelSearch<CR>
nnoremap <Leader>zy :ZettelYankName<CR>

"imap <silent> [[ [[<esc><Plug>ZettelSearchMap


let g:vimwiki_list = [ { 'path': '~/notes/', 'syntax': 'markdown', 'ext': '.md', 'auto_tags': 1, 'auto_toc': 1} ]
let g:vimwiki_mouse = 1
"let g:vimwiki_folding = 'expr'
let g:vimwiki_auto_chdir = 1
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let g:vimwiki_markdown_link_ext = 1

let g:zettel_options = [{"front_matter" : {"tags" : ""}, "template" :  "~/Templates/zettel.tpl"}]

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

