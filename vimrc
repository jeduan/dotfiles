if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neoBundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle'))
NeoBundleFetch 'Shougo/neoBundle.vim', 'master'

NeoBundle 'Shougo/vimproc.vim', {
    \ 'build' : {
    \     'windows' : 'make -f make_mingw32.mak',
    \     'cygwin' : 'make -f make_cygwin.mak',
    \     'mac' : 'make -f make_mac.mak',
    \     'unix' : 'make_unix.mak',
    \   },
    \ }
"Syntax and language improvements
NeoBundleLazy 'elzr/vim-json', {'autoload': {'filetypes': ['json']}}
NeoBundle 'othree/html5.vim'
NeoBundleLazy 'moll/vim-node', {'autoload':{'filetypes':['javascript']}}
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}
NeoBundle 'plasticboy/vim-markdown'
NeoBundleLazy 'mattn/emmet-vim', {'autoload':{'filetypes':['html','css']}}
NeoBundle 'pangloss/vim-javascript'

"colorschemes
NeoBundle 'chriskempson/base16-vim'

NeoBundle 'marijnh/tern_for_vim', {'build':{'unix': 'npm install'}}
NeoBundle 'rking/ag.vim'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'JazzCore/ctrlp-cmatcher', {'build':{'unix': './install.sh'}}
NeoBundle 'myusuf3/numbers.vim'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'bling/vim-airline'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'tpope/vim-eunuch'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-vinegar'
NeoBundle 'godlygeek/tabular'
NeoBundle 'sickill/vim-pasta'
NeoBundle 'vitaly/vim-gitignore'
NeoBundle 'christoomey/vim-tmux-navigator'

call neobundle#end()

NeoBundleCheck


" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" Switch syntax highlighting on
syntax on

" Enable file type detection and do language-dependent indenting.
filetype plugin indent on

" Show line numbers
set number

" Allow hidden buffers, don't limit to 1 file per window/split
set hidden

set t_Co=256
colorscheme base16-ocean
let base16colorspace=256
set background=dark

if exists('+colorcolumn')
  set colorcolumn=80 " Color the 80th column differently as a wrapping guide.
endif
set clipboard+=unnamed " Yanks go on clipboard instead.
set autoread
set switchbuf=useopen  " Switch to an existing buffer if one exists
set iskeyword+=\$,-   " Add extra characters that are valid parts of variables
set encoding=utf-8
set noshowmode     " Don't show the mode since Airline shows it
set showcmd
set visualbell
set cursorline
set ruler
set splitright
set splitbelow
let mapleader = ","

"Indentation
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set wrap

set list
set listchars=tab:▸\ ,eol:¬,trail:·,extends:#,nbsp:·

set undofile
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set undodir=~/.vim-tmp
set nobackup
set noswapfile
set nowritebackup
"Disable auto newline
set fileformats+=dos

"" Search settings
nnoremap / /\v
vnoremap / /\v
nnoremap <silent> <leader><space> :nohlsearch<CR>
set incsearch
set hlsearch
set ignorecase
set smartcase
set gdefault           " this makes search/replace global by default
set showmatch
set matchtime=2 " How many tenths of a second to blink

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

inoremap <C-l> <C-o>l
inoremap <C-h> <C-o>h

"Hide mouse when typing
set mousehide

set history=1000
set undolevels=1000
set title

" autocomplete
au FileType html,markdown set omnifunc=htmlcomplete#CompleteTags
au FileType css set omnifunc=csscomplete#CompleteCSS

" Save when losing focus
au FocusLost * :silent! wall


" remaps
nnoremap <tab> %
vnoremap <tab> %
" set command to ; instead of :
nnoremap ; :
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

" Folds
" =====

set foldmethod=indent   " Fold based on indent
set foldnestmax=3       " Deepest fold is 3 levels
set nofoldenable        " Don't fold by default

" Completion
" ==========

set wildmode=longest,list,full
set wildmenu                    " Enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~     " Stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*.swp,*.bak,*.pyc,*.class
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set wildignore+=*.orig
set wildignore+=*.esproj
set wildignore+=*.mp3

" Scrolling
" =========

" Start scrolling when we're getting close to margins
set scrolloff=10
set sidescrolloff=15
set sidescroll=1

""""""""""""""""""" Bundle configuration
"delimitMate
" let g:delimitMate_expand_cr = 2
" let g:delimitMate_expand_space = 1
" let g:delimitMate_balance_matchpairs = 1

"""ctrlp.vim"""
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_match_window_bottom = 1
let g:ctrlp_match_window_reversed = 0

" Ensure max height isn't too large. (for performance)
let g:ctrlp_max_height = 10
let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>f :CtrlPCurWD<CR>
let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git', 'cd %s && git ls-files --cached --exclude-standard --others'],
    \ },
  \ 'fallback': 'find %s -type f'
  \ }

let g:ctrlp_custom_ignore = {
    \ 'dir': 'node_modules\|\.DS_Store$\|bower_components\|\.git$'
    \ }

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
let g:syntastic_javascript_checkers = ['jshint']

"Markdown options
let g:vim_markdown_folding_disabled=1

"gundo
" nnoremap <leader>u :GundoToggle<CR>

"airline
"always appear
set laststatus=2
let g:airline_theme='base16'
let g:airline_powerline_fonts=1
" let g:airline_detect_modified=1
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

" Neocomplete
" let g:neocomplete#enable_at_startup = 1
" let g:neocomplete#enable_smart_case = 1
" let g:neocomplete#sources#syntax#min_keyword_length = 3
" " <CR>: close popup and save indent.
" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
" function! s:my_cr_function()
"   return neocomplete#smart_close_popup() . "\<CR>"
" endfunction
" " <C-h>, <BS>: close popup and delete backword char.
" inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"

" vim-unimpaired
" Bubble multiple lines
vmap ˚ [egv
vmap ∆ ]egv

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
