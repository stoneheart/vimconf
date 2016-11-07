" ---------------------------------- "
" Vim-Plug 
" ---------------------------------- "
" Autoload Vim-Plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif
" Load plugins with Vim-Plug 
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'majutsushi/tagbar'
Plug 'scrooloose/syntastic'
Plug 'sheerun/vim-polyglot'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'ervandew/supertab'
"Plug 'tmhedberg/SimpylFold'
Plug 'jiangmiao/auto-pairs'
"Plug 'scrooloose/nerdcommenter'
"Plug 'jistr/vim-nerdtree-tabs'
"Plug 'kien/ctrlp.vim'
"Plug 'vim-scripts/indentpython.vim'
"Plug 'nvie/vim-flake8'
Plug 'vim-airline/vim-airline'
Plug 'jnurmine/Zenburn'
Plug 'altercation/vim-colors-solarized'
"Plug 'jmcantrell/vim-virtualenv'
call plug#end()

" ---------------------------------- "
" Configure NERDTree
" ---------------------------------- "
" Ignore files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$']

" Open NERDTree with Ctrl-n
map <C-n> :NERDTreeToggle<CR>

" Close Vim if the only window left open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ---------------------------------- "
" Configure Tagbar
" ---------------------------------- "
" Open Tagbar with F8
map <F8> :TagbarToggle<CR>

" ---------------------------------- "
" Configure Ultisnip and YouCompleteMe
" ---------------------------------- "
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" ---------------------------------- "
" Configure YouCompleteMe
" ---------------------------------- "
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string
let g:ycm_autoclose_preview_window_after_completion = 1 " Close preview window after completion

let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-j>'

" Goto definition with F3
map <F3> :YcmCompleter GoTo(CR)

"show the docstrings for folded code
"let g:SimpylFold_docstring_preview=1
"autocomplete

"split control
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"folding based on indetntation
autocmd FileType python set foldmethod=indent
"enable folding with the spacebar
nnoremap <space> za

"python PEP8
au BufNewFile,BufRead *.py
  \ set tabstop=4 |
  \ set softtabstop=4 |
  \ set shiftwidth=4 |
  \ set textwidth=79 |
  \ set expandtab |
  \ set autoindent |
  \ set fileformat=unix

"flag unnecessary whitespace
highlight BadWhitespace ctermbg=red guibg=red
au BufNewFile,BufRead *.py match BadWhitespace /\s\+$/

"tab for web
au BufNewFile,BufRead *.js, *.html, *.css
  \ set tabstop=2 |
  \ set softtabstop=2 |
  \ set shiftwidth=2

"set the default file encoding to utf-8
set encoding=utf-8

"syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_loc_list_height = 3
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

"full syntax highlighting
let python_highlight_all=1
syntax on

set nu
set laststatus=2

if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif

autocmd FileType python nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>
