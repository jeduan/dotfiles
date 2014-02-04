set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

"Syntax and language improvements
Bundle 'digitaltoad/vim-jade'
Bundle 'elzr/vim-json'
Bundle 'kchmck/vim-coffee-script'
Bundle 'moll/vim-node'
Bundle 'mustache/vim-mustache-handlebars'
Bundle 'othree/html5.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'tpope/vim-markdown'

"colorschemes
Bundle 'chriskempson/base16-vim'
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'MaxSt/FlatColor'

Bundle 'marijnh/tern_for_vim'
Bundle 'AndrewRadev/switch.vim'
Bundle 'rking/ag.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'JazzCore/ctrlp-cmatcher'
Bundle 'tacahiroy/ctrlp-funky'
Bundle 'myusuf3/numbers.vim'
Bundle 'tomtom/tcomment_vim'
Bundle 'Raimondi/delimitMate'
Bundle 'Valloric/YouCompleteMe'
Bundle 'majutsush/tagbar'
Bundle 'scrooloose/syntastic'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'bling/vim-airline'
Bundle 'sjl/gundo.vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'editorconfig/editorconfig-vim'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-eunuch'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'godlygeek/tabular'
Bundle 'sickill/vim-pasta'

colorscheme base16-ocean
let base16colorspace=256
set background=dark

" mucho robado de http://stevelosh.com/blog/2010/09/coming-home-to-vim
filetype plugin indent on
set modelines=0
syntax on

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set shiftround
set smarttab

if exists('+colorcolumn')
  set colorcolumn=80 " Color the 80th column differently as a wrapping guide.
endif

" set clipboard+=unnamed " Yanks go on clipboard instead.
set cf                 " Enable error files & error jumping.
set autowrite          " Writes on make/shell commands
"Reload files when they change on disk
set autoread
set nofoldenable       " Disable folding entirely.
set foldlevelstart=99  " I really don't like folds.
set gdefault           " this makes search/replace global by default
set switchbuf=useopen  " Switch to an existing buffer if one exists
set iskeyword+=\$,-   " Add extra characters that are valid parts of variables
set nostartofline      " Don't go to the start of the line after some commands

set number
set encoding=utf-8
set scrolloff=3
set smartindent
set autoindent
set noshowmode     " Don't show the mode since Powerline shows it
set showcmd
set hidden
set wildmenu
set wildmode=list:longest,full
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
"set cursorcolumn

set undofile
set undodir=~/.vim/tmp/undo//
set directory=~/.vim/tmp/swap//
set nobackup
set noswapfile

let mapleader = ","
nnoremap / /\v
vnoremap / /\v
nnoremap <silent> <leader><space> :nohlsearch<CR>
set ignorecase
set smartcase
set gdefault
set incsearch
set hlsearch
set showmatch
set matchtime=2 " How many tenths of a second to blink
nnoremap <tab> %
vnoremap <tab> %

set wrap
set formatoptions=crql
set list
set listchars=tab:▸\ ,eol:¬,trail:.,extends:#,nbsp:.

" Deactivate cursor keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" Navigate line holding CTRL
inoremap <C-h> <C-o>h
inoremap <C-j> <C-o>gj
inoremap <C-k> <C-o>gk
inoremap <C-l> <C-o>l

" set command to ; instead of :
nnoremap ; :
"Hide mouse when typing
set mousehide

set history=1000
set undolevels=1000
set wildignore+=*.swp,*.bak,*.pyc,*.class
set wildignore+=.git
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set wildignore+=*.DS_Store,Icon?
set wildignore+=*.orig
set wildignore+=node_modules
set wildignore+=bower_components
set wildignore+=*.esproj
set title

" filetypes
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,Procfile,config.ru,*.rake} set ft=ruby
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown
au BufRead,BufNewFile {build.settings} set ft=lua

