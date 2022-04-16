"=================================================================================
"key combos
"==============================================================================

" unmap old mappings to space
nnoremap <SPACE> <Nop>

" default is left leaning slash
let mapleader = " "

" go to end of line
nnoremap <leader>e $

" go to normal mode from insert mode
inoremap jj <Esc> 

" insert line without going to insert mode
nnoremap K O<Esc>

" paragraph movement
nnoremap ^ }
nnoremap å {
" nnoremap ~ ]
" nnoremap Å [

" for norwegian keyboards
" map dead_diaeresis (^¨~) to asciicircum (^)
" map dead_circumflex and dead_asciitilde to asciitilde (~) 
" https://askubuntu.com/questions/254424/how-can-i-change-what-keys-on-my-keyboard-do-how-can-i-create-custom-keyboard?noredirect=1&lq=1
" xmodmap -e "keycode 35 = asciicircum"
" xmodmap -e "keycode 35 shift = asciicircum asciitilde"

"=================================================================================
"general
"=================================================================================

" highlight syntax
syntax on

" show line numbers
set number

" disable swapfile
set noswapfile

"  highlight all results
set hlsearch

" ignore case in search
set ignorecase

" show search results as you type
set incsearch

" use y and p with the system clipboard
set clipboard=unnamedplus
