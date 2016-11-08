" ---------------------------------- "
" Vim-Plug 
" ---------------------------------- "
" Autoload Vim-Plug
"if empty(glob('~/.vim/autoload/plug.vim'))
"  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs --insecure https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"  autocmd VimEnter * PlugInstall | source $MYVIMRC
"endif
" Load plugins with Vim-Plug 
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'majutsushi/tagbar'
Plug 'scrooloose/syntastic'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'ervandew/supertab'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'kien/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'jnurmine/Zenburn'
Plug 'altercation/vim-colors-solarized'
Plug 'jmcantrell/vim-virtualenv'
"Plug 'davidhalter/jedi-vim'
call plug#end()

"let g:jedi#auto_initialization = 1
"let g:jedi#auto_close_doc = 1
"let g:jedi#popup_on_dot = 0
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
" Configure Ultisnip
" ---------------------------------- "
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" ---------------------------------- "
" Configure YouCompleteMe
" ---------------------------------- "
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string
let g:ycm_autoclose_preview_window_after_completion = 1 " Close preview window after completion

let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-j>'

" Goto definition with F3
map <F3> :YcmCompleter GoTo(CR)

" ---------------------------------- "
" Configure Syntastic 
" ---------------------------------- "
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_loc_list_height = 3
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" ---------------------------------- "
" Configure Airline
" ---------------------------------- "
let g:airline#extensions#tabline#enabled = 1
set laststatus=2

" ---------------------------------- "
" Common
" ---------------------------------- "
" Split control
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Syntax highlighting
let python_highlight_all=1
syntax on

" Python PEP8
au BufNewFile,BufRead *.py set tabstop=4
au BufNewFile,BufRead *.py set softtabstop=4
au BufNewFile,BufRead *.py set shiftwidth=4
au BufNewFile,BufRead *.py set textwidth=79
au BufNewFile,BufRead *.py set expandtab
au BufNewFile,BufRead *.py set autoindent
au BufNewFile,BufRead *.py set fileformat=unix

" Folding based on indentation
au FileType python set foldmethod=indent
set foldlevelstart=99
set foldnestmax=2
nnoremap <space> za " Enable folding with the spacebar

" Flag unnecessary whitespace
highlight BadWhitespace ctermbg=red guibg=red
au BufNewFile,BufRead *.py match BadWhitespace /\s\+$/

" Tab for web
au BufNewFile,BufRead *.js, *.html, *.css set tabstop=2
au BufNewFile,BufRead *.js, *.html, *.css set softtabstop=2
au BufNewFile,BufRead *.js, *.html, *.css set shiftwidth=2

" Set the default file encoding to utf-8
set encoding=utf-8

" Show linenumber
set nu

" Colorscheme
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif

" Run python code
au FileType python nnoremap <F9> :w !python<cr>
