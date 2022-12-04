"=================================================================================
"key combos
"==============================================================================

" unmap old mappings to space
nnoremap <SPACE> <Nop>

" default is left leaning slash
let mapleader = " "

" go to end of line
noremap <leader>e $

" go to normal mode from insert mode
inoremap jj <Esc> 

" insert line without going to insert mode
nnoremap K O<Esc>

" paragraph movement
" noremap ^ }
" noremap å {
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

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

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

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" show search results as you type
set incsearch

" use y and p with the system clipboard
set clipboard=unnamedplus

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Highlight cursor line underneath the cursor vertically.
" set cursorcolumn

" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4

" Use space characters instead of tabs.
" set expandtab

" Do not save backup files.
set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Rendering
set ttyfast

" enable mouse support (might not work well on Mac OS X)
set mouse=a

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx


" configure Vim to use brighter colors
set background=dark
