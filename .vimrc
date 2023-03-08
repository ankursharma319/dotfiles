"=================================================================================
"key combos
"==============================================================================

" unmap old mappings to space
nnoremap <SPACE> <Nop>

" default is left leaning slash
let mapleader = " "

" go to end of line
nnoremap <leader>e $
vnoremap <leader>e $

" go to normal mode from insert mode
inoremap jj <Esc>

" go to normal mode from visual mode
vnoremap <leader>jj <Esc>

" insert line without going to insert mode
nnoremap <leader>O O<Esc>
nnoremap <leader>o o<Esc>

" paragraph movement
noremap ø }
noremap Ø {

" move selected blockes of code up and down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '>-2<CR>gv=gv

" less disorienting when moving page up and down
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap n nzzzv
nnoremap N Nzzzv

" I never use q intentionally, only hit it by mistake
nnoremap q <nop>
nnoremap s <Nop>
nnoremap S <Nop>

" change word wrap
nnoremap <leader>ww :set wrap<cr>
nnoremap <leader>wnw :set nowrap<cr>

" copy current filepath name
nnoremap <leader>cfp :let @+ = expand("%:p")<cr>
nnoremap <leader>crp :let @+ = expand("%")<cr>

" delete without yank
nnoremap d "_d
nnoremap D "_D
vnoremap d "_d

" normal delete with yank (cut)
" use x in visual mode for cutting

" shortcut for grepping in current file
nnoremap <leader>s /

" shortcut for searching word under cursor
nnoremap <leader>n g*
nnoremap <leader>N g#

" autoinsert closing brace
inoremap { {}<Esc>ha
inoremap ( ()<Esc>ha
inoremap [ []<Esc>ha
inoremap " ""<Esc>ha
inoremap ' ''<Esc>ha
inoremap < <><Esc>ha

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

" Use new regular expression engine for syntax highlighting
set re=0

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
if system('uname -s') == "Darwin\n"
  set clipboard=unnamed "OSX
else
  set clipboard=unnamedplus "Linux
endif

" show tabs, trailing spaces and such visually
set list
set listchars=tab:!·,trail:·,precedes:<,extends:>

" Highlight cursor line underneath the cursor horizontally.
" set cursorline

" Highlight cursor line underneath the cursor vertically.
" set cursorcolumn

" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4

" Use space characters instead of tabs.
set expandtab

" Do not save backup files.
set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" new window should come below or to the right
set splitright
set splitbelow

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

" if do turn on wrapping, dont break midword
set linebreak

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

" Set completeopt to have a better completion experience
set completeopt=menu,menuone,noselect,noinsert

" configure Vim to use brighter colors
set background=dark

" https://stackoverflow.com/questions/6488683/how-to-change-the-cursor-between-normal-and-insert-modes-in-vim
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Encoding
set encoding=utf-8

" Rendering
set ttyfast