" filetypes:lua
au FileType lua setl sw=2 ts=2 noet
let g:lua_check_syntax = 0
let g:lua_complete_omni = 1

" autocomplete
au FileType html set omnifunc=htmlcomplete#CompleteTags
au FileType css set omnifunc=csscomplete#CompleteCSS
au FileType coffee nnoremap <leader>pc :! pcoffee %<space>


" Quickly edit/reload the vimrc file
nnoremap <leader>ev :tabe $MYVIMRC<cr>

" Strip trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" jj is now esc
inoremap jj <ESC>
inoremap jk <ESC>
inoremap ;; <C-o>A;

nnoremap C ddO
nnoremap <leader><leader><leader> <c-^>

" Easy window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" double percentage sign in command mode is expanded
" to directory of current file - http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" Save when losing focus
au FocusLost * :silent! wall

""""""""""""""""""" Bundle configuration
"delimitMate
let delimitMate_expand_cr = 1

"""ctrlp.vim"""
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_match_window_bottom = 1
let g:ctrlp_match_window_reversed = 0

" Ensure max height isn't too large. (for performance)
let g:ctrlp_max_height = 10
let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>f :CtrlPCurWD<CR>
nnoremap <leader>F :CtrlP %%<CR>
nnoremap <leader>d :CtrlPFunky<CR>
nnoremap <leader>m :CtrlPMRUFiles<CR>

"syntastic
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': ['scss','html'] }
let g:syntastic_check_on_wq = 0
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1

"gundo
nnoremap <leader>u :GundoToggle<CR>

"airline
let g:airline_theme='molokai'
let g:airline_powerline_fonts=1
let g:airline_detect_modified=1
let g:airline_mode_map = {
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'v'  : 'V',
      \ 'V'  : 'VL',
      \ 'c'  : 'CMD',
      \ '' : 'VB',
      \ }


" Ack
nnoremap <leader>ag :Ag! "<cword>"<cr>

"YouCompleteMe
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview
" let g:ycm_complete_in_comments = 1
" let g:ycm_collect_identifiers_from_comments_and_strings = 1
" let g:ycm_filetype_specific_completion_to_disable = {
"     \ 'ruby' : 1,
"     \ 'coffeescript' : 1,
"     \}

" vim-unimpaired
" Bubble single lines
nmap ˚ [e
nmap ∆ ]e

" Bubble multiple lines
vmap ˚ [egv
vmap ∆ ]egv

" vim-surround
let g:surround_{char2nr("h")} = "{{\r}}"
let g:surround_{char2nr("#")} = "{{#\1helper: \1}}\r{{/\1\1}}"

"Tagbar
nnoremap <leader>t :TagbarToggle<CR>

if executable('coffeetags')
  let g:tagbar_type_coffee = {
      \ 'ctagsbin' : 'coffeetags',
      \ 'ctagsargs' : '',
      \ 'kinds' : [
      \ 'f:functions',
      \ 'o:object',
      \ ],
      \ 'sro' : ".",
      \ 'kind2scope' : {
      \ 'f' : 'object',
      \ 'o' : 'object',
      \ }
      \ }
endif
let g:tagbar_type_html = {
    \ 'kinds' : [
        \ 'f:JavaScript functions',
        \ 'a:named anchors',
    \ ],
\ }

"EasyMotion
let g:EasyMotion_leader_key = '<Space>'

" switch.vim
let g:switch_custom_definitions=[
\        ['on', 'off'],
\        ['0', '1'],
\        ['yes', 'no'],
\        ['before', 'after'],
\        ['visible', 'hidden'],
\        ['block', 'none'],
\        ['!important', '/*!important*/']
\]
nmap - :Switch<CR>

"netrw
let g:netrw_liststyle = 3
let g:netrw_list_hide = ".git,.sass-cache,.jpg,.png,.svg,.DS_Store"
let g:netrw_preview = 1

"mustache
let g:mustache_abbreviations=1

"Tabularize
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>
