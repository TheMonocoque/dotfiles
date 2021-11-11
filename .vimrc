" setup ctag searches.
"set tags+=.tags;/home/user111/.tags

set nowrap
set expandtab
set tabstop=4
set softtabstop=4
"set shiftwidth=4

syntax on

set nohlsearch
set incsearch
set number
set relativenumber
set colorcolumn=80
set scrolloff=8

set noswapfile
set nobackup

set term=xterm-256color
"color desert
color skittles_berry

filetype on

"set statusline=%F%m%r%h%w\ [FMT=%{&ff}]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [LEN=%L]\ [P=%03v\ %04l]
set laststatus=2

"highlight MarginOver cterm=red ctermfg=yello
"match MarginOver /\%>80v.\+/
"match ErrorMsg /\%>80v.\+/

" remove last highlight
map <C-c><C-C> :let @/=""<cr>


""" RANDOM FUNC
function! OpenCurrentLine ()
  " grab current line
  let line = getline (".")
  " add qoutes around the current line to avoid spaces/symbols issues
  let line = substitute(line, '^\(.*\)$', '"\1"', "g")
  " open with default system app, no messy output msg
  exec "!xdg-open" line '>&/dev/null &'
endfunction
  "bind function to a hotkey
"map <F8> :call OpenCurrentLine() <CR><CR>
