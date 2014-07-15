if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neoBundle.vim/
endif


call neobundle#begin(expand('~/.vim/bundle'))
NeoBundleFetch 'Shougo/neoBundle.vim', 'master'

"Syntax and language improvements
NeoBundle 'elzr/vim-json'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'moll/vim-node'
NeoBundle 'mustache/vim-mustache-handlebars'
NeoBundle 'othree/html5.vim'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'tpope/vim-markdown'

"colorschemes
NeoBundle 'chriskempson/base16-vim'

NeoBundle 'marijnh/tern_for_vim'
NeoBundle 'AndrewRadev/switch.vim'
NeoBundle 'rking/ag.vim'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'JazzCore/ctrlp-cmatcher', {
              \ 'build': {
              \       'unix': './install.sh',
              \   },
              \ }
"NeoBundle 'tacahiroy/ctrlp-funky'
NeoBundle 'myusuf3/numbers.vim'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'scrooloose/syntastic'
" NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'bling/vim-airline'
NeoBundleLazy 'sjl/gundo.vim', {
    \   'autoload': { 'commands': 'GundoToggle' }
    \ }
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-eunuch'
NeoBundle 'tpope/vim-fugitive', { 'augroup' : 'fugitive'}
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-vinegar'
NeoBundle 'godlygeek/tabular'
NeoBundle 'sickill/vim-pasta'

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
set scrolloff=3
set smartindent
set autoindent
set noshowmode     " Don't show the mode since Airline shows it
set showcmd
set wildmenu
set wildmode=list:longest,full
set visualbell
set cursorline
set ruler

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
set gdefault           " this makes search/replace global by default
set incsearch
set hlsearch
set showmatch
set matchtime=2 " How many tenths of a second to blink
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
set wildignore+=*.mp3
set title

" autocomplete
au FileType html,markdown set omnifunc=htmlcomplete#CompleteTags
au FileType css set omnifunc=csscomplete#CompleteCSS
au FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
au FileType coffee nnoremap <leader>pc :! pcoffee %<space>

autocmd User Node
  \ if &filetype == "javascript" |
  \   nmap <buffer> <C-w>f <Plug>NodeVSplitGotoFile |
  \   nmap <buffer> <C-w><C-f> <Plug>NodeVSplitGotoFile |
  \ endif

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
let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git', 'cd %s && git ls-files --cached --exclude-standard --others'],
    \ },
  \ 'fallback': 'find %s -type f'
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

"gundo
" nnoremap <leader>u :GundoToggle<CR>

"airline
"always appear
set laststatus=2
let g:airline_theme='base16'
let g:airline_powerline_fonts=1
" let g:airline_detect_modified=1
" let g:airline_mode_map = {
"       \ 'n'  : 'N',
"       \ 'i'  : 'I',
"       \ 'R'  : 'R',
"       \ 'v'  : 'V',
"       \ 'V'  : 'VL',
"       \ 'c'  : 'CMD',
"       \ '' : 'VB',
"       \ }


" Ack
nnoremap <leader>ag :Ag! "<cword>"<cr>

" Neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
if !exists('g:neocomplete#sources#omni#functions')
  let g:neocomplete#sources#omni#functions = {}
endif
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.javascript = '[^. \t]\.\w*'

" vim-unimpaired
" Bubble multiple lines
vmap ˚ [egv
vmap ∆ ]egv

" vim-surround
"let g:surround_{char2nr("h")} = "{{\r}}"
"let g:surround_{char2nr("#")} = "{{#\1helper: \1}}\r{{/\1\1}}"

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
" let g:EasyMotion_leader_key = '<Space>'

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
