call plug#begin()

" List your plugins here
Plug 'tpope/vim-sensible'
Plug 'ggml-org/llama.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'dense-analysis/ale' 
Plug 'junegunn/seoul256.vim'
Plug 'preservim/nerdtree'

call plug#end()

if executable('standardrb')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'standardrb',
        \ 'cmd': ['standardrb', '--lsp'],
        \ 'allowlist': ['ruby'],
        \ })
endif

let g:ale_linters = {'ruby': ['standardrb']}
let g:ale_fixers = {'ruby': ['standardrb']}
let g:ale_fix_on_save = 1  " Enable fix on save

au BufNewFile,BufRead .env setlocal filetype=conf
let g:ale_linter_aliases = {'conf': []}

colo seoul256

set number

" Create directory if it doesn't exist
silent !mkdir -p ~/.vim/swap
" Set swap file directory
set directory=~/.vim/swap//
