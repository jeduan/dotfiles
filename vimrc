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
NeoBundle 'othree/html5.vim'
NeoBundleLazy 'elzr/vim-json', {'autoload': {'filetypes': ['json']}}
NeoBundleLazy 'mattn/emmet-vim', {'autoload': {'filetypes': ['html','css']}}
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'pangloss/vim-javascript'
NeoBundleLazy 'mxw/vim-jsx', {'autoload': {'filetypes': 'javascript'}}

"colorschemes
NeoBundle 'chriskempson/base16-vim'
NeoBundle 'yosiat/oceanic-next-vim'

NeoBundle 'Valloric/YouCompleteMe', {'build': {'unix' : './install.py'}}
NeoBundle 'marijnh/tern_for_vim', {'build':{'unix': 'npm install'}}
NeoBundle 'rking/ag.vim'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'JazzCore/ctrlp-cmatcher', {'build': {'unix': './install.sh'}}
NeoBundle 'myusuf3/numbers.vim'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'tpope/vim-eunuch'
NeoBundle 'tpope/vim-fugitive', { 'augroup' : 'fugitive'}
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-vinegar'
NeoBundle 'sickill/vim-pasta'
NeoBundle 'rdolgushin/gitignore.vim'
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
" colorscheme OceanicNext
let base16colorspace=256
set background=dark

if exists('+colorcolumn')
  set colorcolumn=80 " Color the 80th column differently as a wrapping guide.
endif
set clipboard+=unnamed " Yanks go on clipboard instead.
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

" autocmd on BufWritePre
" autocmd BufWritePre * :call StripTrailingWhitespace()
" Since autoread does not work outside of gui-vim version

"" check file change every 4 seconds ('CursorHold') and reload the buffer upon detecting change
set autoread
au CursorHold * checktime "this should trigger autoread

" remaps
nnoremap <tab> %
vnoremap <tab> %
" set command to ; instead of :
nnoremap ; :

" c-c is now esc
inoremap <C-c> <ESC>
inoremap jk <ESC>
inoremap ;; <C-o>A;

nnoremap C ddO
nnoremap <leader><leader><leader> <c-^>
imap <c-f> function<space>()<c-o>i
cnoremap <expr> %% expand('%:h').'/'

nnoremap <leader>r :! chrome-cli reload<cr><cr>

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
set wildignore+=*.mp3

" Scrolling
" =========

" Start scrolling when we're getting close to margins
set scrolloff=5
set sidescrolloff=15
set sidescroll=1

" Rename current file
" =======================

function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
nnoremap <leader>n :call RenameFile()<cr>

""""""""""""""""""" Bundle configuration

"""ctrlp.vim"""
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_match_window_bottom = 1
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_reuse_window = 'netrw'
let g:ctrlp_switch_buffer = 'et'

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
let g:syntastic_javascript_checkers = ['eslint']

"Markdown options
let g:vim_markdown_folding_disabled=1

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

" vim-unimpaired
" Bubble multiple lines
vmap ˚ [egv
vmap ∆ ]egv

"netrw
let g:netrw_liststyle = 3
let g:netrw_list_hide = ".git,.sass-cache,.jpg,.png,.svg,.DS_Store"
let g:netrw_preview = 1

" Enable JSX in .js files too
let g:jsx_ext_required = 0

