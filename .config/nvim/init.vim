" identify the filetype
  filetype plugin on
" force syntax highlighting
  syntax on
" force unicode encoding
  set encoding=utf-8

" remap jk to ESC for easier exiting insert mode.
  inoremap jk <ESC>
" convert tabs to 2x spaces.
  set tabstop=2
  set softtabstop=2
  set expandtab
  set shiftwidth=2
  set smarttab
  set smartindent

" reduce plugin update time
  set updatetime=100

" map vim copy buffer to system clipboard.
  set clipboard=unnamedplus

" Show relative line numbers for easy jumping around using #j and #k keys.
 "set relativenumber
 "set rnu
" Make line number column thinner.
 "set numberwidth=1
" Force cursor to stay in the middle of the screen.
  set so=999

" Disables automatic commenting on newline.
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Force path autocompletion.
  set wildmode=longest,list,full

" Splits open at the bottom and right, rather than top and left.
  set splitbelow splitright

" Run xrdb whenever Xdefaults or Xresources are updated.
  autocmd BufWritePost *Xresources,*Xdefaults !xrdb %

" PLUGINS #################################################################

" Load all plugins now.
  packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
  silent! helptags ALL

" MARKDOWN-PREVIEW --------------------------------------------------------
  " Automatically launch rendered markdown in browser.
  let g:mkdp_auto_start = 1
  " Automatically close rendered markdown in browser.
  let g:mkdp_auto_close = 1
  " Use vimb instead of Firefox since Firefox won't automatically close
  "   the rendered markdown window.
  let g:mkdp_browser = 'vimb'

" LIGHTLINE ---------------------------------------------------------------
  let g:lightline = {
        \ 'colorscheme': 'one',
        \ 'component_function': {
        \   'filename': 'LightlineFilename',
        \ },
        \ }
  " Show the full path of the open file.
  function! LightlineFilename()
    return expand('%')
  endfunction

" ALE ---------------------------------------------------------------------
  " Have ALE remove extra whitespace and trailing lines.
  let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace']}

  " ALE will fix files automatically when they're saved.
  let g:ale_fix_on_save = 1

  " Set how long ALE waits before linting code (default is 200).
  let g:ale_lint_delay = 300

  " Quickly jump between ALE errors with CTRL-j/k
  nmap <silent> <C-k> <Plug>(ale_previous_wrap)
  nmap <silent> <C-j> <Plug>(ale_next_wrap)
