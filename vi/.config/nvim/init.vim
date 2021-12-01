colorscheme elflord
" enable syntax highlighting
syntax enable

" show line numbers
set number

" set tabs to have 4 spaces
set ts=4

" indent when moving to the next line while writing code
set autoindent

" fix autocomplete to complete files names closer to how the terminal does it
set wildmode=longest:full,full

" expand tabs into spaces
set expandtab

" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4
set expandtab
set tabstop=4

" show the matching part of the pair for [] {} and ()
set showmatch

" enable all Python syntax highlighting features
let python_highlight_all = 1

" set column 80 to be colored
set cc=80
" execute pathogen#infect()

" enable  mouse
" set mouse=a
" set mousehide=1
" set mouseshape=arrow

colorscheme slate 
