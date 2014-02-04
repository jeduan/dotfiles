set go-=T

if has("gui_macvim")
  set antialias
  set guifont=Source\ Code\ Pro\ for\ Powerline:h14
  "set guifont=Source\ Code\ Pro:h14
  function! s:CallCtrlPBasedOnGitStatus()
    let s:git_status = system("git status")

    if v:shell_error == 128
      execute "CtrlPCurFile"
    else
      execute "CtrlPRoot"
    endif
  endfunction

  macmenu &File.New\ Tab key=<nop>
  nnoremap <D-t> :call <SID>CallCtrlPBasedOnGitStatus()<Return>
  nmap <D-/> :TComment<cr>
  vmap <D-/> :TComment<cr>
  nnoremap <D-A-right> :tabnext<CR>
  nnoremap <D-A-left> :tabprevious<CR>

  "Indentation
  vnoremap <D-]> >gv
  vnoremap <D-[> <gv
  nmap <D-[> <
  nmap <D-]> >
  imap <D-[> <C-d>
  imap <D-]> <C-t>

  macmenu Tools.Spelling.To\ Next\ error key=<nop>
  nnoremap <D-;> A;
  inoremap <D-;> <esc>A;

  set lines=50
  set columns=170
  winpos 50 50

   "settings for vim-indent-guides
  "let g:indent_guides_start_level = 2
  "let g:indent_guides_guide_size = 1
endif
